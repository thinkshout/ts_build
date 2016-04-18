<?php

/**
 * Require SSL for all pantheon environments
 */
# if (isset($_SERVER['PANTHEON_ENVIRONMENT'])) {
#   if (!isset($_SERVER['HTTP_X_SSL']) || (isset($_SERVER['HTTP_X_SSL']) && $_SERVER['HTTP_X_SSL'] != 'ON')) {
#     header('HTTP/1.0 301 Moved Permanently');
#     header('Location: https://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']);
#     exit();
#   }
# }