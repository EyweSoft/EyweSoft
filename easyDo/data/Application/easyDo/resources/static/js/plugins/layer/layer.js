/**

 @Name：layer v3.1.0 Web弹层组件
 @Author：贤心
 @Site：http://layer.layui.com
 @License：MIT
    
 */
!function(e,t){"use strict";var i,n,a,o=e.layui&&layui.define,r={getPath:function(){var e=document.scripts,t=e[e.length-1],i=t.src;if(!t.getAttribute("merge"))return i.substring(0,i.lastIndexOf("/")+1)}(),config:{},end:{},minIndex:0,minLeft:[],btn:["&#x786E;&#x5B9A;","&#x53D6;&#x6D88;"],type:["dialog","page","iframe","loading","tips"],getStyle:function(t,i){var n=t.currentStyle?t.currentStyle:e.getComputedStyle(t,null);return n[n.getPropertyValue?"getPropertyValue":"getAttribute"](i)},link:function(t,i,n){if(l.path){var a=document.getElementsByTagName("head")[0],o=document.createElement("link");"string"==typeof i&&(n=i);var s="layuicss-"+(n||t).replace(/\.|\//g,""),f=0;o.rel="stylesheet",o.href=l.path+t,o.id=s,document.getElementById(s)||a.appendChild(o),"function"==typeof i&&function t(){if(++f>80)return e.console&&console.error("layer.css: Invalid");1989===parseInt(r.getStyle(document.getElementById(s),"width"))?i():setTimeout(t,100)}()}}},l={v:"3.1.0",ie:(a=navigator.userAgent.toLowerCase(),!(!e.ActiveXObject&&!("ActiveXObject"in e))&&((a.match(/msie\s(\d+)/)||[])[1]||"11")),index:e.layer&&e.layer.v?1e5:0,path:r.getPath,config:function(e,t){return e=e||{},l.cache=r.config=i.extend({},r.config,e),l.path=r.config.path||l.path,"string"==typeof e.extend&&(e.extend=[e.extend]),r.config.path&&l.ready(),e.extend?(o?layui.addcss("modules/layer/"+e.extend):r.link("theme/"+e.extend),this):this},ready:function(e){var t="layer",i=(o?"modules/layer/":"theme/")+"default/layer.css?v="+l.v;return o?layui.addcss(i,e,t):r.link(i,e,t),this},alert:function(e,t,n){var a="function"==typeof t;return a&&(n=t),l.open(i.extend({content:e,yes:n},a?{}:t))},confirm:function(e,t,n,a){var o="function"==typeof t;return o&&(a=n,n=t),l.open(i.extend({content:e,btn:r.btn,yes:n,btn2:a},o?{}:t))},msg:function(e,t){if(e){t?1==t||"1"==t?t="top_msg DANGER":2!=t&&"2"!=t||(t="top_msg WARNING"):t="top_msg SUCCESS";var n,a="function"==typeof n,o=(t?t+"-msg":"")||"layui-layer-msg",s=f.anim.length-1;return l.open(i.extend({content:e,time:3e3,shade:!1,skin:o,title:!1,closeBtn:!1,btn:!1,resize:!1},a&&!r.config.skin?{skin:o+" layui-layer-hui",anim:s}:((n=n||{}).skin=o+" "+(n.skin||"layui-layer-hui"),n)))}},load:function(e,t){return l.open(i.extend({type:3,icon:e||0,resize:!1,shade:1},t))},tips:function(e,t,n){return l.open(i.extend({type:4,content:[e,t],closeBtn:!1,time:3e4,shade:!1,resize:!1,fixed:!1,maxWidth:310},n))}},s=function(e){var t=this;t.index=++l.index,t.config=i.extend({},t.config,r.config,e),document.body?t.creat():setTimeout((function(){t.creat()}),30)};s.pt=s.prototype;var f=["layui-layer",".layui-layer-title",".layui-layer-main",".layui-layer-dialog","layui-layer-iframe","layui-layer-content","layui-layer-btn","layui-layer-close"];function c(t,n,a,o,s,c){var d="layui-layer-wrap",u=function(){if(a===r.type[1]&&"object"===n.attr("conType")){n.children(":not(."+f[5]+")").remove();for(var o=n.find("."+d),l=0;l<2;l++)o.unwrap();o.css("display",o.data("display")).removeClass(d)}else{if(a===r.type[2])try{var u=i("#"+f[4]+t)[0];u.contentWindow.document.write(""),u.contentWindow.close(),n.find("."+f[5])[0].removeChild(u)}catch(e){}n[0].innerHTML="",n.remove()}if(s&&"REFRESH"==s){var y=e.frameElement;if(y){var p=y.contentWindow;if("function"==typeof p.reLoad)p.reLoad();else{var h=i(i(y).contents().get(0)).find(".custom-iframe")[0].contentWindow;"function"==typeof h.reLoad&&h.reLoad()}}}else"function"==typeof r.end[t]&&r.end[t](s,c);delete r.end[t]};n.data("isOutAnim")&&n.addClass("layer-anim "+o),i("#layui-layer-moves, #layui-layer-shade"+t).remove(),6==l.ie&&r.reselect(),r.rescollbar(t),n.attr("minLeft")&&(r.minIndex--,r.minLeft.push(n.attr("minLeft"))),l.ie&&l.ie<10||!n.data("isOutAnim")?u():setTimeout((function(){u()}),200)}f.anim=["layer-anim-00","layer-anim-01","layer-anim-02","layer-anim-03","layer-anim-04","layer-anim-05","layer-anim-06"],s.pt.config={type:0,shade:.3,fixed:!0,move:f[1],title:"&#x4FE1;&#x606F;",offset:"auto",area:"auto",closeBtn:1,hideBtn:!1,time:0,zIndex:19891014,maxWidth:360,anim:0,isOutAnim:!0,icon:-1,moveType:1,resize:!0,scrollbar:!0,tips:2,btnObj:""},s.pt.vessel=function(e,t){var n=this,a=n.index,o=n.config,l=o.zIndex+a,s="object"==typeof o.title,c=o.maxmin&&(1===o.type||2===o.type),d="",u=!1;o.skin&&o.skin.indexOf("iframeClass")>-1?(u=!0,d+='<div class="titleBox">',d+='\t<div class="return-back"><i class="fa fa-reply mr5"></i><span>返回</span></div>',d+='\t<div class="line"></div>',d+=' <div class="winTitle">'+(s?o.title[0]:o.title)+"</div>",d+="</div>"):d+=s?o.title[0]:o.title;var y,p=o.title?'<div class="layui-layer-title" style="'+(s?o.title[1]:"")+'">'+d+"</div>":'<div class="layui-layer-title"></div>';return o.zIndex=l,t([o.shade?'<div class="layui-layer-shade" id="layui-layer-shade'+a+'" times="'+a+'" style="z-index:'+(l-1)+'; "></div>':"",'<div class="'+f[0]+" layui-layer-"+r.type[o.type]+(0!=o.type&&2!=o.type||o.shade?"":" layui-layer-border")+" "+(o.skin||"")+'" id="'+f[0]+a+'" type="'+r.type[o.type]+'" times="'+a+'" showtime="'+o.time+'" conType="'+(e?"object":"string")+'" style="z-index: '+l+"; width:"+o.area[0]+";height:"+o.area[1]+(o.fixed?"":";position:absolute;")+'">'+(e&&2!=o.type?"":p)+'<div id="'+(o.id||"")+'" class="layui-layer-content'+(0==o.type&&-1!==o.icon?" layui-layer-padding":"")+(3==o.type?" layui-layer-loading"+o.icon:"")+'">'+(0==o.type&&-1!==o.icon?'<i class="layui-layer-ico layui-layer-ico'+o.icon+'"></i>':"")+(1==o.type&&e?"":o.content||"")+'</div><span class="layui-layer-setwin" '+(o.skin&&o.skin.indexOf("top_msg")>-1?" onclick=\"$(this).closest('.top_msg').remove();\"":"")+">"+(y=c?'<a class="layui-layer-min layui-top-btn" href="javascript:;"><i class="zmdi zmdi-minus"></i></a><a class="layui-layer-ico layui-layer-max layui-top-btn" href="javascript:;"><i class="zmdi zmdi-window-maximize"></i></a>':"",o.closeBtn&&(y+='<a class="layui-layer-ico '+f[7]+" "+f[7]+(o.title?o.closeBtn:4==o.type?"1":"2")+'" href="javascript:;"><i class="zmdi zmdi-close"></i></a>'),y+"</span>")+(o.btn?function(){var e="";"string"==typeof o.btn&&(o.btn=[o.btn]);for(var t=0,i=o.btn.length;t<i;t++)e+='<a class="'+f[6]+t+'">'+o.btn[t]+"</a>";return'<div class="'+(o.hideBtn?"btn-hide":"")+" "+f[6]+" layui-layer-btn-"+(o.btnAlign||"common")+'">'+e+"</div>"}():"")+(o.resize?'<span class="layui-layer-resize"></span>':"")+"</div>"],p,i(u?'<div class="layui-layer-iframeClass"></div>':"")),n},s.pt.creat=function(){var e=this,t=e.config,a=e.index,o="object"==typeof(c=t.content),s=i("body");if(!t.id||!i("#"+t.id)[0]){switch("string"==typeof t.area&&(t.area="auto"===t.area?["",""]:[t.area,""]),t.shift&&(t.anim=t.shift),6==l.ie&&(t.fixed=!1),t.type){case 0:t.btn="btn"in t?t.btn:r.btn[0],l.closeAll("dialog");break;case 2:var c=t.content=o?t.content:[t.content||"http://layer.layui.com","auto"];t.content='<iframe scrolling="'+(t.content[1]||"auto")+'" allowtransparency="true" id="'+f[4]+a+'" name="'+f[4]+a+'" onload="this.className=\'\';" class="layui-layer-load" frameborder="0" src="'+t.content[0]+'"></iframe>';break;case 3:delete t.title,delete t.closeBtn,-1===t.icon&&t.icon,l.closeAll("loading");break;case 4:o||(t.content=[t.content,"body"]),t.follow=t.content[1],t.content=t.content[0]+'<i class="layui-layer-TipsG"></i>',delete t.title,t.tips="object"==typeof t.tips?t.tips:[t.tips,!0],t.tipsMore||l.closeAll("tips")}if(e.vessel(o,(function(n,l,d){s.append(n[0]),o?2==t.type||4==t.type?i("body").append(n[1]):c.parents("."+f[0])[0]||(c.data("display",c.css("display")).show().addClass("layui-layer-wrap").wrap(n[1]),i("#"+f[0]+a).find("."+f[5]).before(l)):s.append(n[1]),i(".layui-layer-move")[0]||s.append(r.moveElem=d),e.layero=i("#"+f[0]+a),t.scrollbar||f.html.css("overflow","hidden").attr("layer-full",a)})).auto(a),i("#layui-layer-shade"+e.index).css({"background-color":t.shade[1]||"#000",opacity:t.shade[0]||.3}),2==t.type&&6==l.ie&&e.layero.find("iframe").attr("src",c[0]),4==t.type?e.tips():e.offset(),t.fixed&&n.on("resize",(function(){e.offset(),(/^\d+%$/.test(t.area[0])||/^\d+%$/.test(t.area[1]))&&e.auto(a,!0),4==t.type&&e.tips()})),t.time<=0||setTimeout((function(){l.close(e.index)}),t.time),e.move().callback(),f.anim[t.anim]){var d="layer-anim "+f.anim[t.anim];e.layero.addClass(d).one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend",(function(){i(this).removeClass(d)}))}t.isOutAnim&&e.layero.data("isOutAnim",!0),setTimeout((()=>{i(".btn-hide").removeClass("btn-hide")}),350)}},s.pt.auto=function(e,t){var a=this.config,o=i("#"+f[0]+e);""===a.area[0]&&a.maxWidth>0&&(l.ie&&l.ie<8&&a.btn&&o.width(o.innerWidth()),o.outerWidth()>a.maxWidth&&o.width(a.maxWidth));var r=[o.innerWidth(),o.innerHeight()],s=(o.find(f[1]).outerHeight(),o.find("."+f[6]).outerHeight(),function(e){e=o.find(e,t);var i=o.closest(".layui-layer-iframe");if(t){var n=i.height();i.find(".layui-layer-title").is(":visible")?n-=20:n-=5,e.height(n)}else e.height(i.height()-i.find(".layui-layer-title").height()-(o.hasClass("iframeClass")?0:10))});if(2===a.type){s("iframe");var c=i(o).find("iframe");if(c&&c.length){var d=c[0].contentWindow;if(d&&d.changeLayerBodyHeight&&"function"==typeof d.changeLayerBodyHeight)return d.changeLayerBodyHeight(),!1}}else""===a.area[1]?a.maxHeight>0&&o.outerHeight()>a.maxHeight?(r[1]=a.maxHeight,s("."+f[5])):a.fixed&&r[1]>=n.height()&&(r[1]=n.height(),s("."+f[5])):s("."+f[5]);return this},s.pt.offset=function(){var e=this,t=e.config,i=e.layero,a=[i.outerWidth(),i.outerHeight()],o="object"==typeof t.offset;e.offsetTop=(n.height()-a[1])/2,e.offsetLeft=(n.width()-a[0])/2,o?(e.offsetTop=t.offset[0],e.offsetLeft=t.offset[1]||e.offsetLeft):"auto"!==t.offset&&("t"===t.offset?e.offsetTop=0:"r"===t.offset?e.offsetLeft=n.width()-a[0]:"b"===t.offset?e.offsetTop=n.height()-a[1]:"l"===t.offset?e.offsetLeft=0:"lt"===t.offset?(e.offsetTop=0,e.offsetLeft=0):"lb"===t.offset?(e.offsetTop=n.height()-a[1],e.offsetLeft=0):"rt"===t.offset?(e.offsetTop=0,e.offsetLeft=n.width()-a[0]):"rb"===t.offset?(e.offsetTop=n.height()-a[1],e.offsetLeft=n.width()-a[0]):e.offsetTop=t.offset),t.fixed||(e.offsetTop=/%$/.test(e.offsetTop)?n.height()*parseFloat(e.offsetTop)/100:parseFloat(e.offsetTop),e.offsetLeft=/%$/.test(e.offsetLeft)?n.width()*parseFloat(e.offsetLeft)/100:parseFloat(e.offsetLeft),e.offsetTop+=n.scrollTop(),e.offsetLeft+=n.scrollLeft()),i.attr("minLeft")&&(e.offsetTop=n.height()-(i.find(f[1]).outerHeight()||0),e.offsetLeft=i.css("left")),i.css({top:e.offsetTop,left:e.offsetLeft})},s.pt.tips=function(){var e=this.config,t=this.layero,a=[t.outerWidth(),t.outerHeight()],o=i(e.follow);o[0]||(o=i("body"));var r={width:o.outerWidth(),height:o.outerHeight(),top:o.offset().top,left:o.offset().left},l=t.find(".layui-layer-TipsG"),s=e.tips[0];if(e.tips[1]||l.remove(),r.autoLeft=function(){r.left+a[0]-n.width()>0?(r.tipLeft=r.left+r.width-a[0]+15,l.css({right:12,left:"auto"})):r.tipLeft=r.left},r.where=[function(){r.autoLeft(),r.tipTop=r.top-a[1]-10,l.removeClass("layui-layer-TipsB").addClass("layui-layer-TipsT").addClass("layui-layer-TipsT left").css("border-right-color",e.tips[1])},function(){r.tipLeft=r.left+r.width+10,r.tipTop=r.top,l.removeClass("layui-layer-TipsL").addClass("layui-layer-TipsR right").css("border-bottom-color",e.tips[1])},function(){r.autoLeft(),r.tipTop=r.top+r.height+10,l.removeClass("layui-layer-TipsT").addClass("layui-layer-TipsB").css("border-right-color",e.tips[1])},function(){r.tipLeft=r.left-a[0]-10,r.tipTop=r.top,l.removeClass("layui-layer-TipsR").addClass("layui-layer-TipsL").css("border-bottom-color",e.tips[1])}],r.where[s-1](),1===s?r.top-(n.scrollTop()+a[1]+16)<0&&r.where[2]():2===s?n.width()-(r.left+r.width+a[0]+16)>0||r.where[3]():3===s?r.top-n.scrollTop()+r.height+a[1]+16-n.height()>0&&r.where[0]():4===s&&a[0]+16-r.left>0&&r.where[1](),t.find("."+f[5]).css({"background-color":e.tips[1],color:e.tips.length>1?e.tips[2]:"#fff","padding-right":e.closeBtn?"30px":""}),e.btnObj&&e.btnObj[0]){var c=i(e.btnObj[0]).offset().top+57,d=i(e.btnObj[0]).offset().left;3===s&&(c=c-a[1]-33),t.css({left:d+"px",top:c+"px"})}else t.css({left:r.tipLeft-(e.fixed?n.scrollLeft():0),top:r.tipTop-(e.fixed?n.scrollTop():0)})},s.pt.move=function(){var e=this,t=e.config,a=i(document),o=e.layero,s=o.find(t.move),f=o.find(".layui-layer-resize"),c={};return t.move&&s.css("cursor","move"),s.on("mousedown",(function(e){e.preventDefault(),t.move&&(c.moveStart=!0,c.offset=[e.clientX-parseFloat(o.css("left")),e.clientY-parseFloat(o.css("top"))],r.moveElem.css("cursor","move").show())})),f.on("mousedown",(function(e){e.preventDefault(),c.resizeStart=!0,c.offset=[e.clientX,e.clientY],c.area=[o.outerWidth(),o.outerHeight()],r.moveElem.css("cursor","se-resize").show()})),a.on("mousemove",(function(i){if(c.moveStart){var a=i.clientX-c.offset[0],r=i.clientY-c.offset[1],s="fixed"===o.css("position");if(i.preventDefault(),c.stX=s?0:n.scrollLeft(),c.stY=s?0:n.scrollTop(),!t.moveOut){var f=n.width()-o.outerWidth()+c.stX,d=n.height()-o.outerHeight()+c.stY;a<c.stX&&(a=c.stX),a>f&&(a=f),r<c.stY&&(r=c.stY),r>d&&(r=d)}o.css({left:a,top:r})}if(t.resize&&c.resizeStart){a=i.clientX-c.offset[0],r=i.clientY-c.offset[1];i.preventDefault(),l.style(e.index,{width:c.area[0]+a,height:c.area[1]+r}),c.isResize=!0,t.resizing&&t.resizing(o)}})).on("mouseup",(function(e){c.moveStart&&(delete c.moveStart,r.moveElem.hide(),t.moveEnd&&t.moveEnd(o)),c.resizeStart&&(delete c.resizeStart,r.moveElem.hide())})),e},s.pt.callback=function(){var e=this,t=e.layero,n=e.config;function a(){!1===(n.cancel&&n.cancel(e.index,t))||l.close(e.index),hideLoading()}e.openLayer(),n.success&&(2==n.type?t.find("iframe").on("load",(function(){n.success(t,e.index)})):n.success(t,e.index)),6==l.ie&&e.IE6(t),t.find("."+f[6]).children("a").on("click",(function(){var a=i(this).index();0===a?n.yes?n.yes(e.index,t):n.btn1?n.btn1(e.index,t):l.close(e.index):!1===(n["btn"+(a+1)]&&n["btn"+(a+1)](e.index,t))||l.close(e.index)})),t.find(".return-back").on("click",(function(){a()})),t.find("."+f[7]).on("click",a),n.shadeClose&&i("#layui-layer-shade"+e.index).on("click",(function(){l.close(e.index)})),t.find(".layui-layer-min").on("click",(function(){!1===(n.min&&n.min(t))||l.min(e.index,n)})),t.find(".layui-layer-max").on("click",(function(){i(this).hasClass("layui-layer-maxmin")?(l.restore(e.index),n.restore&&n.restore(t)):(l.full(e.index,n),setTimeout((function(){n.full&&n.full(t)}),100))})),n.end&&(r.end[e.index]=n.end)},r.reselect=function(){i.each(i("select"),(function(e,t){var n=i(this);n.parents("."+f[0])[0]||1==n.attr("layer")&&i("."+f[0]).length<1&&n.removeAttr("layer").show(),n=null}))},s.pt.IE6=function(e){i("select").each((function(e,t){var n=i(this);n.parents("."+f[0])[0]||"none"===n.css("display")||n.attr({layer:"1"}).hide(),n=null}))},s.pt.openLayer=function(){l.zIndex=this.config.zIndex,l.setTop=function(e){return l.zIndex=parseInt(e[0].style.zIndex),e.on("mousedown",(function(){l.zIndex++,e.css("z-index",l.zIndex+1)})),l.zIndex}},r.record=function(e){var t=[e.width(),e.height(),e.position().top,e.position().left+parseFloat(e.css("margin-left"))];e.find(".layui-layer-max").addClass("layui-layer-maxmin"),e.attr({area:t})},r.rescollbar=function(e){f.html.attr("layer-full")==e&&(f.html[0].style.removeProperty?f.html[0].style.removeProperty("overflow"):f.html[0].style.removeAttribute("overflow"),f.html.removeAttr("layer-full"))},e.layer=l,l.getChildFrame=function(e,t){return t=t||i("."+f[4]).attr("times"),i("#"+f[0]+t).find("iframe").contents().find(e)},l.getFrameIndex=function(e){return e?i("#"+e).parents("."+f[4]).attr("times"):0},l.iframeAuto=function(e){if(e){var t=l.getChildFrame("html",e).outerHeight();t||(t=parent.layer.getChildFrame("html",e).outerHeight());var n=i("#"+f[0]+e);n.length||(n=parent.$("#"+f[0]+e));var a=n.find(f[1]).outerHeight()||0,o=n.find("."+f[6]).outerHeight()||0;n.css({height:t+a+o}),n.find("iframe").css({height:t})}},l.iframeSrc=function(e,t){i("#"+f[0]+e).find("iframe").attr("src",t)},l.style=function(e,t,n){var a=i("#"+f[0]+e),o=a.find(".layui-layer-content"),l=a.attr("type"),s=a.find(f[1]).outerHeight()||0,c=a.find("."+f[6]).outerHeight()||0;a.attr("minLeft");l!==r.type[3]&&l!==r.type[4]&&(n||(parseFloat(t.width)<=260&&(t.width=260),parseFloat(t.height)-s-c<=64&&(t.height=64+s+c)),a.css(t),c=a.find("."+f[6]).outerHeight(),l===r.type[2]?a.find("iframe").css({height:parseFloat(t.height)-s-c}):o.css({height:parseFloat(t.height)-s-c-parseFloat(o.css("padding-top"))-parseFloat(o.css("padding-bottom"))}))},l.min=function(e,t){var a=i("#"+f[0]+e),o=a.find(f[1]).outerHeight()||0,s=a.attr("minLeft")||181*r.minIndex+"px",c=a.css("position");r.record(a),r.minLeft[0]&&(s=r.minLeft[0],r.minLeft.shift()),a.attr("position",c),l.style(e,{width:180,height:o,left:s,top:n.height()-o,position:"fixed",overflow:"hidden"},!0),a.find(".layui-layer-min").hide(),"page"===a.attr("type")&&a.find(f[4]).hide(),r.rescollbar(e),a.attr("minLeft")||r.minIndex++,a.attr("minLeft",s)},l.restore=function(e){var t=i("#"+f[0]+e),n=t.attr("area").split(",");t.attr("type");i("#layui-layer-iframe"+e).css("height",parseFloat(n[1])-10),l.style(e,{width:parseFloat(n[0]),height:parseFloat(n[1]),top:parseFloat(n[2]),left:parseFloat(n[3]),position:t.attr("position"),overflow:"visible"},!0),t.find(".layui-layer-max").removeClass("layui-layer-maxmin"),t.find(".layui-layer-min").show(),"page"===t.attr("type")&&t.find(f[4]).show(),r.rescollbar(e),frames["layui-layer-iframe"+e].changeLayerBodyHeight()},l.full=function(e){var t,a=i("#"+f[0]+e);r.record(a),f.html.attr("layer-full")||f.html.css("overflow","hidden").attr("layer-full",e),clearTimeout(t),t=setTimeout((function(){i("#layui-layer-iframe"+e).css("height",n.height()-10);var t="fixed"===a.css("position");l.style(e,{top:t?0:n.scrollTop(),left:t?0:n.scrollLeft(),width:n.width(),height:n.height()-30},!0),a.find(".layui-layer-min").hide(),frames["layui-layer-iframe"+e].changeLayerBodyHeight()}),100)},l.title=function(e,t){i("#"+f[0]+(t||l.index)).find(f[1]).html(e)},l.close=function(e,t,n){var a=i("#"+f[0]+e),o=a.attr("type"),r="layer-anim-close";if(!a[0]){if(a=parent.$("#"+f[0]+e),o=a.attr("type"),!a[0])return;parent.$("#layui-layer-shade"+e).remove()}var l=top.layer.getChildFrame("body",e).find("#isFlowChanged").val();if(l&&"Y"==l)var s=top.layer.confirm("流转图配置未保存，是否继续关闭窗口？",{btn:[i.i18n.prop("common.comfirm"),i.i18n.prop("common.cancel")]},(function(){c(e,a,o,r,t,n),parent.layer.close(s)}),(function(){}));else c(e,a,o,r,t,n)},l.hide=function(e){var t=i("#layui-layer"+e);t[0]?(t.hide(),i("#layui-layer-shade"+e).hide()):(parent.$("#layui-layer"+e).hide(),parent.$("#layui-layer-shade"+e).hide())},l.closeAll=function(t,n){var a=i("."+f[0]);i.each(a,(function(a){if(n&&(0==a&&i(this).outerWidth()===i(e).width()&&i(this).outerHeight()===i(e).height()))return!0;var o=i(this),r=t?o.attr("type")===t:1,s=o.attr("times");r&&l.close(s),r=null}))};var d=l.cache||{},u=function(e){return d.skin?" "+d.skin+" "+d.skin+"-"+e:""};l.prompt=function(e,t){var a="";if("function"==typeof(e=e||{})&&(t=e),e.area){var o=e.area;a='style="width: '+o[0]+"; height: "+o[1]+';"',delete e.area}var r,s=2==e.formType?'<textarea class="layui-layer-input"'+a+">"+(e.value||"")+"</textarea>":'<input type="'+(1==e.formType?"password":"text")+'" class="layui-layer-input" value="'+(e.value||"")+'">',f=e.success;return delete e.success,l.open(i.extend({type:1,btn:["&#x786E;&#x5B9A;","&#x53D6;&#x6D88;"],content:s,skin:"layui-layer-prompt"+u("prompt"),maxWidth:n.width(),success:function(e){(r=e.find(".layui-layer-input")).focus(),"function"==typeof f&&f(e)},resize:!1,yes:function(i){var n=r.val();""===n?r.focus():n.length>(e.maxlength||500)?l.tips("&#x6700;&#x591A;&#x8F93;&#x5165;"+(e.maxlength||500)+"&#x4E2A;&#x5B57;&#x6570;",r,{tips:1}):t&&t(n,i,r)}},e))},l.tab=function(e){var t=(e=e||{}).tab||{},n="layui-this",a=e.success;return delete e.success,l.open(i.extend({type:1,skin:"layui-layer-tab"+u("tab"),resize:!1,title:function(){var e=t.length,i=1,a="";if(e>0)for(a='<span class="'+n+'">'+t[0].title+"</span>";i<e;i++)a+="<span>"+t[i].title+"</span>";return a}(),content:'<ul class="layui-layer-tabmain">'+function(){var e=t.length,i=1,a="";if(e>0)for(a='<li class="layui-layer-tabli '+n+'">'+(t[0].content||"no content")+"</li>";i<e;i++)a+='<li class="layui-layer-tabli">'+(t[i].content||"no  content")+"</li>";return a}()+"</ul>",success:function(t){var o=t.find(".layui-layer-title").children(),r=t.find(".layui-layer-tabmain").children();o.on("mousedown",(function(t){t.stopPropagation?t.stopPropagation():t.cancelBubble=!0;var a=i(this),o=a.index();a.addClass(n).siblings().removeClass(n),r.eq(o).show().siblings().hide(),"function"==typeof e.change&&e.change(o)})),"function"==typeof a&&a(t)}},e))},l.photos=function(t,n,a){var o={};if((t=t||{}).photos){var r=t.photos.constructor===Object,s=r?t.photos:{},f=s.data||[],c=s.start||0;o.imgIndex=1+(0|c),t.img=t.img||"img";var d=t.success;if(delete t.success,r){if(0===f.length)return l.msg("&#x6CA1;&#x6709;&#x56FE;&#x7247;")}else{var y=i(t.photos),p=function(){f=[],y.find(t.img).each((function(e){var t=i(this);t.attr("layer-index",e),f.push({alt:t.attr("alt"),pid:t.attr("layer-pid"),src:t.attr("layer-src")||t.attr("src"),thumb:t.attr("src")})}))};if(p(),0===f.length)return;if(n||y.on("click",t.img,(function(){var e=i(this).attr("layer-index");l.photos(i.extend(t,{photos:{start:e,data:f,tab:t.tab},full:t.full}),!0),p()})),!n)return}o.imgprev=function(e){o.imgIndex--,o.imgIndex<1&&(o.imgIndex=f.length),o.tabimg(e)},o.imgnext=function(e,t){o.imgIndex++,o.imgIndex>f.length&&(o.imgIndex=1,t)||o.tabimg(e)},o.keyup=function(e){if(!o.end){var t=e.keyCode;e.preventDefault(),37===t?o.imgprev(!0):39===t?o.imgnext(!0):27===t&&l.close(o.index)}},o.tabimg=function(e){if(!(f.length<=1))return s.start=o.imgIndex-1,l.close(o.index),l.photos(t,!0,e)},o.event=function(){o.bigimg.hover((function(){o.imgsee.show()}),(function(){o.imgsee.hide()})),o.bigimg.find(".layui-layer-imgprev").on("click",(function(e){e.preventDefault(),o.imgprev()})),o.bigimg.find(".layui-layer-imgnext").on("click",(function(e){e.preventDefault(),o.imgnext()})),i(document).on("keyup",o.keyup)},o.loadi=l.load(1,{shade:!("shade"in t)&&.9,scrollbar:!1}),function(e,t,i){var n=new Image;if(n.src=e,n.complete)return t(n);n.onload=function(){n.onload=null,t(n)},n.onerror=function(e){n.onerror=null,i(e)}}(f[c].src,(function(n){l.close(o.loadi),o.index=l.open(i.extend({type:1,id:"layui-layer-photos",area:function(){var a=[n.width,n.height],o=[i(e).width()-100,i(e).height()-100];if(!t.full&&(a[0]>o[0]||a[1]>o[1])){var r=[a[0]/o[0],a[1]/o[1]];r[0]>r[1]?(a[0]=a[0]/r[0],a[1]=a[1]/r[0]):r[0]<r[1]&&(a[0]=a[0]/r[1],a[1]=a[1]/r[1])}return[a[0]+"px",a[1]+"px"]}(),title:!1,shade:.9,shadeClose:!0,closeBtn:!1,move:".layui-layer-phimg img",moveType:1,scrollbar:!1,moveOut:!0,isOutAnim:!1,skin:"layui-layer-photos"+u("photos"),content:'<div class="layui-layer-phimg"><img src="'+f[c].src+'" alt="'+(f[c].alt||"")+'" layer-pid="'+f[c].pid+'"><div class="layui-layer-imgsee">'+(f.length>1?'<span class="layui-layer-imguide"><a href="javascript:;" class="layui-layer-iconext layui-layer-imgprev"></a><a href="javascript:;" class="layui-layer-iconext layui-layer-imgnext"></a></span>':"")+'<div class="layui-layer-imgbar" style="display:'+(a?"block":"")+'"><span class="layui-layer-imgtit"><a href="javascript:;">'+(f[c].alt||"")+"</a><em>"+o.imgIndex+"/"+f.length+"</em></span></div></div></div>",success:function(e,i){o.bigimg=e.find(".layui-layer-phimg"),o.imgsee=e.find(".layui-layer-imguide,.layui-layer-imgbar"),o.event(e),t.tab&&t.tab(f[c],e),"function"==typeof d&&d(e)},end:function(){o.end=!0,i(document).off("keyup",o.keyup)}},t))}),(function(){l.close(o.loadi),l.msg("&#x5F53;&#x524D;&#x56FE;&#x7247;&#x5730;&#x5740;&#x5F02;&#x5E38;<br>&#x662F;&#x5426;&#x7EE7;&#x7EED;&#x67E5;&#x770B;&#x4E0B;&#x4E00;&#x5F20;&#xFF1F;",{time:3e4,btn:["&#x4E0B;&#x4E00;&#x5F20;","&#x4E0D;&#x770B;&#x4E86;"],yes:function(){f.length>1&&o.imgnext(!0,!0)}})}))}},r.run=function(t){n=(i=t)(e),f.html=i("html"),l.open=function(e){return new s(e).index}},e.layui&&layui.define?(l.ready(),layui.define("jquery",(function(t){l.path=layui.cache.dir,r.run(layui.$),e.layer=l,t("layer",l)}))):"function"==typeof define&&define.amd?define(["jquery"],(function(){return r.run(e.jQuery),l})):(r.run(e.jQuery),l.ready())}(window);