!function(e){"object"==typeof exports&&"object"==typeof module?e(require("../../lib/codemirror")):"function"==typeof define&&define.amd?define(["../../lib/codemirror"],e):e(CodeMirror)}((function(e){"use strict";e.defineMode("ebnf",(function(t){var a=0,r=1,c=0,n=1,i=2,o=null;return t.bracesMode&&(o=e.getMode(t,t.bracesMode)),{startState:function(){return{stringType:null,commentType:null,braced:0,lhs:!0,localState:null,stack:[],inDefinition:!1}},token:function(e,t){if(e){switch(0===t.stack.length&&('"'==e.peek()||"'"==e.peek()?(t.stringType=e.peek(),e.next(),t.stack.unshift(n)):e.match(/^\/\*/)?(t.stack.unshift(c),t.commentType=a):e.match(/^\(\*/)&&(t.stack.unshift(c),t.commentType=r)),t.stack[0]){case n:for(;t.stack[0]===n&&!e.eol();)e.peek()===t.stringType?(e.next(),t.stack.shift()):"\\"===e.peek()?(e.next(),e.next()):e.match(/^.[^\\\"\']*/);return t.lhs?"property string":"string";case c:for(;t.stack[0]===c&&!e.eol();)t.commentType===a&&e.match(/\*\//)||t.commentType===r&&e.match(/\*\)/)?(t.stack.shift(),t.commentType=null):e.match(/^.[^\*]*/);return"comment";case i:for(;t.stack[0]===i&&!e.eol();)e.match(/^[^\]\\]+/)||e.match(/^\\./)||t.stack.shift();return"operator"}var s=e.peek();if(null!==o&&(t.braced||"{"===s)){null===t.localState&&(t.localState=o.startState());var m=o.token(e,t.localState),f=e.current();if(!m)for(var u=0;u<f.length;u++)"{"===f[u]?(0===t.braced&&(m="matchingbracket"),t.braced++):"}"===f[u]&&(t.braced--,0===t.braced&&(m="matchingbracket"));return m}switch(s){case"[":return e.next(),t.stack.unshift(i),"bracket";case":":case"|":case";":return e.next(),"operator";case"%":if(e.match("%%"))return"header";if(e.match(/[%][A-Za-z]+/))return"keyword";if(e.match(/[%][}]/))return"matchingbracket";break;case"/":if(e.match(/[\/][A-Za-z]+/))return"keyword";case"\\":if(e.match(/[\][a-z]+/))return"string-2";case".":if(e.match("."))return"atom";case"*":case"-":case"+":case"^":if(e.match(s))return"atom";case"$":if(e.match("$$"))return"builtin";if(e.match(/[$][0-9]+/))return"variable-3";case"<":if(e.match(/<<[a-zA-Z_]+>>/))return"builtin"}return e.match(/^\/\//)?(e.skipToEnd(),"comment"):e.match(/return/)?"operator":e.match(/^[a-zA-Z_][a-zA-Z0-9_]*/)?e.match(/(?=[\(.])/)?"variable":e.match(/(?=[\s\n]*[:=])/)?"def":"variable-2":-1!=["[","]","(",")"].indexOf(e.peek())?(e.next(),"bracket"):(e.eatSpace()||e.next(),null)}}}})),e.defineMIME("text/x-ebnf","ebnf")}));