<?php get_header(); ?>
	<section id="container">
		<div class="row">
			<div class="span12 search-header">
				<article class="panel">
					<header class="panel-header">
						<<?php echo Bing_get_page_title_tag(); ?> class="search-title">
							<span class="dashicons dashicons-search"></span>
							<?php _e( '搜索', 'Bing' ); ?>
						</<?php echo Bing_get_page_title_tag(); ?>>
						<?php if ( Bing_mpanel( 'breadcrumbs' ) ) : ?>
							<span class="right"><?php Bing_Breadcrumbs::output(); ?></span>
						<?php endif; ?>
					</header>
					<?php echo '<p class="search-number">' . ( get_search_query() ? sprintf( __( '关键词“%s”共有 %s 个搜索结果', 'Bing' ), get_search_query(), $GLOBALS['wp_query']->found_posts ) : __( '无关键词的搜索', 'Bing' ) ) . '</p>'; ?>
				</article>
			</div>
			<?php
			if( Bing_mpanel( 'hot_searches' ) && !get_search_query() )
				Bing_mobile_menu_hot_searches();

			if( get_search_query() )
				Bing_posts_list(); 
			?>
		</div>
		<a class="search-mobile-mask" href="javascript:;"></a>
	</section>
<?php get_footer(); ?>