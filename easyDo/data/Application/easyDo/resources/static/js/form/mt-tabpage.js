!function(t){var i=function(i,a){this.$wrapper=i,this.$tab_list=this.$wrapper.find(".mt-tabpage-title").find(".mt-tabpage-item"),this.$tabCont_wrap=this.$wrapper.find(".mt-tabpage-cont__wrap"),this.$tab_cont=this.$tabCont_wrap.find(".mt-tabpage-item"),this.timer=null,this.playTimer=null,this.iNow=0,this.defaults={curDisplay:1,mouse:"click",changeMethod:"default",autoPlay:!1},this.opts=t.extend({},this.defaults,a)};i.prototype={inital:function(){var i=this;this.setData(),this.tabInital(),"click"===this.opts.mouse?this.$tab_list.click((function(){i.changeTab(t(this).index()),i.iNow=t(this).index(),"function"==typeof loadDefaultCheckedOptions&&loadDefaultCheckedOptions(t(this).attr("type"))})):"over"===this.opts.mouse?this.$tab_list.hover((function(){var a=this;clearTimeout(i.timer),i.timer=setTimeout((function(){i.changeTab(t(a).index())}),30),i.iNow=t(this).index()}),(function(){clearTimeout(i.timer)})):this.$tab_list.click((function(){i.changeTab(t(this).index()),i.iNow=t(this).index()})),this.opts.autoPlay&&(clearInterval(this.playTimer),this.playTimer=setInterval((function(){i.autoPlay()}),1e3),this.$wrapper.hover((function(){clearInterval(i.playTimer)}),(function(){i.playTimer=setInterval((function(){i.autoPlay()}),1e3)})))},setData:function(){var t=this.$tab_cont.width(),i=this.$tab_cont.height(),a=this.$tab_cont.length;switch(this.opts.changeMethod){case"default":case"opacity":default:this.$tab_cont.css({display:"none"});break;case"horizontal":this.$tabCont_wrap.css({width:t*a}),this.$tab_cont.css({float:"left"});break;case"vertical":this.$tabCont_wrap.css({height:i*a})}},tabInital:function(){var t=this.opts.curDisplay-1;this.$tab_list.removeClass("mt-tabpage-item-cur"),this.$tab_list.eq(t).addClass("mt-tabpage-item-cur"),"default"===this.opts.changeMethod||"opacity"===this.opts.changeMethod?this.$tab_cont.eq(t).css({display:"block"}):"horizontal"===this.opts.changeMethod?this.$tabCont_wrap.css({left:-t*this.$tab_cont.width()}):"vertical"===this.opts.changeMethod?this.$tabCont_wrap.css({top:-t*this.$tab_cont.height()}):this.$tab_cont.eq(t).css({display:"block"}),this.iNow=this.opts.curDisplay-1},changeTab:function(t){switch(this.$tab_list.removeClass("mt-tabpage-item-cur"),this.$tab_list.eq(t).addClass("mt-tabpage-item-cur"),this.opts.changeMethod){case"default":default:this.$tab_cont.css({display:"none"}),this.$tab_cont.eq(t).css({display:"block"});break;case"horizontal":this.$tabCont_wrap.stop().animate({left:this.$tab_cont.width()*-t});break;case"vertical":this.$tabCont_wrap.stop().animate({top:this.$tab_cont.height()*-t});break;case"opacity":this.$tab_cont.stop().fadeOut(),this.$tab_cont.eq(t).stop().fadeIn()}},autoPlay:function(){this.iNow===this.$tab_list.length-1?this.iNow=0:this.iNow++,this.changeTab(this.iNow)},constructor:i},t.fn.tab=function(t){return new i(this,t).inital()}}(jQuery);