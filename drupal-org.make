;------------------------------------------------------------------------------
; Makefile for ThinkShout client website.
;------------------------------------------------------------------------------

api = 2
core = 8.x

;-----------------------------------------
; Contrib Modules
;-----------------------------------------


; admin_menu requires bean
;projects[admin_menu][version] = "3.0-rc4"
;projects[admin_menu][subdir] = "contrib"

; bean requires ctools, entity
;projects[bean][version] = "1.7"
;projects[bean][subdir] = "contrib"

; context requires ctools 1.7+ (jquery_ui & admin recommended)
;projects[context][version] = "3.2"
;projects[context][subdir] = "contrib"

; ctools
;projects[ctools][version] = "1.4"
;projects[ctools][subdir] = "contrib"

; entity
;projects[entity][version] = "1.5"
;projects[entity][subdir] = "contrib"

; entityreference
;projects[entityreference][version] = "1.1"
;projects[entityreference][subdir] = "contrib"

; features
;projects[features][version] = "2.0"
;projects[features][subdir] = "contrib"

; field_collection
;projects[field_collection][version] = "1.0-beta7"
;projects[field_collection][subdir] = "contrib"

; pathauto requires token
;projects[pathauto][version] = "1.2"
;projects[pathauto][subdir] = "contrib"

; strongarm requires ctools
;projects[strongarm][version] = "2.0"
;projects[strongarm][subdir] = "contrib"

; token
;projects[token][version] = "1.5"
;projects[token][subdir] = "contrib"

; views
;projects[views][version] = "3.7"
projects[views][subdir] = "contrib"

;-----------------------------------------
; Patched Contrib Modules
;-----------------------------------------

; Patch to fix notices for render arrays in blocks/panels: http://drupal.org/node/1925018#comment-7361230
;projects[ctools][patch][] = "http://drupal.org/files/ctools-1925018-61.patch"


;-----------------------------------------
; Developer tools
;-----------------------------------------

; devel
;projects[devel][version] = "1.4"
;projects[devel][subdir] = "developer"

; diff
;projects[diff][version] = "3.2"
;projects[diff][subdir] = "developer"

; ftools
;projects[ftools][version] = "1.6"
;projects[ftools][subdir] = "developer"

;-----------------------------------------
; Libraries
;-----------------------------------------

; ts_install_helpers
libraries[ts_install_helpers][download][type] = git
libraries[ts_install_helpers][download][url] = git@github.com:thinkshout/ts_install_helpers.git
libraries[ts_install_helpers][directory_name] = "ts_install_helpers"
libraries[ts_install_helpers][type] = "library"


; chosen
libraries[chosen][download][type] = git
libraries[chosen][download][url] = https://github.com/harvesthq/chosen.git
libraries[chosen][directory_name] = "chosen"
libraries[chosen][type] = "library"
;libraries[chosen][revision] = "333899ca51"
