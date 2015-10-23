<?php
/**
 * Local settings used for development.
 *
 * Update SITE to database name and DISTRO to the distro directory name.
 */
if (!defined('PANTHEON_ENVIRONMENT')) {

  $databases = array (
    'default' =>
    array (
      'default' =>
      array (
        'database' => 'PROJECT',
        'username' => 'root',
        'password' => 'root',
        'host' => 'localhost',
        'port' => '',
        'driver' => 'mysql',
        'prefix' => '',
      ),
    ),
  );


  // Configure redis for local use. Comment out if not being used. Update
  // DISTRO to the name of the distro and SITE to the name of the site/db.

  // $conf['redis_client_interface'] = 'PhpRedis';
  // $conf['cache_backends'][] = 'profiles/DISTRO/modules/contrib/redis/redis.autoload.inc';
  // $conf['cache_default_class'] = 'Redis_Cache';
  // $conf['cache_prefix'] = array('default' => 'SITE');
  // // Do not use Redis for cache_form (no performance difference).
  // $conf['cache_class_cache_form'] = 'DrupalDatabaseCache';
  // // Use Redis for Drupal locks (semaphore).
  // $conf['lock_inc'] = 'profiles/DISTRO/modules/contrib/redis/redis.lock.inc';

  // Use stock Solr connection class rather than Pantheon's version. This won't
  // switch the server/core only prevent Pantheon's connection info from
  // overriding what's configured in Drupal.
  $conf['pantheon_apachesolr_search_api_solr_service_class'] = 'SearchApiSolrService';

  // Set domain for stage_file_proxy module.
  $conf['stage_file_proxy_origin'] = 'https://www.SITEDOMAIN.org';

  // Add $base_url so drush uli opens site rather than printing to terminal.
  // If the page being requested is HTTPS or the environment specifies HTTPS.
  if ((isset($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) == 'on') || (isset($_SERVER['TSDEV_SSL']) && $_SERVER['TSDEV_SSL'])) {
    // Using HTTPS.
    $base_url = "https://PROJECT.dev";
  }
  else {
    // Using HTTP.
    $base_url = "http://PROJECT.dev";
  }
}
