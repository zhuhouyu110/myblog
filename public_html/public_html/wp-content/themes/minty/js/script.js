!function(e){function t(t){var i=e("a",h)
u=isNaN(t)?m-1>u?u+1:0:t,i.clone().addClass("temp").appendTo(h).fadeOut(function(){e(this).remove()}),i.attr("href",slideList[u].link).attr("title",slideList[u].title).html('<img src="'+slideList[u].image+'" alt="'+slideList[u].title+'">')}function i(){Y>0?(M.val("发表成功("+Y--+")"),setTimeout(i,1e3)):(M.val("发表评论").prop("disabled",!1),Y=15)}function a(e){e&&(z=e,o.stop().animate({scrollTop:z.offset().top-85},500))}var n=e(window),s=e(document),o=e("html, body"),l=e("#s"),r=e("#rocket"),c=e("html").hasClass("lt-ie7"),d=e("html").hasClass("lt-ie8")
if(e("#m-btns .search").click(function(){e("body").toggleClass("m-search"),l.focus()}),e("#m-menu option").each(function(){e(this).val()==location.href&&e(this).prop("selected",!0)}),c&&e(".menu-item-has-children").mouseenter(function(){e(this).find(".sub-menu").show()}).mouseleave(function(){e(this).find(".sub-menu").hide()}),d&&l.focus(function(){l.addClass("focus")}).blur(function(){l.removeClass("focus")}),c||window.matchMedia&&window.matchMedia("(max-width: 540px)").matches||n.scroll(function(){n.scrollTop()>Math.max(400,n.height())?r.addClass("show"):r.removeClass("show")}).load(function(){if(MINTY.stickySidebar){var t=e("#sidebar"),i=e("#sidebar-top"),a=e("#sidebar-bottom")
if("top"==MINTY.stickySidebar&&i.length)var s=i,o=t.height()+t.offset().top
else if("bottom"==MINTY.stickySidebar&&a.length)var s=a,o=s.offset().top-85
s&&s.length&&n.scroll(function(){n.scrollTop()>o?s.addClass("sticky"):s.removeClass("sticky")}).resize(function(){s.css("left",t.offset().left)}).resize()}}),r.click(function(){return r.addClass("launch"),o.animate({scrollTop:0},600,function(){r.removeClass("show launch")}),!1}),"object"==typeof slideList&&slideList.length){var f,h=e(".slideshow-wrap"),m=slideList.length,u=0
if(h.html('<a href="'+slideList[0].link+'" title="'+slideList[0].title+'"><img src="'+slideList[0].image+'" alt="'+slideList[0].title+'" width="220" height="110"></a>'),m>1){var p=e("<span class='prev'>&lsaquo;</span>"),v=e("<span class='next'>&rsaquo;</span>")
p.click(function(){t(0==u?m-1:u-1)}),v.click(function(){t()}),h.append(p).append(v).hover(function(){clearInterval(f)},function(){f=setInterval(t,7e3)}),f=setInterval(t,7e3)}}var g=e("#main"),y=0
g.on("click",".loadmore",function(t,i){if(y)return!1
var n=e(this).attr("title","正在加载…").addClass("loading"),s=n.attr("href")
return y=1,e.get(s,function(t){n.parent().remove()
var o=e(t),l=o.find(".hentry").addClass("fadein")
g.append(l).append(o.find(".navigation")),i&&a(l.eq(0))
var r=o.filter("title").text()
window.history&&history.pushState&&history.pushState(null,r,s),document.title=r,y=0}),!1})
var w=e("#comments")
w.on("click",".loadmore",function(){var t=e(this)
return t.hasClass("loading")?!1:(t.attr("title","正在加载…").addClass("loading"),e.get(t.attr("href"),function(i){t.parent().remove()
var a=e(i).find(".commentlist").addClass("fadein")
MINTY.lazyload&&a.find("img.lazy").lazyload({effect:"fadeIn"}),w.append(a).append(e(i).find(".navigation"))}),!1)})
var b=e("#commentform"),k=e("#comment"),C=e("#comments-title"),T=e("#comment-settings"),I=e(".comment-settings-toggle"),x=e("span",I),N=e("#author"),M=e("#submit")
I.click(function(){T.hasClass("show")||(T.addClass("show"),e(this).removeClass("required"),N.focus(),setTimeout(function(){s.on("click.comment",function(e){T.find(e.target).length||e.target==T[0]||(T.removeClass("show"),s.off("click.comment"))})},100))}),N.on("change input",function(){x.text(e(this).val())}),k.keydown(function(e){if(e.ctrlKey&&13==e.keyCode)b.trigger("submit")
else if(9==e.keyCode)return I.click(),!1}),e(".comments-link").click(function(){k.focus()}),e("#respond input").add(k).on("invalid",function(){e(this).one("input change",function(){e(this).parent().removeClass("invalid")}).parent().addClass("invalid"),e(this)[0]!=k[0]&&I.click()}),e(".commentlist").eq(0).children().length<10&&e("#comments .loadmore").length&&e("#comments .loadmore").trigger("click")
var S,L,Y=15
if(b.submit(function(){return e.ajax({type:e(this).attr("method"),url:MINTY.ajaxurl,data:e(this).serialize()+"&action=minty_ajax_comment",beforeSend:function(){L=e("#comment_parent").val(),M.val("正在提交.").prop("disabled",!0),k.prop("disabled",!0),S=window.setInterval(function(){M.val("正在提交..."==M.val()?"正在提交.":M.val()+".")},700)},success:function(t){if(window.clearInterval(S),/<\/li>/.test(t)){if(e(".commentlist").length>0){"0"==L?e("<div style='display:none'>"+t+"</div>").prependTo(e(".commentlist").eq(0)).fadeIn():e("<ol class='children' style='display:none'>"+t+"</ol>").insertAfter(e("#comment-"+L)).fadeIn()
var a=parseInt(C.text().match(/\d/g).join(""))+1
a>999&&(a=(""+a/1e3).replace(".",",")),C.text(a+" 条评论")}else e(".no-comments").replaceWith(e("<ol class='commentlist' style='display:none'>"+t+"</ol>").fadeIn()),C.text("1 条评论")
k.prop("disabled",!1).val(""),i()}else alert(e("<div>"+t+"</div>").text()),M.prop("disabled",!1).val("发表评论"),k.prop("disabled",!1)},error:function(){window.clearInterval(S),alert("遇到点小问题，请重新提交评论。"),M.prop("disabled",!1).val("发表评论"),k.prop("disabled",!1)}}),!1}),MINTY.keyboardNavigation){var z
e(document).keypress(function(t){var i=t.target.tagName
if("TEXTAREA"!=i&&"INPUT"!=i)switch(t.which){case 106:var n=e(".previous-post a")[0]
if(n)location.href=n.href
else{if(y)return
if(z){var l=z.next()
l.hasClass("ga")&&(l=l.next()),l.hasClass("hentry")?a(l):e(".loadmore").length&&(e(".loadmore").trigger("click",1),o.animate({scrollTop:s.height()},500))}else a(e(".hentry").eq(1))}t.preventDefault()
break
case 107:var r=e(".next-post a")[0]
if(r)location.href=r.href
else{if(y)return
if(z){var c=z.prev()
c.hasClass("ga")&&(c=c.prev()),c.hasClass("hentry")&&a(c)}else a(e(".hentry").eq(1))}t.preventDefault()
break
case 114:k.focus(),t.preventDefault()
break
case 47:e("#s").focus(),t.preventDefault()}})}if(MINTY.infiniteScroll>0){var q=parseInt(MINTY.infiniteScroll)
s.on("inview",".navigation .loadmore",function(t,i){1>q?s.off("inview"):i&&!e(this).hasClass("loading")&&(e(this).trigger("click"),q--)})}e(".widget-title span").each(function(){var t=e(this)
t.attr("title",t.text())}),MINTY.lazyload&&e("img.lazy").lazyload({effect:"fadeIn"}),location.hash.indexOf("#comment-")>-1&&window.setTimeout(function(){s.scrollTop(s.scrollTop()-74)},1),"ontouchstart"in window?(document.documentElement.className+="touch",e(".menu-item-has-children, .page_item_has_children").attr("aria-haspopup",!0).children("a").on("touchend",function(){return e(this).next().toggle(),!1})):"object"==typeof NProgress&&(NProgress.configure({showSpinner:!1}),NProgress.start(),document.onreadystatechange=function(){"complete"==document.readyState&&setTimeout(NProgress.done,500)}),e.fn.responsiveSlides&&e("#featured-content .rslides").responsiveSlides({auto:!0,pager:!1,nav:!0,timeout:MINTY.slidesTimeout||4e3,prevText:"‹",nextText:"›"}),MINTY.hasGallery&&e(".gallery").each(function(){var t=e(this),i=t.attr("id"),a=t.find(".gallery-item a")
a.addClass("fancybox").each(function(){var t=e(this)
t.attr("rel",i).attr("title",t.find("img").attr("alt"))}).fancybox()})}(jQuery)
