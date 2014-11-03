#!/bin/bash

protectfiles () {
  if [ -f sites/default/settings.php ]; then
	  git checkout sites/default/settings.php
  fi
}
MULTIDEV=true
