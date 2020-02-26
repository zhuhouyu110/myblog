<?php
/**
 * @author 小影
 * @link http://c7sky.com/wordpress-theme-minty.html
 * @copyright [小影志](http://c7sky.com/)
 */

$ad = !( minty_is_wap() || minty_is_mobile() ) ? get_option( 'minty_ad_index' ) : get_option( 'minty_mobile_ad_index' );
if (!empty($ad)) :
?>

<div class="ga" itemscope itemtype="http://schema.org/WPAdBlock"><?php echo stripslashes($ad); ?></div>

<?php endif; ?>