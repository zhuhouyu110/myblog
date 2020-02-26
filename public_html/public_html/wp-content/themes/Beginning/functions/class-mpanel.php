<?php
/**
 * 设置选项类
 *
 * @package WordPress
 * @subpackage Beginning
 *
 * @since Unknown
 * @since Beginning 4.0.5 从 `mpanel/mpanel-functions.php` 移动至此并重命名文件。
 */

/**
 * 设置选项
 *
 * @since Unknown
 * @since Beginning 4.0.5 从 `mpanel/mpanel-functions.php` 移动至此。
 *
 * @warning 不要继承此类！因为历史兼容原因，无法直接添加 final 关键字，但后续更新不会保证
 * 其继承后的兼容性。
 *
 * @link https://www.bgbk.org
 */
class Bing_Mpanel {

	/**
	 * 验证随机数 ID
	 *
	 * @var string
	 */
	private $nonce;

	/**
	 * 表单选项样式
	 *
	 * @var object
	 */
	private $panel;

	/**
	 * 数据库字段名
	 *
	 * @var string
	 */
	public $name;

	/**
	 * 构造函数
	 *
	 * 初始化对象属性，初始化设置选项和挂载函数到钩子上。
	 */
	public function __construct() {
		$this->name  = THEME_MPANEL_NAME;
		$this->nonce = get_stylesheet() . '_mpanel_nonce';

		if ( get_option( $this->name ) === false )
			$this->restore();

		add_action( 'mpanel_content',        array( $this, 'save'                )      );
		add_action( 'wp_ajax_mpanel-save',   array( $this, 'save'                )      );
		add_action( 'admin_enqueue_scripts', array( $this, 'enqueue_scripts'     ),   9 );
		add_action( 'admin_menu',            array( $this, 'admin_menu'          )      );
		add_action( 'admin_bar_menu',        array( $this, 'admin_bar'           ), 100 );
		add_action( 'admin_enqueue_scripts', array( $this, 'mpanel_pointer'      )      );

		// Welcome
		add_action( 'start_theme',                 array( $this, 'open_welcome'  ) );
		add_action( 'wp_ajax_close_theme_welcome', array( $this, 'close_welcome' ) );
		add_action( 'admin_notices',               array( $this, 'welcome'       ) );

		// Mpanel pointer
		add_action( 'start_theme',                  array( $this, 'open_mpanel_pointer'  ) );
		add_action( 'wp_ajax_close_mpanel_pointer', array( $this, 'close_mpanel_pointer' ) );
		add_action( 'admin_enqueue_scripts',        array( $this, 'add_mpanel_pointer'   ) );

		// Uninstall
		add_action(
			'load-beginning_page_mpanel-uninstall',
			array( $this, 'maybe_uninstall_theme' )
		);
	}

	/**
	 * 获取表单选项
	 *
	 * @since Unknown
	 * @since Beginning 4.0.5 不再按需自动引入 `Bing_Mpanel_Panel` 类。
	 */
	public function panel() {
		if ( !isset( $this->panel ) )
			$this->panel = new Bing_Mpanel_Panel( $this );

		return $this->panel;
	}

	/**
	 * 初始化设置
	 */
	public function restore() {
		update_option( $this->name, $this->panel()->get_default() );
	}

	/**
	 * 保存设置
	 */
	public function save() {
		if ( !(
				( isset( $_GET['page']    ) && $_GET['page']    == 'mpanel'      ) ||
				( isset( $_POST['action'] ) && $_POST['action'] == 'mpanel-save' )
			) ||
			!current_user_can( 'edit_theme_options' ) ||
			!isset( $_POST['mpanel_noncename'] ) ||
			!wp_verify_nonce( $_POST['mpanel_noncename'], $this->nonce )
		)
			return;

		if ( !empty( $_POST['mpanel-restore-settings'] ) ) {
			$this->restore();
			return;
		}

		if ( !empty( $_POST['mpanel-import'] ) ) {
			$import = maybe_unserialize( base64_decode( $_POST['mpanel-import'] ) );

			if ( !empty( $import ) ) {
				update_option( $this->name, $import );
				return;
			}
		}

		if ( isset( $_POST['mpanel'] ) ) {
			$content = $_POST['mpanel'];
			unset( $content['mpanel-export'] );

			update_option( $this->name, $content );
		}

		if ( wp_doing_ajax() )
			wp_die( 1 );
	}

	/**
	 * 创建页面
	 *
	 * @since Unknown
	 * @since Beginning 4.0.5 增加「捐助作者」页面；使用帮助页面在菜单栏从「使用帮助」
	 *                        重命名为「帮助」。
	 *
	 * @since Beginning 4.1.0 删除「更新内容」页面；新增「更新日志」页面；新增「卸载主
	 *                        题」页面。
	 */
	public function admin_menu() {
		add_menu_page(
			sprintf( __( '%s 设置', 'Bing' ), THEME_NAME ),
			THEME_NAME,
			'edit_theme_options',
			'mpanel',
			array( $this, 'ui' ),
			'dashicons-awards',
			59
		);

		add_submenu_page(
			'mpanel',
			sprintf( __( '%s 设置', 'Bing' ), THEME_NAME ),
			__( '设置', 'Bing' ),
			'edit_theme_options',
			'mpanel',
			array( $this, 'ui' )
		);

		add_submenu_page(
			'mpanel',
			sprintf( __( '%s 使用帮助', 'Bing' ), THEME_NAME ),
			__( '帮助', 'Bing' ),
			'edit_theme_options',
			'mpanel-help',
			array( $this, 'help' )
		);

		add_submenu_page(
			'mpanel',
			sprintf( __( '%s 更新日志', 'Bing' ), THEME_NAME ),
			__( '更新', 'Bing' ),
			'update_themes',
			'mpanel-update-logs',
			array( $this, 'update_logs' )
		);

		add_submenu_page(
			'mpanel',
			sprintf( __( '卸载 %s 主题', 'Bing' ), THEME_NAME ),
			__( '卸载', 'Bing' ),
			'switch_themes',
			'mpanel-uninstall',
			array( 'Bing_Mpanel_Uninstall', 'output' )
		);

		add_submenu_page(
			'mpanel',
			sprintf( __( '捐助 %s 作者', 'Bing' ), THEME_NAME ),
			__( '捐助', 'Bing' ),
			'read',
			'mpanel-donate',
			array( 'Bing_Mpanel_Donate', 'output' )
		);
	}

	/**
	 * 在 Admin Bar 创建菜单
	 *
	 * @since Unknown
	 * @since Beginning 4.0.5 增加「捐助作者」页面，只有在存在其它页面时才会显示；
	 *                        使用帮助页面在工具栏从「使用帮助」重命名为「帮助」。
	 *
	 * @since Beginning 4.1.0 删除「更新内容」页面；新增「更新日志」页面；新增「卸
	 *                        载主题」页面。
	 */
	public function admin_bar( $wp_admin_bar ) {
		$actions = array();

		if ( current_user_can( 'edit_theme_options' ) ) {
			$actions['mpanel'] = array(
				'ID'    => 'options',
				'title' => __( '设置', 'Bing' )
			);

			$actions['mpanel-help'] = array(
				'ID'    => 'help',
				'title' => __( '帮助', 'Bing' )
			);
		}

		if ( current_user_can( 'update_themes' ) )
			$actions['mpanel-update-logs'] = array(
				'ID'    => 'update-logs',
				'title' => __( '更新', 'Bing' )
			);

		if ( current_user_can( 'switch_themes' ) )
			$actions['mpanel-uninstall'] = array(
				'ID'    => 'uninstall',
				'title' => __( '卸载', 'Bing' )
			);

		if ( empty( $actions ) )
			return;

		if ( current_user_can( 'read' ) )
			$actions['mpanel-donate'] = array(
				'ID'    => 'donate',
				'title' => __( '捐助', 'Bing' )
			);

		$wp_admin_bar->add_menu( array(
			'id'    => 'mpanel',
			'title' => THEME_NAME,
			'href'  => current( array_keys( $actions ) )
		) );

		foreach ( $actions as $page => $action )
			$wp_admin_bar->add_menu( array(
				'parent' => 'mpanel',
				'id'     => 'mpanel-' . $action['ID'],
				'title'  => $action['title'],
				'href'   => add_query_arg( 'page', $page, admin_url( 'admin.php' ) )
			) );
	}

	/**
	 * 挂载脚本
	 *
	 * 挂载设置选项界面所需要的 CSS 和 JavaScript 脚本。
	 *
	 * @since Unknown
	 *
	 * @since Beginning 4.1.0 只有在「主题设置」页面才会挂载脚本；挂载动作钩子从
	 *                        `mpanel_content` 更换为 `admin_enqueue_scripts`。
	 *
	 * @uses wp_register_style() 注册 CSS 样式表
	 * @uses wp_enqueue_style()  挂载 CSS 样式表
	 *
	 * @uses wp_register_script() 注册 JavaScript 脚本
	 * @uses wp_enqueue_script()  挂载 JavaScript 脚本
	 */
	public function enqueue_scripts() {
		if ( get_current_screen()->base != 'toplevel_page_mpanel' )
			return;

		$base = get_template_directory_uri() . '/mpanel/';

		// Switchery
		wp_register_style( 'mpanel-switchery', $base . 'css/switchery.css' );
		wp_register_script( 'mpanel-switchery', $base . 'js/switchery.js' );

		// jQuery UI
		wp_register_style( 'mpanel-jquery-ui', $base . 'css/jquery-ui-1.9.2.custom.css' );
		wp_register_script( 'mpanel-jquery-ui', $base . 'js/jquery-ui-1.9.2.custom.js' );

		// cxCalendar
		wp_register_style( 'mpanel-cxcalendar', $base . 'css/cxcalendar.css', array( 'mpanel-jquery-ui' ) );
		wp_register_script( 'mpanel-cxcalendar', $base . 'js/cxcalendar.js', array( 'mpanel-jquery-ui' ) );

		// Style
		wp_enqueue_style( 'mpanel-style', $base . 'css/style.css', array( 'wp-color-picker', 'mpanel-switchery', 'mpanel-cxcalendar' ), THEME_DB_VERSION );

		// Base
		wp_enqueue_script( 'mpanel-base', $base . 'js/base.js', array( 'jquery', 'wp-color-picker', 'mpanel-switchery', 'mpanel-cxcalendar' ), THEME_DB_VERSION, true );
		wp_localize_script( 'mpanel-base', 'mpanel_base_args', array( 'admin_ajax' => admin_url( 'admin-ajax.php' ), 'list_repeat_error' => __( '列表不能重复', 'Bing' ) ) );

		// Media
		wp_enqueue_media();
	}

	/**
	 * 获取设置
	 */
	public function get( $option ) {
		if ( empty( $option ) )
			return false;

		$content = get_option( $this->name );

		if ( !isset( $content[$option] ) )
			return false;

		return wp_unslash( $content[$option] );
	}

	/**
	 * 更新设置
	 */
	public function update( $option, $value ) {
		if ( empty( $option ) )
			return false;

		$content = get_option( $this->name );

		$content[$option] = $value;
		return update_option( $this->name, $content );
	}

	/**
	 * 删除设置
	 */
	public function delete( $option ) {
		if ( empty( $option ) )
			return false;

		$content = get_option( $this->name );

		if ( !isset( $content[$option] ) )
			return false;

		unset( $content[$option] );
		return update_option( $this->name, $content );
	}

	/**
	 * 生成「主题设置」界面
	 */
	public function ui(){
		do_action( 'mpanel_content' );
		$panel = $this->panel()->get_from();
?>
		<div id="mpanel-wrap">
			<form method="post" action="" id="mpanel-form">
				<div class="mpanel-menu-box">
					<h1 class="mpanel-logo"></h1>
					<ul class="mpanel-menu">
						<?php
						$i = 0;
						foreach( $this->panel()->menu as $name ){
							++$i;
							echo "<li class='list-$i'>$name</li>";
						}
						?>
					</ul>
				</div>
				<?php wp_nonce_field( $this->nonce, 'mpanel_noncename' ); ?>
				<input name="mpanel-save" type="submit" class="mpanel-submit mpanel-save" value="<?php esc_attr_e( '保存设置', 'Bing' ); ?>" />
				<div class="mpanel-mian-panel"><?php echo $panel; ?></div>
				<input name="mpanel-save" type="submit" class="mpanel-submit mpanel-save2" value="<?php esc_attr_e( '保存设置', 'Bing' ); ?>" />
			</form>
			<form method="post" action="" id="mpanel-form-restore-settings">
				<input type="submit" name="mpanel-restore-settings" title="<?php esc_attr_e( '恢复初始设置', 'Bing' ); ?>" onclick="return confirm( '<?php echo esc_js( __( '所有目前的设置都会被恢复到初始状态，无法恢复。你确定？', 'Bing' ) ); ?>' ) ? true : false;" value="<?php esc_attr_e( '恢复初始设置', 'Bing' ); ?>" class="mpanel-submit mpanel-restore-settings">
				<?php wp_nonce_field( $this->nonce, 'mpanel_noncename' ); ?>
			</form>
		</div>
		<div id="mpanel-load"></div>
<?php
	}

	/**
	 * 输出「使用帮助」页面
	 *
	 * @since Beginning 4.0.5 标题从「Beginning 使用帮助」变更成「使用帮助」；采用框架
	 *                        引用的方式代替了原来的超链接引导文字。
	 *
	 * @since Beginning 4.1.0 补全丢失的 `</div>` 标签。
	 */
	public function help() {
		echo '<div class="wrap">';

			$title = __( '使用帮助', 'Bing' );
			echo '<h1 style="margin-bottom: .5em;">' . $title . '</h1>';

			$url = 'https://www.bgbk.org/wp-theme-beginning-help/';
			echo '<iframe src="' . $url . '" width="100%" height="550"></iframe>';

		echo '</div>';
	}

	/**
	 * 激活欢迎使用提示语
	 *
	 * @since Beginning 4.0.0
	 */
	public function open_welcome() {
		update_option( THEME_SLUG . '_welcome', true );
	}

	/**
	 * 关闭欢迎使用提示语
	 *
	 * @since Beginning 4.0.0
	 */
	public function close_welcome() {
		check_ajax_referer( 'close_theme_welcome-' . THEME_SLUG );

		if ( !current_user_can( 'switch_themes' ) )
			return;

		if ( delete_option( THEME_SLUG . '_welcome' ) )
			wp_die( 1 );
	}

	/**
	 * 显示欢迎使用提示语
	 *
	 * @since Beginning 4.0.0
	 */
	public function welcome() {
		if (
			get_current_screen()->parent_base != 'mpanel' ||
			!get_option( THEME_SLUG . '_welcome' )        ||
			!current_user_can( 'switch_themes' )
		)
			return;

		$text = sprintf(
			__( '欢迎使用 %s 主题，你可以%s联系作者，也可以%s加入我们的 QQ 群；主题支持在线升级，不建议直接修改主题的代码。', 'Bing' ),
			THEME_NAME,
			'<a href="https://www.bgbk.org/go/qq" target="_blank">' . __( '点击此处', 'Bing' ) . '</a>',
			'<a href="https://www.bgbk.org/go/qq-group" target="_blank">' . __( '点击此处', 'Bing' ) . '</a>'
		);

		$close = add_query_arg( array(
			'action'   => 'close_theme_welcome',
			'_wpnonce' => wp_create_nonce( 'close_theme_welcome-' . THEME_SLUG )
		), admin_url( 'admin-ajax.php' ) );

		echo '
			<div class="updated notice is-dismissible" id="close-theme-welcome">
				<p>' . $text . '</p>
			</div>
			<script type="text/javascript">
				jQuery( document ).on( \'click\', \'#close-theme-welcome .notice-dismiss\', function() {
					jQuery.get( \'' . esc_url_raw( $close ) . '\' );
				} );
			</script>';
	}

	/**
	 * 激活设置界面引导
	 *
	 * 在 `Bing_upgrade_theme_400()` 重新激活了此功能。
	 *
	 * @since Beginning 4.0.0
	 */
	public function open_mpanel_pointer() {
		update_option( THEME_SLUG . '_mpanel_pointer', true );
	}

	/**
	 * 关闭设置界面引导
	 *
	 * @since Beginning 4.0.0
	 */
	public function close_mpanel_pointer() {
		check_ajax_referer( 'close_mpanel_pointer-' . THEME_SLUG );

		if ( !current_user_can( 'edit_theme_options' ) )
			return;

		if ( delete_option( THEME_SLUG . '_mpanel_pointer' ) )
			wp_die( 1 );
	}

	/**
	 * 添加设置界面引导
	 *
	 * @since Beginning 4.0.0
	 */
	public function add_mpanel_pointer() {
		if (
			!get_option( THEME_SLUG . '_mpanel_pointer' ) ||
			!current_user_can( 'edit_theme_options' )
		)
			return;

		wp_enqueue_style( 'wp-pointer' );
		wp_enqueue_script( 'wp-pointer' );

		// 兼容 WordPress 4.5 以下
		if ( function_exists( 'wp_add_inline_script' ) )
			wp_add_inline_script( 'wp-pointer', $this->mpanel_pointer() );
		else
			add_action( 'admin_print_footer_scripts', array( $this, 'mpanel_pointer' ), 18 );
	}

	/**
	 * 生成设置界面引导
	 *
	 * @since Beginning 4.0.0
	 *
	 * @TODO 找到替代 addslashes() 与 str_replace() 的正确方法。
	 */
	public function mpanel_pointer() {
		$content = '
			<h3>' . sprintf( __( '欢迎使用 %s 主题！', 'Bing' ), THEME_NAME ) . '</h3>
			<p>' . __( '可以在这里设置这个主题，强烈建议您根据喜好自定义主题。', 'Bing' ) . '</p>';

		$close = add_query_arg( array(
			'action'   => 'close_mpanel_pointer',
			'_wpnonce' => wp_create_nonce( 'close_mpanel_pointer-' . THEME_SLUG )
		), admin_url( 'admin-ajax.php' ) );

		$js = '
			jQuery( function() {
				var pointer = jQuery( "#toplevel_page_mpanel" ).pointer( {
					content:      "' . addslashes( str_replace( "\n", ' ', trim( $content ) ) ) . '",
					pointerWidth: 300,

					position: {
						edge:  "left",
						align: "center"
					},

					close: function() {
						jQuery( window ).off( "scroll", reposition );
						jQuery.get( "' . esc_url_raw( $close ) . '" );
					}
				} ).pointer( "open" ),

				reposition = function() {
					pointer.pointer( "reposition" );
				};

				jQuery( window ).on( "scroll", reposition );
			} );';

		// `current_action()` 添加于 WordPress 3.9
		if ( current_action() == 'admin_print_footer_scripts' )
			echo '<script type="text/javascript">' . $js . '</script>';
		else
			return $js;
	}

	/**
	 * 输出「更新日志」页面
	 *
	 * @since Beginning 4.1.0
	 */
	public function update_logs() {
		echo '<div class="wrap">';

			$title = __( '更新日志', 'Bing' );
			echo '<h1 style="margin-bottom: .5em;">' . $title . '</h1>';

			$url = 'https://www.bgbk.org/update/beginning/';
			echo '<iframe src="' . $url . '" width="100%" height="550"></iframe>';

		echo '</div>';
	}

	/**
	 * 调度主题卸载程序
	 *
	 * @since Beginning 4.1.0
	 */
	public function maybe_uninstall_theme() {
		if ( isset( $_POST['_wpnonce'] ) && isset( $_POST['switch_theme'] ) )
			Bing_Mpanel_Uninstall::run();
	}

	/**
	 * 输出「更新内容」页面
	 *
	 * @since Unknown
	 * @deprecated Beginning 4.1.0
	 */
	public function update_content() {
		_deprecated_function( __METHOD__, '4.1.0' );
		echo '<div class="wrap"></div>';
	}

	/**
	 * 后台更新页面添加更新内容查看提示
	 *
	 * @since Unknown
	 * @deprecated Beginning 4.1.0
	 *
	 * `add_filter( 'gettext', array( $this, 'update_content_help' ), 16, 3 );`
	 */
	public function update_content_help( $translations, $text, $domain ) {
		_deprecated_function( __METHOD__, '4.1.0' );
		return $translations;
	}

}

// End of page.
