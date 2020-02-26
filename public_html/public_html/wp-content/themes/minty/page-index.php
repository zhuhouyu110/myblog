<?php
/*
Template Name: index
*/
?>
<!DOCTYPE>
<html>
  <head>
    <title>宇后人生</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable = no" />
    <meta name="keywords" content="宇后人生" />
    <meta name="description" content="宇后人生博客" />
    <link href="<?php echo get_theme_file_uri( 'main.css' ); ?>" rel="stylesheet" type="text/css" />
    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">-->
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <style>
      .btn{
        background-color: #1E9FFF;
        display: inline-block;
        height: 38px;
        line-height: 38px;
        padding: 0 25px;
        background-color: #009688;
        color: #fff;
        white-space: nowrap;
        text-align: center;
        font-size: 14px;
        border: none;
        border-radius: 2px;
        cursor: pointer;
        outline: 0;
        -webkit-appearance: none;
        transition: all .3s;
        -webkit-transition: all .3s;
        box-sizing: border-box;
        vertical-align: middle;
        text-decoration: none;
}
    </style>
  </head>
  <body class="is-preload">
    <div id="wrapper">
      <div id="bg"></div>
      <div id="overlay"></div>
      <div id="main">
        <!-- Header -->
        <header id="header">
          <h1 style="font-family: 'STXingkai'; color: #fff;">宇后人生博客</h1><br>
          <p style="font-size:large;font-weight:100; font-family: 'STXingkai';color: #fff;">人生如逆旅，我亦是行人</p><br><br>
          <a class="btn" href="http://zhuhouyu.xyz/blog/" title="博客">Enter</a></li>
          <br></header>
        <!-- Footer -->
        <footer id="footer">
          </footer>
      </div>
    </div>
    <script>window.onload = function() {
      document.body.classList.remove('is-preload');
    }
    window.ontouchmove = function() {
      return fals
    }
    window.onorientationchange = function() {
      document.body.scrollTop = 0;
    }</script>
    <!--音乐https://player.hexiongbiao.cn/-->
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </body>

</html>