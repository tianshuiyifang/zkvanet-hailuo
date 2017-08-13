function checkGpsWeight(){
	
	$("#deviceCkeck").modal();
	complex_initDevCheck();
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
			if (ret.statusCode == 0) {
				if(ret.statusCode){
				
				}
			} else {
				layer.msg($.i18n.prop("comm.Failed"), {icon : 2});
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
			if (ret.statusCode == 0) {
				if(ret.statusCode){
				
				}
			} else {
				layer.msg($.i18n.prop("comm.Failed"), {icon : 2});
			}
		},
		error : function(e) {
		}
	});
}

function refreshResp(){
	
	var devImei=$("select[name='devcheck']").val();
	$("#checkresp").html("有结果");
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:{"userId":$.parseJSON(getCookie("selectHistory")).userId,"imei":devImei},
		url : _ctx + "rest/deviceControl/queryOrder",
		success : function(ret) {
			if (ret.statusCode == 0) {
				if(ret.statusCode){
				
				}
			} else {
				layer.msg($.i18n.prop("comm.Failed"), {icon : 2});
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