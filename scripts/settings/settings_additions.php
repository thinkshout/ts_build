// Site configuration settings.
if (file_exists(DRUPAL_ROOT . '/' . conf_path() . '/site.settings.php')) {
include_once DRUPAL_ROOT . '/' . conf_path() . '/site.settings.php';
}

// Local site configuration settings.
if (file_exists(DRUPAL_ROOT . '/' . conf_path() . '/local.settings.php')) {
include_once DRUPAL_ROOT . '/' . conf_path() . '/local.settings.php';
}
