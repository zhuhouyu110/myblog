<?php
if ( !function_exists( 'Bing_slider' ) ) :
	/**
	 * 获取幻灯片
	 */
	function Bing_slider(){
		if( !Bing_mpanel( 'slider_home' ) )
			return;

		$query = Bing_slider_query();

		if( !$query->have_posts() )
			return;

		$items           = Bing_mpanel( 'slider_home_page_items_number' );
		$excerpt_length  = round( 80 / $items );

		$thumbnail_width  = round( 720 / $items );
		$thumbnail_height = Bing_mpanel( 'slider_home_height' );

		$args = array(
			'items'      => $items,
			'loop'       => Bing_mpanel( 'slider_home_loop' ),
			'smartSpeed' => Bing_mpanel( 'slider_home_switch_speed' )
		);

		if( Bing_mpanel( 'slider_home_dots' ) ){
			$args['dots']      = true;
			$args['dotsClass'] = 'slider-dots';
			$args['dotClass']  = 'dot';
		}

		if( Bing_mpanel( 'slider_home_auto_play' ) ){
			$args['autoplay']        = true;
			$args['autoplayTimeout'] = Bing_mpanel( 'slider_home_auto_play_speed' ) * 1000;
		}
	?>
		<div class="span12">
			<div class="panel transparent no-padding slider no-js-hide owl-carousel" data-owl-carousel="<?php echo esc_attr( wp_json_encode( $args ) ); ?>">
				<?php
				while( $query->have_posts() ):
					$query->the_post();
				?>
					<article <?php post_class(); ?>>
						<?php echo Bing_thumbnail( $thumbnail_width, $thumbnail_height ); ?>
						<a href="<?php the_permalink(); ?>" class="slider-text" rel="bookmark">
							<?php the_title( '<' . Bing_get_main_list_title_tag() . ' class="post-title">', '</' . Bing_get_main_list_title_tag() . '>' ); ?>
							<p class="excerpt"><?php echo Bing_excerpt( $excerpt_length ); ?></p>
						</a>
					</article>
				<?php endwhile; ?>
			</div>
		</div>
	<?php
	}
endif;

/**
 * 获取幻灯片内容查询
 */
function Bing_slider_query(){
	$query_args = array(
		'posts_per_page'      => Bing_mpanel( 'slider_home_number' ),
		'ignore_sticky_posts' => true
	);

	switch( $query = Bing_mpanel( 'slider_home_query' ) ){
		case 'sticky':
			$query_args['post__in'] = get_option( 'sticky_posts' );
			break;
		case 'rand':
		case 'comment_count':
			$query_args['orderby'] = $query;
			break;
		case 'view_count':
			$query_args['orderby']  = 'meta_value_num';
			$query_args['meta_key'] = 'views';
			break;
		case 'category':
			$query_args['category__in'] = Bing_mpanel( 'slider_home_query_categories' );
			break;
	}

	return new WP_Query( $query_args );
}

//End of page.
