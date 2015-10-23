#!/bin/bash
set -e

#
# Build the distribution using the same process used on Drupal.org
#
# Usage: build.sh [-y] <DESTINATION_PATH> <DB_USER> <DB_PASS> <DB_NAME> from the
# profile main directory. If any of the db params are excluded, the install
# profile will not be run, just built.
#

source scripts/config.sh

confirm () {
  read -r -p "${1:-Are you sure? [Y/n]} " response
  case $response in
    [yY][eE][sS]|[yY])
      true
      ;;
    *)
      false
      ;;
  esac
}

# Figure out directory real path.
realpath () {
  TARGET_FILE=$1

  cd `dirname $TARGET_FILE`
  TARGET_FILE=`basename $TARGET_FILE`

  while [ -L "$TARGET_FILE" ]
  do
    TARGET_FILE=`readlink $TARGET_FILE`
    cd `dirname $TARGET_FILE`
    TARGET_FILE=`basename $TARGET_FILE`
  done

  PHYS_DIR=`pwd -P`
  RESULT=$PHYS_DIR/$TARGET_FILE
  echo $RESULT
}

usage() {
  echo "Usage: build.sh [-y] <DESTINATION_PATH> <DB_USER> <DB_PASS> <DB_NAME>" >&2
  echo "Use -y to skip deletion confirmation" >&2
  echo "Install profile will only be run if db credentials are provided" >&2
  exit 1
}

DESTINATION=$1
DBUSER=$2
DBPASS=$3
DB=$4
ASK=true

while getopts ":y" opt; do
  case $opt in
    y)
      DESTINATION=$2
      DBUSER=$3
      DBPASS=$4
      DB=$5
      ASK=false
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
  esac
done

if [ "x$DESTINATION" == "x" ]; then
  usage
fi

if [ ! -f drupal-org.make ]; then
  echo "[error] Run this script from the distribution base path."
  exit 1
fi

DESTINATION=$(realpath $DESTINATION)

case $OSTYPE in
  darwin*)
    TEMP_BUILD=`mktemp -d -t tmpdir`
    ;;
  *)
    TEMP_BUILD=`mktemp -d`
    ;;
esac
# Drush make expects destination to be empty.
rmdir $TEMP_BUILD

if [ -d $DESTINATION ]; then
  echo "Removing existing destination: $DESTINATION"
  if $ASK; then
    confirm && chmod -R 777 $DESTINATION && rm -rf $DESTINATION
    if [ -d $DESTINATION ]; then
      echo "Aborted."
      exit 1
    fi
  else
    chmod -R 777 $DESTINATION && rm -rf $DESTINATION
  fi
  echo "Existing directories removed."
fi

# Build the profile.
echo "Building the profile..."
drush make --no-core --contrib-destination --no-gitinfofile drupal-org.make tmp

# Build the distribution and copy the profile in place.
echo "Building the distribution..."
drush make --no-gitinfofile drupal-org-core.make $TEMP_BUILD
echo -n "Moving to destination... "
cp -r tmp $TEMP_BUILD/profiles/$PROJECT
rm -rf tmp
cp -r . $TEMP_BUILD/profiles/$PROJECT
mv $TEMP_BUILD $DESTINATION

# set permissions on the sites/default directory
chmod 755 $DESTINATION/sites/default

# run the install profile
SETTINGS="$DESTINATION/profiles/$PROJECT/scripts/settings/settings_additions.php"
if [ $DBUSER  ] && [ $DBPASS ] && [ $DB ] ; then
  # If bash receives an error status, it will halt execution. Setting +e to tell
  # bash to continue even if error.
  set +e
  cd $DESTINATION
  echo "Running install profile"
  drush si $PROJECT --site-name="$SITENAME" --db-url=mysql://$DBUSER:$DBPASS@localhost/$DB -y
  # Copy settings_additions.php if found
  echo $SETTINGS
  if [ -f $SETTINGS ]; then
    # ensure permissions on the sites/default directory allow writing
    # installation process will leave sites/default with 555 permissions
    chmod 755 $DESTINATION/sites/default
    echo -n "Copying settings.php additions"
    chmod 664 $DESTINATION/sites/default/settings.php
    cat $SETTINGS >> $DESTINATION/sites/default/settings.php
    chmod 444 $DESTINATION/sites/default/settings.php
  fi
  set -e
else
  echo "Skipping install profile"
  # Copy settings_additions.php if found
  echo $SETTINGS
  if [ -f $SETTINGS ]; then
    echo -n "Copying settings.php additions to default.settings.php "
    cat $SETTINGS >> $DESTINATION/sites/default/default.settings.php
  fi
fi

SETTINGS_SITE="$DESTINATION/profiles/$PROJECT/scripts/settings/site.settings.php"
if [ -f $SETTINGS_SITE ]; then
  cp $SETTINGS_SITE $DESTINATION/sites/default/site.settings.php
  printf "Copied site.settings.php into place.\n"
fi

SETTINGS_LOCAL="$DESTINATION/profiles/$PROJECT/scripts/settings/local.settings.php"
if [ -f $SETTINGS_LOCAL ]; then
  # replace PROJECT with actual project name in local.settings.php
  sed -i '' "s/PROJECT/$PROJECT/g" $DESTINATION/profiles/$PROJECT/scripts/settings/local.settings.php
  cp $SETTINGS_LOCAL $DESTINATION/sites/default/local.settings.php
  printf "Copied local.settings.php into place.\n"
fi

# uncomment RewriteBase in project's .htaccess file
# necessary for Drupal sites running on a machine configured using ThinkShout standards
# see https://github.com/thinkshout/ts_recipes/tree/master/brew-lamp-dev-envt
# see https://github.com/thinkshout/ts_recipes/blob/master/environment_setup.sh
cd $DESTINATION
sed -i '' 's/# RewriteBase \/$/RewriteBase \//g' ./.htaccess

echo "Build script complete."
