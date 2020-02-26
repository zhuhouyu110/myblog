<?php
/**
 * 主题更新类
 *
 * @package WordPress
 * @subpackage Beginning
 * @since Beginning 4.0.2
 */

/**
 * 主题更新
 *
 * @since Unknown
 * @since Beginning 4.0.2 从 `functions/update.php` 移动至此。
 *
 * @warning 不要继承此类！因为历史兼容原因，无法直接添加 final 关键字，但后续更新不会保证
 * 其继承后的兼容性。
 */
class Bing_Theme_Update {

	/**
	 * 此对象
	 *
	 * @var object
	 */
	public static $object;

	/**
	 * API 服务器
	 *
	 * @var string
	 */
	private $api = 'https://apis.bgbk.org/wordpress/themes/update-check/';

	/**
	 * 是否尝试使用 SSL 请求
	 *
	 * @var bool
	 * @since Beginning 4.0.0
	 */
	private $try_ssl = true;

	/**
	 * 主题更新信息
	 *
	 * @var array
	 */
	private $update_data;

	/**
	 * 初始化
	 */
	public static function init() {
		if ( !isset( self::$object ) )
			self::$object = new self();
	}

	/**
	 * 构造函数
	 */
	public function __construct() {
		add_action( 'after_switch_theme', array( $this, 'force_check'     ), 18    );
		add_action( 'after_switch_theme', array( $this, 'get_update_data' ), 18, 0 );
		add_action( 'wp_update_themes',   array( $this, 'get_update_data' ), 18, 0 );
		add_action( 'admin_notices',      array( $this, 'update_notice'   ),  6    );

		add_filter(
			'pre_set_site_transient_update_themes',
			array( $this, 'insert_update_data' ),
			18
		);

		// @ignore
		add_action(
			'wp_ajax_update-theme',
			array( $this, 'add_fix_ajax_update_failed_callable' ),
			0
		);
	}

	/**
	 * 添加后台更新提示
	 *
	 * @since Beginning 4.0.2
	 * @see update_nag()
	 */
	public function update_notice() {
		if ( !current_user_can( 'update_themes' ) )
			return;

		if ( in_array( get_current_screen()->id, array( 'update-core', 'themes' ) ) )
			return;

		$update = get_site_transient( 'update_themes' );

		if ( empty( $update->response ) )
			return;

		foreach ( array( get_template(), get_stylesheet() ) as $theme ) {
			if ( empty( $update->response[$theme] ) )
				continue;

			if ( empty( $update->response[$theme]['new_version'] ) )
				continue;

			if ( empty( $update->response[$theme]['url'] ) )
				$text = sprintf(
					__( '%1$s 主题 %2$s 版本可用！', 'Bing' ),
					wp_get_theme( $theme )->name,
					$update->response[$theme]['new_version']
				);
			else
				$text = sprintf(
					__( '<a href="%1$s" target="_blank">%2$s 主题 %3$s 版本</a>可用！', 'Bing' ),
					esc_url( $update->response[$theme]['url'] ),
					wp_get_theme( $theme )->name,
					$update->response[$theme]['new_version']
				);

			if ( !empty( $update->response[$theme]['package'] ) )
				$text .= sprintf(
					__( '<a href="%1$s">现在去升级</a>。', 'Bing' ),
					esc_url( add_query_arg( 'theme', $theme, admin_url( 'themes.php' ) ) )
				);

			echo '<div class="update-nag">' . $text . '</div>';
			return;
		}
	}

	/**
	 * 强制检测主题更新
	 *
	 * @since Beginning 4.0.2
	 * @since Beginning 4.1.0 检测时不会再触发 WordPress 核心主题更新检测。
	 *
	 * @see wp_update_themes()
	 */
	public function force_check() {
		$name  = 'update_themes';
		$value = get_site_transient( $name );

		$value = $this->insert_update_data( $value );
		set_site_transient( $name, $value );
	}

	/**
	 * 插入主题更新信息
	 *
	 * @since Unknown
	 * @since Beginning 4.1.0 修改数据之前会先判断参数是否为对象。
	 */
	public function insert_update_data( $update_data ) {
		if ( $my_update_data = $this->get_update_data() ) {
			if ( !is_object( $update_data ) ) {
				$update_data = new stdClass();
				$update_data->response = array();
			} elseif ( !isset( $update_data->response ) ) {
				$update_data->response = array();
			}

			$update_data->response = $my_update_data + $update_data->response;
		}

		return $update_data;
	}

	/**
	 * 获取主题更新信息
	 */
	public function get_update_data() {
		if ( isset( $this->update_data ) )
			return $this->update_data;

		$response = $this->get_api( array(
			'themes' => ( $themes = $this->get_themes() ),
			'active' => get_stylesheet(),

			// 备用参数
			'active_theme' => get_stylesheet()
		) );

		if ( !empty( $response['themes'] ) ) {
			if ( $this->is_validate( $response ) )
				$response['themes'] = $this->filter_themes( $response['themes'] );

			if ( $response['themes'] )
				$this->update_data = $response['themes'];
		}

		if ( !isset( $this->update_data ) )
			$this->update_data = false;

		return $this->update_data;
	}

	/**
	 * 获取主题信息
	 *
	 * @since Beginning 4.0.2
	 */
	private function get_themes() {
		$themes  = wp_get_themes();
		$results = array();

		foreach ( $themes as $theme ) {
			$stylesheet = $theme->get_stylesheet();
			$template   = $theme->get_template();

			$results[$stylesheet] = array(
				'name'       => $theme->get( 'Name' ),
				'title'      => $theme->get( 'Name' ),
				'version'    => $theme->get( 'Version' ),
				'author'     => $theme->get( 'Author' ),
				'author_uri' => $theme->get( 'AuthorURI' ),
				'theme_uri'  => $theme->get( 'ThemeURI' ),

				'stylesheet' => $stylesheet,
				'template'   => $template,

				// 备用参数
				'author_url' => $theme->get( 'AuthorURI' ),
				'theme_url'  => $theme->get( 'ThemeURI' )
			);

			foreach ( array( 'db_version', 'license' ) as $key )
				if ( ( $mod = Bing_Theme_Mods::select( $stylesheet )->get( $key ) ) !== false )
					$results[$stylesheet][$key] = $mod;
		}

		return $results;
	}

	/**
	 * 检测远程服务器是否需要本地验证更新信息
	 *
	 * @since Beginning 4.0.2
	 */
	private function is_validate( $response ) {
		$keys = array(
			'verify',
			'check',
			'validate',
			'version_compare',
			'safe_mode',
			'verifies',
			'checks',
			'validates'
		);

		foreach ( $keys as $key )
			if ( !empty( $response[$key] ) )
				return true;

		return false;
	}

	/**
	 * 过滤主题更新信息
	 */
	private function filter_themes( $themes ) {
		$themes = (array) $themes;
		$result = array();

		foreach ( $themes as $stylesheet => $new_theme ) {
			if ( empty( $new_theme['new_version'] ) )
				continue;

			if ( !empty( $new_theme['theme'] ) )
				$stylesheet = $new_theme['theme'];

			if ( empty( $stylesheet ) )
				continue;

			$theme = wp_get_theme( $stylesheet );

			if ( !$theme->exists() )
				continue;

			$new_version     = strtolower( $new_theme['new_version'] );
			$current_version = strtolower( $theme->get( 'Version' ) );

			if ( version_compare( $new_version, $current_version, '<=' ) )
				continue;

			$result[$stylesheet] = array(
				'theme'       => $stylesheet,
				'new_version' => $new_theme['new_version'],
				'url'         => isset( $new_theme['url']     ) ? esc_url_raw( $new_theme['url']     ) : $theme->get( 'ThemeURI' ),
				'package'     => isset( $new_theme['package'] ) ? esc_url_raw( $new_theme['package'] ) : null
			);
		}

		return $result;
	}

	/**
	 * 获取远程服务器信息
	 *
	 * @since Unknown
	 * @since Beginning 4.0.5 使用 `Bing_Remote_Application_Programming_Interface` 类进访问远程 API。
	 */
	private function get_api( $body ) {
		global $wpdb;

		$other_body = array(
			'url'             => home_url('index.php'),
			'name'            => get_bloginfo( 'name' ),
			'is_multisite'    => is_multisite(),
			'api_version'     => 1,
			'wp_version'      => get_bloginfo( 'version' ),
			'php_version'     => phpversion(),
			'server_software' => $_SERVER['SERVER_SOFTWARE'],
			'wp_locale'       => get_locale(),

			// 备用参数
			'multisite_enabled' => is_multisite()
		);

		if ( method_exists( $wpdb, 'db_version' ) )
			$other_body['mysql_version'] = $wpdb->db_version();

		$path = 'wordpress/themes/update-check/';
		$api  = new Bing_Remote_Application_Programming_Interface( $path );

		$api->method = 'POST';
		$api->data   = array_merge( $other_body, $body );

		if ( !$api->request() )
			return false;

		if ( !$api->parse_json() )
			return false;

		$results = $api->get_results();
		return $results;
	}

	/**
	 * 挂载「修复某些主题无法使用 AJAX 更新的问题」的方法
	 *
	 * @since Beginning 4.0.0
	 */
	public function add_fix_ajax_update_failed_callable() {
		add_filter( 'sanitize_key', array( $this, 'fix_ajax_update_failed' ), 18, 2 );
	}

	/**
	 * 修复某些主题无法使用 AJAX 更新的问题
	 *
	 * @see sanitize_key()
	 * @see wp_ajax_update_theme()
	 *
	 * @since Beginning 4.0.0
	 */
	public function fix_ajax_update_failed( $key, $raw_key ) {
		if ( !wp_doing_ajax() )
			return $key;

		if ( !doing_action( 'wp_ajax_update-theme' ) )
			return $key;

		static $ran = false;

		if ( $ran )
			return $key;

		$ran = true;

		if ( $key == strtolower( $raw_key ) )
			$key = $raw_key;

		return $key;
	}

	/**
	 * 强制检测主题更新
	 *
	 * @since Unknown
	 * @deprecated Beginning 4.0.2 Use slef::force_check()
	 */
	public function force_check_update() {
		_deprecated_function( __METHOD__, '4.0.2', __CLASS__ . '::force_check()' );
		return $this->force_check();
	}

	/**
	 * 更新主题时校验 MD5
	 *
	 * @since Beginning 4.0.0
	 * @deprecated Beginning 4.0.2
	 *
	 * // 第四个 $hook_extra 参数需要 WordPress 4.4
	 * `add_filter( 'upgrader_source_selection', array( $this, 'check_files' ), 18, 4 )`;
	 */
	public function check_files( $source, $remote_source, $upgrader, $hook_extra = null ) {
		_deprecated_function( __METHOD__, '4.0.2' );
		return $source;
	}

	/**
	 * Checksums API 服务器
	 *
	 * @var string
	 *
	 * @since Beginning 4.0.0
	 * @deprecated Beginning 4.0.2
	 */

	/**
	 * 获取 Checksums
	 *
	 * @since Beginning 4.0.0
	 * @deprecated Beginning 4.0.2
	 */

	/**
	 * 校验字符串是否为一个合法的 MD5
	 *
	 * @since Beginning 4.0.0
	 * @deprecated Beginning 4.0.2
	 */

	/**
	 * 发送 HTTP POST 请求
	 *
	 * @since Beginning 4.0.0
	 * @deprecated Beginning 4.0.5
	 */

}

// End of page.
