<?php
/**
 * 文章存档简码
 *
 * @since Unknown
 * @since Beginning 4.1.0 修复翻译函数没有添加 domain 的问题。
 */
function Bing_shortcode_archives() {
	$query = new WP_Query( 	array(
		'nopaging'            => true,
		'ignore_sticky_posts' => true,
		'post_type'           => 'post'
	) );

	if ( !$query->have_posts() )
		return __( '没有文章。', 'Bing' );

	$month   = null;
	$heading = Bing_get_main_list_title_tag();
	$code    = '';

	while ( $query->have_posts() ) {
		$query->the_post();

		if ( ( $current_month = get_the_date( 'Y-m' ) ) != $month ) {
			if ( $month )
				$code .= '</ul>';

			$month = $current_month;
			$code .= "<$heading>$month</$heading><ul>";
		}

		$url_attr = esc_url( get_permalink() );
		$day      = get_the_date( 'd' );
		$title    = get_the_title();

		$code .= "<li>$day - <a href='$url_attr'>$title</a></li>";
	}

	$code .= '</ul>';

	wp_reset_postdata();
	return $code;
}
add_shortcode( 'archives', 'Bing_shortcode_archives' );

/**
 * 标签云简码
 */
function Bing_shortcode_tags() {
	return wp_tag_cloud( 'echo=0&number=0' );
}
add_shortcode( 'tags', 'Bing_shortcode_tags' );

/**
 * 友情链接简码
 *
 * @since Beginning 4.1.0
 */
function Bing_shortcode_links( $atts, $content, $shortcode ) {
	$pairs = array( 'menu' => null );
	$atts  = shortcode_atts( $pairs, $atts, $shortcode );

	if ( !$items = wp_get_nav_menu_items( $atts['menu'] ) )
		return __( '没有找到友情链接。', 'Bing' );

	$code = '<ul class="links-list row">';

		foreach ( $items as $item ) {
			$name = get_the_title( $item );
			$link = $item->url;

			$domain = parse_url( $link, PHP_URL_HOST );
			$icon   = Bing_get_website_favicon( $domain );

			$title  = '<img class="link-favicon" src="' . esc_url( $icon ) . '" />';
			$title .= '<span class="link-name">' . $name . '</span>';
			$title  = '<header class="link-title">' . $title . '</header>';

			if ( empty( $item->post_content ) )
				$description = '';
			else
				$description = '<span class="link-description">' . $item->post_content . '</span>';

			$atts = Bing_render_attributes( array_filter( array(
				'href'   => $link,
				'class'  => 'link-box',
				'title'  => $item->attr_title,
				'target' => $item->target,
				'rel'    => $item->xfn
			) ) );

			$code .= "<li class='span4'><a{$atts}>{$title}{$description}</a></li>";
		}

	$code .= '</ul>';
	return $code;
}
add_shortcode( 'links', 'Bing_shortcode_links' );

// End of page.
