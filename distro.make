; This file describes the core project requirements for TS Build 7.x. Several
; patches against Drupal core and their associated issue numbers have been
; included here for reference.
;
; Use this file to build a full distro including Drupal core (with patches) and
; the TS Build install profile using the following command:
;
;     $ drush make distro.make [directory]

api = 2
core = 7.x

projects[] = drupal

; Use vocabulary machine name for permissions
; http://drupal.org/node/995156
; projects[drupal][patch][995156] = http://drupal.org/files/issues/995156-5_portable_taxonomy_permissions.patch

projects[ts_build][type] = profile
projects[ts_build][download][type] = git
projects[ts_build][download][url] = http://git.drupal.org/project/buildkit.git
projects[ts_build][download][tag] = 7.x-2.0-beta2
