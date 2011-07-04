
# ThinkShout Build for Drupal 7.x

ThinkShout's make file and starter profile for building Drupal 7.x sites.

# Requirements 
In addition to the standard Drupal requirements you will need the following to
make use of TS Build:

* drush 3.1 - http://drupal.org/project/drush
* drush make 2.0 beta 9 - http://drupal.org/project/drush_make
* git - http://git-scm.com

# Getting started

## Run drush make with TS Build

Grab the `distro.make` file from TS Build and run:

    $ drush make --contrib-destination=sites/all/ ts_build.make [directory]

or use its url on GitHub directly:

    $ drush make --contrib-destination=sites/all/  "https://raw.github.com/thinkshout/ts_build/master/ts_build.make" [directory]

Notes:

* Passing the --contrib-destination=sites/all/ places all contrib modules and libraries into the sites/all module, which is our preference, but not required.
* Regardless, TS Build will download the Profiler library into the ts_build profile directory as it's in a separate make file.

## Choose the *ts_build* install profile when installing Drupal

    drush si ts_build

TS Build is designed to be used as a start build, not a base build. So you'll probably want to add your install profile goodness either directly into TS Build or after renaming it to _myprofile_.

# Extending TS Build

Site builders can use TS Build as a starting point for their own install
profiles. Basic steps for creating a new install profile called `myprofile` that
extends TS Build:

1. Create the following directory and files:

        profiles/myprofile
        profiles/myprofile/distro.make
        profiles/myprofile/myprofile.info
        profiles/myprofile/myprofile.make
        profiles/myprofile/myprofile.install

2. Enter an include statement into `distro.make` to include the contents of the
  Build Kit distro makefile and then add your new install profile to it:

        ; Include Build Kit distro makefile via URL
        includes[] = https://raw.github.com/thinkshout/ts_build/master/ts_build.make

        ; Add myprofile to the full Drupal distro build
        projects[myprofile][type] = profile
        projects[myprofile][download][type] = git
        projects[myprofile][download][url] = git://github.com/myname/myprofile.git

2. Enter an include statement into `myprofile.make` to include the contents of
  the Build Kit install profile makefile and then add any additional projects
  or overrides:

        ; Include Build Kit install profile makefile via URL
        includes[] = https://raw.github.com/thinkshout/ts_build/master/drupal-org.make

        projects[feeds][version] = 2.0-alpha1
        projects[job_scheduler][version] = 2.0-alpha1
        ...

  For more information about using makefiles see the [drush make README][1].

3. Copy the contents of `ts_build.info` into `myprofile.info` and then adjust
  its contents to reflect the metadata, modules and theme you want to enable.
  For example:

        name = My First Drupal Distro
        core = 6.x
        description = Hello world!

        dependencies[] = feeds
        ...

4. Implement `hook_install()` in `myprofile.install` to do any other setup
  tasks for your install profile:

        <?php

        function myprofile_install() {
          theme_enable(array('stark'));
          variable_set('theme_default', 'stark');
        }

5. Build a full distro using the following command from `profiles/myprofile`:

        $ drush make distro.make [directory]

6. Choose "My First Drupal Distro" when installing Drupal!
