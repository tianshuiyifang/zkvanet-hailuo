$(document).ready(function(){
	//iniOrganizeName();
	initVechileIOC();
	//initDeviceList();
	//initPage();
});

//ALL ACCOUNT
var totalRecord=0;
//CURRENT PAGE
var pageNo = 1;
//PAGESZE
var pageSize=10;
function initPage(){
	$("#pagination-deviceList").pagination({
		items: totalRecord,
		itemsOnPage: pageSize,
		onPageClick: function(pageNumber, event){
			pageNo = pageNumber;
			initDeviceList();
		},
		onInit : function (){
			$("#pagination-deviceList").pagination("selectPage",pageNo);
		}
	});
}

//LOAD DEVICEINFO
/*function initDeviceList(){
	$.ajax({
		type:'POST',
		url:_ctx+"/device/list",  
		async: false, 
		cache:false,
		dataType: 'json', 
		data:{"pageNo":pageNo,"pageSize":pageSize},  
		success:function(returnData){
			if(returnData.code==0){
				$('#devicelist').html(template('d-info',returnData));
			}
			//alert(returnData.page.totalRecord);
			totalRecord=returnData.page.totalRecord;
		}
	});
}*/

$("#btn-submit-vehile").click(function(){
	if(validateFrom()){
		var datas=$("#js-yunmdevice-from").serializeObject();
		$.ajax({  
			url: _ctx+"/vechilebund/inset", 
			type: "POST",
			data:datas,  
			async: false,
			cache: false,
			dataType: 'json',  
			success: function (returnData){
				if (returnData.code==0){
					layer.msg('分配成功！', {icon: 1});
					window.location.href=_ctx+"/device/assets";
				}
			}
		});
	}
});


//SELECT CARIOC
$("#js-carioc").each(function(){
	$(this).find("li").click(function(){
		$("#js-carioc li").each(function(){
			$(this).removeClass("c-primary");
		});
		$(this).toggleClass("c-primary");
		//alert(event.contentText);
	});
});
//INT carIocStyle
function selectCarIoc(carIocStyle,obj){
	$("#carioc-input").val(carIocStyle);
	$("#js-carioc>li").removeClass("c-primary");
	$(obj).addClass("c-primary");
}

function initVechileIOC(){
	var vioc=$("#carioc-input").val();
	if(!vioc){
		vioc = "other";
	}
	$("#js-carioc>li."+vioc).addClass("c-primary");
}

function  validate(){
	var deviceName=$("#deviceName").val();        //设备名称
	var carioc=$("#carioc-input").val();          //车辆图标
	var vechleNumber=$("#vechleNumber").val();    //车牌号

	if(deviceName===""||vechleNumber==""||carioc===""){
		layer.msg('请填写相关信息', {icon: 7});
		return false;
	}else{
		return true;
	}
}




//serializeObject
(function($){
	$.fn.serializeObject = function() {
		if ( !this.length ) { return false; }
		var $el = this,
		data = {},
		lookup = data;
		$el.find(':input[type!="checkbox"][type!="radio"], input:checked').each(function() {
			var named = this.name.replace(/\[([^\]]+)?\]/g, ',$1').split(','),
			cap = named.length - 1,
			i = 0;
			for ( ; i < cap; i++ ) {
				lookup = lookup[ named[i] ] = lookup[ named[i] ] ||
				( named[i+1] == "" ? [] : {} );
			}
			if ( lookup.length != undefined ) {
				lookup.push( $(this).val() );
			}else {
				lookup[ named[ cap ] ]  = $(this).val();
			}
			lookup = data;
		});
		return data;
	};
})(jQuery);

//首页弹出设备更新窗口
function toUpdateDeviceIndex(imei,userId)
{	
	complex_buildDeviceInfoForm("customer",imei,"indexeditDevice");
}


/**
 * 设备更多功能
 * @param obj this
 * @param imei	imei
 * @param orgid	设备id
 * @param statuss 状态
 */
function morefunction(obj,imei,orgid,statuss,defaultName){
	 //点击更多时，若添加分组框存在，则隐藏
	 if($(".add-group-form").is(":visible")){
		$(".add-group-form").remove();
		 $(".js-add-group").show();
	}
	//点击更多时，组名编辑框若存在，则先删除
	if($(".edit-group-form").length>0)	{
		$(".edit-group-form").parents(".node-func").removeClass("show-edit-group");
		$(".edit-group-form").remove();
		$(".devnum").show();
	}
	//点击更多时，若删除框存在，则隐藏删除框
	if($("[id^=layui-layer]").length>0){
		$("[id^=layui-layer]").hide();
	}

	//点击更多之前先把前一个操作框移出
	$(obj).parents().find(".func-box").remove();
	
	//获取分组列表
	var VOrganizeList;
	$.ajax({
		type:'POST',
		url: _ctx+"/VOrganize/orangizeList",
		data:{"userId":userId},   
		async: false,
		cache:false,
		success:function(ret){
			if(ret.code==0){
				VOrganizeList=ret.data;
			}
		},
		error:function(e){
			ajaxError("index.jsp",e);
		}
	});
  var obj_id = $(obj).attr("data-id");
  var box_id = "funcBox-"+obj_id;

  var func_html = '';
  	 func_html += '<div class="func-box" id="funcBox-'+ obj_id +'">';
 	 func_html += '<ul  class="func-list fs-12 lh-2">';
 
  //当状态是未激活和欠费时，不能出现街景、下发指令、行车记录选项
  /* if(statuss&&statuss!="inactivated"&&statuss!="inactivated bind"&&statuss!="arrears"&&statuss!="arrears bind"){
  } */
  //欠费未激活设备不能查看形式记录，街景，指令
  if(statuss&&statuss!="inactivated"&&statuss!="inactivated bind"&&statuss!="arrears"&&statuss!="arrears bind"){
	 func_html += '<li><a title="'+$.i18n.prop("index.StreeMap")+'" onclick="trackpresetStreet(\''+imei+'\')">'+$.i18n.prop("index.StreeMap")+'</a></li>';
	 //如果是体验用户，则不显示下发指令项
	 if(complex_loginUserType!=12){
		 func_html += '<li><a title="'+$.i18n.prop("index.Issue_command")+'" onclick="openInstructionModel(\''+imei+'\')">'+$.i18n.prop("index.Issue_command")+'</a></li>';
	 }
 	 func_html += '<li><a title="'+$.i18n.prop("header.drivingRecord")+'" onclick="drivingrecord(\''+imei+'\')">'+$.i18n.prop("header.drivingRecord")+'</a></li>';
 	 //电子围栏
   	 func_html += '<li><a title="'+$.i18n.prop("Geozones.Geozone")+'" onclick="electricFence(\''+imei+'\')">'+$.i18n.prop("Geozones.Geozone")+'</a></li>';
  }
  	if(complex_loginUserType!=3){
  		func_html += '<li><a title="'+$.i18n.prop("Asset.Movetogroup")+'">'+$.i18n.prop("Asset.Movetogroup")+'&nbsp;&nbsp;<i class="fa fa-angle-right"></i></a>';
  	}
 	 func_html += '<ul class="list-sub-func fs-12 lh-2 ">';
	if(VOrganizeList && VOrganizeList.length > 0){
	  for (var orgi = 0; orgi < VOrganizeList.length; orgi++) {
			var organize= VOrganizeList[orgi];
			var orgId=organize.id;
			var organizeName=organize.organizeName;
			//if(orgId!=orgid){//判断是否是当前所在组的id
				if(organizeName==="默认组"){
					organizeName =defaultName;
				}
				func_html += '<li><a onclick="moveGroup(\''+imei+'\',\''+orgid+'\',\''+orgId+'\',\''+statuss+'\')" title="'+organizeName+'" >'+organizeName+'</a></li>';
			//}
		}
	}
	 func_html += '</ul>';
	 func_html += '</li>';
  //当状态是未激活和欠费时:把设备详情隐藏，直接显示在设备后面
  if(statuss&&statuss!="inactivated"&&statuss!="inactivated bind"&&statuss!="arrears"&&statuss!="arrears bind"){
 	 func_html += '<li><a title="'+$.i18n.prop("index.DeviceDetail")+'" onclick="toUpdateDeviceIndex(\''+imei+'\',\''+userId+'\')">'+$.i18n.prop("index.DeviceDetail")+'</a></li>';
  }
	  func_html += '</ul>';
	  func_html += '</div>';
  createFuncBox(obj_id,obj,func_html);

  funcBoxPosition(obj,box_id);//设置定位位置
  
  //鼠标移出func-list操作框后，该操作框移出
  $(".func-box").mouseleave(function(){
		$(this).remove();
	});
 
}

/**
 * 移动分组
 * @param imei	imei
 * @param localOrgId 移动前所在组id
 * @param orgid	移动后所在组id
 * @param statuss 状态
 */
function moveGroup(imei,localOrgId,orgId,statuss){
	//在线
	statuss="all";
	$.ajax({
		type:'POST',
		url: _ctx+"/device/moveOrganzie",  
		data:{"imeis":imei,"orgId":orgId,"userId":userId,"searchParentId":searchParentId,"keyword":word},
		async: false,
		cache: false,
		success:function(ret){
			if(ret.code==0){
			// search(statuss); 
				//若移动到的是当前组，直接提示操作成功，不进行其他操作
				if(localOrgId!=orgId){
						 //移动成功后把整个（设备li）追加到（组ul）标签中，再改变要移动到的组显示列表和数量
						 $("#"+imei).appendTo($("#"+orgId+"_ul"));
						 
						//重新绑定点击更多操作事件，把设备组id换为移动到组的id	 
						var morefuc='morefunction(this,'+'\''+imei+'\',\''+orgId+'\',\''+statuss+'\')';
						 $("#device_"+imei).removeAttr("onclick");
						 $("#device_"+imei).attr("onclick",morefuc);
					
						//移动到的组设备数量加1
						var t=$("#vehicleCount_"+orgId).text();
						$("#vehicleCount_"+orgId).text("");
						$("#vehicleCount_"+orgId).text(parseInt(t)+1);
	
						//移动出的组设备数量减1
						var t1=$("#vehicleCount_"+localOrgId).text();
						$("#vehicleCount_"+localOrgId).text("");
						$("#vehicleCount_"+localOrgId).text(parseInt(t1)-1); 
				}
				layer.msg($.i18n.prop("comm.Operationdone"),{icon:1});
				searchCondition("all");
			}else if(ret.code==-2){
				layer.msg($.i18n.prop("comm.NoAccess"),{icon:1});
			}else{
				layer.msg($.i18n.prop("comm.Failed"),{icon:5});
			}
		},
		error:function(e){
			ajaxError("index.jsp",e);
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}

/****************************设备型号设置****************************/
var machine_PageNo = 1;
var machine_pageSize = 10;
var machine_totalRecord = "";

function initMachineTypeNamePaging(param){
	$("#machineTypeName_paging").pagination({
		prevText: $.i18n.prop("page.previous") ,
		nextText: $.i18n.prop("page.next"),
		items: machine_totalRecord,
     	itemsOnPage: machine_pageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param, event){
     		if(event && (event.type=="click" || event.type=="change")){
     			machine_PageNo = pageNumber;
     			machine_pageSize = pageSize;
     			getMachineTypeNameList(machine_PageNo,machine_pageSize,param);
     		}
     	},
     	onInit : function (){
     		$("#machineTypeName_paging").pagination("selectPage",machine_PageNo);
     	}
	});
}



function getMachineTypeNameList(pageNo,intPageSize,param){
	
	if(pageNo){
		machine_PageNo = pageNo;
	}
	if(pageNo){
		machine_pageSize = intPageSize;
	}
	if(!param){
		param = {currentPage:machine_PageNo,pageSize:machine_pageSize};
	}
	param.currentPage = machine_PageNo;
	param.pageSize = machine_pageSize;
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:param,
		url : _ctx + "/machineTypeName/list",
		beforeSend:function(XHR){
			showLoading('machineTypeNameContent');
		},
		complete:function(XHR, TS){
			hideLoading('machineTypeNameContent');
			tableHeaderAutoWidth("#machineTypeNameTableHeader","#machineTypeNameContent");//设备型号设置表头宽度
		},
		success : function(ret) {
			if(ret && ret.code == 0){
				if(ret.data.result && ret.data.result.length>0){
					$("#machineTypeName_tbody").html(template("machineTypeName_tmp",{data:ret.data.result,pageNo:machine_PageNo,pageSize:machine_pageSize}));
					machine_totalRecord = ret.data.totalRecord;
					if(machine_PageNo == 1){
						initMachineTypeNamePaging(param);
					}
					
					$("#machineTypeName_paging").show();
					$("#machineTypeName_nodata").hide();
				}else{
					$("#machineTypeName_tbody").html(template("machineTypeName_tmp",null));
					$("#machineTypeName_paging").hide();
					$("#machineTypeName_nodata").show();
				}
			}else{
				$("#machineTypeName_tbody").html(template("machineTypeName_tmp",null));
				$("#machineTypeName_paging").hide();
				$("#machineTypeName_nodata").show();
			}
		},
		error : function(e) {
			ajaxError("getMachineTypeNameList()", e);
		}
	});
	
}


function setMachineTypeName(id,machineName,pName,mcType){
	$("#id").val(id);
	$("#mcType").val(mcType);
	$("#pName").html(pName);
	$("#machineName").val(machineName);
	
	$("#editMachineModal").modal();
}


$("#saveMachineBtn").click(function(){ 
  	var id = $("#id").val();
  	var machineName = $("#machineName").val();
  	var mcType = $("#mcType").val();
  	$.ajax({
		type:'post',
		url:_ctx+'/machineTypeName/save',
		data:{"id":id,"machineName":machineName,"machineType":mcType},
		success:function(ret){
			if(ret.code==0){
				$("#editMachineModal").modal('hide');
				layer.msg($.i18n.prop("comm.Operationdone"), {time: 2000, icon: 1});
				getMachineTypeNameList();
			}else{
				layer.msg($.i18n.prop("comm.Failed"),{time: 2000, icon: 2});
			}
		},
		complete: function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
});

