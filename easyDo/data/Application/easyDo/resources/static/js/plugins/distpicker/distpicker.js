/*!
 * Distpicker v1.0.4
 * https://github.com/fengyuanchen/distpicker
 *
 * Copyright (c) 2014-2016 Fengyuan Chen
 * Released under the MIT license
 *
 * Date: 2016-06-01T15:05:52.606Z
 */
!function(t){"function"==typeof define&&define.amd?define(["jquery","ChineseDistricts"],t):"object"==typeof exports?t(require("jquery"),require("ChineseDistricts")):t(jQuery,ChineseDistricts)}((function(t,i){"use strict";if(void 0===i)throw new Error('The file "distpicker.data.js" must be included first!');var e="distpicker",s="change."+e,n="province",c="city",o="district";function r(i,e){this.$element=t(i),this.options=t.extend({},r.DEFAULTS,t.isPlainObject(e)&&e),this.placeholders=t.extend({},r.DEFAULTS),this.active=!1,this.init()}r.prototype={constructor:r,init:function(){var i=this.options,e=this.$element.find("select"),s=e.length,r={};e.each((function(){t.extend(r,t(this).data())})),t.each([n,c,o],t.proxy((function(t,n){r[n]?(i[n]=r[n],this["$"+n]=e.filter("[data-"+n+"]")):this["$"+n]=s>t?e.eq(t):null}),this)),this.bind(),this.reset(),this.active=!0},bind:function(){this.$province&&this.$province.on(s,this._changeProvince=t.proxy((function(){this.output(c),this.output(o)}),this)),this.$city&&this.$city.on(s,this._changeCity=t.proxy((function(){this.output(o)}),this))},unbind:function(){this.$province&&this.$province.off(s,this._changeProvince),this.$city&&this.$city.off(s,this._changeCity)},output:function(e){var s,r,h,d,u=this.options,a=this.placeholders,f=this["$"+e],p=[];f&&f.length&&(d=u[e],r=e===n?86:e===c?this.$province&&this.$province.find(":selected").data("code"):e===o?this.$city&&this.$city.find(":selected").data("code"):r,s=t.isNumeric(r)?i[r]:null,t.isPlainObject(s)&&t.each(s,(function(t,i){var e=i===d;e&&(h=!0),p.push({code:t,address:i,selected:e})})),h||(p.length&&(u.autoSelect||u.autoselect)&&(p[0].selected=!0),!this.active&&d&&(a[e]=d)),u.placeholder&&p.unshift({code:"",address:a[e],selected:!1}),f.html(this.getList(p)))},getList:function(i){var e=[];return t.each(i,(function(t,i){e.push('<option value="'+(i.address&&i.code?i.address:"")+'" data-code="'+(i.code||"")+'"'+(i.selected?" selected":"")+">"+(i.address||"")+"</option>")})),e.join("")},reset:function(t){t?this.$province&&this.$province.find(":first").prop("selected",!0).trigger(s):(this.output(n),this.output(c),this.output(o))},destroy:function(){this.unbind(),this.$element.removeData(e)}},r.DEFAULTS={autoSelect:!0,placeholder:!0,province:"—— 省 ——",city:"—— 市 ——",district:"—— 区 ——"},r.setDefaults=function(i){t.extend(r.DEFAULTS,i)},r.other=t.fn.distpicker,t.fn.distpicker=function(i){var s=[].slice.call(arguments,1);return this.each((function(){var n,c,o=t(this),h=o.data(e);if(!h){if(/destroy/.test(i))return;n=t.extend({},o.data(),t.isPlainObject(i)&&i),o.data(e,h=new r(this,n))}"string"==typeof i&&t.isFunction(c=h[i])&&c.apply(h,s)}))},t.fn.distpicker.Constructor=r,t.fn.distpicker.setDefaults=r.setDefaults,t.fn.distpicker.noConflict=function(){return t.fn.distpicker=r.other,this},t((function(){t('[data-toggle="distpicker"]').distpicker()}))}));