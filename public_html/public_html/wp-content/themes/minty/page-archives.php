<?php
/**
 * Template Name: Archives Page
 *
 * @author 小影
 * @link http://c7sky.com/wordpress-theme-minty.html
 * @copyright [小影志](http://c7sky.com/)
 */

get_header(); ?>


	<main id="main" class="hfeed" role="main" itemscope itemtype="http://schema.org/Blog">

	<?php while ( have_posts() ) : the_post(); ?>

		<article <?php post_class(); ?>>
			<header class="entry-header">
				<h1 class="entry-title" itemprop="name headline"><?php the_title(); ?></h1>
			</header>

			<div class="entry-content" itemprop="articleBody">
				<?php minty_archives(); ?>
			</div>
		</article>

		<?php get_template_part( 'ad', 'single' ); ?>

	<?php endwhile; ?>
	</main>

<?php get_sidebar(); ?>
<?php get_footer(); ?>