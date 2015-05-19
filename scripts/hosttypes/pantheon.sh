#!/bin/bash

protectfiles () {
	chmod u+w sites/default
	git checkout sites/default/settings.php
}
