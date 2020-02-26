<?php
if ( !function_exists( 'wp_get_document_title' ) ) :
	/**
	 * 获取网页标题
	 *
	 * @since Beginning 4.0.1
	 * @since WordPress 4.4.0
	 *
	 * 回顾了下历史代码，在 WordPress 4.1 之后，添加 `wp_get_document_title()` 之前，
	 * `wp_title()` 函数会在支持 `title-tag` 特性的主题中对标题进行特殊处理，使其返回
	 * 值与现在的 `wp_get_document_title()` 函数类似。现在 `wp_title()` 又回到了 4.1
	 * 之前的状态，但是考虑此函数只会在有特殊处理的版本中发挥作用，所以无需我们再进行
	 * 处理。
	 */
	function wp_get_document_title() {
		return wp_title( '|', false, 'right' );
	}
endif;

if ( !function_exists( 'wp_doing_ajax' ) ) :
	/**
	 * 检测当前是否为 WordPress AJAX 请求
	 *
	 * @since Beginning 4.0.1
	 * @since WordPress 4.7.0
	 */
	function wp_doing_ajax() {
		return apply_filters( 'wp_doing_ajax', defined( 'DOING_AJAX' ) && DOING_AJAX );
	}
endif;

if ( !function_exists( 'apply_filters_deprecated' ) ) :
	/**
	 * 应用过时的过滤器
	 *
	 * @since Beginning 4.0.1
	 * @since WordPress 4.6.0
	 *
	 * @see _deprecated_hook()
	 */
	function apply_filters_deprecated( $tag, $args, $version, $replacement = false, $message = null ) {
		if ( !has_filter( $tag ) )
			return $args[0];

		_deprecated_hook( $tag, $version, $replacement, $message );
		return apply_filters_ref_array( $tag, $args );
	}
endif;

if ( !function_exists( '_deprecated_hook' ) ) :
	/**
	 * 抛出使用过时钩子的通知
	 *
	 * @since Beginning 4.0.1
	 * @since WordPress 4.6.0
	 *
	 * @access private
	 */
	function _deprecated_hook( $hook, $version, $replacement = null, $message = null ) {
		do_action(
			'deprecated_hook_run',
			$hook,
			$replacement,
			$version,
			$message
		);

		if ( !WP_DEBUG || !apply_filters( 'deprecated_hook_trigger_error', true ) )
			return;

		$message = empty( $message ) ? '' : ' ' . $message;

		if ( is_null( $replacement ) )
			trigger_error( sprintf(
				__( '%1$s is <strong>deprecated</strong> since version %2$s with no alternative available.' ),
				$hook,
				$version
			) . $message );
		else
			trigger_error( sprintf(
				__( '%1$s is <strong>deprecated</strong> since version %2$s! Use %3$s instead.' ),
				$hook,
				$version,
				$replacement
			) . $message );
	}
endif;

if ( !function_exists( 'do_action_deprecated' ) ) :
	/**
	 * 运行过时的动作钩子
	 *
	 * @since Beginning 4.0.2
	 * @since WordPress 4.6.0
	 *
	 * @see _deprecated_hook()
	 */
	function do_action_deprecated( $tag, $args, $version, $replacement = false, $message = null ) {
		if ( !has_action( $tag ) )
			return;

		_deprecated_hook( $tag, $version, $replacement, $message );
		do_action_ref_array( $tag, $args );
	}
endif;

if ( !function_exists( 'spl_autoload_register' ) ) :
	/**
	 * SPL 队列
	 *
	 * @var array
	 */
	global $_wp_spl_autoloaders;
	$_wp_spl_autoloaders = array();

	/**
	 * 自动加载
	 *
	 * 为了兼容 PHP 5.2，利用自动加载来实现 SPL 系统，这里在调用不存在的类
	 * 时会自动循环已注册的回调函数来按需加载类文件。
	 *
	 * @since Beginning 4.0.5
	 * @since WordPress 4.6.0
	 */
	function __autoload( $classname ) {
		foreach ( $GLOBALS['_wp_spl_autoloaders'] as $autoloader ) {
			if ( !is_callable( $autoloader ) )
				continue;

			call_user_func( $autoloader, $classname );

			if ( class_exists( $classname, false ) )
				return;
		}
	}

	/**
	 * 注册回调函数到 SPL 队列
	 *
	 * @since Beginning 4.0.5
	 * @since WordPress 4.6.0
	 *
	 * @see __autoload()
	 */
	function spl_autoload_register( $autoload_function, $throw = true, $prepend = false ) {
		if ( $throw && !is_callable( $autoload_function ) )
			throw new Exception( 'Function not callable' );

		global $_wp_spl_autoloaders;

		if ( in_array( $autoload_function, $_wp_spl_autoloaders ) )
			return;

		if ( $prepend )
			array_unshift( $_wp_spl_autoloaders, $autoload_function );
		else
			$_wp_spl_autoloaders[] = $autoload_function;
	}

	/**
	 * 从 SPL 队列注销回调函数
	 *
	 * @since Beginning 4.0.5
	 * @since WordPress 4.6.0
	 *
	 * @see __autoload()
	 * @see spl_autoload_register()
	 */
	function spl_autoload_unregister( $function ) {
		foreach ( $GLOBALS['_wp_spl_autoloaders'] as &$autoloader ) {
			if ( $autoloader !== $function )
				continue;

			unset( $autoloader );
			return true;
		}

		return false;
	}

	/**
	 * 获取 SPL 队列的所有回调函数
	 *
	 * @since Beginning 4.0.5
	 * @since WordPress 4.6.0
	 *
	 * @see __autoload()
	 * @see spl_autoload_register()
	 */
	function spl_autoload_functions() {
		return $GLOBALS['_wp_spl_autoloaders'];
	}
endif;

if ( !function_exists( 'get_user_locale' ) ) :
	/**
	 * 获取用户语言
	 *
	 * @since Beginning 4.0.5
	 * @since WordPress 4.7.0
	 */
	function get_user_locale() {
		return get_locale();
	}
endif;

// End of page.
