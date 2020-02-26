<?php
/**
 * 解决 Emoji 表情无法使用的问题
 *
 * @since Unknown
 * @deprecated Beginning 4.0.1 Use Bing_emoji_url_cdnjs()
 *
 * 添加于 Beginning 4.0.2 版本，4.0.1 出于疏忽忘记将函数移动至此，而是
 * 直接被删除，这里补上。
 *
 * `add_filter( 'emoji_url', 'Bing_emoji_url_maxcdn', 8 );`
 */
function Bing_emoji_url_maxcdn() {
	_deprecated_function( __FUNCTION__, '4.0.1', 'Bing_emoji_url_cdnjs()' );
	return set_url_scheme( '//twemoji.maxcdn.com/72x72/' );
}

/**
 * 解决 SVG Emoji 表情无法使用的问题
 *
 * @since Unknown
 * @deprecated Beginning 4.0.1 Use Bing_emoji_svg_url_cdnjs()
 *
 * 添加于 Beginning 4.0.2 版本，4.0.1 出于疏忽忘记将函数移动至此，而是
 * 直接被删除，这里补上。
 *
 * `add_filter( 'emoji_svg_url', 'Bing_emoji_svg_url_maxcdn', 8 );`
 */
function Bing_emoji_svg_url_maxcdn() {
	_deprecated_function( __FUNCTION__, '4.0.1', 'Bing_emoji_svg_url_cdnjs()' );
	return set_url_scheme( '//twemoji.maxcdn.com/svg/' );
}

/**
 * 删除 MaxCDN 消失的表情
 *
 * 因为 MaxCDN 莫名其妙的删除了两个表情，导致出现图片 404 的情况，所以暂时删除了这两个表情。
 *
 * @since Unknown
 * @deprecated Beginning 4.0.1
 *
 * add_action( 'init', 'Bing_remove_die_smileys', 8 );
 */
function Bing_remove_die_smileys() {
	global $wpsmiliestrans;
	_deprecated_function( __FUNCTION__, '4.0.1' );

	if( !isset( $wpsmiliestrans ) || !is_array( $wpsmiliestrans ) )
		return;

	$remove_smileys = array(
		"\xf0\x9f\x99\x82",
		"\xf0\x9f\x99\x81",

		"\xf0\x9f\x99\x84"
	);

	foreach ( $wpsmiliestrans as $key => $smiley )
		if ( in_array( $smiley, $remove_smileys ) )
			unset( $wpsmiliestrans[$key] );
}

/**
 * 保存主题版本
 *
 * @since Unknown
 * @deprecated Beginning 4.0.2 Use Bing_check_db_version()
 *
 * `add_action( 'init', 'Bing_save_theme_version', 16 );`
 */
function Bing_save_theme_version() {
	_deprecated_function( __FUNCTION__, '4.0.2', 'Bing_check_db_version()' );
	return Bing_check_db_version();
}

/**
 * 文章访问计数
 *
 * @since Unknown
 * @since 4.0.1 统计所有公开文章类型和文章状态的文章。
 *
 * @deprecated Beginning 4.0.4 Use Bing_Views_Stats::stats()
 *
 * `add_action( 'template_redirect', 'Bing_post_statistics_views' );`
 */
function Bing_post_statistics_views() {
	_deprecated_function( __FUNCTION__, '4.0.4', 'Bing_Views_Stats::stats()' );

	Bing_Views_Stats::init();
	Bing_Views_Stats::$object->stats();
}

/**
 * 获取计数
 *
 * @since Unknown
 * @deprecated Beginning 4.0.4 Use Bing_Views_Stats::get()
 */
function Bing_post_views( $post = null ) {
	_deprecated_function( __FUNCTION__, '4.0.4', 'Bing_Views_Stats::get()' );

	$views = Bing_Views_Stats::get( $post );
	return number_format_i18n( $views );
}

/**
 * 面包屑导航
 *
 * @since Unknown
 * @deprecated Beginning 4.0.4 Use Bing_Breadcrumbs::output()
 */
function Bing_breadcrumbs( $separator = '/', $before = '<div class="breadcrumb"%s>', $after = '</div>', $home = '' ) {
	_deprecated_function( __FUNCTION__, '4.0.4', 'Bing_Breadcrumbs::output()' );

	$breadcrumbs = new Bing_Breadcrumbs( true );
	$code        = $breadcrumbs->get_code();

	// 转换首页图标
	$home = empty( $home ) ? __( '首页', 'Bing' ) : $home;
	$home = '<a href="' . esc_url( home_url('index.php') ) . '" itemprop="breadcrumb">' . $home . '</a>';

	// 替换首页图标
	$code = preg_replace( '/<li class="home">(.*?)<\/li>/', $home . '</li>', $code );

	// 替换分隔符
	$code = substr_replace( $code, '', strrpos( $code, '</li>' ), 5 );
	$code = str_replace( '</li>', $separator, $code );

	// 替换前置字符串
	$before = sprintf( $before, ' itemscope itemtype="http://schema.org/WebPage"' );
	$code   = preg_replace( '/<ol[^>]*>/', $before, $code );

	// 替换后置字符串和多余部分
	$code = str_replace( '</ol>', $after, $code );
	$code = str_replace( '<li>',  '',     $code );

	echo $code;
}

/**
 * 生成分类法层级目录
 *
 * @since Unknown
 * @deprecated Beginning 4.0.4
 *
 * @see Bing_breadcrumbs()
 */
function Bing_taxonomy_parents( $ID, $taxonomy = 'category', $separator = '/' ) {
	_deprecated_function( __FUNCTION__, '4.0.4' );

	$parent  = get_term( $ID, $taxonomy );
	$visited = array();
	$result  = '';

	if (
		$parent->parent != 0                &&
		$parent->parent != $parent->term_id &&
		!in_array( $parent->parent, $visited )
	) {
		$visited[] = $parent->parent;
		$result    .= Bing_taxonomy_parents( $parent->parent, $taxonomy, $separator );
	}

	$result .= sprintf(
		'<a itemprop="breadcrumb" href="%s">%s</a>%s',
		esc_url( get_term_link( $parent->term_id, $taxonomy ) ),
		$parent->name,
		$separator
	);

	return $result;
}

/**
 * 获取新版本更新内容
 *
 * @since Unknown
 * @deprecated Beginning 4.1.0
 */
function Bing_update_content() {
	_deprecated_function( __FUNCTION__, '4.1.0' );
	return false;
}

// End of page.
