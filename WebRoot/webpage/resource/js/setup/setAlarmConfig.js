
/**
 * 分页查询
 */
function getDeviceList(pageNo,intPageSize,param){
	if(pageNo){
		dev_pageNo = pageNo;
	}
	if(pageNo){
		dev_pageSize = intPageSize;
	}
	if(!param){
		param = {devName:$(".js-select-equipment").val(),currentPage:dev_pageNo,pageSize:dev_pageSize};
	}
	param.currentPage = dev_pageNo;
	param.pageSize = dev_pageSize;
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:param,
		url : _ctx + "/device/list",
		beforeSend:function(XHR){
			showLoading('alarmTableContent');
		},
		complete:function(XHR, TS){
			hideLoading('alarmTableContent');
			tableHeaderAutoWidth("#alarmTableHeader","#alarmTableContent");//告警设置表头宽度
		},
		success : function(ret) {
			if(ret && ret.code == 0){
				if(ret.data.result && ret.data.result.length>0){
					$("#alarm_devinfo_tbody").html(template("alarm_devinfo_tmp",{data:ret.data.result,pageNo:dev_pageNo,pageSize:dev_pageSize}));
					dev_totalRecord = ret.data.totalRecord;
					if(dev_pageNo == 1){
						initDevicePaging(param);
					}
					checkboxAllSelect($(".alarm-devlist-all-checkbox"),$(".alarm-devlist-checkbox"));
					$(".alarm-devlist-all-checkbox").iCheck("uncheck");
					$("#alarm_paging_device").show();
					$("#alarm_devList_nodata").hide();
				}else{
					$("#alarm_devinfo_tbody").html(template("alarm_devinfo_tmp",null));
					$("#alarm_paging_device").hide();
					$("#alarm_devList_nodata").show();
				}
			}else{
				$("#alarm_devinfo_tbody").html(template("alarm_devinfo_tmp",null));
				$("#alarm_paging_device").hide();
				$("#alarm_devList_nodata").show();
			}
		},
		error : function(e) {
			ajaxError("getDeviceList()", e);
		}
	});
}

var dev_pageNo = 1;
var dev_pageSize = 10;
var dev_totalRecord = "";
function initDevicePaging(param){
	$("#alarm_paging_device").pagination({
		prevText: $.i18n.prop("page.previous") ,
		nextText: $.i18n.prop("page.next"),
		items: dev_totalRecord,
     	itemsOnPage: dev_pageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param, event){
     		if(event && (event.type=="click" || event.type=="change")){
     			dev_pageNo = pageNumber;
     			dev_pageSize = pageSize;
     			getDeviceList(dev_pageNo,dev_pageSize,param);
     		}
     	},
     	onInit : function (){
     		$("#alarm_paging_device").pagination("selectPage",dev_pageNo);
     	}
	});
}

/**
 * 全选
 * @param all
 * @param checkbox
 */
function checkboxAllSelect(all,checkbox){
    $(all).iCheck().on("ifClicked",function(){
        if(this.checked){
            $(checkbox).iCheck('uncheck');
        }else{
            $(checkbox).iCheck('check');
        }
    });
    $(checkbox).iCheck().on("ifChecked",function(){
        var flag = true;
        $(checkbox).each(function(){
            if(!this.checked){
                flag = false;
            }
        });
        if(flag){
            $(all).iCheck('check');
        }
//        if($(this).val() == "8"){
//        	$("#alarm_configure_form").find("input[name='speed']").val("");
//        	$("#alarm_configure_form").find("input[name='speedTime']").val("");
//        	$(".overSpeed-div").show();
//        }
    }).on("ifUnchecked",function(){
        $(all).iCheck('uncheck');
        if(!$(".alarm-type-check[value='overSpeed']").attr("checked")){
        	$("#alarm_configure_form").find("input[name='speed']").val("");
        	$("#alarm_configure_form").find("input[name='speedTime']").val("");
        	$(".overSpeed-div").hide();
        }
    });
}

/**
 * 设置框
 * @param imei
 * @param mcType
 */
function showSetModal(imei,mcType){
	$("#alarm_configure_form input").val("");
	$(".alarm-type-all-check").iCheck("uncheck");
	$(".overSpeed-div").hide();
	var checkValue = "" , historySet = "";
	if(imei && mcType){
		checkValue = {imeis:imei,mcTypes:mcType};
		historySet = getHistorySetting(imei);
	}else{
		checkValue = getCheckVal();
		if(!checkValue){
			layer.msg($.i18n.prop("cust.Pleaseselectequipment"));
			return;
		}
	}
	$("#setAlarmModal").modal();
	$("#selectEmailSend").iCheck('check');
	 $(".js-input-email-list>li:first").nextAll().remove();
     $("#alarm_configure_form").find("input[name='email']").val("");
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:{mcTypes:checkValue.mcTypes},
		url : _ctx + "/setup/getAlarmTypeByMcType",
		success : function(ret) {
			if(ret && ret.code == 0){
				if(historySet && historySet.length > 0){
					$.each(ret.data,function(i,v){
						$.each(historySet,function(x,y){
							if(v.id == y.status){
								v.check = "checked";
							}
//							if(y.status == "8"){
//								$("#alarm_configure_form").find("input[name='speed']").val(y.speed);
//								$("#alarm_configure_form").find("input[name='speedTime']").val(y.speedTime);
//								$(".overSpeed-div").show();
//							}
						});
					});
					if(historySet[0].emails){
						var mailArray = historySet[0].emails.split(",");
						$("#alarm_configure_form").find("input[name='email']").eq(0).val(mailArray[0]);
						for (var int = 1; int < mailArray.length; int++) {
							$(".js-add-email-address").click();
							$("#alarm_configure_form").find("input[name='email']").eq(int).val(mailArray[int]);
						}
					}
				}
				if(historySet.length == ret.data.length){
					$(".alarm-type-all-check").iCheck("check");
				}
				$(".js-alarm-item").html(template("alarm_typeList_tmp",ret));
				$("#alarm_configure_form").find("input[name='imeis']").val(checkValue.imeis);
				checkboxAllSelect($(".alarm-type-all-check"),$(".alarm-type-check"));
			}
		}
	});
}


function getHistorySetting(imei){
	var result = "";
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:{'imei':imei},
		url : _ctx + "/setup/getHistorySetting",
		success :function(ret){
			if(ret && ret.code == 0){
				result = ret.data;
			}
		}
	});
	return result;
}


/**
 * 获取选中的行
 */
function getCheckVal(){
	var result = "",mcTypes = "",imeis = "";
	var allCheck = $(".alarm-devlist-checkbox");
	if(allCheck && allCheck.length > 0){
		$.each(allCheck,function(i,v){
			if($(v).attr("checked")){
				var value = $(v).val();
				if(value){
					var array = value.split(",");
					imeis += array[0]+",";
					mcTypes += array[1]+",";
				}
			}
		});
		if(mcTypes && imeis){
			mcTypes = mcTypes.substring(0, mcTypes.length-1);
			imeis = imeis.substring(0, imeis.length-1);
			result = {"mcTypes":mcTypes,"imeis":imeis};
		}
	}
	return result;
}

function alarmValid(){
	var result = {"emails":"","speed":"","status":"","speedTime":""};
	var form = $("#alarm_configure_form");
	$.each($(".alarm-type-check"),function(i,v){
		if($(v).attr("checked")){
			result.status += $(v).val()+",";
		}
	});
//	if(!result.status){
//		layer.msg($.i18n.prop("Alert.chooseAlertType"));
//		return;
//	}
	if(result.status){
		result.status = result.status.substring(0, result.status.length-1);
		if($("#selectEmailSend").attr("checked")){
			var errorTarget = null;
			$.each($(form).find("input[name='email']"),function(i,v){
				var value = $(v).val();
				if(value && /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(value)){
					result.emails += $(v).val()+",";
				}else{
					errorTarget = v;
					return ;
				}
			});
			if(errorTarget){
				if(!$(errorTarget).val()){
					layer.msg($.i18n.prop("Alert.PleaseEnterEmail"),{icon:2});
				}else{
					layer.msg($.i18n.prop("Alert.emailFormatError"),{icon:2});
				}
				$(errorTarget).focus();
				return;
			}
			if(!result.emails){
				layer.msg($.i18n.prop("Alert.PleaseEnterEmail"));
				return;
			}
			result.emails = result.emails.substring(0, result.emails.length-1);
		}
		if(result.status && result.status.indexOf("6") >= 0){
			result.speed = $(form).find("input[name='speed']").val();
//			if(result.speed){
//				if(!/^[0-9]*$/.test(result.speed) || result.speed < 60){
//					layer.msg($.i18n.prop("Alert.Speedisanumbergreaterthan60"));
//					$(form).find("input[name='speed']").focus();
//					return ;
//				}
//			}else{
//				layer.msg($.i18n.prop("Alert.speedcannotnull"));
//				$(form).find("input[name='speed']").focus();
//				return;
//			}
//			result.speedTime = $(form).find("input[name='speedTime']").val();
//			if(result.speedTime){
//				if(!/^[0-9]*$/.test(result.speedTime) || result.speedTime < 10){
//					layer.msg($.i18n.prop("Alert.Timeisanumbergreaterthan10"));
//					$(form).find("input[name='speedTime']").focus();
//					return ;
//				}
//			}else{
//				layer.msg($.i18n.prop("Alert.timecannotnull"));
//				$(form).find("input[name='speedTime']").focus();
//				return ;
//			}
		}
	}
	return result;
}


/**
 * 设置告警
 */
function setAlarmConfig(){
	var result = alarmValid();
	if(!result){
		return ;
	}
	result.imei = $("#alarm_configure_form").find("input[name='imeis']").val();
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data: result,
		url : _ctx + "/setup/setAlarmConfig",
		success : function(ret) {
			if(ret && ret.code == 0){
				layer.msg($.i18n.prop("comm.Operationdone"),{icon:1});
				$(".alarm-devlist-checkbox").iCheck("uncheck");
			}else{
				layer.msg($.i18n.prop("comm.Failed"),{icon:2});
			}
			$("#setAlarmModal").modal("hide");
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}




//	var loadStart = null;

function showLoading(target){
	if(target){
		ele = $("#"+target);
		if(ele.is("div")){
			ele.append(template("alarm_loading_tmp",{}));
		}
		if(ele.is("table")){
			ele.find("tbody").hide();
			ele.parent().find("[id*=paging]").hide();
			ele.parent().find("[id*=nodata]").hide();
			ele.after(template("alarm_loading_tmp",{}));
		}
//			loadStart = new Date().getTime();
	}
}

function hideLoading(target){
	if(target){
		ele = $("#"+target);
		if(ele.is("table")){
			ele.parent().find("div[id*=logindata]").remove();
			ele.find("tbody").show();
		}else{
			ele.find("div[id*=logindata]").remove();
		}
//			var loadEnd = new Date().getTime();
//			if((loadEnd - loadStart) > 1000){
//				hideLoad(ele);
//			}else{
//				setTimeout("hideLoad("+'"'+target+'"'+")" , (1000-(loadEnd - loadStart)));
//			}
//			loadStart = null;
	}
}

$(function(){
	getAppSet();
});

function getAppSet(){
	$.ajax({
		type:"post",
	    data:{},
		url : _ctx + "/alarmInfo/getAppSet",
		success : function(ret) {
			if(ret && ret.code == 0){
				if(ret.data && ret.data.length>0){
					$("#alarm_appSet_tbody").html(template("alarm_appSet_tmp",{data:ret.data,pageNo:1,pageSize:20}));
				}
			}
		},
		error : function(e) {
		}
	});
}
function setAppSet(id,parentId,configureId){
	$.ajax({
		type:"post",
	    data:{id:id , parentId:parentId , configureId:configureId},
		url : _ctx + "/alarmInfo/setAppSet",
		success : function(ret) {
			getAppSet();
		},
		error : function(e) {
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}
function setAppSetAll(flags){
	$.ajax({
		type:"post",
	    data:{flag:flags},
		url :  _ctx + "/alarmInfo/setAppSetAll",
		success : function(ret) {
			getAppSet();
		},
		error : function(e) {
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}
