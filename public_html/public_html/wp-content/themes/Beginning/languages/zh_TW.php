<?php
/**
 * 禁止半角符号自动转换
 */
add_filter( 'run_wptexturize', '__return_false', 12 );

//End of page.
