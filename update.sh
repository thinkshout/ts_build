#!/bin/bash

# Update an existing TS Build profile to use the latest ts_build_scripts.

echo "Getting new .gitignore"
curl -fsSL https://raw.githubusercontent.com/thinkshout/ts_build/composer/.gitignore
echo "Getting new composer file"
curl -fsSL https://raw.githubusercontent.com/thinkshout/ts_build/composer/composer.json
echo "Removing old scripts"
rm -rf scripts
echo "Installing new scripts"
composer install
