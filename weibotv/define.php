<?php
$d = str_replace('\\', '/', dirname(__FILE__));
define('ROOT', $d == '' ? '/' : $d . '/');
define('DATA_PATH', ROOT . 'data/');
define('ACTION_PATH', ROOT . 'action/');
define('HTTP_DATA', "http://qq.com/weibo/18/tv/data/");