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
projects[ts_build][download][url] = https://github.com/thinkshout/ts_build.git
projects[ts_build][download][revision] = "master"

; Contrib Modules

projects[admin_menu][subdir] = "contrib"
projects[admin_menu][version] = "3.x-dev"

projects[context][subdir] = "contrib"
projects[context][version] = "3.x-dev"

projects[ctools][subdir] = "contrib"
projects[ctools][version] = "1.0-beta1"

projects[features][subdir] = "contrib"
projects[features][version] = "1.0-beta3"

projects[imce][subdir] = "contrib"
projects[imce][version] = "1.4"

projects[imce_wysiwyg][subdir] = "contrib"
projects[imce_wysiwyg][version] = "1.x-dev"

projects[pathauto][subdir] = "contrib"
projects[pathauto][version] = "1.0-rc2"

projects[strongarm][subdir] = "contrib"
projects[strongarm][version] = "2.0-beta2"

projects[token][subdir] = "contrib"
projects[token][version] = "1.0-beta2"

projects[views][subdir] = "contrib"
projects[views][version] = "3.0-rc1"

projects[wysiwyg][subdir] = "contrib"
projects[wysiwyg][version] = "2.1"

; Themes

projects[layoutstudio][type] = "theme"
projects[layoutstudio][version] = "1.x-dev"

; Libraries

libraries[ckeditor][type] = "library"
libraries[ckeditor][download][type] = "file"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.5.3/ckeditor_3.5.3.tar.gz"

libraries[profiler][download][type] = "get"
libraries[profiler][download][url] = "http://ftp.drupal.org/files/projects/profiler-7.x-2.x-dev.tar.gz"

; === Developer Tools - To be removed for production builds ===

projects[devel][subdir] = "development"
projects[devel][version] = "1.x-dev"

projects[diff][subdir] = "development"
projects[diff][version] = "2.x-dev"
