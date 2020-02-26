<?php
/**
 * Template Name: Blank Page
 *
 * @author 小影
 * @link http://c7sky.com/wordpress-theme-minty.html
 * @copyright [小影志](http://c7sky.com/)
 */

get_header(); ?>

	
	<main id="main" class="hfeed" role="main" itemscope itemtype="http://schema.org/WebPage">

	<?php while ( have_posts() ) : the_post(); ?>

		<?php the_content(); ?>
	
	<?php endwhile; ?>

	</main>

<?php get_footer(); ?>