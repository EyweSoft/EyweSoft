function initCalendar(){new Schedule({el:"#schedule-box",showToday:!1,clickCb:function(t){if("Y"==$("#isEdit").val()){var s=$(".current-month").find('span[title="'+t+'"]');s.hasClass("non-workday")?s.removeClass("non-workday"):s.addClass("non-workday"),$("#isChange").val("Y")}},nextMonthCb:function(t,s){recordCurWorkdaysAndGetNewWorkdays(t,s)},nextYeayCb:function(t,s){recordCurWorkdaysAndGetNewWorkdays(t,s)},prevMonthCb:function(t,s){recordCurWorkdaysAndGetNewWorkdays(t,s)},prevYearCb:function(t,s){recordCurWorkdaysAndGetNewWorkdays(t,s)}})}function initSelectWeek(){$(".days-wrap .day-one").click((function(){if("N"!=$("#isEdit").val()){var t=$(this).attr("val");$(this).hasClass("non-workday")?($(this).removeClass("non-workday"),$(".current-month."+t).find(".currentDate").removeClass("non-workday")):($(this).addClass("non-workday"),$(".current-month."+t).find(".currentDate").addClass("non-workday"));var s="";$(".day-one").each((function(){$(this).hasClass("non-workday")||(s?s+=","+$(this).attr("val"):s=$(this).attr("val"))})),$("#weekdays").val(s),$("#isChange").val("Y")}}))}function recordCurWorkdaysAndGetNewWorkdays(t,s){var a=t+""+(s<10?"0"+s:s),e=recordCurMonthWorkdays()[a];e||$.ajax({cache:!0,type:"POST",url:"/advanceSet/getWorkdays",data:{dateId:a,weekdays:$("#weekdays").val()},async:!1,success:function(t){e=t}}),$("#curWorkdays").val(e)}function initSelectTime(){for(var t="",s="",a="",e="",i=$('input[name="amStartTime"]').val(),n=$('input[name="amEndTime"]').val(),l=i.split(":")[0],r=i.split(":")[1],o=n.split(":")[0],d=n.split(":")[1],c="0",m=0;m<60;m++)c=m<10?0+m:m,m%15==0&&(s+='<li class="'+(c==r?"time-selected":"")+'">'+c+"</li>",e+='<li class="'+(c==d?"time-selected":"")+'">'+c+"</li>"),m<=12&&(t+='<li class="'+(c==l?"time-selected":"")+'">'+c+"</li>",a+='<li class="'+(c==o?"time-selected":"")+'">'+c+"</li>");$("#am-start-hour-list").html(t),$("#am-start-minute-list").html(s),$("#am-end-hour-list").html(a),$("#am-end-minute-list").html(e);var h="",u="",y="",k="",v=$('input[name="pmStartTime"]').val(),w=$('input[name="pmEndTime"]').val(),f=v.split(":")[0],C=v.split(":")[1],p=w.split(":")[0],W=w.split(":")[1];for(c="0",m=0;m<60;m++)c=m<10?0+m:m,m%15==0&&(u+='<li class="'+(c==C?"time-selected":"")+'">'+c+"</li>",k+='<li class="'+(c==W?"time-selected":"")+'">'+c+"</li>"),m>12&&m<24&&(h+='<li class="'+(c==f?"time-selected":"")+'">'+c+"</li>",y+='<li class="'+(c==p?"time-selected":"")+'">'+c+"</li>");$("#pm-start-hour-list").html(h),$("#pm-start-minute-list").html(u),$("#pm-end-hour-list").html(y),$("#pm-end-minute-list").html(k),$(".time-select-list li").click((function(){$(this).siblings().removeClass("time-selected"),$(this).addClass("time-selected");var t=$(this).closest(".time-select-list"),s=t.attr("id"),a=$(this).text(),e=t.closest(".time-slot-box");if(a<10&&(a=0+a),s.indexOf("start-")>-1){var i=e.find('input[name$="StartTime"]'),n=i.val(),l=n.split(":")[0],r=n.split(":")[1];s.indexOf("start-hour-list")>-1?l=a:r=a,i.val(l+":"+r)}else{var o=e.find('input[name$="EndTime"]'),d=o.val(),c=d.split(":")[0],m=d.split(":")[1];s.indexOf("end-hour-list")>-1?c=a:m=a,o.val(c+":"+m)}})),$(".time-box .time").click((function(t){if("N"!=$("#isEdit").val()){stopPropagation(t);var s=$(this).closest(".time-slot-box").find(".select-time");s.hasClass("amTime")?$(".pmTime").hide():$(".amTime").hide(),s.is(":visible")?s.hide():s.show()}}))}function initWeek(){var t=$("#weekdays").val();t&&$(".day-one").each((function(){t.indexOf($(this).attr("val"))<0&&$(this).addClass("non-workday")}))}function recordCurMonthWorkdays(){var $workdays=$("#workdays"),workdaysJson=$workdays.val();workdaysJson=workdaysJson?eval("("+workdaysJson+")"):{};var $isChange=$("#isChange"),isChange=$isChange.val();if(isChange&&"Y"==isChange){var curMonth=$("#curMonth").attr("val"),workdays="";$(".current-month .currentDate").each((function(){$(this).hasClass("non-workday")||(workdays?workdays+=","+$(this).text():workdays=$(this).text())})),workdaysJson[curMonth]=workdays,$isChange.val("N"),$("#workdays").val(JSON.stringify(workdaysJson))}return workdaysJson}