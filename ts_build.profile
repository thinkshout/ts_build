<?php

/**
 * Implement hook_install_tasks().
 *
 * We hook into the install process to add our own tasks prior to Drupal's final
 * step in the default install process.
 */
function ts_build_install_tasks() {
  $taskset = array(
    'ts_build_custom_install' => array(
      'display_name' => st('Thinkshout Site Setup'),
    ),
  );
  return $taskset;
}


/**
 * Post install tasks.
 */
function ts_build_custom_install(&$install_state) {
  // Disable DB blocks so we can use context to place everything.
  if (module_exists('block')) {
    db_update('block')
      ->fields(array('status' => 0, 'region' => ''))
      ->execute();
  }

  // Disable the default Bartik theme
  theme_disable(array('bartik'));

  // Enable and set shiny theme for admin pages, and
  // ts_build theme as default.
  $enable = array(
    'theme_default' => 'ts_build',
    'admin_theme' => 'shiny',
  );
  theme_enable($enable);

  foreach ($enable as $var => $theme) {
    if (!is_numeric($var)) {
      variable_set($var, $theme);
    }
  }

  // Clean up.
  drupal_flush_all_caches();
  features_revert();
}
