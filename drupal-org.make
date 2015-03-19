;------------------------------------------------------------------------------
; Makefile for ThinkShout client website.
;------------------------------------------------------------------------------

api = 2
core = 7.x

;-----------------------------------------
; Contrib Modules
;-----------------------------------------

; admin_views
; projects[admin_views][version] = ""
projects[admin_views][subdir] = "contrib"

; bean requires ctools, entity
;projects[bean][version] = ""
projects[bean][subdir] = "contrib"

; context requires ctools 1.7+ (jquery_ui & admin recommended)
;projects[context][version] = ""
projects[context][subdir] = "contrib"

; ctools
;projects[ctools][version] = ""
projects[ctools][subdir] = "contrib"

; entity
;projects[entity][version] = ""
projects[entity][subdir] = "contrib"

; entityreference
;projects[entityreference][version] = ""
projects[entityreference][subdir] = "contrib"

; features
;projects[features][version] = ""
projects[features][subdir] = "contrib"

; menu_block
;projects[menu_block][version] = ""
projects[menu_block][subdir] = "contrib"

; pathauto requires token
;projects[pathauto][version] = ""
projects[pathauto][subdir] = "contrib"

; strongarm requires ctools
;projects[strongarm][version] = ""
projects[strongarm][subdir] = "contrib"

; token
;projects[token][version] = ""
projects[token][subdir] = "contrib"

; views
;projects[views][version] = ""
projects[views][subdir] = "contrib"

;-----------------------------------------
; Patched Contrib Modules
;-----------------------------------------

;-----------------------------------------
; Developer tools
;-----------------------------------------

; devel
;projects[devel][version] = ""
projects[devel][subdir] = "developer"

; diff
;projects[diff][version] = ""
projects[diff][subdir] = "developer"

; reroute_email
;projects[reroute_email][version] = ""
projects[reroute_email][subdir] = "developer"

;-----------------------------------------
; Libraries
;-----------------------------------------

; chosen
libraries[chosen][download][type] = git
libraries[chosen][download][url] = https://github.com/harvesthq/chosen.git
libraries[chosen][directory_name] = "chosen"
libraries[chosen][type] = "library"
;libraries[chosen][revision] = "333899ca51"
