<?php
/**
 * @author 小影
 * @link http://c7sky.com/wordpress-theme-minty.html
 * @copyright [小影志](http://c7sky.com/)
 */

get_header(); ?>

	<main id="error404" role="main">
		<article class="content">
			<span class="code">404</span>
			<h1><?php echo get_option('minty_404_title'); ?></h1>
			<h3><?php echo get_option('minty_404_tagline'); ?></h3>
			<ul>
				<li><a href="<?php echo home_url('/'); ?>">« 返回首页</a></li>
				<li><a href="<?php echo home_url('/guestbook'); ?>">给我留言 »</a></li>
			</ul>
		</article>
	</main>

<?php get_footer(); ?>