<?php
/**
 * 捐助作者页面类
 *
 * @package WordPress
 * @subpackage Beginning
 *
 * @since Beginning 4.0.5
 */

/**
 * 捐助作者页面
 *
 * @since Beginning 4.0.5
 *
 * @warning 不要继承此类！因为历史兼容原因，无法直接添加 final 关键字，但后续更新不会保证
 * 其继承后的兼容性。
 */
class Bing_Mpanel_Donate {

	/**
	 * 输出页面
	 *
	 * @since Beginning 4.0.5
	 */
	public static function output() {
		$self = new self();
		echo $self->get_code();
	}

	/**
	 * 获取页面代码
	 *
	 * @since Beginning 4.0.5
	 */
	public function get_code() {
		$code = '<div class="wrap">';

			$text  = __( '捐助作者', 'Bing' );
			$code .= '<h1>' . $text . '</h1>';

			$text  = sprintf( __( '嗨！觉得 %1$s 主题怎么样？这是一款完全免费的主题，只有作者一个人在维护，并且于 2015 年 10 月开始持续的予以更新支持。' ), THEME_NAME );
			$code .= '<p>' . $text . '</p>';

			$text  = sprintf( __( '如果你特别喜欢 %1$s，不妨通过以下渠道对主题作者进行一些资金赞助，以鼓励其一直以来的坚持！' ), THEME_NAME );
			$code .= '<p>' . $text . '</p>';

			if ( $channels = $this->get_channels() )
				$code .= $this->get_rendered_channels( $channels );
			else
				$code .= $this->get_default_channels();

			$text  = __( '自愿捐助，十分感谢！', 'Bing' );
			$code .= '<p><strong>' . $text . '</strong></p>';

		$code .= '</div>';
		return $code;
	}

	/**
	 * 获取捐助渠道
	 *
	 * @since Beginning 4.0.5
	 */
	private function get_channels() {
		$locale    = get_user_locale();
		$transient = get_template() . '_donate_channels_' . $locale;

		if ( ( $channels = get_site_transient( $transient ) ) === false ) {
			$api = new Bing_Remote_Application_Programming_Interface( 'donate/bing' );
			$api->data = compact( 'locale' );

			if ( !$api->request() )
				return false;

			if ( !$api->parse_json() )
				return false;

			$channels = $api->get_results();
			set_site_transient( $transient, $channels, DAY_IN_SECONDS );
		}

		if ( isset( $channels['channels'] ) )
			$channels = $channels['channels'];

		return $channels;
	}

	/**
	 * 获取渲染后的捐助渠道代码
	 *
	 * @since Beginning 4.0.5
	 */
	private function get_rendered_channels( $channels ) {
		$translations = $this->get_channels_translations();
		$code         = '';

		foreach ( $channels as $name => $channel ) {
			if ( !isset( $translations[$name] ) )
				continue;

			$text  = $translations[$name];
			$code .= '<h2>' . $text . '</h2>';

			if ( !empty( $channel['account'] ) ) {
				$text  = sprintf( __( '账号：<code>%s</code>', 'Bing' ), $channel['account'] );
				$code .= '<p>' . $text . '</p>';
			}

			if ( !empty( $channel['qrcode'] ) ) {
				$text  = __( '使用手机客户端扫描二维码直达捐助页面：', 'Bing' );
				$code .= '<p>' . $text . '</p>';

				$qrcode = &$channel['qrcode'];

				if ( is_array( $qrcode ) ) {
					if ( isset( $qrcode['src'] ) ) {
						$url = $qrcode['src'];
					} elseif ( isset( $qrcode['source'] ) ) {
						$url = $qrcode['source'];
					} elseif ( isset( $qrcode['url'] ) ) {
						$url = $qrcode['url'];
					} elseif ( isset( $qrcode['image'] ) && is_string( $qrcode['image'] ) ) {
						$url = $qrcode['image'];
					} elseif ( isset( $qrcode['sources'] ) ) {
						$source = reset( $qrcode['sources'] );
						$url    = $source['url'];
					} else {
						return '';
					}

					$atts = array(
						'src'    => $url,
						'width'  => $qrcode['width'],
						'height' => $qrcode['height']
					);

					if ( isset( $qrcode['sources'] ) ) {
						$atts['srcset'] = '';

						foreach ( $qrcode['sources'] as $source ) {
							$url = str_replace( ' ', '%20', $source['url'] );
							$atts['srcset'] .= "{$url} {$source['value']}{$source['descriptor']}, ";
						}

						$atts['srcset'] = rtrim( $atts['srcset'], ', ' );
					}

					$image = '<img' . Bing_render_attributes( $atts ) . ' />';
				} else {
					$image = '<img src="' . esc_url( $qrcode ) . '" />';
				}

				$code .= '<p>' . $image . '</p>';
			}
		}

		return $code;
	}

	/**
	 * 获取默认捐助渠道代码
	 *
	 * @since Beginning 4.0.5
	 */
	private function get_default_channels() {
		$code = '<iframe src="https://www.bgbk.org/donate/" width="100%" height="500"></iframe>';
		return $code;
	}

	/**
	 * 获取支持渠道的名称翻译
	 *
	 * @since Beginning 4.0.5
	 */
	private function get_channels_translations() {
		$translations = array(
			'alipay' => __( '支付宝', 'Bing' ),
			'qpay'   => __( 'QQ 钱包', 'Bing' )
		);

		return $translations;
	}

}

// End of page.
