<?php
/**
 * 获取文章缩略图地址
 */
function Bing_post_thumbnail_url( $post = null ){
	$post = get_post( $post );

	if( has_post_thumbnail( $post->ID ) ){
		$thumbnail_ID = get_post_thumbnail_id( $post->ID );
		$thumbnail    = wp_get_attachment_image_src( $thumbnail_ID, 'full' );
		$url          = $thumbnail[0];
	}

	if( empty( $url ) ){
		preg_match_all( '/<img.+src=[\'"]([^\'"]+)[\'"].*>/i', $post->post_content, $content_images );

		if( !empty( $content_images[1][0] ) )
			$url = $content_images[1][0];
	}

	if( empty( $url ) )
		$url = get_template_directory_uri() . '/images/random/' . substr( $post->ID, -1, 1 ) . '.png';

	return apply_filters( 'theme_thumbnail_url', $url, $post );
}

/**
 * 裁剪缩略图
 *
 * @since Unknown
 * @since Beginning 4.0.1 改为使用 JPG 格式的图片，同时修改图片命名规则。
 *
 * @uses wp_get_image_editor()
 * @uses image_resize_dimensions()
 */
function Bing_crop_thumbnail( $url, $width, $height = null ) {
	$width = (int) $width;
	$height = empty( $height ) ? $width : (int) $height;

	if ( ( $pre = apply_filters( 'pre_theme_crop_thumbnail', null, $url, $width, $height ) ) !== null )
		return $pre;

	$hash = md5( $url );

	$short_hash = base_convert( $hash, 16, 32 );
	$short_hash = substr( $hash, 0, 12 );

	$file_path = WP_CONTENT_DIR . THEME_THUMBNAIL_PATH . "/{$short_hash}-{$width}x{$height}.jpg";
	$file_url  = content_url( THEME_THUMBNAIL_PATH . "/{$short_hash}-{$width}x{$height}.jpg" );

	// 优先使用新版缩略图
	if ( is_file( $file_path ) )
		return $file_url;

	// 再来检测是否存在旧版缩略图
	if ( is_file( WP_CONTENT_DIR . THEME_THUMBNAIL_PATH . "/$hash-$width-$height.png" ) )
		return content_url( THEME_THUMBNAIL_PATH . "/$hash-$width-$height.png" );

	$editor = wp_get_image_editor( $url );

	if ( is_wp_error( $editor ) )
		return $url;

	$size = $editor->get_size();
	if ( !$dims = image_resize_dimensions( $size['width'], $size['height'], $width, $height, true ) )
		return $url;

	$cmp_x      = $size['width'] / $width;
	$cmp_y      = $size['height'] / $height;
	$cmp        = min( $cmp_x, $cmp_y );
	$min_width  = round( $width * $cmp );
	$min_height = round( $height * $cmp );

	$crop = $editor->crop( $dims[2], $dims[3], $min_width, $min_height, $width, $height );

	if( is_wp_error( $crop ) )
		return $url;

	Bing_build_empty_index( WP_CONTENT_DIR . THEME_THUMBNAIL_PATH );

	$save = $editor->save( $file_path, 'image/jpeg' );

	if ( is_wp_error( $save ) ) {
		$result = $url;
		$filter = 'theme_crop_thumbnail_error';
	} else {
		$result = $file_url;
		$filter = 'theme_crop_thumbnail';
	}

	$args = array_values( compact( 'result', 'width', 'height', 'url' ) );
	return apply_filters_deprecated( $filter, $args, '4.0.1', 'pre_theme_crop_thumbnail' );
}

//End of page.
