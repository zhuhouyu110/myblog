=== Kill 429 -完美解决WordPress 429 Too Many Requests报错 ===
Contributors: wbolt,mrkwong
Donate link: https://www.wbolt.com/
Tags: 429 Too Many Requests, 429报错, WordPress 429, 状态码429
Requires at least: 4.8
Tested up to: 5.3
Stable tag: 1.0.0
License: GNU General Public License v2.0 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html

2019年年底只要是部署在中国境内的服务器的WordPress网站，后台执行WordPress版本更新，或者WordPress主题、WordPress插件更新时，就会提示429 Too Many Requests，原因暂不明确。WordPress 429报错状态码到目前为止依然存在，不少站长对这种情况无可奈可，又或者只能先通过其他途径先下载WordPress安装包、主题及插件压缩包，再上传到服务器安装。
但这种方式对于大部分站长来说，流程繁琐。因此，闪电博为了帮助各站长解决此问题，特地开发了Kill 429 Too Many Requests这款插件，安装并激活该插件后，中国境内服务器上的Wordpress可以直接升级版本及更新主题、插件。


== Description ==

Kill 429 Too Many Requests是一款解决中国境内服务器WordPress版本更新，主题及插件更新报429错误的插件，插件通过优化中国境内服务器访问WordPress数据服务器的网络，解决429报错问题，快速安装WordPress版本更新及其他主题、插件更新。

== Installation ==

FTP安装
1. 解压插件压缩包kill-429.zip，将解压获得文件夹上传至wordpress安装目录下的 `/wp-content/plugins/`目录.
2. 访问WordPress仪表盘，进入“插件”-“已安装插件”，在插件列表中找到“杀死429报错”，点击“启用”.
3. 通过“设置”->“杀死429报错” 进入插件设置界面.
4. 至此，该插件安装完毕，次日即可访问百度站长后台查看百度搜索推送数据。

仪表盘安装
1. 进入WordPress仪表盘，点击“插件-安装插件”：
* 关键词搜索“杀死429报错”，找搜索结果中找到“杀死429报错”插件，点击“现在安装”；
* 或者点击“上传插件”-选择“杀死429报错”插件压缩包kill-429.zip，点击“现在安装”。
2. 安装完毕后，启用 `杀死429报错` 插件.
3. 通过“设置”->“杀死429报错” 进入插件设置界面.
4. 至此，该插件安装完毕，次日即可访问百度站长后台查看百度搜索推送数据。

关于本插件，你可以通过阅读<a href="https://www.wbolt.com/kill-429-plugin-documentation.html?utm_source=wp&utm_medium=link&utm_campaign=kill-429" rel="friend" title="插件教程">杀死429报错插件教程</a>学习了解插件安装、设置等详细内容。

== Frequently Asked Questions ==


== Notes ==

WordPress VK是一款专门为WordPress开发的<a href="https://www.wbolt.com/plugins/kill-429?utm_source=wp&utm_medium=link&utm_campaign=kill-429" rel="friend" title="最好用的百度推送管理插件">杀死429报错插件</a>. 插件通过优化中国境内服务器访问WordPress数据服务器的网络，解决429报错问题，快速安装WordPress版本更新及其他主题、插件更新。

闪电博（<a href="https://www.wbolt.com/?utm_source=wp&utm_medium=link&utm_campaign=kill-429" rel="friend" title="闪电博官网">wbolt.com</a>）专注于WordPress主题和插件开发,为中文博客提供更多优质和符合国内需求的主题和插件。此外我们也会分享WordPress相关技巧和教程。

除了杀死429报错插件外，目前我们还开发了以下WordPress插件：

- [热门关键词推荐插件](https://wordpress.org/plugins/smart-keywords-tool/)
- [百度搜索推送管理](https://wordpress.org/plugins/baidu-submit-link/)
- [Smart SEO Tool](https://wordpress.org/plugins/smart-seo-tool/)
- [WP资源下载管理](https://wordpress.org/plugins/download-info-page/)
- [IMGspider-图片采集插件](https://wordpress.org/plugins/imgspider/)
- [打赏/点赞/分享组件](https://wordpress.org/plugins/donate-with-qrcode/)
- 更多主题和插件，请访问<a href="https://www.wbolt.com/?utm_source=wp&utm_medium=link&utm_campaign=kill-429" rel="friend" title="闪电博官网">wbolt.com</a>!

如果你在WordPress主题和插件上有更多的需求，也希望您可以向我们提出意见建议，我们将会记录下来并根据实际情况，推出更多符合大家需求的主题和插件。

致谢！

闪电博团队

== Screenshots ==


== Changelog ==

= 1.0.0 =
* 新增WordPress数据服务器请求服务器线路
* 解决中国境内服务器请求WordPress服务器报429错误
* 支持配置第三方代理IP地址

