/**
 * @license AngularJS v1.2.13
 * (c) 2010-2014 Google, Inc. http://angularjs.org
 * License: MIT
 */
!function(e,t,n){"use strict";t.mock={},t.mock.$BrowserProvider=function(){this.$get=function(){return new t.mock.$Browser}},t.mock.$Browser=function(){var e=this;this.isMock=!0,e.$$url="http://server/",e.$$lastUrl=e.$$url,e.pollFns=[],e.$$completeOutstandingRequest=t.noop,e.$$incOutstandingRequestCount=t.noop,e.onUrlChange=function(t){return e.pollFns.push((function(){e.$$lastUrl!=e.$$url&&(e.$$lastUrl=e.$$url,t(e.$$url))})),t},e.cookieHash={},e.lastCookieHash={},e.deferredFns=[],e.deferredNextId=0,e.defer=function(t,n){return n=n||0,e.deferredFns.push({time:e.defer.now+n,fn:t,id:e.deferredNextId}),e.deferredFns.sort((function(e,t){return e.time-t.time})),e.deferredNextId++},e.defer.now=0,e.defer.cancel=function(r){var o;return t.forEach(e.deferredFns,(function(e,t){e.id===r&&(o=t)})),o!==n&&(e.deferredFns.splice(o,1),!0)},e.defer.flush=function(n){if(t.isDefined(n))e.defer.now+=n;else{if(!e.deferredFns.length)throw new Error("No deferred tasks to be flushed");e.defer.now=e.deferredFns[e.deferredFns.length-1].time}for(;e.deferredFns.length&&e.deferredFns[0].time<=e.defer.now;)e.deferredFns.shift().fn()},e.$$baseHref="",e.baseHref=function(){return this.$$baseHref}},t.mock.$Browser.prototype={poll:function(){t.forEach(this.pollFns,(function(e){e()}))},addPollFn:function(e){return this.pollFns.push(e),e},url:function(e,t){return e?(this.$$url=e,this):this.$$url},cookies:function(e,n){if(!e)return t.equals(this.cookieHash,this.lastCookieHash)||(this.lastCookieHash=t.copy(this.cookieHash),this.cookieHash=t.copy(this.cookieHash)),this.cookieHash;t.isUndefined(n)?delete this.cookieHash[e]:t.isString(n)&&n.length<=4096&&(this.cookieHash[e]=n)},notifyWhenNoOutstandingRequests:function(e){e()}},t.mock.$ExceptionHandlerProvider=function(){var e;this.mode=function(t){switch(t){case"rethrow":e=function(e){throw e};break;case"log":var n=[];e=function(e){1==arguments.length?n.push(e):n.push([].slice.call(arguments,0))},e.errors=n;break;default:throw new Error("Unknown mode '"+t+"', only 'log'/'rethrow' modes are allowed!")}},this.$get=function(){return e},this.mode("rethrow")},t.mock.$LogProvider=function(){var e=!0;function n(e,t,n){return e.concat(Array.prototype.slice.call(t,n))}this.debugEnabled=function(n){return t.isDefined(n)?(e=n,this):e},this.$get=function(){var r={log:function(){r.log.logs.push(n([],arguments,0))},warn:function(){r.warn.logs.push(n([],arguments,0))},info:function(){r.info.logs.push(n([],arguments,0))},error:function(){r.error.logs.push(n([],arguments,0))},debug:function(){e&&r.debug.logs.push(n([],arguments,0))},reset:function(){r.log.logs=[],r.info.logs=[],r.warn.logs=[],r.error.logs=[],r.debug.logs=[]},assertEmpty:function(){var e=[];if(t.forEach(["error","warn","info","log","debug"],(function(n){t.forEach(r[n].logs,(function(r){t.forEach(r,(function(t){e.push("MOCK $log ("+n+"): "+String(t)+"\n"+(t.stack||""))}))}))})),e.length)throw e.unshift("Expected $log to be empty! Either a message was logged unexpectedly, or an expected log message was not checked and removed:"),e.push(""),new Error(e.join("\n---------\n"))}};return r.reset(),r}},t.mock.$IntervalProvider=function(){this.$get=["$rootScope","$q",function(e,r){var o=[],i=0,s=0,a=function(a,c,u,f){var l=r.defer(),d=l.promise,h=0,g=t.isDefined(f)&&!f;return u=t.isDefined(u)?u:0,d.then(null,null,a),d.$$intervalId=i,o.push({nextTime:s+c,delay:c,fn:function(){var r;l.notify(h++),u>0&&h>=u&&(l.resolve(h),t.forEach(o,(function(e,t){e.id===d.$$intervalId&&(r=t)})),r!==n&&o.splice(r,1)),g||e.$apply()},id:i,deferred:l}),o.sort((function(e,t){return e.nextTime-t.nextTime})),i++,d};return a.cancel=function(e){return!!e&&(t.forEach(o,(function(t,n){t.id===e.$$intervalId&&(r=n)})),r!==n&&(o[r].deferred.reject("canceled"),o.splice(r,1),!0));var r},a.flush=function(e){for(s+=e;o.length&&o[0].nextTime<=s;){var t=o[0];t.fn(),t.nextTime+=t.delay,o.sort((function(e,t){return e.nextTime-t.nextTime}))}return e},a}]};var r=/^(\d{4})-?(\d\d)-?(\d\d)(?:T(\d\d)(?:\:?(\d\d)(?:\:?(\d\d)(?:\.(\d{3}))?)?)?(Z|([+-])(\d\d):?(\d\d)))?$/;function o(e){return parseInt(e,10)}function i(e,t,n){var r="";for(e<0&&(r="-",e=-e),e=""+e;e.length<t;)e="0"+e;return n&&(e=e.substr(e.length-t)),r+e}function s(e,r,o){var i=[],s=[],u=[],f=t.bind(u,u.push),l=t.copy;function d(e,n,r){return t.isFunction(e)?e:function(){return t.isNumber(e)?[e,n,r]:[200,e,n]}}function h(e,a,d,h,g,p,m){var $=new c,v=s[0],w=!1;function k(e){return t.isString(e)||t.isFunction(e)||e instanceof RegExp?e:t.toJson(e)}function E(t){return!o&&p&&p.then&&p.then((function(){for(var e=0,t=u.length;e<t;e++)if(u[e]===r){u.splice(e,1),h(-1,n,"");break}})),r;function r(){var n=t.response(e,a,d,g);$.$$respHeaders=n[2],h(l(n[0]),l(n[1]),$.getAllResponseHeaders())}}if(v&&v.match(e,a)){if(!v.matchData(d))throw new Error("Expected "+v+" with different data\nEXPECTED: "+k(v.data)+"\nGOT:      "+d);if(!v.matchHeaders(g))throw new Error("Expected "+v+" with different headers\nEXPECTED: "+k(v.headers)+"\nGOT:      "+k(g));if(s.shift(),v.response)return void u.push(E(v));w=!0}for(var T,D=-1;T=i[++D];)if(T.match(e,a,d,g||{})){if(T.response)(o?o.defer:f)(E(T));else{if(!T.passThrough)throw new Error("No response defined !");r(e,a,d,h,g,p,m)}return}throw w?new Error("No response defined !"):new Error("Unexpected request: "+e+" "+a+"\n"+(v?"Expected "+v:"No more request expected"))}return h.when=function(e,t,n,r){var s=new a(e,t,n,r),c={respond:function(e,t,n){s.response=d(e,t,n)}};return o&&(c.passThrough=function(){s.passThrough=!0}),i.push(s),c},g("when"),h.expect=function(e,t,n,r){var o=new a(e,t,n,r);return s.push(o),{respond:function(e,t,n){o.response=d(e,t,n)}}},g("expect"),h.flush=function(n){if(e.$digest(),!u.length)throw new Error("No pending request to flush !");if(t.isDefined(n))for(;n--;){if(!u.length)throw new Error("No more pending request to flush !");u.shift()()}else for(;u.length;)u.shift()();h.verifyNoOutstandingExpectation()},h.verifyNoOutstandingExpectation=function(){if(e.$digest(),s.length)throw new Error("Unsatisfied requests: "+s.join(", "))},h.verifyNoOutstandingRequest=function(){if(u.length)throw new Error("Unflushed requests: "+u.length)},h.resetExpectations=function(){s.length=0,u.length=0},h;function g(e){t.forEach(["GET","DELETE","JSONP"],(function(t){h[e+t]=function(r,o){return h[e](t,r,n,o)}})),t.forEach(["PUT","POST","PATCH"],(function(t){h[e+t]=function(n,r,o){return h[e](t,n,r,o)}}))}}function a(e,n,r,o){this.data=r,this.headers=o,this.match=function(n,r,o,i){return e==n&&(!!this.matchUrl(r)&&(!(t.isDefined(o)&&!this.matchData(o))&&!(t.isDefined(i)&&!this.matchHeaders(i))))},this.matchUrl=function(e){return!n||(t.isFunction(n.test)?n.test(e):n==e)},this.matchHeaders=function(e){return!!t.isUndefined(o)||(t.isFunction(o)?o(e):t.equals(o,e))},this.matchData=function(e){return!!t.isUndefined(r)||(r&&t.isFunction(r.test)?r.test(e):r&&t.isFunction(r)?r(e):r&&!t.isString(r)?t.equals(r,t.fromJson(e)):r==e)},this.toString=function(){return e+" "+n}}function c(){c.$$lastInstance=this,this.open=function(e,t,n){this.$$method=e,this.$$url=t,this.$$async=n,this.$$reqHeaders={},this.$$respHeaders={}},this.send=function(e){this.$$data=e},this.setRequestHeader=function(e,t){this.$$reqHeaders[e]=t},this.getResponseHeader=function(e){var r=this.$$respHeaders[e];return r||(e=t.lowercase(e),(r=this.$$respHeaders[e])||(r=n,t.forEach(this.$$respHeaders,(function(n,o){r||t.lowercase(o)!=e||(r=n)}))),r)},this.getAllResponseHeaders=function(){var e=[];return t.forEach(this.$$respHeaders,(function(t,n){e.push(n+": "+t)})),e.join("\n")},this.abort=t.noop}if(t.mock.TzDate=function(e,n){var s=new Date(0);if(t.isString(n)){var a=n;if(s.origDate=function(e){var t;if(t=e.match(r)){var n=new Date(0),i=0,s=0;return t[9]&&(i=o(t[9]+t[10]),s=o(t[9]+t[11])),n.setUTCFullYear(o(t[1]),o(t[2])-1,o(t[3])),n.setUTCHours(o(t[4]||0)-i,o(t[5]||0)-s,o(t[6]||0),o(t[7]||0)),n}return e}(n),n=s.origDate.getTime(),isNaN(n))throw{name:"Illegal Argument",message:"Arg '"+a+"' passed into TzDate constructor is not a valid date string"}}else s.origDate=new Date(n);var c=new Date(n).getTimezoneOffset();s.offsetDiff=60*c*1e3-1e3*e*60*60,s.date=new Date(n+s.offsetDiff),s.getTime=function(){return s.date.getTime()-s.offsetDiff},s.toLocaleDateString=function(){return s.date.toLocaleDateString()},s.getFullYear=function(){return s.date.getFullYear()},s.getMonth=function(){return s.date.getMonth()},s.getDate=function(){return s.date.getDate()},s.getHours=function(){return s.date.getHours()},s.getMinutes=function(){return s.date.getMinutes()},s.getSeconds=function(){return s.date.getSeconds()},s.getMilliseconds=function(){return s.date.getMilliseconds()},s.getTimezoneOffset=function(){return 60*e},s.getUTCFullYear=function(){return s.origDate.getUTCFullYear()},s.getUTCMonth=function(){return s.origDate.getUTCMonth()},s.getUTCDate=function(){return s.origDate.getUTCDate()},s.getUTCHours=function(){return s.origDate.getUTCHours()},s.getUTCMinutes=function(){return s.origDate.getUTCMinutes()},s.getUTCSeconds=function(){return s.origDate.getUTCSeconds()},s.getUTCMilliseconds=function(){return s.origDate.getUTCMilliseconds()},s.getDay=function(){return s.date.getDay()},s.toISOString&&(s.toISOString=function(){return i(s.origDate.getUTCFullYear(),4)+"-"+i(s.origDate.getUTCMonth()+1,2)+"-"+i(s.origDate.getUTCDate(),2)+"T"+i(s.origDate.getUTCHours(),2)+":"+i(s.origDate.getUTCMinutes(),2)+":"+i(s.origDate.getUTCSeconds(),2)+"."+i(s.origDate.getUTCMilliseconds(),3)+"Z"});return t.forEach(["getUTCDay","getYear","setDate","setFullYear","setHours","setMilliseconds","setMinutes","setMonth","setSeconds","setTime","setUTCDate","setUTCFullYear","setUTCHours","setUTCMilliseconds","setUTCMinutes","setUTCMonth","setUTCSeconds","setYear","toDateString","toGMTString","toJSON","toLocaleFormat","toLocaleString","toLocaleTimeString","toSource","toString","toTimeString","toUTCString","valueOf"],(function(e){s[e]=function(){throw new Error("Method '"+e+"' is not implemented in the TzDate mock")}})),s},t.mock.TzDate.prototype=Date.prototype,t.mock.animate=t.module("ngAnimateMock",["ng"]).config(["$provide",function(e){var n=[];e.value("$$animateReflow",(function(e){return n.push(e),t.noop})),e.decorator("$animate",(function(e){var r={queue:[],enabled:e.enabled,triggerReflow:function(){if(0===n.length)throw new Error("No animation reflows present");t.forEach(n,(function(e){e()})),n=[]}};return t.forEach(["enter","leave","move","addClass","removeClass","setClass"],(function(t){r[t]=function(){r.queue.push({event:t,element:arguments[0],args:arguments}),e[t].apply(e,arguments)}})),r}))}]),t.mock.dump=function(e){return function e(r){var o;t.isElement(r)?(r=t.element(r),o=t.element("<div></div>"),t.forEach(r,(function(e){o.append(t.element(e).clone())})),o=o.html()):t.isArray(r)?(o=[],t.forEach(r,(function(t){o.push(e(t))})),o="[ "+o.join(", ")+" ]"):o=t.isObject(r)?t.isFunction(r.$eval)&&t.isFunction(r.$apply)?n(r):r instanceof Error?r.stack||r.name+": "+r.message:t.toJson(r,!0):String(r);return o}(e);function n(e,r){var o=[(r=r||"  ")+"Scope("+e.$id+"): {"];for(var i in e)Object.prototype.hasOwnProperty.call(e,i)&&!i.match(/^(\$|this)/)&&o.push("  "+i+": "+t.toJson(e[i]));for(var s=e.$$childHead;s;)o.push(n(s,r+"  ")),s=s.$$nextSibling;return o.push("}"),o.join("\n"+r)}},t.mock.$HttpBackendProvider=function(){this.$get=["$rootScope",s]},t.mock.$TimeoutDecorator=function(e,n){return e.flush=function(e){n.defer.flush(e)},e.verifyNoPendingTasks=function(){if(n.deferredFns.length)throw new Error("Deferred tasks to flush ("+n.deferredFns.length+"): "+(e=n.deferredFns,r=[],t.forEach(e,(function(e){r.push("{id: "+e.id+", time: "+e.time+"}")})),r.join(", ")));var e,r},e},t.mock.$RootElementProvider=function(){this.$get=function(){return t.element("<div ng-app></div>")}},t.module("ngMock",["ng"]).provider({$browser:t.mock.$BrowserProvider,$exceptionHandler:t.mock.$ExceptionHandlerProvider,$log:t.mock.$LogProvider,$interval:t.mock.$IntervalProvider,$httpBackend:t.mock.$HttpBackendProvider,$rootElement:t.mock.$RootElementProvider}).config(["$provide",function(e){e.decorator("$timeout",t.mock.$TimeoutDecorator)}]),t.module("ngMockE2E",["ng"]).config(["$provide",function(e){e.decorator("$httpBackend",t.mock.e2e.$httpBackendDecorator)}]),t.mock.e2e={},t.mock.e2e.$httpBackendDecorator=["$rootScope","$delegate","$browser",s],t.mock.clearDataCache=function(){var e,n=t.element.cache;for(e in n)if(Object.prototype.hasOwnProperty.call(n,e)){var r=n[e].handle;r&&t.element(r.elem).off(),delete n[e]}},e.jasmine||e.mocha){var u=null,f=function(){return!!u};beforeEach((function(){u=this})),afterEach((function(){var e=u.$injector;u.$injector=null,u.$modules=null,u=null,e&&(e.get("$rootElement").off(),e.get("$browser").pollFns.length=0),t.mock.clearDataCache(),t.forEach(t.element.fragments,(function(e,n){delete t.element.fragments[n]})),c.$$lastInstance=null,t.forEach(t.callbacks,(function(e,n){delete t.callbacks[n]})),t.callbacks.counter=0})),e.module=t.mock.module=function(){var e=Array.prototype.slice.call(arguments,0);return f()?n():n;function n(){if(u.$injector)throw new Error("Injector already created, can not register a module!");var n=u.$modules||(u.$modules=[]);t.forEach(e,(function(e){t.isObject(e)&&!t.isArray(e)?n.push((function(n){t.forEach(e,(function(e,t){n.value(t,e)}))})):n.push(e)}))}};var l=function(e,t){this.message=e.message,this.name=e.name,e.line&&(this.line=e.line),e.sourceId&&(this.sourceId=e.sourceId),e.stack&&t&&(this.stack=e.stack+"\n"+t.stack),e.stackArray&&(this.stackArray=e.stackArray)};l.prototype.toString=Error.prototype.toString,e.inject=t.mock.inject=function(){var e=Array.prototype.slice.call(arguments,0),n=new Error("Declaration Location");return f()?r.call(u):r;function r(){var r=u.$modules||[];r.unshift("ngMock"),r.unshift("ng");var o=u.$injector;o||(o=u.$injector=t.injector(r));for(var i=0,s=e.length;i<s;i++)try{o.invoke(e[i]||t.noop,this)}catch(e){if(e.stack&&n)throw new l(e,n);throw e}finally{n=null}}}}}(window,window.angular);