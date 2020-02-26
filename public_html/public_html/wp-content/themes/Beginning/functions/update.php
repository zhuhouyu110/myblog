<?php
/**
 * 检测主题数据库版本号
 *
 * 如果检测到主题数据库版本号变化，则根据旧版本的情况执行数据升级操作，
 * 并且触发对应的动作钩子。
 *
 * @since Beginning 4.0.2
 */
function Bing_check_db_version() {
	if ( ( $db_version = Bing_get_db_version() ) == THEME_DB_VERSION )
		return;

	if ( empty( $db_version ) )
		do_action( 'theme_start' );

	if ( !function_exists( 'Bing_upgrade_theme' ) )
		require( get_template_directory() . '/functions/upgrade.php' );

	Bing_upgrade_theme();

	if ( $db_version ) {
		$args = array( 'N/A', wp_get_theme()->get( 'Version' ) );
		do_action_deprecated( 'theme_update', $args, '4.0.2', 'theme_upgrade' );
	}
}
add_action( 'init', 'Bing_check_db_version', 2 );

/**
 * 获取主题数据库版本号
 *
 * @since Beginning 4.0.2
 */
function Bing_get_db_version() {
	if ( $db_version = get_theme_mod( 'db_version' ) )
		return $db_version;

	// 兼容 3.0 版本开始的规则
	if ( $db_version = (int) get_option( get_stylesheet() . '_db_version' ) ) {
		set_theme_mod( 'db_version', $db_version );
		return $db_version;
	}

	// 兼容最早的规则
	if ( $version = get_option( THEME_SLUG . '_version' ) ) {
		$db_version = Bing_translate_theme_db_version( $version );

		set_theme_mod( 'db_version', $db_version );
		return $db_version;
	}

	return false;
}

/**
 * 根据主题版本号计算对应的数据库版本号
 *
 * 只适用于计算主题 3.0 以及之前版本的数据库版本号，否则一律返回 3.0 主题的数据库版本号。
 */
function Bing_translate_theme_db_version( $version ) {
	$old_versions = array(
		'1.0',
		'1.1',
		'1.2',
		'1.2.1',
		'1.3',
		'1.3.1',
		'2.0',
		'2.0.1',
		'2.1',
		'3.0'
	);

	$db_version = 1;

	foreach ( $old_versions as $old_version ) {
		if ( version_compare( $version, $old_version, '<=' ) ) {
			// 非法版本使用最近的上一个版本号
			if ( !in_array( $version, $old_versions ) )
				--$db_version;

			break;
		}

		++$db_version;
	}

	return $db_version;
}

// End of page.
