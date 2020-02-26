<?php
/**
 * 卸载主题页面类
 *
 * @package WordPress
 * @subpackage Beginning
 *
 * @since Beginning 4.1.0
 */

/**
 * 卸载主题页面
 *
 * @since Beginning 4.1.0
 */
final class Bing_Mpanel_Uninstall {

	/**
	 * 输出页面
	 *
	 * @since Beginning 4.1.0
	 */
	public static function output() {
		$self = new self();
		echo $self->get_code();
	}

	/**
	 * 运行卸载
	 *
	 * @since Beginning 4.1.0
	 */
	public static function run() {
		if ( !current_user_can( 'switch_themes' ) )
			wp_die( __( '您没有卸载主题的权限。', 'Bing' ) );

		$self = new self();
		check_admin_referer( $self->get_nonce_action() );

		$theme  = $_POST['switch_theme'];
		$target = wp_get_theme( $theme );

		if ( !$target->exists() || !$target->is_allowed() )
			wp_die( __( '切换到的目标主题无效，请重新选择。', 'Bing' ) );

		$current = array( get_stylesheet(), get_template() );
		$switch  = array( $target->get_stylesheet(), $target->get_template() );

		if ( array_intersect( $current, $switch ) )
			wp_die( __( '目标主题和当前主题有重合，请重写选择。', 'Bing' ) );

		$target = $target->get_stylesheet();
		$self->uninstall( $target );
	}

	/**
	 * 获取页面代码
	 *
	 * @since Beginning 4.1.0
	 */
	public function get_code() {
		$code = '<div class="wrap">';

			$text  = __( '卸载主题', 'Bing' );
			$code .= '<h1>' . $text . '</h1>';

			$text  = __( '主题在运行过程中会在数据库中保存一些数据，比如主题设置、数据库版本号和授权许可证之类的信息，如果直接删除主题文件会导致这些数据永远占用数据库空间。', 'Bing' );
			$code .= '<p>' . $text . '</p>';

			$text  = __( '你可以选择使用下边的按钮来彻底卸载主题，程序会自动清除主题在数据库中保存的所有数据，然后帮助你切换到别的主题，你可以继续保留主题或删除主题文件。', 'Bing' );
			$code .= '<p>' . $text . '</p>';

			$text  = __( '要注意的是，只要主题被运行一次，所有的数据就会重新生成，所以请避免这种情况或重新卸载。', 'Bing' );
			$code .= '<p>' . $text . '</p>';

			$text  = __( '卸载', 'Bing' );
			$code .= '<h2>' . $text . '</h2>';

			$themes  = $this->get_themes();
			$options = array();

			if ( $themes ) {
				foreach ( $themes as $name => $title ) {
					$value     = esc_attr( $name );
					$options[] = "<option value='{$value}'>{$title}</option>";
				}

				$select  = '<select name="switch_theme" id="switch_theme">';
				$select .= implode( '', $options ) . '</select>';

				$text = sprintf( __( '删除所有主题数据并切换到 %s 主题。', 'Bing' ), $select );
				$form = '<label for="switch_theme">' . $text . '</label>';

				$text  = __( '卸载', 'Bing' );
				$form .= get_submit_button( $text, 'primary', 'submit', false );

				$form .= wp_nonce_field( $this->get_nonce_action(), '_wpnonce', true, false );
				$code .= '<form id="uninstall-theme" method="post">' . $form . '</form>';

				$script = '
					jQuery( "#uninstall-theme" ).on( "submit", function() {
						return confirm( "' . esc_js( __( '数据不可恢复，真的要卸载吗？', 'Bing' ) ) . '" );
					} );';

				$code .= '<script type="text/javascript">' . $script . '</script>';
			} else {
				$text  = __( '没有可以切换到的主题，所以无法卸载。', 'Bing' );
				$code .= '<p><strong>' . $text . '</strong></p>';
			}

		$code .= '</div>';
		return $code;
	}

	/**
	 * 获取可以切换到的主题列表
	 *
	 * @since Beginning 4.1.0
	 */
	private function get_themes() {
		$excludes = array_unique( array( get_stylesheet(), get_template() ) );
		$results  = array();

		foreach ( wp_get_themes( array( 'allowed' => true ) ) as $theme ) {
			$stylesheet = $theme->get_stylesheet();
			$template   = $theme->get_template();

			if ( !array_intersect( $excludes, array( $stylesheet, $template ) ) )
				$results[$stylesheet] = $theme->get( 'Name' );
		}

		return $results;
	}

	/**
	 * 卸载主题
	 *
	 * @since Beginning 4.1.0
	 */
	private function uninstall( $target ) {
		$update = Bing_Theme_Update::$object;
		$update->force_check();

		$this->clean_theme_data();
		switch_theme( $target );

		wp_redirect( 'themes.php?activated=true' );
		exit;
	}

	/**
	 * 清除主题数据
	 *
	 * @since Beginning 4.1.0
	 */
	private function clean_theme_data() {
		delete_option( THEME_MPANEL_NAME );
		delete_option( THEME_SLUG . '_welcome' );
		delete_option( THEME_SLUG . '_mpanel_pointer' );

		$stylesheet = get_stylesheet();
		Bing_Theme_Mods::select( $stylesheet )->remove_all();

		if ( ( $template = get_template() ) != $stylesheet )
			Bing_Theme_Mods::select( $template )->remove_all();
	}

	/**
	 * 获取验证随机数动作名称
	 *
	 * @since Beginning 4.1.0
	 */
	private function get_nonce_action() {
		return 'uninstall-' . get_stylesheet();
	}

}

// End of page.
