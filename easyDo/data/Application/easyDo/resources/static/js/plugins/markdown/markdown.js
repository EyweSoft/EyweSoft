!function(e){var t=e.Markdown=function e(t){switch(typeof t){case"undefined":this.dialect=e.dialects.Gruber;break;case"object":this.dialect=t;break;default:if(!(t in e.dialects))throw new Error("Unknown Markdown dialect '"+String(t)+"'");this.dialect=e.dialects[t]}this.em_state=[],this.strong_state=[],this.debug_indent=""};function r(){return"Markdown.mk_block( "+uneval(this.toString())+", "+uneval(this.trailing)+", "+uneval(this.lineNumber)+" )"}function n(){var e=require("util");return"Markdown.mk_block( "+e.inspect(this.toString())+", "+e.inspect(this.trailing)+", "+e.inspect(this.lineNumber)+" )"}e.parse=function(e,r){return new t(r).toTree(e)},e.toHTML=function(t,r,n){var i=e.toHTMLTree(t,r,n);return e.renderJsonML(i)},e.toHTMLTree=function(e,t,r){"string"==typeof e&&(e=this.parse(e,t));var n=h(e),i={};n&&n.references&&(i=n.references);var l=function(e,t,r){var n;r=r||{};var i=e.slice(0);"function"==typeof r.preprocessTreeNode&&(i=r.preprocessTreeNode(i,t));var l=h(i);if(l){for(n in i[1]={},l)i[1][n]=l[n];l=i[1]}if("string"==typeof i)return i;switch(i[0]){case"header":i[0]="h"+i[1].level,delete i[1].level;break;case"bulletlist":i[0]="ul";break;case"numberlist":i[0]="ol";break;case"listitem":i[0]="li";break;case"para":i[0]="p";break;case"markdown":i[0]="html",l&&delete l.references;break;case"code_block":i[0]="pre",n=l?2:1;var s=["code"];s.push.apply(s,i.splice(n)),i[n]=s;break;case"inlinecode":i[0]="code";break;case"img":i[1].src=i[1].href,delete i[1].href;break;case"linebreak":i[0]="br";break;case"link":i[0]="a";break;case"link_ref":if(i[0]="a",!(a=t[l.ref]))return l.original;delete l.ref,l.href=a.href,a.title&&(l.title=a.title),delete l.original;break;case"img_ref":var a;if(i[0]="img",!(a=t[l.ref]))return l.original;delete l.ref,l.src=a.href,a.title&&(l.title=a.title),delete l.original}if(n=1,l){for(var c in i[1])n=2;1===n&&i.splice(n,1)}for(;n<i.length;++n)i[n]=arguments.callee(i[n],t,r);return i}(e,i,r);return function(e){var t=h(e)?2:1;for(;t<e.length;)"string"==typeof e[t]?t+1<e.length&&"string"==typeof e[t+1]?e[t]+=e.splice(t+1,1)[0]:++t:(arguments.callee(e[t]),++t)}(l),l};var i=t.mk_block=function(e,t,i){1==arguments.length&&(t="\n\n");var l=new String(e);return l.trailing=t,l.inspect=n,l.toSource=r,null!=i&&(l.lineNumber=i),l};function l(e){for(var t=0,r=-1;-1!==(r=e.indexOf("\n",r+1));)t++;return t}function s(e,t){var r=e+"_state",n="strong"==e?"em_state":"strong_state";function i(e){this.len_after=e,this.name="close_"+t}return function(l,s){if(this[r][0]==t)return this[r].shift(),[l.length,new i(l.length-t.length)];var a=this[n].slice(),c=this[r].slice();this[r].unshift(t);var o=this.processInline(l.substr(t.length)),h=o[o.length-1];this[r].shift();return h instanceof i?(o.pop(),[l.length-h.len_after,[e].concat(o)]):(this[n]=a,this[r]=c,[t.length,t])}}t.prototype.split_blocks=function(e,t){var r,n=/([\s\S]+?)($|\n(?:\s*\n|$)+)/g,s=[],a=1;for(null!=(r=/^(\s*\n)/.exec(e))&&(a+=l(r[0]),n.lastIndex=r[0].length);null!==(r=n.exec(e));)s.push(i(r[1],r[2],a)),a+=l(r[0]);return s},t.prototype.processBlock=function(e,t){var r=this.dialect.block,n=r.__order__;if("__call__"in r)return r.__call__.call(this,e,t);for(var i=0;i<n.length;i++){var l=r[n[i]].call(this,e,t);if(l)return(!o(l)||l.length>0&&!o(l[0]))&&this.debug(n[i],"didn't return a proper array"),l}return[]},t.prototype.processInline=function(e){return this.dialect.inline.__call__.call(this,String(e))},t.prototype.toTree=function(e,t){var r=e instanceof Array?e:this.split_blocks(e),n=this.tree;try{for(this.tree=t||this.tree||["markdown"];r.length;){var i=this.processBlock(r.shift(),r);i.length&&this.tree.push.apply(this.tree,i)}return this.tree}finally{t&&(this.tree=n)}},t.prototype.debug=function(){var e=Array.prototype.slice.call(arguments);e.unshift(this.debug_indent),"undefined"!=typeof print&&print.apply(print,e),"undefined"!=typeof console&&void 0!==console.log&&console.log.apply(null,e)},t.prototype.loop_re_over_block=function(e,t,r){for(var n,i=t.valueOf();i.length&&null!=(n=e.exec(i));)i=i.substr(n[0].length),r.call(this,n);return i},t.dialects={},t.dialects.Gruber={block:{atxHeader:function(e,t){var r=e.match(/^(#{1,6})\s*(.*?)\s*#*\s*(?:\n|$)/);if(r){var n=["header",{level:r[1].length}];return Array.prototype.push.apply(n,this.processInline(r[2])),r[0].length<e.length&&t.unshift(i(e.substr(r[0].length),e.trailing,e.lineNumber+2)),[n]}},setextHeader:function(e,t){var r=e.match(/^(.*)\n([-=])\2\2+(?:\n|$)/);if(r){var n=["header",{level:"="===r[2]?1:2},r[1]];return r[0].length<e.length&&t.unshift(i(e.substr(r[0].length),e.trailing,e.lineNumber+2)),[n]}},code:function(e,t){var r=[],n=/^(?: {0,3}\t| {4})(.*)\n?/;if(e.match(n)){e:for(;;){var l=this.loop_re_over_block(n,e.valueOf(),(function(e){r.push(e[1])}));if(l.length){t.unshift(i(l,e.trailing));break e}if(!t.length)break e;if(!t[0].match(n))break e;r.push(e.trailing.replace(/[^\n]/g,"").substring(2)),e=t.shift()}return[["code_block",r.join("\n")]]}},horizRule:function(e,t){var r=e.match(/^(?:([\s\S]*?)\n)?[ \t]*([-_*])(?:[ \t]*\2){2,}[ \t]*(?:\n([\s\S]*))?$/);if(r){var n=[["hr"]];return r[1]&&n.unshift.apply(n,this.processBlock(r[1],[])),r[3]&&t.unshift(i(r[3])),n}},lists:function(){var e="[*+-]|\\d+\\.",t=/[*+-]/,r=new RegExp("^( {0,3})("+e+")[ \t]+"),n="(?: {0,3}\\t| {4})";function l(e,t,r,n){if(t)e.push(["para"].concat(r));else{var i=e[e.length-1]instanceof Array&&"para"==e[e.length-1][0]?e[e.length-1]:e;n&&e.length>1&&r.unshift(n);for(var l=0;l<r.length;l++){var s=r[l];"string"==typeof s&&i.length>1&&"string"==typeof i[i.length-1]?i[i.length-1]+=s:i.push(s)}}}function s(e,t){for(var r=new RegExp("^("+n+"{"+e+"}.*?\\n?)*$"),l=new RegExp("^"+n+"{"+e+"}","gm"),s=[];t.length>0;){if(r.exec(t[0])){var a=t.shift(),c=a.replace(l,"");s.push(i(c,a.trailing,a.lineNumber))}break}return s}function a(e,t,r){var n=e.list,i=n[n.length-1];if(!(i[1]instanceof Array&&"para"==i[1][0]))if(t+1==r.length)i.push(["para"].concat(i.splice(1)));else{var l=i.pop();i.push(["para"].concat(i.splice(1)),l)}}return function(i,o){var h=i.match(r);if(h){for(var u,f,p,g=[],v=E(h),d=!1,_=[g[0].list];;){for(var b=i.split(/(?=\n)/),k="",m=0;m<b.length;m++){var y="",w=b[m].replace(/^\n/,(function(e){return y=e,""})),M=(p=g.length,new RegExp("(?:^("+n+"{0,"+p+"} {0,3})("+e+")\\s+)|(^"+n+"{0,"+(p-1)+"}[ ]{0,4})"));if(void 0!==(h=w.match(M))[1]){k.length&&(l(u,d,this.processInline(k),y),d=!1,k=""),h[1]=h[1].replace(/ {0,3}\t/g,"    ");var x=Math.floor(h[1].length/4)+1;if(x>g.length)v=E(h),u.push(v),u=v[1]=["listitem"];else{var S=!1;for(f=0;f<g.length;f++)if(g[f].indent==h[1]){v=g[f].list,g.splice(f+1),S=!0;break}S||(++x<=g.length?(g.splice(x),v=g[x-1].list):(v=E(h),u.push(v))),u=["listitem"],v.push(u)}y=""}w.length>h[0].length&&(k+=y+w.substr(h[0].length))}k.length&&(l(u,d,this.processInline(k),y),d=!1,k="");var $=s(g.length,o);$.length>0&&(c(g,a,this),u.push.apply(u,this.toTree($,[])));var j=o[0]&&o[0].valueOf()||"";if(!j.match(r)&&!j.match(/^ /))break;i=o.shift();var A=this.dialect.block.horizRule(i,o);if(A){_.push.apply(_,A);break}c(g,a,this),d=!0}return _}function E(e){var r=t.exec(e[2])?["bulletlist"]:["numberlist"];return g.push({list:r,indent:e[1]}),r}}}(),blockquote:function(e,t){if(e.match(/^>/m)){var r=[];if(">"!=e[0]){for(var n=e.split(/\n/),i=[];n.length&&">"!=n[0][0];)i.push(n.shift());e=n.join("\n"),r.push.apply(r,this.processBlock(i.join("\n"),[]))}for(;t.length&&">"==t[0][0];){var l=t.shift();(e=new String(e+e.trailing+l)).trailing=l.trailing}var s=e.replace(/^> ?/gm,"");this.tree;return r.push(this.toTree(s,["blockquote"])),r}},referenceDefn:function(e,t){var r=/^\s*\[(.*?)\]:\s*(\S+)(?:\s+(?:(['"])(.*?)\3|\((.*?)\)))?\n?/;if(e.match(r)){h(this.tree)||this.tree.splice(1,0,{});var n=h(this.tree);void 0===n.references&&(n.references={});var l=this.loop_re_over_block(r,e,(function(e){e[2]&&"<"==e[2][0]&&">"==e[2][e[2].length-1]&&(e[2]=e[2].substring(1,e[2].length-1));var t=n.references[e[1].toLowerCase()]={href:e[2]};void 0!==e[4]?t.title=e[4]:void 0!==e[5]&&(t.title=e[5])}));return l.length&&t.unshift(i(l,e.trailing)),[]}},para:function(e,t){return[["para"].concat(this.processInline(e))]}}},t.dialects.Gruber.inline={__oneElement__:function(e,t,r){var n,i;return t=t||this.dialect.inline.__patterns__,(n=new RegExp("([\\s\\S]*?)("+(t.source||t)+")").exec(e))?n[1]?[n[1].length,n[1]]:(n[2]in this.dialect.inline&&(i=this.dialect.inline[n[2]].call(this,e.substr(n.index),n,r||[])),i=i||[n[2].length,n[2]]):[e.length,e]},__call__:function(e,t){var r,n=[];function i(e){"string"==typeof e&&"string"==typeof n[n.length-1]?n[n.length-1]+=e:n.push(e)}for(;e.length>0;)r=this.dialect.inline.__oneElement__.call(this,e,t,n),e=e.substr(r.shift()),c(r,i);return n},"]":function(){},"}":function(){},"\\":function(e){return e.match(/^\\[\\`\*_{}\[\]()#\+.!\-]/)?[2,e[1]]:[1,"\\"]},"![":function(e){var t=e.match(/^!\[(.*?)\][ \t]*\([ \t]*(\S*)(?:[ \t]+(["'])(.*?)\3)?[ \t]*\)/);if(t){t[2]&&"<"==t[2][0]&&">"==t[2][t[2].length-1]&&(t[2]=t[2].substring(1,t[2].length-1)),t[2]=this.dialect.inline.__call__.call(this,t[2],/\\/)[0];var r={alt:t[1],href:t[2]||""};return void 0!==t[4]&&(r.title=t[4]),[t[0].length,["img",r]]}return(t=e.match(/^!\[(.*?)\][ \t]*\[(.*?)\]/))?[t[0].length,["img_ref",{alt:t[1],ref:t[2].toLowerCase(),original:t[0]}]]:[2,"!["]},"[":function(e){var r=String(e),n=t.DialectHelpers.inline_until_char.call(this,e.substr(1),"]");if(!n)return[1,"["];var i,l,s=1+n[0],a=n[1],c=(e=e.substr(s)).match(/^\s*\([ \t]*(\S+)(?:[ \t]+(["'])(.*?)\2)?[ \t]*\)/);if(c){var o=c[1];if(s+=c[0].length,o&&"<"==o[0]&&">"==o[o.length-1]&&(o=o.substring(1,o.length-1)),!c[3])for(var h=1,u=0;u<o.length;u++)switch(o[u]){case"(":h++;break;case")":0==--h&&(s-=o.length-u,o=o.substring(0,u))}return l={href:(o=this.dialect.inline.__call__.call(this,o,/\\/)[0])||""},void 0!==c[3]&&(l.title=c[3]),i=["link",l].concat(a),[s,i]}return(c=e.match(/^\s*\[(.*?)\]/))?(s+=c[0].length,i=["link_ref",l={ref:(c[1]||String(a)).toLowerCase(),original:r.substr(0,s)}].concat(a),[s,i]):1==a.length&&"string"==typeof a[0]?(i=["link_ref",l={ref:a[0].toLowerCase(),original:r.substr(0,s)},a[0]],[s,i]):[1,"["]},"<":function(e){var t;return null!=(t=e.match(/^<(?:((https?|ftp|mailto):[^>]+)|(.*?@.*?\.[a-zA-Z]+))>/))?t[3]?[t[0].length,["link",{href:"mailto:"+t[3]},t[3]]]:"mailto"==t[2]?[t[0].length,["link",{href:t[1]},t[1].substr(7)]]:[t[0].length,["link",{href:t[1]},t[1]]]:[1,"<"]},"`":function(e){var t=e.match(/(`+)(([\s\S]*?)\1)/);return t&&t[2]?[t[1].length+t[2].length,["inlinecode",t[3]]]:[1,"`"]},"  \n":function(e){return[3,["linebreak"]]}},t.dialects.Gruber.inline["**"]=s("strong","**"),t.dialects.Gruber.inline.__=s("strong","__"),t.dialects.Gruber.inline["*"]=s("em","*"),t.dialects.Gruber.inline._=s("em","_"),t.buildBlockOrder=function(e){var t=[];for(var r in e)"__order__"!=r&&"__call__"!=r&&t.push(r);e.__order__=t},t.buildInlinePatterns=function(e){var t=[];for(var r in e)if(!r.match(/^__.*__$/)){var n=r.replace(/([\\.*+?|()\[\]{}])/g,"\\$1").replace(/\n/,"\\n");t.push(1==r.length?n:"(?:"+n+")")}t=t.join("|"),e.__patterns__=t;var i=e.__call__;e.__call__=function(e,r){return null!=r?i.call(this,e,r):i.call(this,e,t)}},t.DialectHelpers={},t.DialectHelpers.inline_until_char=function(e,t){for(var r=0,n=[];;){if(e[r]==t)return[++r,n];if(r>=e.length)return null;var i=this.dialect.inline.__oneElement__.call(this,e.substr(r));r+=i[0],n.push.apply(n,i.slice(1))}},t.subclassDialect=function(e){function t(){}function r(){}return t.prototype=e.block,r.prototype=e.inline,{block:new t,inline:new r}},t.buildBlockOrder(t.dialects.Gruber.block),t.buildInlinePatterns(t.dialects.Gruber.inline),t.dialects.Maruku=t.subclassDialect(t.dialects.Gruber),t.dialects.Maruku.processMetaHash=function(e){for(var t=function(e){var t=e.split(""),r=[""],n=!1;for(;t.length;){var i=t.shift();switch(i){case" ":n?r[r.length-1]+=i:r.push("");break;case"'":case'"':n=!n;break;case"\\":i=t.shift();default:r[r.length-1]+=i}}return r}(e),r={},n=0;n<t.length;++n)if(/^#/.test(t[n]))r.id=t[n].substring(1);else if(/^\./.test(t[n]))r.class?r.class=r.class+t[n].replace(/./," "):r.class=t[n].substring(1);else if(/\=/.test(t[n])){var i=t[n].split(/\=/);r[i[0]]=i[1]}return r},t.dialects.Maruku.block.document_meta=function(e,t){if(!(e.lineNumber>1)&&e.match(/^(?:\w+:.*\n)*\w+:.*$/)){h(this.tree)||this.tree.splice(1,0,{});var r=e.split(/\n/);for(p in r){var n=r[p].match(/(\w+):\s*(.*)$/),i=n[1].toLowerCase(),l=n[2];this.tree[1][i]=l}return[]}},t.dialects.Maruku.block.block_meta=function(e,t){var r=e.match(/(^|\n) {0,3}\{:\s*((?:\\\}|[^\}])*)\s*\}$/);if(r){var n,i=this.dialect.processMetaHash(r[2]);if(""===r[1]){var l=this.tree[this.tree.length-1];if(n=h(l),"string"==typeof l)return;for(a in n||(n={},l.splice(1,0,n)),i)n[a]=i[a];return[]}var s=e.replace(/\n.*$/,""),c=this.processBlock(s,[]);for(a in(n=h(c[0]))||(n={},c[0].splice(1,0,n)),i)n[a]=i[a];return c}},t.dialects.Maruku.block.definition_list=function(e,t){var r,n=/^((?:[^\s:].*\n)+):\s+([\s\S]+)$/,i=["dl"];if(a=e.match(n)){for(var l=[e];t.length&&n.exec(t[0]);)l.push(t.shift());for(var s=0;s<l.length;++s){var a=l[s].match(n),c=a[1].replace(/\n$/,"").split(/\n/),o=a[2].split(/\n:\s+/);for(r=0;r<c.length;++r)i.push(["dt",c[r]]);for(r=0;r<o.length;++r)i.push(["dd"].concat(this.processInline(o[r].replace(/(\n)\s+/,"$1"))))}return[i]}},t.dialects.Maruku.inline["{:"]=function(e,t,r){if(!r.length)return[2,"{:"];var n=r[r.length-1];if("string"==typeof n)return[2,"{:"];var i=e.match(/^\{:\s*((?:\\\}|[^\}])*)\s*\}/);if(!i)return[2,"{:"];var l=this.dialect.processMetaHash(i[1]),s=h(n);for(var a in s||(s={},n.splice(1,0,s)),l)s[a]=l[a];return[i[0].length,""]},t.buildBlockOrder(t.dialects.Maruku.block),t.buildInlinePatterns(t.dialects.Maruku.inline);var c,o=Array.isArray||function(e){return"[object Array]"==Object.prototype.toString.call(e)};function h(e){return o(e)&&e.length>1&&"object"==typeof e[1]&&!o(e[1])?e[1]:void 0}function u(e){return e.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;").replace(/'/g,"&#39;")}function f(e){if("string"==typeof e)return u(e);var t=e.shift(),r={},n=[];for(!e.length||"object"!=typeof e[0]||e[0]instanceof Array||(r=e.shift());e.length;)n.push(arguments.callee(e.shift()));var i="";for(var l in r)i+=" "+l+'="'+u(r[l])+'"';return"img"==t||"br"==t||"hr"==t?"<"+t+i+"/>":"<"+t+i+">"+n.join("")+"</"+t+">"}c=Array.prototype.forEach?function(e,t,r){return e.forEach(t,r)}:function(e,t,r){for(var n=0;n<e.length;n++)t.call(r||e,e[n],n,e)},e.renderJsonML=function(e,t){(t=t||{}).root=t.root||!1;var r=[];if(t.root)r.push(f(e));else for(e.shift(),!e.length||"object"!=typeof e[0]||e[0]instanceof Array||e.shift();e.length;)r.push(f(e.shift()));return r.join("\n\n")}}("undefined"==typeof exports?(window.markdown={},window.markdown):exports);