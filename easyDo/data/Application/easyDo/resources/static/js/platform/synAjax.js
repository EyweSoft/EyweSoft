var synAjax={extendMethod:function(a,e,n,t){showLoading();var o="className="+a+"&methodName="+e;if(n&&n.length>0)for(var d=0;d<n.length;d++)o+="&paramValues="+n[d];o+="&r="+Math.random(),$.ajax({url:"/extend",async:!1,data:o,dataType:"html",type:"POST",contentType:"application/x-www-form-urlencoded; charset=UTF-8",success:function(a){hideLoading(),t&&t(a)}})}};