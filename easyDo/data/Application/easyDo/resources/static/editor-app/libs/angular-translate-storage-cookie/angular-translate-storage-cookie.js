/*!
 * angular-translate - v2.4.2 - 2014-10-21
 * http://github.com/angular-translate/angular-translate
 * Copyright (c) 2014 ; Licensed MIT
 */
angular.module("pascalprecht.translate").factory("$translateCookieStorage",["$cookieStore",function(t){return{get:function(e){return t.get(e)},set:function(e,n){t.put(e,n)}}}]);