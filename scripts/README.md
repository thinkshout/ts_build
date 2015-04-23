### Introduction
These scripts are designed to be run from outside the scripts folder. In other words, you should be working from the root folder of this Git repository, and typing:
```./scripts/build.sh``` or ```./scripts/deploy.sh``` -- never just ```./build.sh``` for example.

### Initial Setup
You will want to create a "build" directory that holds this Git Repo somewhere outside of your local web root. Your website's root directory or "webroot" will also be your "drupal-root". We refer to it as a "drupal-root" in this document. The location of this directory will depend on your local webserver configuration.

Update ```config.sh``` with your profile name in the "PROJECT" variable, (this should match your .info file) and your preferred site name in the "SITENAME" variable.

The other two options can remain blank until you are ready to deploy.

### Building your site
To build a copy of your site, from your build directory, run:

```./scripts/build.sh /PATH/TO/DRUPAL-ROOT```

WARNING: This will completely delete the contents of your target DRUPAL-ROOT directory! Don't be afraid to move or rename that directory first, just in case.

### Updating your site/repo
You will now have a second, somewhat messier copy of your git repo in your Drupal-root at profiles/PROFILENAME. You can make updates and changes here and commit them straight back to the master repository. Don't forget to pull those changes back to your Build directory as needed.

### Deployment Setup
Update your config.sh, defining the ```HOSTTYPE``` and ```GITREPO``` variables. The ```HOSTTYPE``` should match one of the script names in the "hosttypes" directory (minus the file extension). The Gitrepo should point to your HOST'S git repository.

In order to run the Deployment script, you need to define the environment variable ```$EDITOR```. Run ```echo $EDITOR```: if no value is returned, run the following command (you can add this to your .bashrc or .bash_profile to avoid repeating this step):

```export EDITOR='nano'```

(Replace 'nano' with your editor of choice. If you use Sublime you can use 'subl -w')

If you are on a host that wants the .git root anywhere other than the Drupal root, you'll need to create an appropriate script for that host in the  ```hosttypes``` directory (if one doesn't already exist). In that script, specify the location of the Drupal root (see the ```hosttypes/acquia.sh``` for an example). Feel free to contribute your custom host configuration back to the repo!

Your hosttype script should always define a function called "protectfiles".

Sometimes, the first deployment behaves differently than future deployments. For example, a new Pantheon site may not have a ```sites/default/settings.php``` file, which will break the "protectfiles" function. It is advisable to run a basic Drupal site install through the Pantheon UI, with Pantheon set to SSH mode, in order to initialize this file. Once that has been done, commit the file through Pantheon's UI and switch back to git mode.

### Deploying your changes

Form your Build directory, pull your latest changes, then run:

```./scripts/deploy.sh```

This will run the build script to create a copy of your site, then clone your host site and compare the two. It will amalgamate all the changes into a single commit and give you a chance to edit the commit message.

Make sure that the list of files it spits out to be changed are consistent with your expectations. The script will confirm with you before pushing changes.

The Deployment script accepts some special arguments:

```./scripts/deploy.sh # -b branchname```

The # argument should be used if you have made some sort of commit directly on the host, like running the Pantheon updates. This number should match the number of host-based commits you have made since you last ran the deploy script. If you make host-based commits, then don't pass this argument in, the deploy script won't generate an accurate commit message for your changes, but will otherwise work fine.

The "branchname" argument, specified by a "-b", allows you to push to a remote branch on the host (for example, Pantheon's multidev environments). Note that the push is always done from whatever branch you are currently on, and this only specifies the remote branch to push to at the HOST.

These scripts developed by ThinkShout, Inc
