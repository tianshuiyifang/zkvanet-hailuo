function checkGpsWeight(){
	
	$("#deviceCkeck").modal();
	complex_initDevCheck();
	$("#checkresp").html();
}

function sendGps(){
	
	
	var devImei=$("select[name='devcheck']").val();
	var gpsOrder=$("#gpsorder").val();
	if(gpsOrder==""){
		layer.msg("命令不能为空");
		return;
	}
	
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:{"userId":$.parseJSON(getCookie("selectHistory")).userId,"imei":devImei,"order":gpsOrder},
		url : _ctx + "rest/deviceControl/sendorder",
		success : function(ret) {
			if (ret.statusCode == -1) {
				layer.msg("设备未上线/发送失败");
				return ;
			} else if(ret.statusCode == 1){
				layer.msg("发送成功");
				return ;
			} else if(ret.statusCode == 2){
				layer.msg("收到设备回应");
				return ;
			}
		},
		error : function(e) {
		}
	});
	
	
}

function sendWeight(){
	
	var devImei=$("select[name='devcheck']").val();
	var weightorder=$("#weightorder").val();
	if(weightorder==""){
		layer.msg("命令不能为空");
		return;
	}
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:{"userId":$.parseJSON(getCookie("selectHistory")).userId,"imei":devImei,"order":weightorder},
		url : _ctx + "rest/deviceControl/sendorder",
		success : function(ret) {
			if (ret.statusCode == -1) {
				layer.msg("设备未上线/发送失败");
				return ;
			} else if(ret.statusCode == 1){
				layer.msg("发送成功");
				return ;
			} else if(ret.statusCode == 2){
				layer.msg("收到设备回应");
				return ;
			}
		},
		error : function(e) {
		}
	});
}
Date.prototype.format = function(fmt) { 
    var o = { 
       "M+" : this.getMonth()+1,                 //月份 
       "d+" : this.getDate(),                    //日 
       "h+" : this.getHours(),                   //小时 
       "m+" : this.getMinutes(),                 //分 
       "s+" : this.getSeconds(),                 //秒 
       "q+" : Math.floor((this.getMonth()+3)/3), //季度 
       "S"  : this.getMilliseconds()             //毫秒 
   }; 
   if(/(y+)/.test(fmt)) {
           fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
   }
    for(var k in o) {
       if(new RegExp("("+ k +")").test(fmt)){
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
    }
   return fmt; 
}      

$(function(){
	var loginUserId=login_userId;
	if(loginUserId==1){
     $(".checkGpsWeight").show();
	}else{
	 $(".checkGpsWeight").hide();
	}
});

function refreshResp(){
	
	var devImei=$("select[name='devcheck']").val();
	
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:{"userId":$.parseJSON(getCookie("selectHistory")).userId,"imei":devImei},
		url : _ctx + "rest/deviceControl/queryOrder",
		success : function(ret) {
			if (ret.statusCode == 1) {
				if(ret.data!=null){
				    for(var i=0;i<ret.data.length;i++){
				     var createTime=new Date(ret.data[i].createTime);
				     var updateTime=new Date(ret.data[i].updateTime);
				     ret.data[i].createTime= createTime.format("yyyy-MM-dd hh:mm:ss");
				     ret.data[i].updateTime= updateTime.format("yyyy-MM-dd hh:mm:ss");
				    }
				}
				$("#checkresp").html(template("checkresplist",ret));
			} else {
				layer.msg("无结果");
			}
		},
		error : function(e) {
		}
	});
}

/**
 * 初始化设备select
 */
function complex_initDevCheck(){
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:{"userId":$.parseJSON(getCookie("selectHistory")).userId},
		url : _ctx + "rest/deviceControl/getdevList",
		success : function(ret) {
			if (ret.code == 0) {
				if(ret.data){
					$("#dev-check").html(template("complex_dev_check_options",ret));
					$("select[name='devcheck']").easyDropDown();
					$("select[name='devcheck']").easyDropDown().change(function(){
						$(".js-search-number-text").val($(this).val());
					});
					$("select[name='devcheck']").easyDropDown("select",0);
				}
			} else {
				layer.msg($.i18n.prop("comm.Failed"), {icon : 2});
			}
		},
		error : function(e) {
		}
	});
}