!function(e){"object"==typeof exports&&"object"==typeof module?e(require("../../lib/codemirror")):"function"==typeof define&&define.amd?define(["../../lib/codemirror"],e):e(CodeMirror)}((function(e){"use strict";e.defineMode("verilog",(function(n,t){var i=n.indentUnit,r=t.statementIndentUnit||i,a=t.dontAlignCalls,o=t.noIndentKeywords||[],s=t.multiLineStrings;function l(e){for(var n={},t=e.split(" "),i=0;i<t.length;++i)n[t[i]]=!0;return n}var c,u,d=l("accept_on alias always always_comb always_ff always_latch and assert assign assume automatic before begin bind bins binsof bit break buf bufif0 bufif1 byte case casex casez cell chandle checker class clocking cmos config const constraint context continue cover covergroup coverpoint cross deassign default defparam design disable dist do edge else end endcase endchecker endclass endclocking endconfig endfunction endgenerate endgroup endinterface endmodule endpackage endprimitive endprogram endproperty endspecify endsequence endtable endtask enum event eventually expect export extends extern final first_match for force foreach forever fork forkjoin function generate genvar global highz0 highz1 if iff ifnone ignore_bins illegal_bins implements implies import incdir include initial inout input inside instance int integer interconnect interface intersect join join_any join_none large let liblist library local localparam logic longint macromodule matches medium modport module nand negedge nettype new nexttime nmos nor noshowcancelled not notif0 notif1 null or output package packed parameter pmos posedge primitive priority program property protected pull0 pull1 pulldown pullup pulsestyle_ondetect pulsestyle_onevent pure rand randc randcase randsequence rcmos real realtime ref reg reject_on release repeat restrict return rnmos rpmos rtran rtranif0 rtranif1 s_always s_eventually s_nexttime s_until s_until_with scalared sequence shortint shortreal showcancelled signed small soft solve specify specparam static string strong strong0 strong1 struct super supply0 supply1 sync_accept_on sync_reject_on table tagged task this throughout time timeprecision timeunit tran tranif0 tranif1 tri tri0 tri1 triand trior trireg type typedef union unique unique0 unsigned until until_with untyped use uwire var vectored virtual void wait wait_order wand weak weak0 weak1 while wildcard wire with within wor xnor xor"),f=/[\+\-\*\/!~&|^%=?:]/,p=/[\[\]{}()]/,m=/\d[0-9_]*/,g=/\d*\s*'s?d\s*\d[0-9_]*/i,y=/\d*\s*'s?b\s*[xz01][xz01_]*/i,v=/\d*\s*'s?o\s*[xz0-7][xz0-7_]*/i,h=/\d*\s*'s?h\s*[0-9a-fxz?][0-9a-fxz?_]*/i,w=/(\d[\d_]*(\.\d[\d_]*)?E-?[\d_]+)|(\d[\d_]*\.\d[\d_]*)/i,x=/^((\w+)|[)}\]])/,_=/[)}\]]/,k=l("case checker class clocking config function generate interface module packageprimitive program property specify sequence table task"),b={};for(var z in k)b[z]="end"+z;for(var j in b.begin="end",b.casex="endcase",b.casez="endcase",b.do="while",b.fork="join;join_any;join_none",b.covergroup="endgroup",o){z=o[j];b[z]&&(b[z]=void 0)}var q=l("always always_comb always_ff always_latch assert assign assume else export for foreach forever if import initial repeat while");function E(e,n){var t,i=e.peek();if(/[,;:\.]/.test(i))return c=e.next(),null;if(p.test(i))return c=e.next(),"bracket";if("`"==i)return e.next(),e.eatWhile(/[\w\$_]/)?"def":null;if("$"==i)return e.next(),e.eatWhile(/[\w\$_]/)?"meta":null;if("#"==i)return e.next(),e.eatWhile(/[\d_.]/),"def";if('"'==i)return e.next(),n.tokenize=(t=i,function(e,n){for(var i,r=!1,a=!1;null!=(i=e.next());){if(i==t&&!r){a=!0;break}r=!r&&"\\"==i}return(a||!r&&!s)&&(n.tokenize=E),"string"}),n.tokenize(e,n);if("/"==i){if(e.next(),e.eat("*"))return n.tokenize=M,M(e,n);if(e.eat("/"))return e.skipToEnd(),"comment";e.backUp(1)}if(e.match(w)||e.match(g)||e.match(y)||e.match(v)||e.match(h)||e.match(m)||e.match(w))return"number";if(e.eatWhile(f))return"meta";if(e.eatWhile(/[\w\$_]/)){var r=e.current();return d[r]?(b[r]&&(c="newblock"),q[r]&&(c="newstatement"),u=r,"keyword"):"variable"}return e.next(),null}function M(e,n){for(var t,i=!1;t=e.next();){if("/"==t&&i){n.tokenize=E;break}i="*"==t}return"comment"}function C(e,n,t,i,r){this.indented=e,this.column=n,this.type=t,this.align=i,this.prev=r}function I(e,n,t){var i=new C(e.indented,n,t,null,e.context);return e.context=i}function W(e){var n=e.context.type;return")"!=n&&"]"!=n&&"}"!=n||(e.indented=e.context.indented),e.context=e.context.prev}function $(e,n){if(e==n)return!0;var t=n.split(";");for(var i in t)if(e==t[i])return!0;return!1}return{electricInput:function(){var e=[];for(var n in b)if(b[n]){var t=b[n].split(";");for(var i in t)e.push(t[i])}return new RegExp("[{}()\\[\\]]|("+e.join("|")+")$")}(),startState:function(e){return{tokenize:null,context:new C((e||0)-i,0,"top",!1),indented:0,startOfLine:!0}},token:function(e,n){var t=n.context;if(e.sol()&&(null==t.align&&(t.align=!1),n.indented=e.indentation(),n.startOfLine=!0),e.eatSpace())return null;c=null,u=null;var i=(n.tokenize||E)(e,n);if("comment"==i||"meta"==i||"variable"==i)return i;if(null==t.align&&(t.align=!0),c==t.type)W(n);else if(";"==c&&"statement"==t.type||t.type&&$(u,t.type))for(t=W(n);t&&"statement"==t.type;)t=W(n);else if("{"==c)I(n,e.column(),"}");else if("["==c)I(n,e.column(),"]");else if("("==c)I(n,e.column(),")");else if(t&&"endcase"==t.type&&":"==c)I(n,e.column(),"statement");else if("newstatement"==c)I(n,e.column(),"statement");else if("newblock"==c)if("function"!=u||!t||"statement"!=t.type&&"endgroup"!=t.type)if("task"==u&&t&&"statement"==t.type);else{var r=b[u];I(n,e.column(),r)}else;return n.startOfLine=!1,i},indent:function(n,t){if(n.tokenize!=E&&null!=n.tokenize)return e.Pass;var o=n.context,s=t&&t.charAt(0);"statement"==o.type&&"}"==s&&(o=o.prev);var l=!1,c=t.match(x);return c&&(l=$(c[0],o.type)),"statement"==o.type?o.indented+("{"==s?0:r):_.test(o.type)&&o.align&&!a?o.column+(l?0:1):")"!=o.type||l?o.indented+(l?0:i):o.indented+r},blockCommentStart:"/*",blockCommentEnd:"*/",lineComment:"//"}})),e.defineMIME("text/x-verilog",{name:"verilog"}),e.defineMIME("text/x-systemverilog",{name:"systemverilog"})}));