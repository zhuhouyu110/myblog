<?php
/**
 * 主题选项类
 *
 * @package WordPress
 * @subpackage Beginning
 * @since Beginning 4.0.2
 */

/**
 * 主题选项
 *
 * @since Beginning 4.0.2
 */
final class Bing_Theme_Mods {

	/**
	 * 此对象
	 *
	 * @since Beginning 4.0.2
	 * @var array
	 */
	public static $objects;

	/**
	 * 当前主题
	 *
	 * @since Beginning 4.0.2
	 * @var string
	 */
	private $theme;

	/**
	 * 构造函数
	 *
	 * @since Beginning 4.0.2
	 */
	public function __construct( $theme ) {
		$this->theme = $theme;
	}

	/**
	 * 选择主题
	 *
	 * @since Beginning 4.0.2
	 */
	public static function select( $theme = null ) {
		if ( empty( $theme ) )
			$theme = get_stylesheet();

		if ( !isset( self::$objects[$theme] ) )
			self::$objects[$theme] = new self( $theme );

		return self::$objects[$theme];
	}

	/**
	 * 获取选项
	 *
	 * @since Beginning 4.0.2
	 * @see get_theme_mod()
	 */
	public function get( $name ) {
		$mods = $this->get_mods();

		if ( isset( $mods[$name] ) )
			return $mods[$name];
		else
			return false;
	}

	/**
	 * 设置选项
	 *
	 * @since Beginning 4.0.2
	 * @see set_theme_mod()
	 */
	public function set( $name, $value ) {
		$mods = $this->get_mods();

		if ( isset( $mods[$name] ) && $mods[$name] === $value )
			return true;

		$mods[$name] = $value;
		return update_option( $this->get_option_name(), $mods );
	}

	/**
	 * 删除选项
	 *
	 * @since Beginning 4.0.2
	 * @see remove_theme_mod()
	 */
	public function remove( $name ) {
		$mods = $this->get_mods();

		if ( !isset( $mods[$name] ) )
			return false;

		unset( $mods[$name] );

		if ( empty( $mods ) )
			$result = delete_option( $this->get_option_name() );
		else
			$result = update_option( $this->get_option_name(), $mods );

		return $result;
	}

	/**
	 * 清除全部选项
	 *
	 * @since Beginning 4.1.0
	 * @see remove_theme_mods()
	 */
	public function remove_all() {
		$this->get_mods();
		return delete_option( $this->get_option_name() );
	}

	/**
	 * 获取全部选项
	 *
	 * @since Beginning 4.0.2
	 * @see get_theme_mods()
	 */
	private function get_mods() {
		if ( ( $mods = get_option( $this->get_option_name() ) ) === false ) {
			$theme_name = wp_get_theme( $this->theme )->get( 'Name' );
			$old_option = 'mods_' . $theme_name;

			if ( ( $mods = get_option( $old_option ) ) !== false )
				if ( update_option( $this->get_option_name(), $mods ) )
					delete_option( $old_option );
		}

		if ( !is_array( $mods ) )
			$mods = array();

		return $mods;
	}

	/**
	 * 获取选项数据库字段的名称
	 *
	 * @since Beginning 4.0.2
	 */
	private function get_option_name() {
		return 'theme_mods_' . $this->theme;
	}

}

// End of page.
