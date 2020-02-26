<?php get_header(); ?>
	<section id="container">
		<div class="row">
			<div class="span12 error404-header">
				<div class="panel">
					<header class="panel-header">
						<<?php echo Bing_get_page_title_tag(); ?> class="error404-title">
							<span class="dashicons dashicons-dismiss"></span>
							HTTP 404: Not Found
						</<?php echo Bing_get_page_title_tag(); ?>>
					</header>
					<p><?php _e( '没有找到当前页面', 'Bing' ); ?></p>
				</div>
			</div>
		</div>
	</section>
<?php get_footer(); ?>