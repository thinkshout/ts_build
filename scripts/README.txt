These scripts are designed to be run from outside the scripts folder. In other words, you should be working from your profile directory and typing:
./scripts/build.sh etc

Start by editing config.sh with your profile name in the "PROJECT" variable. The other 2 options won't be needed until you use the Deploy script.

If you are on a host that wants the .git root anywhere other than the Drupal root, you'll need to create an appropriate script for that host in the  hosttypes directory if one doesn't already exist, specifying the location of the Drupal root (see the hosttypes/acquia.sh for an example).

When your config.sh has everything it needs, you can run the deploy script by typing ./scripts/deploy.sh. The only argument it takes is a number, and that should only be used if you have made some sort of commit directly on the host, like running the Pantheon updates. This number should match the number of host-based commits you have made since you last ran the deploy script. If you make host-based commits, then don't pass this argument in, the deploy script won't generate a complete commit message for your changes.

These scripts developed by ThinkShout, Inc
