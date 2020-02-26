<?php
if ( !function_exists( 'Bing_archive_header' ) ) :
	/**
	 * 存档页信息
	 *
	 * @see get_the_author_meta()
	 * @see get_author_feed_link()
	 *
	 * @see single_term_title()
	 * @see term_description()
	 * @see get_term_feed_link()
	 *
	 * @global object $authordata
	 */
	function Bing_archive_header(){
		if( !is_archive() ) return;
		if( is_author() ){
			$dashicons = 'admin-users';
			$name = $GLOBALS['authordata']->display_name;
			$description = get_the_author_meta( 'description' );
			$feed_link = get_author_feed_link( $GLOBALS['authordata']->ID );
		}elseif( is_date() ){
			$dashicons = 'calendar';
			if( is_day() ) $format = __( 'Y年m月d日', 'Bing' );
			elseif( is_month() ) $format = __( 'Y年m月', 'Bing' );
			else $format = __( 'Y年', 'Bing' );
			$name = get_the_date( $format );
			$description = sprintf( __( '%s发布的文章', 'Bing' ), $name );
		}elseif( is_post_type_archive() ){
			$dashicons   = 'clipboard';
			$name        = get_queried_object()->labels->name;
			$description = get_queried_object()->description;
		}else{
			$dashicons = is_tag() ? 'tag' : 'category';
			$name = single_term_title( '', false );
			$description = term_description();
			$feed_link = get_term_feed_link( get_queried_object_id(), get_queried_object()->taxonomy );
		}
		$description = strip_tags( $description );
	?>
		<div class="span12 archive-header">
			<article class="panel">
				<header class="panel-header">
					<<?php echo Bing_get_page_title_tag(); ?> class="archive-title">
						<span class="dashicons dashicons-<?php echo $dashicons; ?>"></span>
						<?php echo $name; ?>
					</<?php echo Bing_get_page_title_tag(); ?>>
					<?php if ( Bing_mpanel( 'breadcrumbs' ) ) : ?>
						<span class="right"><?php Bing_Breadcrumbs::output(); ?></span>
					<?php endif; ?>
				</header>
				<?php
				echo empty( $description ) ? __( '无描述', 'Bing' ) : $description;
				if( !empty( $feed_link ) ) printf( '<a href="%s" title="%s" class="feed-link"><span class="dashicons dashicons-rss"></span></a>', esc_url( $feed_link ), esc_attr( __( '此存档的 Feed 源，可以使用 RSS 阅读器订阅这些内容', 'Bing' ) ) );
				?>
			</article>
		</div>
	<?php
	}
endif;

//End of page.
