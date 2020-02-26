<?php
/**
 * 路径导航类
 *
 * @package WordPress
 * @subpackage Beginning
 * @since Beginning 4.0.4
 */

/**
 * 路径导航
 *
 * @since Beginning 4.0.4
 */
final class Bing_Breadcrumbs {

	/**
	 * 导航条目
	 *
	 * @since Beginning 4.0.4
	 * @var array
	 */
	private $items = array();

	/**
	 * 构造函数
	 *
	 * @since Beginning 4.0.4
	 */
	public function __construct( $init = false ) {
		if ( $init )
			$this->init();
	}

	/**
	 * 输出路径导航
	 *
	 * @since Beginning 4.0.4
	 * @see self::get_code()
	 */
	public static function output() {
		$self = new self( true );
		echo $self->get_code();
	}

	/**
	 * 初始化
	 *
	 * 根据当前循环计算出需要的路径导航，如果需要自定义导航请不要调用此方法。
	 *
	 * @since Beginning 4.0.4
	 * @since Beginning 4.0.5 修复分类法存档页条件没有添加 `break` 的问题。
	 */
	public function init() {
		if ( !is_home() && !is_front_page() )
			$this->add_base();

		switch ( true ) {
			case is_404() :
				$this->add_404();
				break;

			case is_search() :
				$this->add_search();
				break;

			case is_post_type_archive() :
				$this->add_post_type_archive();
				break;

			case ( is_category() || is_tag() || is_tax() ) :
				$this->add_tax();
				break;

			case is_singular() :
				$this->add_post();
				break;

			case is_author() :
				$this->add_author();
				break;

			case is_day() :
				$this->add_day();
				break;

			case is_month() :
				$this->add_month();
				break;

			case is_year() :
				$this->add_year();
		}

		if ( is_paged() )
			$this->add_paged();
	}

	/**
	 * 获取路径导航代码
	 *
	 * @since Beginning 4.0.4
	 */
	public function get_code() {
		if ( empty( $this->items ) )
			return false;

		$items  = $this->clean_items();
		$output = '';
		$before = '<li class="home">';

		foreach ( $items as $item ) {
			$code = $item['name'];

			if ( !empty( $item['url'] ) ) {
				$url  = esc_url( $item['url'] );
				$code = "<a href='$url' itemprop='breadcrumb'>$code</a>";
			}

			$output .= $before . $code . '</li>';
			$before  = '<li>';
		}

		$atts = array(
			'class'     => 'breadcrumb',
			'itemscope' => null,
			'itemtype'  => 'http://schema.org/WebPage'
		);

		$output = '<ol' . Bing_render_attributes( $atts ) . '>' . $output . '</ol>';
		return $output;
	}

	/**
	 * 添加导航条目
	 *
	 * @since Beginning 4.0.4
	 */
	public function add_item( $name, $url = false ) {
		if ( empty( $name ) )
			return false;

		$this->items[] = compact( 'name', 'url' );
		return true;
	}

	/**
	 * 添加基础条目
	 *
	 * @since Beginning 4.0.4
	 */
	public function add_base() {
		$this->add_item(
			__( '博客', 'Bing' ),
			home_url( 'blog' )
		);
	}

	/**
	 * 添加 404 条目
	 *
	 * @since Beginning 4.0.4
	 */
	public function add_404() {
		$this->add_item( __( '未找到页面', 'Bing' ) );
	}

	/**
	 * 添加搜索条目
	 *
	 * @since Beginning 4.0.4
	 */
	public function add_search() {
		$this->add_item(
			__( '搜索结果', 'Bing' ),
			get_search_link()
		);
	}

	/**
	 * 添加文章类型存档条目
	 *
	 * @since Beginning 4.0.4
	 */
	public function add_post_type_archive( $post_type = null ) {
		if ( !$post_type )
			$post_type = get_post_type();

		if ( !$post_type = get_post_type_object( $post_type ) )
			return;

		$this->add_item(
			$post_type->label,
			get_post_type_archive_link( $post_type->name )
		);
	}

	/**
	 * 添加分类法条目
	 *
	 * @since Beginning 4.0.4
	 */
	public function add_tax( $term = null ) {
		if ( !$term )
			$term = get_queried_object();

		if ( $parent = $term->parent )
			$this->add_tax( get_term( $parent ) );

		$this->add_item(
			$term->name,
			get_term_link( $term->term_id )
		);
	}

	/**
	 * 添加文章条目
	 *
	 * @since Beginning 4.0.4
	 */
	public function add_post() {
		if ( !$post = get_post() )
			return;

		if ( $post_type = get_post_type_object( $post->post_type ) ) {
			if ( !$post_type->_builtin )
				$this->add_post_type_archive( $post_type->name );

			if (
				in_array( $post_type->name, get_taxonomy( 'category' )->object_type ) &&
				$categories = get_the_category()
			)
				$this->add_tax( reset( $categories ) );
		}

		$this->_add_post( $post );
	}

	/**
	 * 添加作者条目
	 *
	 * @since Beginning 4.0.4
	 */
	public function add_author() {
		$this->add_item(
			get_the_author(),
			get_author_posts_url( get_the_author_meta( 'ID' ) )
		);
	}

	/**
	 * 添加日期条目
	 *
	 * @since Beginning 4.0.4
	 */
	public function add_day() {
		$this->add_month();

		$this->add_item(
			get_the_date( 'd' ),

			get_day_link(
				get_the_date( 'Y' ),
				get_the_date( 'm' ),
				get_the_date( 'F' )
			)
		);
	}

	/**
	 * 添加月份条目
	 *
	 * @since Beginning 4.0.4
	 */
	public function add_month() {
		$this->add_year();

		$this->add_item(
			get_the_date( 'F' ),
			get_month_link( get_the_date( 'Y' ), get_the_date( 'm' ) )
		);
	}

	/**
	 * 添加年份条目
	 *
	 * @since Beginning 4.0.4
	 */
	public function add_year() {
		$this->add_item(
			get_the_date( 'Y' ),
			get_year_link( get_the_date( 'Y' ) )
		);
	}

	/**
	 * 添加分页条目
	 *
	 * @since Beginning 4.0.4
	 */
	public function add_paged() {
		if ( !$paged = get_query_var( 'paged' ) )
			return;

		$this->add_item(
			sprintf( __( '第 %s 页', 'Bing' ), $paged ),
			get_pagenum_link( $paged, false )
		);
	}

	/**
	 * 整理导航内容
	 *
	 * 取消导航内容中最后一个条目的链接，同时清空所有内容。
	 *
	 * @since Beginning 4.0.4
	 */
	private function clean_items() {
		$end = end( $this->items );
		$key = key( $this->items );

		$items       = $this->items;
		$items[$key] = array( 'name' => $end['name'] );

		$this->items = array();
		return $items;
	}

	/**
	 * 添加文章导航（处理父级）
	 *
	 * @since Beginning 4.0.4
	 * @TODO 需要寻找更好地解决方法。
	 */
	private function _add_post( $post ) {
		if ( $parent = $post->post_parent )
			$this->_add_post( $parent );

		$this->add_item(
			__( '正文', 'Bing' ),
			get_permalink( $post )
		);
	}

}

// End of page.
