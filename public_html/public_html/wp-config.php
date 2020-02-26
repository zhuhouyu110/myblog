<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'myblog' );

/** MySQL database username */
define( 'DB_USER', 'myblog' );

/** MySQL database password */
define( 'DB_PASSWORD', 'myblog' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'aM/ uqK<Bflco((KMX,}aXL){2fhhD(TmEKbeDxmz}{76:NUo-Nl=n4zq~Um0=~M' );
define( 'SECURE_AUTH_KEY',  '5`YQ*VB$OIw(hFb|U4$B]r^0wwifvD1=>><tl9!FM.dq-n*t#~o+:Dt@bl<VF&Vj' );
define( 'LOGGED_IN_KEY',    'h|_a;/^omtP92i (B5oSOCnlFa-^0-vJmk@p[@Y;[-}F@-3(t_U~!.,XeL)w2Xu4' );
define( 'NONCE_KEY',        ',oS5dW<~`Di`#Nlow[.L=(yL{suM6ylS$^1s1XlJ1~O44#{}S2Uh0Ur2[ulj*qg)' );
define( 'AUTH_SALT',        '=>|`+16%B2mQM8?gGTIP1+#d=Ax*(fYG[s$3[FRB.MW[dfMv|swue- IZh){_M[y' );
define( 'SECURE_AUTH_SALT', '6sx$&qW2ACz,v& j|%g+rPt9U6%6-Yb*kDA|T8l<jELT|GH+vWK;YZuCB2D*fum=' );
define( 'LOGGED_IN_SALT',   'v@8v=A31d]rRxDSuy(.k)`i{n6dP rR(6<?K }$araDIQ;(.$6O^ED~M6EP0AP@-' );
define( 'NONCE_SALT',       '$nRBKQYrerSE)1Z@r?=;y1IOy^}Qcolb5,rZePX{r[S>JY~v$yioy]Dy7$<5xVVj' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
