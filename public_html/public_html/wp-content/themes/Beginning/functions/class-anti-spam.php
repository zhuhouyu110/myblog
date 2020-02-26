<?php
/**
 * 垃圾评论防御类
 *
 * @package WordPress
 * @subpackage Beginning
 * @since Beginning 4.0.2
 */

/**
 * 垃圾评论防御
 *
 * @since Unknown
 * @since Beginning 4.0.2 从 `functions/comment.php` 移动至此。
 *
 * @warning 不要继承此类！因为历史兼容原因，无法直接添加 final 关键字，但后续更新不会保证
 * 其继承后的兼容性。
 */
class Bing_Anti_Spam {

	/**
	 * 此对象
	 *
	 * @since Beginning 4.0.2
	 * @var object
	 */
	public static $object;

	/**
	 * 是否需要拦截此评论
	 *
	 * @since Unknown
	 * @since Beginning 4.0.2 从公开改为私有属性。
	 *
	 * @var bool
	 */
	private $spam = false;

	/**
	 * 是否已经检测过评论数据
	 *
	 * @since Beginning 4.0.2
	 * @var bool
	 */
	private $checked = false;

	/**
	 * 初始化
	 *
	 * @since Unknown
	 * @since Beginning 4.0.2 检测是否启用的逻辑移走，并且将实例化的对象存储到静态属性中。
	 */
	public static function init() {
		if ( isset( self::$object ) )
			return;

		if ( !self::is_active() )
			return;

		self::$object = new self();
	}

	/**
	 * 检测是否启用垃圾评论防御
	 *
	 * @since Beginning 4.0.2
	 */
	private static function is_active() {
		if ( !Bing_mpanel( 'comment_anti' ) )
			return false;

		if ( is_user_logged_in() )
			return false;

		return true;
	}

	/**
	 * 构造函数
	 */
	public function __construct() {
		$this->check();

		add_filter( 'comment_form_field_comment', array( $this, 'change_form'   ), 16    );
		add_filter( 'pre_comment_approved',       array( $this, 'check_comment' ), 10, 2 );
	}

	/**
	 * 检测评论数据
	 *
	 * @since Unknown
	 * @since Beginning 4.0.2 添加判断，避免重复进行数据检测。
	 */
	public function check() {
		if ( $this->checked )
			return;
		else
			$this->checked = true;

		if ( !isset( $_POST['comment'] ) )
			return;

		if ( isset( $_POST['person-comment'] ) ) {
			$_POST['comment'] = $_POST['person-comment'];
			unset( $_POST['person-comment'] );

			$_REQUEST = array_merge( $_GET, $_POST );
		} else {
			$this->spam = true;
		}
	}

	/**
	 * 修改评论表单
	 */
	public function change_form( $field ) {
		$search = array(
			'name="comment"',
			'</textarea>'
		);

		$replace = array(
			'name="person-comment"',
			'</textarea><textarea name="comment" style="display: none;"></textarea>'
		);

		return str_replace( $search, $replace, $field );
	}

	/**
	 * 拦截垃圾评论
	 *
	 * @since Unknown
	 * @since Beginning 4.0.2 修复评论类型判断成功后返回 `$comment` 的问题，已修正为 `$approved`。
	 */
	public function check_comment( $approved, $comment ) {
		if ( $this->spam ) {
			if ( in_array( $comment['comment_type'], array( 'pingback', 'trackback' ) ) )
				return $approved;

			wp_die( __( '检测为机器人评论，请在网站评论表单处提交您的评论', 'Bing' ) );
		}

		return $approved;
	}

	/**
	 * 获取属性
	 *
	 * @since Beginning 4.0.2
	 */
	public function __get( $name ) {
		return $this->$name;
	}

	/**
	 * 设置属性
	 *
	 * @since Beginning 4.0.2
	 * @since Beginning 4.0.4 取消无效的返回值。
	 */
	public function __set( $name, $value ) {
		$this->$name = $value;
	}

	/**
	 * 检测属性是否已经设置
	 *
	 * @since Beginning 4.0.2
	 */
	public function __isset( $name ) {
		return isset( $this->$name );
	}

	/**
	 * 销毁属性
	 *
	 * @since Beginning 4.0.2
	 */
	public function __unset( $name ) {
		unset( $this->$name );
	}

}

// End of page.
