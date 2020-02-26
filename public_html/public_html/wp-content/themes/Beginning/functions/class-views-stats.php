<?php
/**
 * 浏览统计类
 *
 * @package WordPress
 * @subpackage Beginning
 * @since Beginning 4.0.4
 */

/**
 * 浏览统计
 *
 * @since Beginning 4.0.4
 */
final class Bing_Views_Stats {

	/**
	 * 此对象
	 *
	 * @var object
	 */
	public static $object;

	/**
	 * 构造函数
	 *
	 * @since Beginning 4.0.4
	 */
	public function __construct() {
		add_action( 'template_redirect', array( $this, 'stats' ), 18 );
	}

	/**
	 * 初始化
	 *
	 * @since Beginning 4.0.4
	 */
	public static function init() {
		if ( !isset( self::$object ) )
			self::$object = new self();
	}

	/**
	 * 获取文章浏览次数
	 *
	 * @since Beginning 4.0.4
	 */
	public static function get( $post = null ) {
		self::init();
		return self::$object->get_views( $post );
	}

	/**
	 * 输出文章浏览次数
	 *
	 * @since Beginning 4.0.4
	 */
	public static function output() {
		$views = self::get();
		echo number_format_i18n( $views );
	}

	/**
	 * 统计浏览
	 *
	 * @since Beginning 4.0.4
	 *
	 * @uses self::get_post()
	 * @uses self::incrementing()
	 */
	public function stats() {
		if ( !is_singular() )
			return;

		if ( !$post = $this->get_post() )
			return;

		$this->incrementing( $post );
	}

	/**
	 * 获取文章浏览次数
	 *
	 * @since Beginning 4.0.4
	 * @return int
	 */
	public function get_views( $post = null ) {
		if ( !$post = get_post( $post ) )
			return 0;

		$views = get_post_meta( $post->ID, 'views', true );
		return (int) $views;
	}

	/**
	 * 获取可以进行浏览统计的文章
	 *
	 * @since Beginning 4.0.4
	 * @see get_post()
	 */
	private function get_post( $post = null ) {
		if ( !$post = get_post( $post ) )
			return false;

		if ( !$post_status = get_post_status_object( $post->post_status ) )
			return false;

		if ( !$post_status->public )
			return false;

		if ( !$post_type = get_post_type_object( $post->post_type ) )
			return false;

		if ( !$post_type->public )
			return false;

		return $post;
	}

	/**
	 * 文章浏览次数递增
	 *
	 * @since Beginning 4.0.4
	 * @return bool 是否递增成功。
	 */
	private function incrementing( $post = null ) {
		if ( !$post = get_post( $post ) )
			return false;

		$views  = $this->get_views( $post );
		$result = update_post_meta( $post->ID, 'views', ++$views );

		return (bool) $result;
	}

}

// End of page.
