#!/bin/bash

# Update an existing TS Build profile to use the latest ts_build_scripts.
echo saving your current configuration
mv scripts/settings settings
mv scripts/config.sh settings/config.sh
echo "Append protectfiles from hosttypes/pantheon.sh to settings/config.sh"
cat scripts/hosttypes/pantheon.sh >> settings/config.sh
echo "Getting new .gitignore"
curl -fsSL https://raw.githubusercontent.com/thinkshout/ts_build/composer/.gitignore > .gitignore
echo "Getting new composer file"
curl -fsSL https://raw.githubusercontent.com/thinkshout/ts_build/composer/composer.json > composer.json
echo "Removing old scripts"
rm -rf scripts
echo "Installing new scripts"
composer install
