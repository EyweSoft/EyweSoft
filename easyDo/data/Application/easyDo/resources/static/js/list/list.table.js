var table,tempModel,tempType,globalSupportTree=!1;function initCommonTable(e){var t=e.tableId,a=e.objectType,i=e.view,s=e.pageSize,o=document.querySelector("#"+t),n=295;e.height&&(n=e.height),o.GM({gridManagerName:t,height:n+"px",supportCheckbox:!1,supportAjaxPage:!0,supportAdjust:!1,supportDrag:!1,supportMenu:!1,ajaxData:function(){return"/dashboard/getListData?objectType="+a},ajaxType:"POST",currentPageKey:"targetPage",pageSizeKey:"pageSize",columnData:i.headData,pageSize:s,ajaxSuccess:function(e){}})}function selectedTr(e,t){e=$(e),window.event&&window.event.ctrlKey?e.hasClass("selected")&&t?e.removeClass("selected"):e.addClass("selected"):!t&&e.hasClass("selected")||(e.siblings().removeClass("selected"),e.addClass("selected"))}function getMemuList(e,t,a){var i,s=[];if(t){t=t.split(",");for(var o=0;o<t.length;o++)i={},t[o]&&("O"==t[o]?(i.content='<i class="fa fa-blinds-open"></i>打开',i.onClick=function(t,a){var i=$(a).closest("tr").attr("id");openEntity(e,i)},i.line=!1):"A"==t[o]?(i.content='<i class="fa fa-plus"></i>新建',i.onClick=function(t,a){var i=$(a).closest("tr").attr("id");addEntity(e,i)},i.line=!1):"V"==t[o]?(i.content='<i class="fa fa-eye"></i>预览',i.onClick=function(t,i){var s=$(i).closest("tr").attr("id");viewDoc(e,s,a)},i.line=!1):"DL"==t[o]?(i.content='<i class="fa fa-download"></i>下载',i.onClick=function(t,i){var s=$(i).closest("tr"),o=s.attr("id");s.siblings(".selected").each((function(){o+=","+$(this).attr("id")})),downLoad(e,o,a)},i.line=!0):"COMM"==t[o]?(i.content='<i class="fa fa-comment-dots"></i>沟通',i.onClick=function(t,i){var s=$(i).closest("tr"),o=s.attr("id");communication(e,o,a,null,s)},i.line=!0):"MV"==t[o]?(i.content='<i class="fa fa-random"></i>移动',i.onClick=function(t,a){var i=$(a).closest("tr"),s=i.attr("id");i.siblings(".selected").each((function(){s+=","+$(this).attr("id")})),moveFolder(e,s,e,!0)},i.line=!1):"AGN"==t[o]?(i.content='<i class="fa fa-users-cog"></i>指派',i.onClick=function(t,i){var s=$(i).closest("tr").attr("id");assignUser(e,s,a)},i.line=!1):"ATSC"==t[o]?(i.content='<i class="fa fa-plus tsc"></i>新建用例',i.onClick=function(t,i){var s=$(i).closest("tr").attr("id");addTsc(e,s,a)},i.line=!1):"DPRQ"==t[o]?(i.content='<i class="fa fa-send-backward prq"></i>分解需求',i.onClick=function(t,i){var s=$(i).closest("tr").attr("id");decPrq(e,s,a)},i.line=!1):"DTSK"==t[o]?(i.content='<i class="fa fa-send-backward task"></i>分解任务',i.onClick=function(t,i){var s=$(i).closest("tr").attr("id");decTask(e,s,a)},i.line=!0):"DTSP"==t[o]?(i.content='<i class="fa fa-universal-access tsp"></i>执行测试',i.onClick=function(t,i){var s=$(i).closest("tr").attr("id");doTsp(e,s,a)},i.line=!0):"SLP"==t[o]?(i.content='<i class="fa fa-cog"></i>设置生命阶段',i.onClick=function(t,i){var s=$(i).closest("tr").attr("id");setLifecyclePhase(e,s,a)},i.line=!1):"E"==t[o]?(i.content='<i class="fa fa-pencil-alt"></i>编辑',i.onClick=function(t,i){var s=$(i).closest("tr").attr("id");editEntity(e,s,a)},i.line=!0):"CU"==t[o]?(i.content='<i class="fa fa-user-times"></i>变更',i.onClick=function(t,i){var s=$(i).closest("tr").attr("id");changeUser(e,s,a)},i.line=!1):"RB"==t[o]?(i.content='<i class="fa fa-reply"></i>回退',i.onClick=function(t,i){var s=$(i).closest("tr").attr("id");rollBack(e,s,a)},i.line=!1):"SR"==t[o]?(i.content='<i class="fa fa-cog"></i>设置角色',i.onClick=function(t,a){var i=$(a).closest("tr").attr("id");editRole(e,i)},i.line=!1):"CP"==t[o]?(i.content='<i class="fa fa-copy"></i>复制',i.onClick=function(t,i){var s=$(i).closest("tr").attr("id");copy(e,s,a)},i.line=!0):"OP"==t[o]?(i.content='<i class="fa fa-power-off reStart"></i>开启',i.onClick=function(t,a){var i=$(a).closest("tr"),s=i.attr("id");i.siblings(".selected").each((function(){s+=","+$(this).attr("id")})),closeOrRestartEntity(e,s,"N")},i.line=!0):"CE"==t[o]?(i.content='<i class="fa fa-power-off isClose"></i>关闭',i.onClick=function(t,a){var i=$(a).closest("tr"),s=i.attr("id");i.siblings(".selected").each((function(){s+=","+$(this).attr("id")})),closeOrRestartEntity(e,s,"Y")},i.line=!0):"D"==t[o]?(i.content='<i class="fa fa-trash-alt"></i>删除',i.onClick=function(t,i){var s=$(i).closest("tr"),o=s.attr("id");s.siblings(".selected").each((function(){o+=","+$(this).attr("id")})),removeEntity(e,o,a,s)},i.line=!0):"CL"==t[o]&&(i.content='<i class="fa fa-unlink"></i>取消链接',i.onClick=function(t,i){var s=$(i).closest("tr"),o=s.attr("id");s.siblings(".selected").each((function(){o+=","+$(this).attr("id")})),cancelLinkEntity(e,o,a)},i.line=!0),s.unshift(i))}return s}function getSign(e){var t="";return"FIELD"==tempModel?e.colName&&"COM"!=tempType&&(t=e.colName):"PAGE"==tempModel?e.children.length||!e.creatorId?t="PAGENODE":e.creatorId&&"admin"==e.creatorId&&(t="PAGESYSTEM"):"LIFECYCLE"==tempModel&&$.ajax({url:"/lifecycle/getLifecycleStatus",type:"post",data:{id:e.id,objectType:tempType},async:!1,success:function(e){t=e}}),t}$.widget("ui.initTable",{options:{tableId:"grid-table",model:null,rights:null,supportPage:!0,supportTree:!1,openState:!1,queryObject:null,supportCheckbox:!1,supportRadio:!1,dateType:"",objectId:"",objectType:"",viewId:"",folderId:"",isRead:"",isOpenWindow:"",curDate:"",filterConditions:""},_create:function(){var headData=[],headColumn,pageSize,filterHtml="",fieldType,query,menuList,tableId=this.options.tableId,model=this.options.model,rights=this.options.rights,supportPage=this.options.supportPage,supportTree=this.options.supportTree,openState=this.options.openState,queryObject=this.options.queryObject,supportCheckbox=this.options.supportCheckbox,dateType=this.options.dateType;objectId=this.options.objectId,objectType=this.options.objectType,viewId=this.options.viewId,folderId=this.options.folderId,filterConditions=this.options.filterConditions,isRead=this.options.isRead,globalSupportTree=supportTree,isOpenWindow=this.options.isOpenWindow,supportRadio=this.options.supportRadio,curDate=this.options.curDate,supportRadio&&(supportCheckbox=supportRadio);var height=calcTableHeight(tableId,queryObject);menuList=getMemuList(model,rights,objectType||queryObject);var headData=getHeadData(model,queryObject,viewId,objectType,curDate);headData&&(headColumn=headData.headData,pageSize||(pageSize=headData.pageSize),query={view:headData.view,pageSize:pageSize,model:model,orderBy:headData.orderBy,orderByType:headData.orderByType,queryObject:queryObject,dateType:dateType,objectId:objectId,objectType:objectType,viewId:viewId,folderId:folderId,isRead:isRead,isOpenWindow:isOpenWindow,curDate:curDate,filterConditions:filterConditions}),table=document.querySelector("#"+tableId),tempModel=model,tempType=queryObject,"undefined"!=typeof iFilter&&iFilter.init($(".fixed-table-filter input.form-control"),model,query,table,tableId,height,openState);var tempIds="";table.GM({gridManagerName:tableId,disableCache:!1,height:height+"px",supportAjaxPage:supportPage,supportCheckbox:supportCheckbox||!1,supportAutoOrder:!0,supportTreeData:supportTree,supportConfig:!0,disableLine:!0,disableBorder:!0,disableAutoLoading:!0,checkboxConfig:{useRowCheck:!0,useRadio:supportRadio||!1},useHideRow:!0,treeConfig:{openState:openState||!1,treeKey:"children"},ajaxData:function(){return"/getBodyData"},ajaxType:"POST",query:query,currentPageKey:"targetPage",pageSizeKey:"pageSize",pageSize:pageSize,columnData:headColumn,supportMoveRow:!1,useHideRow:!1,supportPrint:!1,supportExport:!1,useCellFocus:!1,supportMenu:!0,menuHandler:e=>{if(menuList)for(var t=0;t<menuList.length;t++)e.unshift(menuList[t]);return e},pagingBefore:function(e){},pagingAfter:function(e){},sortingBefore:function(e,t,a){if(a)for(var i in a)iFilter.props.query.orderBy=i,iFilter.props.query.orderByType=a[i],iFilter.props.table.GM("setQueryNoRefresh",iFilter.props.query)},sortingAfter:function(e){},adjustBefore:function(e){},adjustAfter:function(e){},dragBefore:function(e){},dragAfter:function(e){},rowClick:function(e,t,a){"function"==typeof dblSelectObject&&dblSelectObject(e,t,a),selectedTr(a,!0)},checkedBefore:function(e,t,a){},checkedAfter:function(e,t,a){var i=$("#selectIds").val(),s=$("#selectNames").val();if(a)if(t)i&&!supportRadio?(i+=","+a.id,a.showName?s+=", "+a.showName:a.name&&(s+=", "+$(a.name).attr("title"))):(i=a.id,a.showName?s=a.showName:a.name&&(s=$(a.name).attr("title")));else if(i&&(i=(i=i.replaceAll(a.id+",","")).replaceAll(a.id,"")),s){var o="";a.showName?o=a.showName:a.name&&(o=$(a.name).attr("title")),o&&(s=(s=s.replaceAll(o+",","")).replaceAll(o,""))}$("#selectIds").val(i),$("#selectNames").val(s)},checkedAllBefore:function(e,t){if(tempIds="",e&&e.length)for(var a=0;a<e.length;a++)tempIds?tempIds+=","+e[a].id:tempIds=e[a].id},checkedAllAfter:function(e,t){var a=$("#selectIds").val();if(t){if(e&&e.length)for(var i=0;i<e.length;i++)a?a+=","+e[i].id:a=e[i].id}else{var s=tempIds.split(",");if(s&&s.length&&a)for(i=0;i<s.length;i++)a=(a=a.replaceAll(s[i]+",","")).replaceAll(s[i],"")}$("#selectIds").val(a)},ajaxBeforeSend:function(){"file-table"!=tableId&&showLoading()},ajaxSuccess:function(e){"function"==typeof detailPageDoCustom&&detailPageDoCustom(e,tableId)},ajaxComplete:function(data){var $table=$("#"+tableId),$tableWrap=$table.closest(".table-wrap");if(supportCheckbox){var selectIds=$("#selectIds").val(),selectData=[];if(selectIds){data=eval("("+data+")"),data=data.data;for(var i=0;i<data.length;i++)selectIds.indexOf(data[i].id)>-1&&selectData.push(data[i])}setTimeout((function(){GridManager.setCheckedData(tableId,selectData)}),100)}else if("grid-table"!=tableId&&tableId.indexOf("-table")>-1&&data){data=eval("("+data+")"),$("#"+tableId.replace("-table","-count")).text(data.totals),$("#"+tableId).attr("totals",data.totals);var $tableNone=$("#"+tableId.replace("-table","-none"));data.totals?($tableWrap.show(),$tableNone.hide()):($tableNone.length&&$tableWrap.hide(),$tableNone.show())}var tableHeight=$table.height()+1,$tableDiv=$tableWrap.find(".table-div");supportPage||$tableDiv.addClass("notSupportPage"),hideLoading();var selectTrId=$("#defaultSelectId").val();selectTrId&&(selectedTr($('tr[id="'+selectTrId+'"]'),!0),$(".table-wrap .table-div").animate({scrollTop:$("#defaultSelectId").attr("scrollTop")},1)),$("tbody tr").dblclick((function(){if(!$(this).find('td[noOpen="true"]').length){var e=$(this).attr("id");e&&model&&"RELATE"!=model&&openEntity(model,e)}})),setTimeout((function(){$('tbody tr td[noUpper="true"]').dblclick((function(e){stopPropagation(e)})),"function"==typeof tableLoadComplete&&tableLoadComplete(data),hideLoading(500)}),200)}}),$(".form-search").bind("keypress",(function(e){if("13"==e.keyCode){var t=$(this).attr("searchVal"),a=$(this).val();t&&a||t==a||(iFilter.props.query.name=$(this).val(),iFilter.refreshTable())}})),changeJIframeHeight()},destroy:function(){$.Widget.prototype.destroy.call(this),iFilter.props.table.GM("destroy")}});var operateMap=new Map;function getShowMenuBtnsBySignRule(e,t){var a=$("#objectType").val(),i=$("#model").val();i||(i=a);let s,o,n,l=[],r=$(e).closest("tr"),c=r.attr("sign"),d=isEntity(i);var f=r.attr("id");if(f){i&&d?(n=operateMap[f],n||$.ajax({url:"/entity/getMenuOperate",type:"post",data:{objectId:f,objectType:i,belongId:$("#belongId").val()},async:!1,success:function(e){n=e,operateMap[f]=n}})):"WORKFLOW"==i?$.ajax({url:"/workflow/getWorkflowMenuOperate",type:"post",data:{id:f},async:!1,success:function(e){n=e,operateMap[f]=n}}):"ENTITY"==i?$.ajax({url:"/entity/getEntityMenuOperate",type:"post",data:{id:f},async:!1,success:function(e){n=e,operateMap[f]=n}}):"DASHBOARD"==i&&$.ajax({url:"/dashboard/getDashboardMenuOperate",type:"post",data:{id:f},async:!1,success:function(e){n=e,operateMap[f]=n}});for(var p=0;p<t.length;p++)if(s=t[p],o=s.content,!(!o||o.indexOf("gm-icon gm-icon-up")>-1||o.indexOf("gm-icon gm-icon-down")>-1||o.indexOf("fa fa-cogs")>-1)){if((d||"WORKFLOW"==i||"ENTITY"==i||"DASHBOARD"==i)&&(o.indexOf("fa fa-eye")>-1||o.indexOf("fa fa-download")>-1||o.indexOf("fa fa-cog")>-1||o.indexOf("fa fa-pencil-alt")>-1||o.indexOf("fa fa-trash-alt")>-1||o.indexOf("fa fa-power-off")>-1||o.indexOf("fa fa-users-cog")>-1||o.indexOf("fa fa-plus tsc")>-1||o.indexOf("fa fa-send-backward prq")>-1||o.indexOf("fa fa-send-backward task")>-1)){if(!n)continue;if(o.indexOf("fa fa-eye")>-1&&n.indexOf("fa fa-eye")<0)continue;if(o.indexOf("fa fa-download")>-1&&n.indexOf("fa fa-download")<0)continue;if(o.indexOf("fa fa-cog")>-1&&n.indexOf("fa fa-cog")<0)continue;if(o.indexOf("fa fa-pencil-alt")>-1&&n.indexOf("fa fa-pencil-alt")<0)continue;if(o.indexOf("fa fa-trash-alt")>-1&&n.indexOf("fa fa-trash-alt")<0)continue;if(o.indexOf("fa fa-power-off isClose")>-1&&n.indexOf("fa fa-power-off isClose")<0)continue;if(o.indexOf("fa fa-power-off reStart")>-1&&n.indexOf("fa fa-power-off reStart")<0)continue;if(o.indexOf("fa fa-users-cog")>-1&&n.indexOf("fa fa-users-cog")<0)continue;if(o.indexOf("fa fa-plus tsc")>-1&&n.indexOf("fa fa-plus tsc")<0)continue;if(o.indexOf("fa fa-send-backward prq")>-1&&n.indexOf("fa fa-send-backward prq")<0)continue;if(o.indexOf("fa fa-send-backward task")>-1&&n.indexOf("fa fa-send-backward task")<0)continue}c?"FIELD"==tempModel?c.startsWith("COM_")?o.indexOf("fa fa-trash-alt")<0&&l.push(t[p]):o.indexOf("fa fa-unlink")<0&&l.push(t[p]):"PAGE"==tempModel?c.startsWith("PAGENODE")||c.startsWith("PAGESYSTEM")&&o.indexOf("fa fa-trash-alt")<0&&l.push(t[p]):"LIFECYCLE"==tempModel&&("CL"!=c?o.indexOf("fa fa-trash-alt")<0&&l.push(t[p]):l.push(t[p])):l.push(t[p])}return l}}function getHeadData(e,t,a,i,s){var o="";return $.ajax({url:"/getHeadData",type:"get",dataType:"json",data:{model:e,queryObject:t,viewId:a,objectType:i,curDate:s},async:!1,success:function(e){o=e}}),o}function showOption(e){}function packBoardTr(e){var t="";if(e)for(var a="",i="",s=0;s<e.length;s++){if(t+="<li class=\"board-li\" onclick=\"openEntity('TSK', '"+(a=e[s]).taskId+"')\">",t+='\t<div class="progressBar" style="background-color:'+a.statusBg+'"></div>',t+='\t<div class="board-content spec">',t+='\t\t<div class="data-name">'+a.name+"</div>",t+='\t\t<div class="ml10">',t+='\t\t\t<div class="cur-status" style="background-color:'+a.statusBg+'">',t+='\t\t\t\t<i class="'+a.statusIcon+'" style="color:'+a.statusFc+'"></i>',t+='\t\t\t\t<div class="box">',t+='\t\t\t\t\t<div class="title" style="color:'+a.statusFc+'">'+a.statusName+"</div>",t+='\t\t\t\t\t<div class="remark" style="color:'+a.statusFc+'">当前状态</div>',t+="\t\t\t\t</div>",t+="\t\t\t</div>",t+='\t\t\t<div class="cur-date">',t+='\t\t\t\t<div class="circ"><i class="fa fa-calendar-check-o"></i></div>',t+='\t\t\t\t<div class="box">',t+='\t\t\t\t\t<div class="title">'+a.startDate+"</div>",t+='\t\t\t\t\t<div class="remark">'+a.startFieldName+"</div>",t+="\t\t\t\t</div>",t+="\t\t\t</div>",t+='\t\t\t<div class="cur-date mr0">',t+='\t\t\t\t<div class="circ"><i class="fa fa-calendar-check-o"></i></div>',t+='\t\t\t\t<div class="box">',t+='\t\t\t\t\t<div class="title">'+a.endDate+"</div>",t+='\t\t\t\t\t<div class="remark">'+a.endFieldName+"</div>",t+="\t\t\t\t</div>",t+="\t\t\t</div>",t+='\t\t\t<div class="clearfix"></div>',t+="\t\t</div>",t+="\t</div>",t+='\t<div class="board-status">',t+='\t\t<div class="pt3">',t+='\t\t\t<span class="rate" style="background-color:'+a.light+";color:"+(a.light?"white":"")+'">偏差率：'+a.devRate+"%</span>",t+='\t\t\t<span class="rate">完成率：'+a.copRate+"%</span>",t+="\t\t</div>",t+='\t\t<ul class="list-unstyled team-info mr5">',a.user)for(var o=0;o<a.user.length;o++)o>6||(t+="\t\t<li onclick=\"viewUser('"+(i=a.user[o]).userId+'\')" title="'+i.userTitle+'"><img src="'+i.userImg+'"></li>');t+="\t\t</ul>",t+="\t</div>",t+="</li>"}return t}function reLoad(e,t){if("undefined"!=typeof iFilter){$(iFilter.props.table).closest(".table-div");var a=$("tr.selected");e||(e=a.attr("id")),setCookie("selectTrId",e),$("#defaultSelectId").val(e).attr("scrollTop",$(".table-wrap .table-div").scrollTop());var i=$("#isGantt").val();if(t||(t=$("#belongType").val()),!iFilter.props.table||i&&"Y"==i||t&&"PJT"==t){var s=$(".windowPage"),o=$("#custom-iframe");s.length?window.history.go(-2):o.length&&o.contents().find(".refresh-action").click()}else iFilter.refreshTable()}}function calcTableHeight(e,t){var a,i=parent.$("#leftsidebar").height(),s=$("#isOpenWindow").val(),o=parent.$("#custom-iframe");if(null==(a=o&&o.length?o.height():$(".table-list-box").closest("body").height())){a=$("#"+e).closest(".layout-left").height()-$(".button-box").height(),$(".detail-sign").length&&(a-=$(".detail-sign").height()+10),$(".button-box").length?a-=$(".button-box").height():$(".t-btn").length&&(a-=$(".t-btn").height()+10);var n=$("#"+e).closest(".field-li");n.length&&(a-=40*n.prevAll().length+115)}else if(s&&"Y"==s||parent.$(".iframeClass").length)a-=85;else if(i&&a>=i)a-=193;else if(100==a)a=i-195;else{var l=$(".pjt-box");l&&l.length?a-=63:a-=68}$(".change-tab").length&&(a-=46),$(".table-list-box .search-condition").length&&(a-=60),a<100&&(a=$("#"+e).closest("body").height(),s&&"Y"==s&&(a-=65)),t&&"BA"==t&&(a-=63),$("#isSignWindow").val()&&(a-=45);var r=$("#tableHeightAuto").val();return r&&"Y"==r&&(a="100%"),a}function changeJIframeHeight(){parent.$(".J_iframe").height(parent.$(".slimScrollDiv").height()-10)}function editView(){var e="/page/pageSet/"+$("#viewFilter").attr("value")+"?objectType="+$("#objectType").val()+"&entityTypeId=&subType=&pageType=LIST&isCopy=N&isEntityList=Y&parentname="+window.name;openWindowLikeIframe({url:e})}function copyView(){var e=$("#viewFilter").attr("value"),t=($("#objectType").val(),"/page/pageSet/"+e+"?objectType="+$("#objectType").val()+"&entityTypeId=&subType=&pageType=LIST&isCopy=Y&isEntityList=Y&parentname="+window.name);openWindowLikeIframe({url:t})}function delView(){confirm("确定要删除该列表吗？",confirmDelView)}function confirmDelView(){var e=$("#viewFilter").attr("value");$.ajax({type:"POST",url:"/page/delPage",data:{ids:e},async:!1,success:function(t){e==$("#viewId").val()&&$('li[issystem="Y"]').click(),$('li[value="'+e+'"]').remove(),parent.layer.closeAll(),parent.layer.msg("操作成功")}})}function reLoadView(e){$.ajax({cache:!0,type:"POST",url:"/page/getPageList",data:{objectType:$("#objectType").val(),selectId:e,pageType:"LIST"},async:!1,success:function(e){if(e){for(var t,a,i="",s=0;s<e.length;s++)i+='<li title="'+e[s].text+'" isSystem="'+e[s].type+'" value="'+e[s].id+'"><a href="javascript:void(0);" class="'+(e[s].checked?"cur":"")+'" ><span class="text">'+e[s].text+'</span><i class="fa fa-ellipsis-h ml5 eidt-list"></i></a></li>',e[s].checked&&(t=e[s].id,a=e[s].text);i+='<li class="addList" title="新建列表"><i class="zmdi zmdi-plus"></i></li>',$("#viewFilter").html(i),$("#viewFilter-text").text(a),loadViewType(!1,$("#viewType").val(),t,!0),initViewList()}}})}function initViewList(){$("#viewFilter li").hover((function(){var e=$(".dropdown-sub-menu");if($(this).hasClass("addList"))e.addClass("hide");else{$(this).closest("ul").attr("value",$(this).attr("value"));var t=$(this).offset().top-17;"Y"==$(this).attr("isSystem")?(e.find(".isNotShow").hide(),e.find("li").css("border","0px")):(e.find(".isNotShow").show(),e.find("li:not(:last-child)").css("border-bottom","1px dotted #e0e0e7cc")),$(".table-list-box .search-condition").length&&(t-=60),e.css("top",t+"px").removeClass("hide")}})),$("#viewFilter li").click((function(){$("#viewFilter li a").removeClass("cur"),$(this).find("a").addClass("cur"),$("#viewFilter-text").text($(this).attr("title"));var e=$(this).attr("value");loadViewType(!1,$("#viewType").val(),e,!1)})),$(".addList").click((function(){var e="/page/pageSet/null?objectType="+$("#objectType").val()+"&entityTypeId=&subType=&pageType=LIST&isCopy=N&isEntityList=Y&parentname="+window.name;openWindowLikeIframe({url:e,title:"新建列表"})}))}