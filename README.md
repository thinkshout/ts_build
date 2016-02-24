
# ThinkShout Build for Drupal 7.x

ThinkShout's make file and starter profile for building Drupal 7.x sites.

# Requirements 
In addition to the standard Drupal requirements you will need the following to
make use of TS Build:

* drush 3.1 - http://drupal.org/project/drush
* drush make 2.0 beta 9 - http://drupal.org/project/drush_make
* git - http://git-scm.com
* composer - https://getcomposer.org

# Getting started
The build scripts are now included with composer. To install the scripts `composer install`. To update, `composer update`.

# Update an existing project to use ts_build_script run this command from the root of project folder.
bash -c "$(curl -fsSL https://raw.githubusercontent.com/thinkshout/ts_build/master/update.sh)"

# Install directions
See https://github.com/thinkshout/ts_build/wiki/Standard-Build for the current instructions.
