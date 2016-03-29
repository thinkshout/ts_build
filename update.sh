#!/bin/bash

# Update an existing TS Build profile to use the latest ts_build_scripts.
echo saving your current configuration
[ -d "scripts/settings" ] && mv scripts/settings settings
[ -d "settings" ] || mkdir settings
mv scripts/config.sh settings/config.sh
echo "Append protectfiles from hosttypes/pantheon.sh to settings/config.sh"
cat scripts/hosttypes/pantheon.sh >> settings/config.sh

if [ -f settings/settings.php ]; then
  echo "Moving existing settings.php to site.settings.php"
  mv settings/settings.php settings/site.settings.php
fi

echo "Getting new settings_additions.php"
[ ! -f "settings/settings_additions.php" ] && curl -fsSL https://raw.githubusercontent.com/thinkshout/ts_build/master/settings/settings_additions.php > settings/settings_additions.php
echo "Getting new .gitignore"
curl -fsSL https://raw.githubusercontent.com/thinkshout/ts_build/master/.gitignore > .gitignore
echo "Getting new composer file"
curl -fsSL https://raw.githubusercontent.com/thinkshout/ts_build/master/composer.json > composer.json
echo "Removing old scripts"
git rm -r scripts
echo "Installing new scripts"
composer install
