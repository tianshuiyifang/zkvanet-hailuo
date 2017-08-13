var query_history = "";
$("#alarm-ReportTab>ul>li").click(function(){
	switch ($(this).index()) {
		case 0:
			initTime('alarmReport');
			addActive("alarmReport");
			break;
		case 1:
			initTime('alarmInfo');
			addActive("alarmInfo");
			alarmInfo_pageNo = 1;
			alarmInfo_pageSize = 10;
			alarmInfo_totalRecord = "";
			break;
		case 2:
			initTime('geozone');
			addActive("geozone");
			alarm_geozone_pageNo = 1;
			alarm_geozone_pageSize = 10;
			alarm_geozone_totalRecord = "";
			break;
		default:
			initTime('alarmReport');
			addActive("alarmReport");
			break;
		}
 });


//$(function(){
//	
//});
/**
 * 
 * 获取告警统计信息
 */
var alarmFromObj=false;
function cleanAlarmData(){
	$("#vibrationAlert").text(0);
	$("#powerCutOffAlert").text(0);
	$("#lowBatteryAlert").text(0);
	$("#sosAlert").text(0);
	$("#alarm_report_tbody").html(template("alarm_report_tbody_tmp",null));
	$("#alarm_report_nodata").show();
	$("#alarm_report-loading").hide();
}
function getAlarmReport(){
	$("#alarm_report_nodata").hide();
	$("#alarm_report-loading").show();
	$("#alarm_report_tbody").hide();
	alarmFromObj=false;
	
	if(!initCheckPickerTime({"startTime":$("#startTime_alarmReport").val(),"endTime":$("#endTime_alarmReport").val()})){
		cleanAlarmData();
		return
	}
	if(!checkInputDevNameAndImei("alarmReport")){
		cleanAlarmData();
		return
	}	
	var imeis = $("#queryDevice_select_alarmReport").val();
	if(imeis){
		if(FindCount(imeis.toString(),",")){
			cleanAlarmData();
			return;
		}
		
		var checkImeis = checkExpiredActivation(imeis);
		if(checkImeis.indexOf("b")>=0){
//			parent.layer.confirm($.i18n.prop("header.Report.ImeiNoData")+": "+checkImeis.replace("b",""), {
//				btn: [$.i18n.prop("comm.Confirm")] //按钮
//			});
			cleanAlarmData();
			return;
		}
		if(checkImeis){
			layer.confirm(checkImeis+$.i18n.prop("cust.CheckExpiredActivation"), {
				btn: [$.i18n.prop("comm.Confirm")] //按钮
			});
			cleanAlarmData();
			return;
		}
	}
	setCaching(userId,"AlarmReport",null,$("#startTime_alarmReport").val(),$("#endTime_alarmReport").val(),$("#queryDevice_select_alarmReport").val(),null);
	//if(!initCheckPickerTime({"startTime":$("#startTime_alarmReport").val(),"endTime":$("#endTime_alarmReport").val()}) && !checkInputDevNameAndImei("alarmReport")){$("#alarm_report-loading").hide(); return}
	$.ajax({
		type:"post",
	    cache: false,
	    data:{"userId":userId,"imei":$("#queryDevice_select_alarmReport").val(),"startTime":$("#startTime_alarmReport").val(),"endTime":$("#endTime_alarmReport").val()},
		url : _ctx + "/alarmInfo/getAlarmReport",
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
		success : function(ret) {
			var total = {"Vibrationalert":0,"Powercutoffalert":0,"Lowbatteryalert":0,"SOSalert":0};
			if(ret && ret.code == 0){
				if(ret.data && ret.data.length > 0){
					alarmFromObj=true;
					$("#alarm_report_tbody").html(template("alarm_report_tbody_tmp",ret));
					$.each(ret.data,function(i,v){
						total.Vibrationalert += Number(v.vibration);
						total.Powercutoffalert += Number(v.cutPower);
						total.Lowbatteryalert += Number(v.lowPower);
						total.SOSalert += Number(v.sos);
					});
					$("#alarm_report_tbody").show();
					$("#alarm_report_nodata").hide();
				}else{
					$("#alarm_report_tbody").html(template("alarm_report_tbody_tmp",null));
					$("#alarm_report_nodata").show();
				}
			}else{
				$("#alarm_report_tbody").html(template("alarm_report_tbody_tmp",null));
				$("#alarm_report_nodata").show();
			}
			$("#vibrationAlert").text(total.Vibrationalert);
			$("#powerCutOffAlert").text(total.Powercutoffalert);
			$("#lowBatteryAlert").text(total.Lowbatteryalert);
			$("#sosAlert").text(total.SOSalert);
			tableHeaderAutoWidth("#alarmTableHeader","#alarmTableContent");//告警总览表格
			
			$("#alarm_report-loading").hide();
		},
		error : function(e) {
			ajaxError("getAlarmReport()", e);
		}
	});
}


var alarmInfo_pageNo = 1;
var alarmInfo_pageSize = 10;
var alarmInfo_totalRecord = "";

function initAlarmInfoPaging(param){
	$("#alarm_info_paging").pagination({
		prevText: $.i18n.prop("page.previous") ,
		nextText: $.i18n.prop("page.next"),
		items: alarmInfo_totalRecord,
     	itemsOnPage: alarmInfo_pageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param, event){
     		if(event && (event.type=="click" || event.type=="change")){
     			alarmInfo_pageNo = pageNumber;
     			alarmInfo_pageSize = pageSize;
     			getAlarmInfo(alarmInfo_pageNo,alarmInfo_pageSize,param);
     		}
     	},
     	onInit : function (){
     		$("#alarm_info_paging").pagination("selectPage",alarmInfo_pageNo);
     	}
	});
}
function showAlarmInfoTab(){
	AlarmInfoFromObj = false;
	selectRTimeat('Today','alarmInfo');
	$(".alarmInfo-date").eq(0).addClass("btn-primary").siblings().removeClass("btn-primary");
	$("#queryDevice_select_alarmInfo").val("");
	$("#queryDevice_div_alarmInfo").hide();
//	$(".alarmInfo-all-status,.alarmInfo-status").iCheck("uncheck");
	$("#alarm_info_tbody").empty();
	$("#alarm_info_paging").hide();
	$("#alarm_info_nodata").show();
	$("#alarm_info-loading").hide();
	$(".query_device_div_alarmInfo").hide();
	$(".btn-back-report").hide();
//	for (var i = 0; i < 4; i++) {
//		$(".alarmInfo-status").eq(i).iCheck("check");
//	}
	$("#queryDevice_select_alarmInfo").removeClass("form-control-error");
}

function showAlarmReportTab(){
	$("#vibrationAlert").text(0);
	$("#powerCutOffAlert").text(0);
	$("#lowBatteryAlert").text(0);
	$("#sosAlert").text(0);
	alarmFromObj = false;
	selectRTimeat('Today','alarmReport');
	$(".alarmReport-date").eq(0).addClass("btn-primary").siblings().removeClass("btn-primary");
	$("#queryDevice_div_alarmReport").hide();
	$("#queryDevice_select_alarmReport").val("");
	$(".query_device_div_alarmReport").hide();
	$("#alarm_report-loading").hide();
	$("#alarm_report_tbody").empty();
	$("#alarm_report_nodata").show();
	for (var i = 4; i < 8; i++) {
		$("#alarm_report_total th").eq(i).html(0);
	}
	$("#queryDevice_select_alarmReport").removeClass("form-control-error");
}

//告警处理
function saveAlarmDeal(){
	if($("#alarmDealForm").valid()){
		$.ajax({
			url:_ctx+"/alarmInfo/saveAlarmDeal",
			data: $("#alarmDealForm").serialize(),
			async: true,
		    cache: true,
		    dataType: 'json',
		    type:"post",
		    complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			},
		    success: function(ret){
	    		if(ret && ret.code == 0){
			    	$("#alarmDealModal_deal").modal('hide');
					layer.msg($.i18n.prop("comm.Operationdone"),{icon:1}); 
					getAlarmInfoList(true,1);//刷新列表
					getAlarmInfo(alarmInfo_pageNo,alarmInfo_pageSize,null);
	    		}else{
	    			layer.msg($.i18n.prop("comm.Failed"),{icon:2});    
	    		}
		    },
		    complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});
	}
}

function showGeozoneTab(){
	geozoneFromObj = false;
	selectRTimeat('Today','geozone');
	$("#geozoneTotal_in").html(0);
	$("#geozoneTotal_out").html(0);
	$(".geozone-date").eq(0).addClass("btn-primary").siblings().removeClass("btn-primary");
	$("#queryDevice_div_geozone").hide();
	$("#queryDevice_select_geozone").val("");
	$(".query_device_div_geozone").hide();
	$("#alarm_geozone-loading").hide();
	$("#alarm_geozone_tbody").empty();
	$("#alarm_geozone_nodata").show();
	$("#paging-alarm_geozone").hide();
	$("#queryDevice_select_geozone").removeClass("form-control-error");
}

function setCaching(userId,allType,status,startTime,endTime,imeis,type){
	if(status){
		$("#statusCaching"+allType).val(status);
	}
	if(type){
		$("#type"+allType).val(type);
	}
	$("#startTime"+allType).val(startTime);
	$("#endTime"+allType).val(endTime);
	$("#imeis"+allType).val(imeis);
	if(userId){
		$("#userId"+allType).val(userId);
	}
}

/**
 * 获取告警信息列表
 */
var AlarmInfoFromObj=false;
function cleanAlarmInfoData(){
	$("#alarm_info_tbody").html(template("alarm_info_tbody_tmp",null));
	$("#alarm_info_nodata").show();
	$("#alarm_info_paging").hide();
	$("#alarm_info-loading").hide();
}
function getAlarmInfo(pageNo,intPageSize,param){
	$("#alarm_info_nodata").hide();
	$("#alarm_info_paging").hide();
	$("#alarm_info-loading").show();
	$("#alarm_info_tbody").hide();
	var status = alarm_getCheckVal('alarmInfo-status');
	AlarmInfoFromObj=false;
	if(pageNo){
		alarmInfo_pageNo = pageNo;
	}
	if(intPageSize){
		alarmInfo_pageSize = intPageSize;
	}
	if(!initCheckPickerTime({"startTime":$("#startTime_alarmInfo").val(),"endTime":$("#endTime_alarmInfo").val()})){
		cleanAlarmInfoData();
		return
	}
	if(!checkInputDevNameAndImei("alarmInfo")){
		cleanAlarmInfoData();
		return
	}
	var imeis = $("#queryDevice_select_alarmInfo").val();
	if(imeis){
		if(FindCount(imeis.toString(),",")){
			cleanAlarmInfoData();
			return;
		}
		var checkImeis = checkExpiredActivation(imeis);
		if(checkImeis.indexOf("b")>=0){
//			parent.layer.confirm($.i18n.prop("header.Report.ImeiNoData")+": "+checkImeis.replace("b",""), {
//				btn: [$.i18n.prop("comm.Confirm")] //按钮
//			});
			cleanAlarmInfoData();
			return;
		}
		if(checkImeis){
			layer.confirm(checkImeis+$.i18n.prop("cust.CheckExpiredActivation"), {
				btn: [$.i18n.prop("comm.Confirm")] //按钮
			});
			cleanAlarmInfoData();
			return;
		}
	}
	
	//if(!initCheckPickerTime({"startTime":$("#startTime_alarmInfo").val(),"endTime":$("#endTime_alarmInfo").val()}) && !checkInputDevNameAndImei("alarmInfo")){$("#alarm_info-loading").hide(); return}
	
	if(status=="" || status==null){
		status = "no_alarm_type";
	}
	setCaching(userId,"AlarmInfo",status,$("#startTime_alarmInfo").val(),$("#endTime_alarmInfo").val(),$("#queryDevice_select_alarmInfo").val(),null);
	if(!param){
		param = {"userId":userId,"imei":$("#queryDevice_select_alarmInfo").val(),"startTime":$("#startTime_alarmInfo").val(),"endTime":$("#endTime_alarmInfo").val(),"status":status,pageNo:alarmInfo_pageNo,pageSize:alarmInfo_pageSize};
	}
	param.pageNo = alarmInfo_pageNo;
	param.pageSize = alarmInfo_pageSize;
	$("#pageNoAlarmInfo").val(alarmInfo_pageNo);
	$("#pageSizeAlarmInfo").val(alarmInfo_pageSize);
	$.ajax({
		type:"post",
	    cache: false,
	    data: param,
		url : _ctx + "/alarmInfo/getAlarmInfo",
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
		success : function(ret) {
			if(ret && ret.code == 0){
				if(ret.data.result && ret.data.result.length > 0){
//					$.each(ret.data.result,function(i,v){
//						v.addr = "";
//					});
					AlarmInfoFromObj=true;
					$("#alarm_info_tbody").html(template("alarm_info_tbody_tmp",{data:ret.data.result,pageNo:alarmInfo_pageNo,pageSize:alarmInfo_pageSize}));
					alarmInfo_totalRecord = ret.data.totalRecord;
					if(alarmInfo_pageNo == 1){
						initAlarmInfoPaging(param);
					}
					$("#alarm_info_tbody").show();
					$("#alarm_info_paging").show();
					$("#alarm_info_nodata").hide();
				}else{
					$("#alarm_info_tbody").html(template("alarm_info_tbody_tmp",null));
					$("#alarm_info_nodata").show();
					$("#alarm_info_paging").hide();
				}
			}else{
				$("#alarm_info_tbody").html(template("alarm_info_tbody_tmp",null));
				$("#alarm_info_nodata").show();
				$("#alarm_info_paging").hide();
			}
			tableHeaderAutoWidth("#alarmDetailTableHeader","#alarmDetailTableContent");//告警详情表格
			
			$("#alarm_info-loading").hide();
		},
		error : function(e) {
			ajaxError("getAlarmInfo()", e);
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
        $(".expiredUncheck").iCheck().on("ifChecked",function(){
        	$(".expiredUncheck").iCheck('uncheck');
        });
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
        $(".expiredUncheck").iCheck().on("ifChecked",function(){
        	$(".expiredUncheck").iCheck('uncheck');
        });
    }).on("ifUnchecked",function(){
        $(all).iCheck('uncheck');
    });
    $(".expiredUncheck").iCheck().on("ifChecked",function(){
    	$(".expiredUncheck").iCheck('uncheck');
    });
}

function alarm_getCheckVal(target){
	var result = "";
	var devName = "";
	$.each($("."+target),function(i,v){
		if($(v).attr("checked")){
			if(target == 'query-device-check'){
				var value = $(v).val();
				if(value){
					var array = value.split(',');
					result += array[0]+",";
					devName += array[1]+",";
				}
			}else{
				result += $(v).val()+",";
			}
		}
	});
	if(result){
		result = result.substring(0, result.length-1);
	}
	if(target == 'query-device-check'){
		if(devName){
			devName = devName.substring(0, devName.length - 1);
		}
		selectDevice(result,devName,"alarmReport");
	}
	return result;
}
function showQueryTab(option){
	if(!option.target){
		return ;
	}
//	if(document.getElementById("queryDevice_table_"+option.target) && !option.isQuery){
//		$(".queryDevice-all-check-"+option.target+",.queryDevice-check-"+option.target).iCheck("uncheck");
//		$("#queryDevice_div_"+option.target).show();
//		return;
//	}
//	var param = {};
//	param.imeis = "";
//	var devName = $("#queryDevice_select_"+option.target).val();
//	if(devName){
//		if(devName.indexOf(",") > 0){
//			devName = devName.substring(devName.lastIndexOf(",")+1,devName.length);
//		}
//	}
//	param.devName = devName;
//	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
//	var selectNode = treeObj.getSelectedNodes()[0];
//	
//	if(selectNode){
//		param.userId = selectNode.id;
//		param.fullParent = selectNode.fullParentId;
//	}
//	var result = queryDevice(param);
//	if(result && result.code == 0){
//		var data = [];
//		if(query_history){
//			var array = query_history.substring(0, query_history.length - 1).split(',');
//			
//			$.each(result.data,function(i,v){
//				
//				var flag = true;
//				$.each(array,function(x,y){
//					if(v.imei == y){  
//						flag = false;
//					}
//				});
//				if(flag){
//					data.push(v);
//					flag = true;
//				}
//			});
//		}else{
//			data = result.data;
//		}
//		$("#queryDevice_div_"+option.target).html(template("queryDevice_tmp",{data:data,checkFlag:option.checkFlag,target:option.target}));
//		$(".expiredUncheck").attr("disabled",true);
//		if(option.checkFlag){
//			checkboxAllSelect($(".queryDevice-all-check-"+option.target), $(".queryDevice-check-"+option.target));
//		}
//	}
	var devName = $("#queryDevice_select_"+option.target).val();
	$('.deviceAllCheckbox').iCheck('uncheck');
	//if(devName){
//		var arrayDevName = devName.split(",");
//		var nodes = tree1.getCheckedNodes(true);
//		var nodesImeis = "";
//		var flag = true;
//		for(var i=0;i<nodes.length;i++){
//			nodesImeis += nodes[i].id + ",";
//		}
//		var arrayNodesImeis = nodesImeis.split(",");
//		for(var j=0;j<arrayNodesImeis.length;j++){
//			if(arrayNodesImeis[j]){
//				if($.inArray(arrayNodesImeis[j], arrayDevName) == -1){//判断该imei是否与数组元素相同
//					tree1.showNode(arrayNodesImeis[i]);
//				}
//			}
//		}
		
		
		
		//getTreeSelectValue(option.target,devName);
	//}
	if(!option.treeFlag){
		searchViewBox(option.target,devName,option.isQuery);
	}
	
}

//搜索结果显示
function searchViewBox(str,devName,query){
	//var btn = $(".queryDevice_btn_"+str);
	var box = $("#queryDevice_div_"+str);
	var flag = box.is(":hidden");
	if(!query){
		if(flag){
			if(devName){
				box.show();
				if(!tree1){
					$("#queryDevice_div_"+target+" .noDataHide").show();
					$("#queryDevice_div_"+target+" .TreeLogindataTable").hide();
					$("#queryDevice_div_"+target+" .hideConfirmClose").hide();
				}else{
					getTreeSelectValue(str,devName,"1");
				}
			}else{
				box.show();
				allTableTree(str,check,devName);
			}
		}else{
			box.hide();
		}
	}else{
		if(devName){
			var check = devName.substring(devName.lastIndexOf(",")+1,devName.length);
			if(flag){
				box.show();
				if(str == "alarmInfo"){
					allTableTree(str,check,devName);
				}else{
					allTableTree(str,check,devName);
				}
			}else{
				if(check){
					box.show();
					if(str == "alarmInfo"){
						allTableTree(str,check,devName);
					}else{
						allTableTree(str,check,devName);
					}
				}else{
					box.hide();
				}
			}
		}else{
			box.show();
			allTableTree(str,check,devName);
		}
	}
	
	$(document).bind("click",function(e){
		 var target = $(e.target);
		 if(!target.closest("#queryDevice_select_"+str+",.queryDevice_btn_"+str+",#queryDevice_div_"+str).length){
		 	box.hide();
		 }
	 });

	box.find(".js-btn-close").click(function(){
		box.hide();
	});
}

function checkExpiredActivation(imeis){
	imeis = imeis.replace(/\ +/g,"").replace(/[ ]/g,"").replace(/[\r\n]/g,"");
	var arrayImeis = imeis.split(",");
	var ImeisIsNu = "";
	for(var i = 0;i<arrayImeis.length;i++){
		if(arrayImeis[i]){
			if(!(isNaN(arrayImeis[i]))){
				ImeisIsNu = ImeisIsNu + arrayImeis[i] + ",";
			}
		}
	}
	//isNaN($('#id').val()
	var param = {};
	param.imeis = ImeisIsNu;
	param.devName = "";
	param.userId = userId;
	param.fullParent = fullParentId;
	
	var tipimei = '';
	var flag = true;
	var array = [];
	$.ajax({
		type: "post",
		async: false,
	    cache: false,
	    data: param,
		url : _ctx + "/setup/queryDevice",
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
		success : function(ret) {
			if(ret.data&&ret.data.length>0){
				$.each(ret.data,function(i,v){
					array.push(v.imei);
				});
				for(var i =0;i<arrayImeis.length;i++){
					if(arrayImeis[i]){
						if($.inArray(arrayImeis[i],array)==-1) {
							tipimei += arrayImeis[i] + ",";
		    			}
					}
				}
				if(!tipimei){
					flag = false;
					$.each(ret.data,function(i,v){
						if(v.userExpirationStr =='1' || v.userExpirationStr =='2'){
							tipimei += v.imei + ","; 
						}
					});
				}else{
					flag = true;
				}
				if(flag){
					tipimei = "b" + tipimei;
				}
			}else{
				tipimei = "b" +imeis;
			}
		}
	});
	return tipimei;
}

function getSelectValue(target,imei,checkFlag){
	if(query_history){
		if(query_history.indexOf(",") > 0){
			var last = query_history.substring(query_history.lastIndexOf(",")+1,query_history.length);
			if(last.length<15){
				query_history = query_history.substring(0, query_history.lastIndexOf(",")+1);
			}
		}else{
			query_history="";
		}
	}
	if(imei){
		if(!query_history || query_history.indexOf(imei) == -1){
			if(checkFlag == "true"){
				query_history += imei+",";
			}else{
				query_history = imei;
			}
		}
	}else{
		$.each($(".queryDevice-check-"+target),function(i,v){
			if($(v).attr("checked")){
				var value = $(v).val();
				if(query_history.indexOf(value) >= 0){
					query_history += ",";
				}else if(value && !query_history || query_history.indexOf(value) == -1){
					query_history += value+",";
				}
			}
		});
	}
	$("#queryDevice_select_"+target).val(query_history);
	$("#queryDevice_div_"+target).hide();
	$("#queryDevice_select_"+target).focus();
}

/**
 * 获取围栏告警信息
 */
var alarm_geozone_pageNo = 1;
var alarm_geozone_pageSize = 10;
var alarm_geozone_totalRecord = "";
var geozoneFromObj=false;
function cleanGeozoneAlarmData(){
	$("#geozoneTotal_in").html(0);
	$("#geozoneTotal_out").html(0);
	$("#alarm_geozone_tbody").empty();
	$("#alarm_geozone_nodata").show();
	$("#alarm_geozone-loading").hide();
	$("#paging-alarm_geozone").hide();
}
function alarm_geozone_Page(param){
	$("#paging-alarm_geozone").pagination({
		prevText: $.i18n.prop("page.previous") ,
		nextText: $.i18n.prop("page.next"),
		items: alarm_geozone_totalRecord,
     	itemsOnPage: alarm_geozone_pageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param, event){
     		if(event && (event.type=="click" || event.type=="change")){
     			alarm_geozone_pageNo = pageNumber;
     			alarm_geozone_pageSize = pageSize;
     			getGeozoneAlarm(alarm_geozone_pageNo,alarm_geozone_pageSize,param);
     		}
     	},
     	onInit : function (){
     		$("#paging-alarm_geozone").pagination("selectPage",alarm_geozone_pageNo);
     	}
	});
}

function getGeozoneAlarm(pageNo,intPageSize,param){
	if(pageNo){
		alarm_geozone_pageNo = pageNo;
	}
	if(intPageSize){
		alarm_geozone_pageSize = intPageSize;
	}
	$("#alarm_geozone_nodata").hide();
	$("#alarm_geozone-loading").show();
	$("#alarm_geozone_tbody").hide();
	$("#paging-alarm_geozone").hide();
	geozoneFromObj=false;
	
	if(!initCheckPickerTime({"startTime":$("#startTime_geozone").val(),"endTime":$("#endTime_geozone").val()})){
		cleanGeozoneAlarmData();
		return
	}
	if(!checkInputDevNameAndImei("geozone")){
		cleanGeozoneAlarmData();
		return
	}
	var imeis = $("#queryDevice_select_geozone").val();
	if(imeis){
		if(FindCount(imeis.toString(),",")){
			cleanGeozoneAlarmData();
			return;
		}
		var checkImeis = checkExpiredActivation(imeis);
		if(checkImeis.indexOf("b")>=0){
			cleanGeozoneAlarmData();
			return;
		}
		if(checkImeis){
			layer.confirm(checkImeis+$.i18n.prop("cust.CheckExpiredActivation"), {
				btn: [$.i18n.prop("comm.Confirm")] //按钮
			});
			cleanGeozoneAlarmData();
			return;
		}
	}
	setCaching(userId,"Geozone","in,out",$("#startTime_geozone").val(),$("#endTime_geozone").val(),$("#queryDevice_select_geozone").val(),null);
	if(!param){
		param = {"userId":userId,"alarmType":"geozone","imei":$("#queryDevice_select_geozone").val(),"startTime":$("#startTime_geozone").val(),"endTime":$("#endTime_geozone").val(),"status":"in,out","pageNo":alarm_geozone_pageNo,"pageSize":alarm_geozone_pageSize};
	}
	param.pageNo = alarm_geozone_pageNo;
	param.pageSize = alarm_geozone_pageSize;
	//if(!initCheckPickerTime({"startTime":$("#startTime_geozone").val(),"endTime":$("#endTime_geozone").val()}) && !checkInputDevNameAndImei("geozone")){$("#alarm_geozone-loading").hide(); return}
	$.ajax({
		type:"post",
	    cache: false,
	    data: param,
		url : _ctx + "/alarmInfo/getAlarmInfo",
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
		success : function(ret) {
			var total = {"totalIn":0,"totalOut":0};
			if(ret && ret.code == 0){
				if(ret.data.result && ret.data.result.length > 0){
					geozoneFromObj=true;
					$.each(ret.data.result,function(i,v){
						$("#alarm_geozone_nodata").hide();
//						if(v.status == "IN"){
//							total.totalIn += 1;
//						}
//						if(v.status == "OUT"){
//							total.totalOut += 1;
//						}
//						if($("#language").val()=="zh"){
//							if(v.status == "in"){
//								v.status = "进"
//							}else{
//								v.status = "出"
//							}
//						}
						v.status=v.status.replace("in",$.i18n.prop('Alert.in')).replace("out", $.i18n.prop('Alert.out'));
						if(!v.geoName){
							v.geoName = $.i18n.prop("Geozones.FenceDelete");
						}else{
							if($("#language").val()=="en"){
								v.geoName = v.geoName.replace("[APP端设置]","[APP setting]").replace("APP创建围栏","APP create a fence");
							}
						}
					});
					$("#alarm_geozone_tbody").html(template("alarm_geozone_tbody_tmp",{"data":ret.data.result,pageNo:alarm_geozone_pageNo,pageSize:alarm_geozone_pageSize}));
					alarm_geozone_totalRecord = ret.data.totalRecord;
					$("#alarm_geozone_tbody").show();
					$("#paging-alarm_geozone").show();
					if(alarm_geozone_pageNo == 1){
						alarm_geozone_Page(param);
					}
					$("#alarm_geozone_nodata").hide();
				}else{
					$("#alarm_geozone_tbody").empty();
					$("#alarm_geozone_nodata").show();
					$("#paging-alarm_geozone").hide();
				}
			}else{
				$("#alarm_geozone_tbody").empty();
				$("#alarm_geozone_nodata").show();
				$("#paging-alarm_geozone").hide();
			}
			$("#geozoneTotal_in").html(ret.data.currentPage);
			$("#geozoneTotal_out").html(ret.data.endRow);
			tableHeaderAutoWidth("#fenceTableHeader","#fenceTableContent");//围栏告警统计表格
			
			$("#alarm_geozone-loading").hide();
		},
		error : function(e) {
			ajaxError("getAlarmInfo()", e);
		}
	});
}

function toAlarmInfo(imei,status){
	var startTime = $("#startTime_alarmReport").val();
	var endTime   = $("#endTime_alarmReport").val();
	
	$(".alarm-nav div ul>li").eq(1).click();
	$(".alarmInfo-all-status,.alarmInfo-status").iCheck("uncheck");
	$(".alarmInfo-status[value='"+status+"']").iCheck('check');
	
	$("#startTime_alarmInfo").val(startTime);
	$("#endTime_alarmInfo").val(endTime);
	$("#queryDevice_select_alarmInfo").val(imei+",");
	
	//判断是否还有btn-primary 样式
	$("#qucikTime_alarmInfo").children().removeClass("btn-primary");
	$(".btn-back-report").show();
	getAlarmInfo(1);
}

function backAlarmReport(){
	$(".alarm-detail-box").hide();
	$(".alarm-statistical-box").show();
	$(".alarm-nav div ul>li").eq(0).addClass('active').siblings().removeClass('active');
	tableHeaderAutoWidth("#alarmTableHeader","#alarmTableContent");//告警总览表格
}

function switchTab(timeDivId){
	switch(after_seleType){
		case 'Yesterday':
			$("#"+timeDivId).children().eq(0).click();
			break;
		case 'ThisWeek':
			$("#"+timeDivId).children().eq(1).click();
			break;
		case 'LastWeek':
			$("#"+timeDivId).children().eq(2).click();
			break;
		case 'ThisMonth':
			$("#"+timeDivId).children().eq(3).click();
			break;
		case 'LastMonth':
			$("#"+timeDivId).children().eq(4).click();
			break;
		default :
			$("#"+timeDivId).children().eq(0).click();
			break;
	}
}

function getAllAlarmType(){
	$.ajax({
		url: _ctx + "/alarmInfo/getAllAlarmType?flag=1",
		async: true,
	    cache: false,
	    dataType: 'json',
	    complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
	    success: function(ret){
	    	if(ret && ret.code==0){
	    		if(ret.data && ret.data.length>0){
	    			$('#alarmTypeReport').html(template('allAlarmType',{"data" : ret.data}));//装填数据
	    			
	    			$('#alarmTypeReport').append('<label class="icheck-min" title="'+$.i18n.prop("comm.CheckAll")+'"> '+ 
	    					'<input type="checkbox" name="alarmInfoCheckAll" class="alarmInfo-all-status">&nbsp;'+$.i18n.prop("comm.CheckAll")+'</label>');
	    		}
	    	}else{
	    		$('#alarmTypeReport').html(template('allAlarmType',null));//装填数据
	    	}
	    	if(ret.msg){
				$.each(ret.msg.split(","),function(index,value){
    			     $("input[name='status'][value='"+value+"']").iCheck('check');
    			});
			}else{//默认选择
				$("input[name = 'status'],input[name = 'alarmInfoCheckAll']").iCheck();
			}
	    	checkboxAllSelect($(".alarmInfo-all-status"),$(".alarmInfo-status"));
	    },
		error : function(e) {
			ajaxError("getAllAlarmType()", e);
		}
	});
}