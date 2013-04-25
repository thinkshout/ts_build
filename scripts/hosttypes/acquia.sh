#!/bin/bash

HOSTDRUPALROOT=$HOSTTYPE/docroot
echo $HOSTDRUPALROOT
protectfiles () {
	git checkout docroot/sites/default/settings.php
	git checkout docroot/.ah_site_archive_imported
}