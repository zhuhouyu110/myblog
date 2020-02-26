				</div>
				<?php Bing_banner_span12( 'footer' ); ?>
			</div>
			<footer id="footer">
				<div class="box-md">
					<?php if( Bing_mpanel( 'footer_menu' ) ): ?>
						<nav class="menu footer-menu-box" role="navigation" itemscope itemtype="http://schema.org/SiteNavigationElement">
							<span class="menu-title"><span class="dashicons dashicons-menu"></span><?php echo Bing_menu_name( 'footer_menu' ); ?></span>
							<?php echo Bing_nav_menu( 'footer_menu' ); ?>
						</nav>
					<?php endif; ?>
					<p class="footer-left"><?php echo Bing_mpanel( 'footer_text_left' ); ?></p>
					<p class="footer-right"><?php echo Bing_mpanel( 'footer_text_right' ); ?></p>
				</div>
				<?php Bing_mobile_menu(); ?>
			</footer>
		</div>
		<?php if( Bing_mpanel( 'return_top' ) ): ?>
			<a href="#" id="return-top" title="<?php esc_attr_e( '返回顶部', 'Bing' ); ?>" data-no-ajax>
				<span class="dashicons dashicons-arrow-up-alt"></span>
			</a>
		<?php
		endif;
		wp_footer();
		?>
<script type="text/javascript" src="<?php bloginfo('template_url');?>/snow/snow.js"></script>
	</body>
</html>