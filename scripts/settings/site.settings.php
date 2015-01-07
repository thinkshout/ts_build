<?php
/**
 * @file
 * site.settings.php
 *
 * Custom settings for this site.
 */

// Non-Pantheon OR Pantheon, but not the 'live' environment.
if (!defined('PANTHEON_ENVIRONMENT') || PANTHEON_ENVIRONMENT !== 'live') {
//  // Disable the connection to salesforce.
//  $conf['salesforce_consumer_key'] = '';
//  $conf['salesforce_consumer_secret'] = '';
//  $conf['salesforce_endpoint'] = 'https://test.salesforce.com';
//  $conf['salesforce_instance_url'] = '';
//
//  // Disable the connection to Mandrill to prevent any emails from being sent.
//  $conf['mandrill_api_key'] = '';
}

// Only on the live environment.
if (defined('PANTHEON_ENVIRONMENT') && PANTHEON_ENVIRONMENT == 'live') {
  // Mandrill Live credentials.
  $conf['mandrill_api_key'] = '';

  // Salesforce live credentials.
  $conf['salesforce_consumer_key'] = '';
  $conf['salesforce_consumer_secret'] = '';
  $conf['salesforce_endpoint'] = 'https://login.salesforce.com';
  $conf['salesforce_instance_url'] = '';
}
