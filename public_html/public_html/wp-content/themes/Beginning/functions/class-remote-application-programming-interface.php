<?php
/**
 * 远程 API 类
 *
 * @package WordPress
 * @subpackage Beginning
 *
 * @since Beginning 4.0.5
 */

/**
 * 远程 API
 *
 * @since Beginning 4.0.5
 */
final class Bing_Remote_Application_Programming_Interface {

	/**
	 * API 服务器域名
	 *
	 * @since Beginning 4.0.5
	 * @var string
	 */
	public $domain = 'apis.bgbk.org';

	/**
	 * SSL 请求规则
	 *
	 * 有三种选择：`force` 为必须使用 SSL 进行请求；`try` 为先尝试使用 SSL 进行请求，如果失败
	 * 则以普通方式重新请求；`disable` 为不使用 SSL 进行请求。
	 *
	 * @since Beginning 4.0.5
	 * @var bool
	 */
	public $ssl_rule = 'try';

	/**
	 * 请求方法
	 *
	 * @since Beginning 4.0.5
	 * @var string
	 *
	 * @see WP_Http::request()
	 */
	public $method = 'GET';

	/**
	 * 请求路径
	 *
	 * @since Beginning 4.0.5
	 * @var string
	 */
	public $path;

	/**
	 * 请求数据
	 *
	 * @since Beginning 4.0.5
	 * @var string
	 */
	public $data = array();

	/**
	 * 请求内容
	 *
	 * @since Beginning 4.0.5
	 * @var string
	 */
	private $body;

	/**
	 * 请求结果
	 *
	 * @since Beginning 4.0.5
	 * @var array
	 */
	private $results;

	/**
	 * 构造函数
	 *
	 * @since Beginning 4.0.5
	 */
	public function __construct( $path ) {
		$this->path = $path;
	}

	/**
	 * 发送请求
	 *
	 * @since Beginning 4.0.5
	 */
	public function request() {
		if ( !$ssl_rule = $this->get_ssl_rule() )
			return false;

		$args = $this->get_http_args();

		if ( in_array( $ssl_rule, array( 'force', 'try' ) ) ) {
			$url      = $this->get_url( 'https' );
			$response = wp_safe_remote_request( $url, $args );

			if ( $ssl_rule == 'force' && is_wp_error( $response ) )
				return false;
		}

		if ( !isset( $response ) || is_wp_error( $response ) ) {
			$url      = $this->get_url();
			$response = wp_safe_remote_request( $url, $args );
		}

		if ( wp_remote_retrieve_response_code( $response ) != 200 )
			return false;

		$this->body = wp_remote_retrieve_body( $response );
		return true;
	}

	/**
	 * 获取内容
	 *
	 * @since Beginning 4.1.0
	 */
	public function get_body() {
		return $this->body;
	}

	/**
	 * 解析 JSON 数据
	 *
	 * @since Beginning 4.0.5
	 */
	public function parse_json() {
		$body    = trim( $this->body );
		$results = json_decode( $body, true );

		if ( $success = is_array( $results ) )
			$this->results = $results;

		return $success;
	}

	/**
	 * 获取结果
	 *
	 * @since Beginning 4.0.5
	 */
	public function get_results() {
		return $this->results;
	}

	/**
	 * 获取指定路径的 API 服务器网址
	 *
	 * @since Beginning 4.0.5
	 */
	private function get_url( $scheme = 'http' ) {
		$domain = $this->get_domain( $scheme );
		return $domain . '/' . ltrim( $this->path, '/' );
	}

	/**
	 * 获取指定协议的 API 服务器域名
	 *
	 * @since Beginning 4.0.5
	 */
	private function get_domain( $scheme = 'http' ) {
		$domain = '//' . $this->domain;
		return set_url_scheme( $domain, $scheme );
	}

	/**
	 * 根据服务器环境获取 SSL 请求规则
	 *
	 * @since Beginning 4.0.5
	 */
	private function get_ssl_rule() {
		if ( !wp_http_supports( array( 'ssl' ) ) ) {
			if ( $this->ssl_rule == 'force' )
				return false;

			if ( $this->ssl_rule == 'try' )
				return 'disable';
		}

		return $this->ssl_rule;
	}

	/**
	 * 获取 HTTP 请求参数
	 *
	 * @since Beginning 4.0.5
	 */
	private function get_http_args() {
		$timeout  = defined( 'DOING_CRON' ) && DOING_CRON ? 30 : 5;
		$timeout += round( strlen( maybe_serialize( $this->data ) ) / 2000 );

		// @TODO Headers
		$args = array(
			'user-agent' => sprintf(
				'WordPress/%s; %s',
				get_bloginfo( 'version' ),
				home_url('index.php')
			),

			'timeout' => $timeout,
			'method'  => $this->method,
			'body'    => $this->data
		);

		return $args;
	}

}

// End of page.
