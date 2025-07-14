<?php

define('DB_NAME', getenv('MYSQL_DATABASE') ?: 'wordpress');
define('DB_USER', getenv('MYSQL_USER') ?: 'sudoUser');
define('DB_PASSWORD', getenv('MYSQL_PASSWORD') ?: 'sudoUser123');
define('DB_HOST', 'mariadb:3306');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
define('WP_DEBUG', false);
define('WP_DEBUG_LOG', false);
define('WP_DEBUG_DISPLAY', false);
define('WP_HOME', 'https://bismail.42.fr');
define('WP_SITEURL', 'https://bismail.42.fr');


define('AUTH_KEY',       getenv('AUTH_KEY') ?: "No key found");
define('SECURE_AUTH_KEY',  getenv('SECURE_AUTH_KEY') ?: "No key found");
define('LOGGED_IN_KEY',    getenv('LOGGED_IN_KEY') ?: "No key found");
define('NONCE_KEY',        getenv('NONCE_KEY') ?: "No key found");
define('AUTH_SALT',        getenv('AUTH_SALT') ?: "No key found");
define('SECURE_AUTH_SALT', getenv('SECURE_AUTH_SALT') ?: "No key found");
define('LOGGED_IN_SALT',   getenv('LOGGED_IN_SALT') ?: "No key found");
define('NONCE_SALT',       getenv('NONCE_SALT') ?: "No key found");