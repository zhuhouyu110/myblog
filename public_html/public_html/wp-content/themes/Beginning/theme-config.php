<?php
/**
 * 主题名称
 *
 * @var string
 */
if ( !defined( 'THEME_NAME' ) )
	define( 'THEME_NAME', 'Beginning' );

/**
 * 主题别名
 *
 * @var string
 */
if ( !defined( 'THEME_SLUG' ) )
	define( 'THEME_SLUG', trim( THEME_NAME ) );

/**
 * 主题数据库版本
 *
 * 历史版本：
 *
 *  - 1.0.0    >    1
 *   - 1.1.0   >    2
 *  - 1.2.0    >    3
 *   - 1.2.1   >    4
 *  - 1.3.0    >    5
 *   - 1.3.1   >    6
 *
 *  - 2.0.0    >    7
 *   - 2.0.1   >    8
 *  - 2.1.0    >    9
 *
 *  - 3.0.0    >   10
 *  - 3.1.0    >   11
 *   - 3.1.1   >   12
 *  - 3.2.0    >   13
 *   - 3.2.1   >   14
 *   - 3.2.2   >   15
 *
 *  - 4.0.0    >   16
 *   - 4.0.1   >   17
 *   - 4.0.2   >   18
 *   - 4.0.3   >   19
 *   - 4.0.4   >   20
 *   - 4.0.5   >   21
 *  - 4.1.0    >   22
 *   - 4.1.1   >   23
 *
 * @var int
 */
if ( !defined( 'THEME_DB_VERSION' ) )
	define( 'THEME_DB_VERSION', 23 );

/**
 * 主题设置数据库字段名
 *
 * @var string
 */
if ( !defined( 'THEME_MPANEL_NAME' ) )
	define( 'THEME_MPANEL_NAME', 'Bing_mpanel_' . THEME_SLUG );

/**
 * 主题小工具前缀
 *
 * @var string
 */
if ( !defined( 'THEME_WIDGET_PREFIX' ) )
	define( 'THEME_WIDGET_PREFIX', THEME_NAME . ' - ' );

/**
 * 头像存储目录
 *
 * 基于 `WP_CONTENT_DIR` 常量的目录，结尾不要有斜线。
 *
 * @var string
 */
if ( !defined( 'THEME_AVATAR_PATH' ) )
	define( 'THEME_AVATAR_PATH', '/cache/' . THEME_SLUG . '/avatar' );

/**
 * 缩略图存储目录
 *
 * 基于 `WP_CONTENT_DIR` 常量的目录，结尾不要有斜线。
 *
 * @var string
 */
if ( !defined( 'THEME_THUMBNAIL_PATH' ) )
	define( 'THEME_THUMBNAIL_PATH', '/cache/' . THEME_SLUG . '/thumbnail' );

/**
 * 主题运行需要的 WordPress 版本
 *
 * @since Beginning 4.0.0
 * @var string
 */
if ( !defined( 'THEME_REQUIRED_WP' ) )
	define( 'THEME_REQUIRED_WP', '4.2-alpha' );

/**
 * Favicon 图标储存目录
 *
 * 基于 `WP_CONTENT_DIR` 常量的目录，结尾不要有斜线。
 *
 * @since Beginning 4.1.0
 * @var string
 */
if ( !defined( 'THEME_FAVICON_PATH' ) )
	define( 'THEME_FAVICON_PATH', '/cache/' . THEME_SLUG . '/favicon' );

// End of page.
