; Drush Make API version.

api = 2
core = 7.x

contrib-destination = sites/all
contrib_destination = sites/all
base_contrib_destination = sites/all

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
