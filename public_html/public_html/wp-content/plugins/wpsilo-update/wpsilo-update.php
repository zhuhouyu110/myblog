<?php
/*
Plugin Name: wp101.net中文下载镜像
Plugin URI: https://wpsilo.com/wordpress-429.html
Description: wp101.net中文下载镜像
Version: 1.0
Author: wpsilo.com
Author URI: http://wpsilo.com
*/
add_filter('site_transient_update_core', function($value){
    foreach ($value->updates as &$update) {
        if($update->locale == 'zh_CN'){
            $update->download   = 'http://cn.wp101.net/latest-zh_CN.zip';
            $update->packages->full = 'http://cn.wp101.net/latest-zh_CN.zip';
        }
    }
 
    return $value;
});