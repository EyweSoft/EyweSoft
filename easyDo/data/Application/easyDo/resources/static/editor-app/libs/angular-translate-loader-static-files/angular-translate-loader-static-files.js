/*!
 * angular-translate - v2.4.2 - 2014-10-21
 * http://github.com/angular-translate/angular-translate
 * Copyright (c) 2014 ; Licensed MIT
 */
angular.module("pascalprecht.translate").factory("$translateStaticFilesLoader",["$q","$http",function(r,e){return function(t){if(!t||!angular.isString(t.prefix)||!angular.isString(t.suffix))throw new Error("Couldn't load static files, no prefix or suffix specified!");var i=r.defer();return e(angular.extend({url:[t.prefix,t.key,t.suffix].join(""),method:"GET",params:""},t.$http)).success((function(r){i.resolve(r)})).error((function(r){i.reject(t.key)})),i.promise}}]);