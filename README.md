
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

# Update an existing project to use ts_build_script

* Run this command from the root of project folder:
`bash -c "$(curl -fsSL https://raw.githubusercontent.com/thinkshout/ts_build/master/update.sh)"`

* Either do a dry run of the deploy script (don't commit it!) or run the build script to check to see what's changed.

* Provided all the changes make sense, check these changes into the Github repo.

* Again, provided the changes make sense, you can deploy the latest build scripts to Pantheon. This will help to eliminate any possible confusion for the dev pushing the next deployment.

# What to do if the deployment looks off

* Check out the commit before updating the scripts.

* Do a dry run of the deploy script to see if the changes are the same between the previous scripts and the new one.

* Revert back to the old script, if necessary, and create a Github issue explaining
the problem when attempting to switch.

# Install directions
See https://github.com/thinkshout/ts_build/wiki/Standard-Build for the current instructions.
