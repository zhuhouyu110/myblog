<?php
// 禁止半角符号自动转换
add_filter( 'run_wptexturize', '__return_false', 12 );

/**
 * 解决 Emoji 表情无法使用的问题
 *
 * 使用 CDNJS 作为 Emoji 表情的来源。
 *
 * @since Beginning 4.0.1
 * @see https://cdnjs.com/libraries/twemoji
 */
function Bing_emoji_url_cdnjs() {
	return 'https://cdnjs.cloudflare.com/ajax/libs/twemoji/2.2.1/2/72x72/';
}
add_filter( 'emoji_url', 'Bing_emoji_url_cdnjs', 8 );

/**
 * 解决 SVG Emoji 表情无法使用的问题
 *
 * 使用 CDNJS 作为 Emoji 表情的来源。
 *
 * @since Beginning 4.0.1
 * @see https://cdnjs.com/libraries/twemoji
 */
function Bing_emoji_svg_url_cdnjs() {
	return 'https://cdnjs.cloudflare.com/ajax/libs/twemoji/2.2.1/2/svg/';
}
add_filter( 'emoji_svg_url', 'Bing_emoji_svg_url_cdnjs', 8 );

/**
 * 双核浏览器使用 Webkit 内核
 */
function Bing_browser_webkit(){
	echo '<meta name="renderer" content="webkit">';
}
add_action( 'wp_head', 'Bing_browser_webkit', 4 );

/**
 * 禁止百度转码网页
 */
function Bing_disable_baidu_transform(){
	$disables = array( 'transform', 'siteapp' );

	foreach( $disables as $disable )
		echo '<meta http-equiv="Cache-Control" content="no-' . $disable . '" />';
}
add_action( 'wp_head', 'Bing_disable_baidu_transform', 4 );

//End of page.
