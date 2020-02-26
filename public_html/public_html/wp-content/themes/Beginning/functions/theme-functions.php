<?php
/**
 * 选项初始化和调用
 *
 * @since Unknown
 * @since Beginning 4.0.4 对过早的调用抛出警告信息。
 * @since Beginning 4.0.5 不再按需自动引入 `Bing_Mpanel` 类；过早调用时直接退出函数。
 *
 * `add_action( 'after_setup_theme', 'Bing_mpanel', 2, 0 );`
 */
function Bing_mpanel( $option = false ) {
	static $mpanel;

	if ( !did_action( 'after_setup_theme' ) ) {
		_doing_it_wrong(
			__FUNCTION__,
			__( '请务必在 `after_setup_theme` 动作钩子运行之后再调用此函数。', 'Bing' ),
			'4.0.4'
		);

		return false;
	}

	if ( !isset( $mpanel ) )
		$mpanel = new Bing_Mpanel();

	if ( $option === false )
		return $mpanel;

	$value = $mpanel->get( $option );
	$value = apply_filters( 'Bing_mpanel_' . $option, $value, $option, $mpanel );

	return $value;
}

/**
 * 自动加载
 *
 * @since Beginning 4.0.5
 * @see Bing_theme_objects_init()
 */
function Bing_theme_auto_loader( $name ) {
	if ( strpos( $name, 'Bing_' ) !== 0 )
		return;

	$name = strtolower( substr( $name, 5 ) );
	$name = str_replace( '_', '-', $name );

	if ( validate_file( $name ) !== 0 )
		return;

	$directory = get_template_directory();
	$filename  = "{$directory}/functions/class-{$name}.php";

	if ( file_exists( $filename ) )
		require( $filename );
}

/**
 * 主题对象初始化
 *
 * @since Beginning 4.0.5
 */
function Bing_theme_objects_init() {
	// 注册自动加载
	spl_autoload_register( 'Bing_theme_auto_loader' );

	// 初始化设置选项
	Bing_mpanel();

	// 初始化主题更新
	Bing_Theme_Update::init();

	// 初始化垃圾评论防御
	add_action( 'init', array( 'Bing_Anti_Spam', 'init' ) );

	// 初始化浏览统计
	Bing_Views_Stats::init();
}
add_action( 'after_setup_theme', 'Bing_theme_objects_init', 2 );

/**
 * 语言本地化
 */
function Bing_theme_localize(){
	load_theme_textdomain( 'Bing', get_template_directory() . '/languages' );
}
add_action( 'after_setup_theme', 'Bing_theme_localize' );

/**
 * 显示不兼容提示信息
 */
function Bing_theme_wp_version_compatible(){
	global $wp_version;

	if (
		version_compare( THEME_REQUIRED_WP, $wp_version, '>' ) &&
		current_user_can( 'update_core' )
	)
		echo '
			<div class="error" id="theme-wp-version-compatible">
				<p>
					<strong>' . __( '警告：', 'Bing' ) . '</strong>'
					. sprintf(
						__(
							'%s 主题能完美运行至少需要 WordPress %s 版本，您当前的 WordPress 版本（%s）可能会使主题部分功能出现问题；为了安全性和兼容性考虑，请尽快升级 WordPress 到最新版本，或者至少升级到能使主题完美运行的最低版本。',
							'Bing'
						),
						THEME_NAME,
						THEME_REQUIRED_WP,
						$wp_version
					) .
				'</p>
			</div>';
}
add_action( 'admin_notices', 'Bing_theme_wp_version_compatible', 8 );

/**
 * 关闭 Admin Bar
 *
 * @see is_admin_bar_showing()
 */
add_filter( 'show_admin_bar', '__return_false', 8 );

/**
 * 添加文章编辑器样式表
 */
function Bing_add_editor_style(){
	if( !Bing_mpanel( 'editor_preview' ) )
		return;

	$args = array(
		'action' => 'theme_editor_style',
		'ver'    => THEME_DB_VERSION
	);
	$url = add_query_arg( $args, admin_url( 'admin-ajax.php' ) );

	add_editor_style( $url );
}
add_action( 'after_setup_theme', 'Bing_add_editor_style' );

/**
 * 添加主题功能支持
 */
function Bing_add_theme_support() {
	// HTML5
	add_theme_support( 'html5' );

	// 网页标题
	add_theme_support( 'title-tag' );

	// 特色图片
	add_theme_support( 'post-thumbnails' );

	// 自定义背景
	add_theme_support( 'custom-background', array( 'default-color' => 'F0F0F5' ) );
}
add_action( 'after_setup_theme', 'Bing_add_theme_support' );

/**
 * 优化搜索页标题
 */
function Bing_optimize_search_title( $title ) {
	if( is_search() && !get_search_query() )
		$title['title'] = __( '搜索', 'Bing' );

	return $title;
}
add_filter( 'document_title_parts', 'Bing_optimize_search_title', 12 );

/**
 * 挂载脚本
 *
 * @uses wp_register_style() 注册 CSS 样式表
 * @uses wp_enqueue_style()  挂载 CSS 样式表
 *
 * @uses wp_register_script() 注册 JavaScript 脚本
 * @uses wp_enqueue_script()  挂载 JavaScript 脚本
 */
function Bing_enqueue_scripts() {
	// IE8
	wp_enqueue_style( 'theme-ie8', get_template_directory_uri() . '/css/ie8.css', array( 'theme-style' ), THEME_DB_VERSION );
	wp_style_add_data( 'theme-ie8', 'conditional', 'lt IE 9' );

	// NProgress
	wp_register_style( 'theme-nprogress', get_template_directory_uri() . '/css/nprogress.css', array( 'theme-style' ), THEME_DB_VERSION );
	wp_register_script( 'theme-nprogress', get_template_directory_uri() . '/js/nprogress.js', array( 'theme-base' ), THEME_DB_VERSION );
	if ( Bing_mpanel( 'progress' ) && Bing_mpanel( 'ajax_load_page' ) ){
		wp_enqueue_style( 'theme-nprogress' );
		wp_enqueue_script( 'theme-nprogress' );
	}

	// Owl carousel
	wp_register_style( 'theme-owl-carousel', get_template_directory_uri() . '/css/owl.carousel.css', array( 'theme-style' ), THEME_DB_VERSION );
	wp_register_script( 'theme-owl-carousel', get_template_directory_uri() . '/js/owl.carousel.min.js', array( 'jquery', 'theme-base' ), THEME_DB_VERSION );
	if ( Bing_mpanel( 'slider_home' ) ){
		wp_enqueue_style( 'theme-owl-carousel' );
		wp_enqueue_script( 'theme-owl-carousel' );
	}

	// Responsive
	wp_register_style( 'theme-responsive', get_template_directory_uri() . '/css/responsive.css', array( 'theme-style' ), THEME_DB_VERSION );

	if ( Bing_mpanel( 'responsive' ) )
		wp_enqueue_style( 'theme-responsive' );

	// Comment reply
	if ( get_option( 'thread_comments' ) )
		wp_enqueue_script( 'comment-reply' );

	// Style
	wp_enqueue_style( 'theme-style', get_stylesheet_uri(), array( 'dashicons' ), THEME_DB_VERSION );

	// Base
	wp_enqueue_script( 'theme-base', get_template_directory_uri() . '/js/base.js', array( 'jquery' ), THEME_DB_VERSION );
	wp_localize_script( 'theme-base', 'theme_base_args', array(
		'admin_ajax'      => admin_url( 'admin-ajax.php' ),
		'ajax_comment'    => Bing_mpanel( 'ajax_comment' ),
		'comment_loading' => __( '正在提交...', 'Bing' ),
		'ajax_load_page'  => Bing_mpanel( 'ajax_load_page' ),
		'insert_smiley'   => Bing_insert_smiley(),
		'progress'        => Bing_mpanel( 'progress' ) && Bing_mpanel( 'ajax_load_page' ),
		'imageFirewall'   => Bing_mpanel( 'image_firewall' ) ? parse_url( home_url('index.php'), PHP_URL_HOST ) : false
	) );

	// HTML 5
	wp_enqueue_script( 'theme-html5', get_template_directory_uri() . '/js/html5.js', array(), '3.7.0' );
	wp_script_add_data( 'theme-html5', 'conditional', 'lt IE 9' );
}
add_action( 'wp_enqueue_scripts', 'Bing_enqueue_scripts' );

/**
 * 获取文章摘要
 *
 * 可以自定义摘要的字数（长度）和省略号样式；
 * 同时，作为 excerpt_length 和 excerpt_more 钩子的回调函数，根据条件返回摘要的字数和省略号样式。
 *
 * @see the_excerpt()
 * @see get_the_excerpt()
 * @see wp_trim_excerpt()
 *
 * @link http://www.endskin.com/excerpt-length-more/
 * 
 * @param int    $length 摘要字数；默认值为 100 个字。
 * @param string $more   省略号样式；默认值为西文省略号的 HTML 转义字符（&hellip;）。
 * @param bool   $echo   是否直接输出摘要，分别对应 the_excerpt() 和 get_the_excerpt() 函数；默认值为 False。
 *
 * @return string|int
 */
function Bing_excerpt( $length = 100, $more = '&hellip;', $echo = false ){
	static $excerpt_length, $excerpt_more;

	$current_filter = current_filter();

	if ( $current_filter == 'excerpt_length' ) return $excerpt_length;
	if ( $current_filter == 'excerpt_more'   ) return $excerpt_more;

	$excerpt_length = $length;
	$excerpt_more   = $more;

	$callable = __FUNCTION__;
	add_filter( 'excerpt_length', $callable, 18 );
	add_filter( 'excerpt_more',   $callable, 18 );

		$excerpt = $echo ? the_excerpt() : get_the_excerpt();

	remove_filter( 'excerpt_length', $callable, 18 );
	remove_filter( 'excerpt_more',   $callable, 18 );

	unset( $excerpt_length, $excerpt_more );
	return $excerpt;
}

/**
 * 获取网页描述
 */
function Bing_site_description( $home ){
	if( is_home() || is_front_page() ) {
		$description = $home;
	} elseif( is_category() || is_tag() || is_tax() ) {
		$description = term_description();
	} elseif( is_singular() ) {
		$description = wp_trim_words( get_post()->post_content, 120, '' );
	} elseif( is_author() ) {
		$description = get_the_author_meta( 'description' );
	} elseif( is_date() ) {
		if ( is_day() )
			$d = __( 'Y年m月d日', 'Bing' );
		elseif ( is_month() )
			$d = __( 'Y年m月', 'Bing' );
		else
			$d = __( 'Y年', 'Bing' );

		$date        = get_the_date( $d );
		$description = sprintf( __( '%s发布的文章', 'Bing' ), $date );
	} else {
		return '';
	}

	return strip_tags( trim( $description ) );
}

/**
 * 打印网页描述元标记
 */
function Bing_add_site_description_meta(){
	if( $description = Bing_site_description( Bing_mpanel( 'site_description' ) ) )
		echo '<meta name="description" content="' . esc_attr( $description ) . '" />';
}
add_action( 'wp_head', 'Bing_add_site_description_meta' );

/**
 * 调用侧边栏
 */
function Bing_sidebar(){
	if( Bing_mpanel( 'sidebar' ) )
		add_action( 'get_footer', 'get_sidebar', 1, 0 );
}
add_action( 'init', 'Bing_sidebar' );

/**
 * 移除侧边栏
 */
function Bing_remove_sidebar(){
	remove_action( 'get_footer', 'get_sidebar', 1 );
}

/**
 * 告知 pingback 网址
 * 通过添加 `<link>` 标签，告知访问者文章的 pingback 网址。
 */
function Bing_pingback_link() {
	if ( !is_singular() || !pings_open() )
		return;

	$url = get_bloginfo( 'pingback_url', 'display' );
	echo '<link rel="pingback" href="' . esc_url( $url ) . '" />';
}
add_action( 'wp_head', 'Bing_pingback_link', 2 );

/**
 * IE 浏览器使用最新模式渲染
 */
function Bing_ie_edge(){
	echo '<meta http-equiv="X-UA-Compatible" content="IE=edge">';
}
add_action( 'wp_head', 'Bing_ie_edge', 4 );

/**
 * 响应式布局
 */
function Bing_responsive(){
	if( !Bing_mpanel( 'responsive' ) )
		return;

	$content = array(
		'width'         => 'device-width',
		'initial-scale' => 1,
		'maximum-scale' => 1,
		'user-scalable' => 'no'
	);
	$content = apply_filters( 'responsive_viewport', $content );

	$content_value = urldecode( http_build_query( $content, '', ',' ) );
	echo '<meta name="viewport" content="' . esc_attr( $content_value ) . '">';
}
add_action( 'wp_head', 'Bing_responsive', 6 );

/**
 * 生成空白首页文件
 */
function Bing_build_empty_index( $path ){
	$index = $path . '/index.php';

	if( is_file( $index ) )
		return;

	wp_mkdir_p( $path );
	file_put_contents( $index, "<?php\n// Silence is golden.\n" );
}

/**
 * 头像缓存
 */
function Bing_avatar_cache( $url, $id_or_email, $args ){
	if( !Bing_mpanel( 'avatar_cache' ) || apply_filters( 'pre_option_show_avatars', false ) )
		return $url;

	if( is_numeric( $id_or_email ) )
		$user = get_user_by( 'id', absint( $id_or_email ) );
	elseif( is_string( $id_or_email ) )
		strpos( $id_or_email, '@md5.gravatar.com' ) ? list( $email_hash ) = explode( '@', $id_or_email ) : $email = $id_or_email;
	elseif( $id_or_email instanceof WP_User )
		$user = $id_or_email;
	elseif( $id_or_email instanceof WP_Post )
		$user = get_user_by( 'id', (int) $id_or_email->post_author );
	elseif( is_object( $id_or_email ) && isset( $id_or_email->comment_ID ) ){
		if( !empty( $id_or_email->user_id ) )
			$user = get_user_by( 'id', (int) $id_or_email->user_id );

		if( ( empty( $user ) || is_wp_error( $user ) ) && !empty( $id_or_email->comment_author_email ) )
			$email = $id_or_email->comment_author_email;
	}

	if( empty( $email_hash ) ){
		if( !empty( $user ) )
			$email = $user->user_email;

		$email_hash = md5( strtolower( trim( $email ) ) );
	}

	$file_path  = WP_CONTENT_DIR . THEME_AVATAR_PATH . "/$email_hash.png";
	$cache_time = Bing_mpanel( 'avatar_cache_day' ) * DAY_IN_SECONDS;

	if( !is_file( $file_path ) || ( $cache_time > 0 && ( time() - filemtime( $file_path ) ) >= $cache_time ) ){
		remove_filter( 'get_avatar_url', 'Bing_avatar_cache', 16 );

			$args['size']      = 150;
			$avatar_cache_size = get_avatar_url( $id_or_email, $args );

		add_filter( 'get_avatar_url', 'Bing_avatar_cache', 16, 3 );

		$editor = wp_get_image_editor( $avatar_cache_size );

		if( is_wp_error( $editor ) )
			return $url;

		Bing_build_empty_index( WP_CONTENT_DIR . THEME_AVATAR_PATH );

		if( is_wp_error( $editor->save( $file_path, 'image/png' ) ) )
			return $url;
	}

	return content_url( THEME_AVATAR_PATH . "/$email_hash.png" );
}
add_filter( 'get_avatar_url', 'Bing_avatar_cache', 16, 3 );

/**
 * 统一头像 Alt 标签
 */
function Bing_avatar_alt( $args ){
	if( empty( $args['alt'] ) )
		$args['alt'] = __( 'Gravatar 头像', 'Bing' );

	return $args;
}
add_filter( 'get_avatar_data', 'Bing_avatar_alt', 16 );

/**
 * 搜索结果只限文章
 */
function Bing_search_filter_post( $query ){
	if( Bing_mpanel( 'search_filter_post' ) && !is_admin() && $query->is_main_query() && $query->is_search() )
		$query->set( 'post_type', 'post' );

	return $query;
}
add_filter( 'pre_get_posts', 'Bing_search_filter_post' );

/**
 * 搜索结果只有一篇文章时自动跳转到该文章
 */
function Bing_search_one_redirect(){
	if( !Bing_mpanel( 'search_one_redirect' ) || Bing_mpanel( 'ajax_load_page' ) )
		return;

	global $wp_query;

	if( $wp_query->is_search() && $wp_query->found_posts == 1 ){
		wp_redirect( get_permalink( $wp_query->posts['0']->ID ) );
		die;
	}
}
add_action( 'template_redirect', 'Bing_search_one_redirect' );

/**
 * 移除头部无用信息
 */
function Bing_remove_head_refuse(){
	if( !Bing_mpanel( 'remove_head_refuse' ) )
		return;

	remove_action( 'wp_head', 'wp_generator'                        );
	remove_action( 'wp_head', 'index_rel_link'                      );
	remove_action( 'wp_head', 'parent_post_rel_link',            10 );
	remove_action( 'wp_head', 'start_post_rel_link',             10 );
	remove_action( 'wp_head', 'adjacent_posts_rel_link_wp_head', 10 );
	remove_action( 'wp_head', 'feed_links',                       2 );
	remove_action( 'wp_head', 'feed_links_extra',                 3 );
}
add_action( 'init', 'Bing_remove_head_refuse' );

/**
 * 关闭离线编辑器接口
 */
function Bing_remove_xmlrpc(){
	if( !Bing_mpanel( 'remove_xmlrpc' ) )
		return;

	remove_action( 'wp_head', 'rsd_link' );
	remove_action( 'wp_head', 'wlwmanifest_link' );

	add_filter( 'xmlrpc_enabled', '__return_false' );
}
add_action( 'init', 'Bing_remove_xmlrpc', 5 );

/**
 * 阻止站内文章互相 Pingback
 *
 * @link http://www.endskin.com/noself-pingback
 */
function Bing_no_self_pingback( &$links ){
	if( !Bing_mpanel( 'no_self_pingback' ) )
		return;

	$home_url = home_url('index.php');
	foreach( $links as $key => $value )
		if( strpos( $value, $home_url ) !== false )
			unset( $links[$key] );
}
add_action( 'pre_ping', 'Bing_no_self_pingback' );

/**
 * 文章内容链接全部在新窗口打开
 */
function Bing_post_auto_blank( $content ){
	if( Bing_mpanel( 'post_auto_blank' ) && is_single() )
		$content = str_replace( '<a', '<a target="_blank"', $content );

	return $content;
}
add_filter( 'the_content', 'Bing_post_auto_blank', 13 );

/**
 * 文章内容外链全部添加 nofollow 并在新窗口打开
 *
 * PS：待调整
 */
function Bing_post_auto_nofollow_blank( $content ){
	if( !Bing_mpanel( 'post_auto_nofollow_blank' ) || !is_single() )
		return $content;

	$regexp = "<a\s[^>]*href=(\"??)([^\" >]*?)\\1[^>]*>";

	if( preg_match_all( "/$regexp/siU", $content, $matches, PREG_SET_ORDER ) ){
		if( !empty( $matches ) ){
			$site_url = site_url();
			for( $i = 0; $i < count( $matches ); ++$i ){
				$tag = $matches[$i][0];
				$tag2 = $matches[$i][0];
				$url = $matches[$i][0];
				$noFollow = '';
				$pattern = '/target\s*=\s*"\s*_blank\s*"/';
				preg_match( $pattern, $tag2, $match, PREG_OFFSET_CAPTURE );
				if( count( $match ) < 1 ) $noFollow .= ' target="_blank" '; 
				$pattern = '/rel\s*=\s*"\s*[n|d]ofollow\s*"/';
				preg_match( $pattern, $tag2, $match, PREG_OFFSET_CAPTURE );
				if( count( $match ) < 1 ) $noFollow .= ' rel="nofollow" ';
				$pos = strpos( $url, $site_url );
				if( $pos === false ){
					$tag = rtrim( $tag, '>' );
					$tag .= $noFollow . '>';
					$content = str_replace( $tag2, $tag, $content );
				}
			}
		}
	}

	return $content;
}
add_filter( 'the_content', 'Bing_post_auto_nofollow_blank', 14 );

/**
 * 文章编辑器功能扩展
 */
function Bing_editor_add_functions( $buttons ){
	array_push( $buttons, 'fontselect', 'fontsizeselect', 'backcolor', 'underline', 'hr', 'sub', 'sup', 'cut', 'copy', 'paste', 'cleanup', 'wp_page', 'newdocument' );
	return $buttons;
}
add_filter( 'mce_buttons_3', 'Bing_editor_add_functions' );

/**
 * 自定义头部代码
 */
function Bing_custom_head_code(){
	echo Bing_mpanel( 'head_code' );
}
add_action( 'wp_head', 'Bing_custom_head_code', 14 );

/**
 * 自定义底部代码
 */
function Bing_custom_footer_code(){
	echo Bing_mpanel( 'footer_code' );
}
add_action( 'wp_footer', 'Bing_custom_footer_code', 14 );

/**
 * 获取页面标题标签
 *
 * @since Beginning 4.0.0
 */
function Bing_get_page_title_tag() {
	return Bing_mpanel( 'headings_tags_downgrade' ) ? 'h2' : 'h1';
}

/**
 * 获取主列表标题标签
 *
 * @since Beginning 4.0.0
 */
function Bing_get_main_list_title_tag() {
	return Bing_mpanel( 'headings_tags_downgrade' ) ? 'h3' : 'h2';
}

/**
 * 获取本地化文件路径
 *
 * @since Beginning 4.0.1
 */
function Bing_get_locale_filename() {
	$locale = get_locale();

	if ( validate_file( $locale ) != 0 )
		return false;

	$filename  = get_template_directory() . '/languages/';
	$filename .= $locale . '.php';

	if ( !is_file( $filename ) )
		return false;

	return $filename;
}

/**
 * 如果存在则引入本地化文件
 *
 * @since Beginning 4.0.1
 * @see Bing_get_locale_filename()
 */
function Bing_maybe_include_locale_file() {
	if ( $filename = Bing_get_locale_filename() )
		include( $filename );
}

/**
 * 生成 HTML 标签参数的代码
 *
 * @since Beginning 4.0.4
 */
function Bing_render_attributes( $atts ) {
	$attributes = '';

	foreach ( $atts as $name => $value ) {
		if ( !isset( $value ) ) {
			$attributes .= ' ' . $name;
			continue;
		}

		if ( is_object( $value ) )
			$value = get_object_vars( $value );

		if ( is_array( $value ) )
			$value = wp_json_encode( $value );

		$filter = in_array( $name, array( 'href', 'src' ) ) ? 'esc_url' : 'esc_attr';
		$value  = call_user_func( $filter, $value );

		$attributes .= " $name='$value'";
	}

	return $attributes;
}

/**
 * 获取网站 Favicon 图标
 *
 * @since Beginning 4.1.0
 */
function Bing_get_website_favicon( $domain ) {
	$name = base_convert( md5( $domain ), 16, 32 );
	$name = '/' . substr( $name, 0, 12 ) . '.png';

	$filename = WP_CONTENT_DIR . THEME_FAVICON_PATH . $name;
	$file_url = content_url( THEME_FAVICON_PATH . $name );

	if ( file_exists( $filename ) )
		return $file_url;

	$api = new Bing_Remote_Application_Programming_Interface( 'favicon/stream/' );
	$api->data = compact( 'domain' );

	if ( $api->request() && ( $body = $api->get_body() ) != 'Error: Not favicon.' )
		$favicon = $body;
	else
		$favicon = file_get_contents( get_template_directory() . '/images/favicon.png' );

	$dir = WP_CONTENT_DIR . THEME_FAVICON_PATH;
	Bing_build_empty_index( $dir );

	if ( !file_put_contents( $filename, $favicon ) )
		return get_template_directory_uri() . '/images/favicon.png';

	return $file_url;
}

// End of page.
