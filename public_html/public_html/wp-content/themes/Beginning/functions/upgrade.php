<?php
/**
 * 升级主题
 *
 * @since Unknown
 * @since Beginning 4.0.2 会根据情况返回不同的值。
 * @since Beginning 4.0.4 只有保存数据库版本号成功才会返回 True。
 *
 * @return bool 是否执行了升级操作。
 */
function Bing_upgrade_theme() {
	if ( ( $db_version = get_theme_mod( 'db_version' ) ) == THEME_DB_VERSION )
		return false;

	if ( $db_version < 2 )
		Bing_upgrade_theme_110();

	if ( $db_version < 3 )
		Bing_upgrade_theme_120();

	if ( $db_version < 5 )
		Bing_upgrade_theme_130();

	if ( $db_version < 6 )
		Bing_upgrade_theme_131();

	if ( $db_version < 7 )
		Bing_upgrade_theme_200();

	if ( $db_version < 10 )
		Bing_upgrade_theme_300();

	if ( $db_version < 11 )
		Bing_upgrade_theme_310();

	if ( $db_version < 13 )
		Bing_upgrade_theme_320();

	if ( $db_version < 16 )
		Bing_upgrade_theme_400();

	if ( $db_version < 18 )
		Bing_upgrade_theme_402();

	if ( $db_version < 23 )
		Bing_upgrade_theme_411();

	if ( $result = set_theme_mod( 'db_version', THEME_DB_VERSION ) )
		do_action( 'theme_upgrade', THEME_DB_VERSION, $db_version );

	return $result;
}

/**
 * 升级主题到 1.1 版本
 */
function Bing_upgrade_theme_110(){
	$mpanel = Bing_mpanel();

	if( $mpanel->get( 'crop_thumbnail' ) === false )
		$mpanel->update( 'crop_thumbnail', $mpanel->get( 'timthumb' ) );

	$mpanel->delete( 'timthumb' );

	foreach( array( 'header', 'footer', 'post_bottom' ) as $banner ){
		$banner_id = 'banner_' . $banner;

		$defaults = array(
			'type'        => 'img',
			'tab'         => true,
			'mobile_show' => true
		);

		foreach( $defaults as $key => $value ){
			$option = $banner_id . '_' . $key;
			if( $mpanel->get( $option ) === false )
				$mpanel->update( $option, $value );
		}
	}
}

/**
 * 升级主题到 1.2 版本
 */
function Bing_upgrade_theme_120(){
	$mpanel = Bing_mpanel();

	foreach( array( 'progress', 'hot_searches', 'first_line_indent' ) as $option )
		if( $mpanel->get( $option ) === false )
			$mpanel->update( $option, true );

	if( $mpanel->get( 'related_posts_number' ) === false )
		$mpanel->update( 'related_posts_number', 3 );

	if( $mpanel->get( 'main_color' ) === false )
		$mpanel->update( 'main_color', '#237DED' );

	foreach( array( 'header', 'footer', 'post_bottom' ) as $banner ){
		$banner_id = 'banner_' . $banner;

		if( $mpanel->get( $banner_id . '_client' ) === false ){
			$option_value = array( 'pc' );

			if( $mpanel->get( $banner_id . '_mobile_show' ) )
				$option_value[] = 'mobile';

			$mpanel->update( $banner_id . '_client', $option_value );
		}

		$mpanel->delete( $banner_id . '_mobile_show' );
	}
}

/**
 * 升级主题到 1.3 版本
 */
function Bing_upgrade_theme_130(){
	$mpanel = Bing_mpanel();

	foreach( array( 'return_top', 'sidebar' ) as $option )
		if( $mpanel->get( $option ) === false )
			$mpanel->update( $option, true );

	$new_default_sidebar = sanitize_title( THEME_SLUG . '_default' );
	$sidebars_widgets    = wp_get_sidebars_widgets();

	if( is_array( $sidebars_widgets ) && !empty( $sidebars_widgets['widget_sidebar'] ) && empty( $sidebars_widgets[$new_default_sidebar] ) ){
		$sidebars_widgets[$new_default_sidebar] = $sidebars_widgets['widget_sidebar'];
		unset( $sidebars_widgets['widget_sidebar'] );

		wp_set_sidebars_widgets( $sidebars_widgets );
	}
}

/**
 * 升级主题到 1.3.1 版本
 */
function Bing_upgrade_theme_131(){
	foreach( array( 'header_menu', 'footer_menu' ) as $theme_location )
		delete_transient( 'nav_menu_' . $theme_location );
}

/**
 * 升级主题到 2.0 版本
 */
function Bing_upgrade_theme_200(){
	$mpanel = Bing_mpanel();

	if( strtoupper( $mpanel->get( 'main_color' ) ) == '#237DED' )
		$mpanel->update( 'main_color', '#2D6DCC' );

	delete_transient( THEME_SLUG . '_update_content' );
}

/**
 * 升级主题到 3.0 版本
 */
function Bing_upgrade_theme_300(){
	$mpanel = Bing_mpanel();

	$defaults = array(
		'slider_home_number'            => 5,
		'slider_home_page_items_number' => 1,
		'slider_home_dots'              => true,
		'slider_home_loop'              => true,
		'slider_home_auto_play'         => true,
		'slider_home_auto_play_speed'   => 5,
		'slider_home_switch_speed'      => 250,
		'slider_home_height'            => 260,
		'slider_home_query'             => 'new'
	);

	foreach( $defaults as $option => $value )
		if( $mpanel->get( $option ) === false )
			$mpanel->update( $option, $value );

	$mpanel->delete( 'hide_safari_bar' );
}

/**
 * 升级主题到 3.1 版本
 */
function Bing_upgrade_theme_310(){
	$mpanel = Bing_mpanel();

	if( $mpanel->get( 'editor_preview' ) === false )
		$mpanel->update( 'editor_preview', true );
}

/**
 * 升级主题到 3.2 版本
 */
function Bing_upgrade_theme_320() {
	$mpanel = Bing_mpanel();

	if ( $mpanel->get( 'footer_menu' ) === false )
		$mpanel->update( 'footer_menu', true );

	if ( $mpanel->get( 'sidebar_width' ) === false )
		$mpanel->update( 'sidebar_width', 240 );

	delete_site_transient( THEME_SLUG . '_update_content' );
}

/**
 * 升级主题到 4.0 版本
 *
 * @since Beginning 4.0.0
 */
function Bing_upgrade_theme_400() {
	$mpanel = Bing_mpanel();

	// 清理残余数据
	if (
		!get_option( THEME_SLUG . '_welcome' ) &&
		get_option( THEME_SLUG . '_welcome' ) !== false
	)
		delete_option( THEME_SLUG . '_welcome' );

	// 重新激活主题设置引导
	$mpanel->open_mpanel_pointer();

	// 更新版权连接为 HTTPS
	$copyright     = $mpanel->get( 'footer_text_right' );
	$new_copyright = str_replace( 'http://www.bgbk.org', 'https://www.bgbk.org', $copyright );

	if ( $copyright != $new_copyright )
		$mpanel->update( 'footer_text_right', $new_copyright );

	// 更新有关主颜色的设置
	if ( $mpanel->get( 'main_color_source' ) === false ) {
		// 随机颜色插件集成至主题
		if ( function_exists( 'Bing_Beginning_random_main_color' ) )
			$main_color_source = 'rand';
		elseif ( $mpanel->get( 'custom_main_color' ) )
			$main_color_source = 'custom';
		else
			$main_color_source = 'default';

		$mpanel->update( 'main_color_source', $main_color_source );
	}

	$mpanel->delete( 'custom_main_color' );

	// 填充旧版的页面侧边栏数据
	if ( $sidebar_location_post = $mpanel->get( 'sidebar_location_post' ) )
		foreach ( get_pages() as $page )
			if ( $mpanel->get( 'sidebar_location_page_' . $page->ID ) === false )
				$mpanel->update( 'sidebar_location_page_' . $page->ID, $sidebar_location_post );

	// 开启标签降级
	if ( $mpanel->get( 'headings_tags_downgrade' ) === false )
		$mpanel->update( 'headings_tags_downgrade', true );
}

/**
 * 升级主题到 4.0.2 版本
 *
 * @since Beginning 4.0.2
 */
function Bing_upgrade_theme_402() {
	$mpanel = Bing_mpanel();

	// 设置关于页面内容
	if ( $mpanel->get( 'about_page' ) === false )
		$mpanel->update( 'about_page', 'footer' );

	// 删除旧的数据库储存的版本号
	delete_option( get_stylesheet() . '_db_version' );
	delete_option( THEME_SLUG . '_version' );
}

/**
 * 升级主题到 4.1.1 版本
 *
 * @since Beginning 4.1.1
 */
function Bing_upgrade_theme_411() {
	$mpanel = Bing_mpanel();

	// 设置关于页面内容
	if ( $mpanel->get( 'mobile_single_collapse' ) === false )
		$mpanel->update( 'mobile_single_collapse', true );
}

// End of page.
