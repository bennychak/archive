<?php
/** 
 * WordPress 基础配置文件。
 *
 * 本文件包含以下配置选项: MySQL 设置、数据库表名前缀、
 * 密匙、WordPress 语言设定以及 ABSPATH。如需更多信息，请访问
 * {@link http://codex.wordpress.org/Editing_wp-config.php 编辑
 * wp-config.php} Codex 页面。MySQL 设置具体信息请咨询您的空间提供商。
 *
 * 这个文件用在于安装程序自动生成 wp-config.php 配置文件，
 * 您可以手动复制这个文件，并重命名为 wp-config.php，然后输入相关信息。
 *
 *
 * @package WordPress
 */

// ** MySQL 设置 - 具体信息来自您正在使用的主机 ** //
/** WordPress 数据库的名称 */
define('DB_NAME', 'huashi');

/** MySQL 数据库用户名 */
define('DB_USER', 'root');

/** MySQL 数据库密码 */
define('DB_PASSWORD', '123456');

/** MySQL 主机 */
define('DB_HOST', 'localhost');

/** 创建数据表时默认的文字编码 */
define('DB_CHARSET', 'utf8');

/** 数据库整理类型。如不确定请勿更改 */
define('DB_COLLATE', '');

/**#@+
 * 身份密匙设定。
 *
 * 您可以随意写一些字符
 * 或者直接访问 {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org 私钥生成服务}，
 * 任何修改都会导致 cookie 失效，所有用户必须重新登录。
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Qj$Uw6RqD5^JzXl2t?6%xNsHL|{pR(WrmYF|fAElxjz:>Dew*uJAU?pOE^*E&iK{');
define('SECURE_AUTH_KEY',  '#wzLlK-1)gJTR9*+X|K$@nIS#3w9KVJdJIBIP{ek>K9y+Giy.,.4@=?oQZVqzUWW');
define('LOGGED_IN_KEY',    '1d16Kq=qc+jg-ZeXe0`ZLN1h,:XF/,Otm4`>L}pTgq(<U/R6/m>{]jJ@~{7ino7?');
define('NONCE_KEY',        '^E!ggq*@K.HmW[g`DR2UD3P7u~w!GP&+~SxhOwA A8I[Z<J1vm)|r[E%!tB tQ8d');
define('AUTH_SALT',        '+bhdNPpuytdWzUUSj3ZdeG4_wy2pvoV`,=oDAx07hj7lm2-+D;5`ZaU|qy+`7f07');
define('SECURE_AUTH_SALT', '$*kzx]+S^}j.<w2jqr=sz|D@I`; n;d#BH]>B7kSF7t4xI%/@m#~y|SK:bIMFAWv');
define('LOGGED_IN_SALT',   '&;gJqPjPjBnx8/Yp?ov#[4?xn-?I!o53dra&*-O<#KB10m.+a|0MX!0KZTtyDm3T');
define('NONCE_SALT',       '_P(rrNEfDV4eX%~:koc+:<D~z_BSYsu^%DkDz@RWg(dsy=9fgQ;M@BS|s~?E2[8I');

/**#@-*/

/**
 * WordPress 数据表前缀。
 *
 * 如果您有在同一数据库内安装多个 WordPress 的需求，请为每个 WordPress 设置不同的数据表前缀。
 * 前缀名只能为数字、字母加下划线。
 */
$table_prefix  = 'huashi_';

/**
 * WordPress 语言设置，默认为英语。
 *
 * 本项设定能够让 WordPress 显示您需要的语言。
 * 	wp-content/languages 内应放置同名的 .mo 语言文件。
 * 要使用 WordPress 简体中文界面，只需填入 zh_CN。
 */
define ('WPLANG', 'zh_CN');

/**
 * 开发者专用：WordPress 调试模式。
 *
 * 将这个值改为“true”，WordPress 将显示所有开发过程中的提示。
 * 强烈建议插件开发者在开发环境中启用本功能。
 */
define('WP_DEBUG', false);

/* 好了！请不要再继续编辑。请保存该文件。 */

/** WordPress 目录的绝对路径。 */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** 设置 WordPress 变量和包含文件。 */
require_once(ABSPATH . 'wp-settings.php');
