<?php

/**
 * Specify the database settings for your local environment
 */

# $databases = array (
#   'default' =>
#   array (
#     'default' =>
#     array (
#       'database' => 'project',
#       'username' => 'root',
#       'password' => 'root',
#       'host' => 'localhost',
#       'port' => '',
#      'driver' => 'mysql',
#       'prefix' => '',
#     ),
#   ),
# );

/**
 * Specify the base_url so the site works with local virtualhosts
 */

# $base_url = 'http://project-name.dev';

/**
 * Specify the settings for stage file proxy so you just need to drush en the module
 */

#$conf['stage_file_proxy_hotlink'] = 1;
#$conf['stage_file_proxy_origin'] = 'http://organization.org';

/**
 * Simple way to get the pantheon solr drupal server pointed to localhost
 */

# $conf['pantheon_apachesolr_search_api_solr_service_class'] = 'SearchApiSolrService';