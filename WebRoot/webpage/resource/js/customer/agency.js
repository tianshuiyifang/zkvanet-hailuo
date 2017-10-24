$(".js-add-agency").click(function(){
	
	var leftNode = leftTree.getSelectedNodes()[0];
	if(leftNode.type==0){
		layer.msg($.i18n.prop('集团用户不可添加经销商'),{icon:1});	
		return;
	}
	$("#addAgency").modal();
	
	$("#userId").val("");
	$("#agencyName").val("");
	$("#agencyCode").val("");
	$("#agencyAddress").val("");
	$("#agencyMailCode").val("");
	$("#agencyPhone").val("");
	$("#agencyFax").val("");
	$("#agencyContacts").val("");
	$("#agencyContactsName").val("");
	$("#agencyLat").val("");
	$("#agencyLon").val("");
	
	$("#userId").val(leftNode.id);
	$("#addAgencyBtn").show();
	$("#updateAgencyBtn").hide();
	complex_agentcyarea();
});
//区域围栏
$(".js-add-agency-area").click(function(){
	
	var leftNode = leftTree.getSelectedNodes()[0];
	if(leftNode.type==0){
		layer.msg($.i18n.prop('集团用户不可添加区域'),{icon:1});	
		return;
	}
	$("#addAgencyarea").modal();
	
	$("#areaCode").val("");
	$("#areaName").val("");
	$("#areaManager").val("");
	$("#areaRail").val("");
	
	$("#changshangUid").val(leftNode.id);
	$("#addAgencyareaBtn").show();
	$("#updateAgencyareaBtn").hide();
	
	
});
function agencyareaUpdateModal(id,areaName,areaCode,areaManager,areaRail){
	var leftNode = leftTree.getSelectedNodes()[0];
	$("#addAgencyarea").modal();
	$("#addAgencyareaBtn").hide();
	$("#updateAgencyareaBtn").show();
	$("#id").val(id);
	$("#areaName").val(areaName);
	$("#areaCode").val(areaCode);
	$("#areaManager").val(areaManager);
	$("#areaRail").val(areaRail);
	$("#changshangUid").val(leftNode.id);
}
//初始化经销商区域
function complex_agentcyarea(index){
	if(index==null||index==undefined){
		index=0;
	}
	var leftNode = leftTree.getSelectedNodes()[0];
	$.ajax({
		type:"post",
		async: false,
		data:{"id":leftNode.id},
	    cache: false,
		url : _ctx + "rest/geozoneControl/arealist",
		success : function(ret) {
			if (ret.statusCode == 0) {
				if(ret.data){
					$("#agencyArea").html(template("complex_area_options",ret));
					$("select[name='agencyAreaId']").easyDropDown();
					index=$('select[name=agencyAreaId]').find('option').index($('option[value='+index+']'));
					$("select[name='agencyAreaId']").easyDropDown("select",index);
				}
			} else {
				layer.msg($.i18n.prop("comm.Failed"), {icon : 2});
			}
		},
		error : function(e) {
			ajaxError("complex_initDevMcType()", e);
		}
	});
}
function agencyUpdateModal(id){
	
	$("#addAgency").modal();
	$("#addAgencyBtn").hide();
	$("#updateAgencyBtn").show();
	$.ajax({
		type:"post",
		async: true,
	    cache: false,
	    dataType :"json",
		beforeSend:function(XHR){
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
	    data:{"agencyId":id},
	    url:_ctx+"rest/loginController/getSingleAgency",
		success:function(ret){
			if(ret.statusCode==0){
				var data =null;
				if(ret.data!=null){
					$("#userId").val(ret.data.id);
					$("#agencyName").val(ret.data.agencyName);
					$("#agencyCode").val(ret.data.agencyCode);
					$("#agencyAddress").val(ret.data.agencyAddress);
					$("#agencyMailCode").val(ret.data.agencyMailCode);
					$("#agencyPhone").val(ret.data.agencyPhone);
					$("#agencyFax").val(ret.data.agencyFax);
					$("#agencyContacts").val(ret.data.agencyContacts);
					$("#agencyContactsName").val(ret.data.agencyContactsName);
					$("#agencyLat").val(ret.data.agencyLat);
					$("#agencyLon").val(ret.data.agencyLon);
					complex_agentcyarea(ret.data.agencyAreaId);
				}
			}
		},
		error:function(e){
			ajaxError("customer_search.jsp",e);
		}
	});
}
function deleteAgencyarea(id){
	
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:{"areaId":id},
	    url:_ctx+"rest/geozoneControl/areadelete",
		error:function(e){
			ajaxError("customer_search.jsp",e);
		},
		success:function(ret){
			if(ret &&ret.statusCode==0){
				layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});	
				$("#searchArea").click();
			} else if(ret.code==213){
				layer.msg($.i18n.prop('cust.Accountalreadyexists'),{icon:2});	
			} else{
				layer.msg($.i18n.prop('comm.Failed'),{icon:2});   
			}
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}
function deleteAgency(id){
	
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:{"agencyId":id},
	    url:_ctx+"rest/loginController/deleteSingleAgency",
		error:function(e){
			ajaxError("customer_search.jsp",e);
		},
		success:function(ret){
			if(ret &&ret.statusCode==0){
				layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});	
				$("#searchAgency").click();
			} else if(ret.code==213){
				layer.msg($.i18n.prop('cust.Accountalreadyexists'),{icon:2});	
			} else{
				layer.msg($.i18n.prop('comm.Failed'),{icon:2});   
			}
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}
function agencyRail(id){
	
	
	$("#createGeoLand").html("创建围栏");
	$("#mapIframe").contents().find('body').html("");
	$("#createFenceModal").modal();
	$("#mapIframe").attr("src","/zkvanet-hailuo/webpage/geozone/landMarkMap.jsp?id="+id);
    
	
}

function getAgencyPosition(){
	
	
	$("#getPositionTitle").html("选择位置");
	$("#positionmapIframe").contents().find('body').html("");
	$("#getPosition").modal();
	
	$("#positionmapIframe").attr("src","/zkvanet-hailuo/webpage/geozone/agencylandMarkMap.jsp?lat="+$("#agencyLat").val()+"&lon="+$("#agencyLon").val()+"&address="+$("#agencyAddress").val());
	
}

function getAgencyAreaPosition(){
	
	
	$("#createGeoLand").html("选择区域围栏");
	$("#mapIframe").contents().find('body').html("");
	$("#createFenceModal").modal();
	$("#mapIframe").attr("src","/zkvanet-hailuo/webpage/geozone/agencylandareaMarkMap.jsp?id=new");
	
}

function setAddress(address,lat,lon){
	$("#address").val(address);
	$("#lat").val(lat);
	$("#lon").val(lon);
	
}
function saveaddress(){
	
	$("#agencyAddress").val($("#address").val());
	$("#agencyLat").val($("#lat").val());
	$("#agencyLon").val($("#lon").val());
	getAgencyPositionHide();
}
function getAgencyPositionHide(){
	$("#createFenceModal").modal("hide");
}
function createFenceModalHide(){
	$("#createFenceModal").modal("hide");
}
/**
 * 分页
 */
var totalRow=0;
//当前页
var pageCurrent = 1;
//每页条数
var pageSize = 10;
/**
 * 区域分页
 */
var atotalRow=0;
//当前页
var apageCurrent = 1;
//每页条数
var apageSize = 10;

function initAgencyPage(param){
	$("#paging-agency").pagination({
		prevText:$.i18n.prop('comm.Lastpage'),
		nextText:$.i18n.prop('comm.Nextpage'),
		items: totalRow,
     	itemsOnPage: param.pageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param,event){//点击查询指定页数数据
     		if(event && (event.type=="click" || event.type=="change")){
     			pageCurrent = pageNumber;
     			param.pageSize=pageSize;
     			
     			getAgency(pageCurrent,param);
     		}
     	},
     	onInit : function (){//初始化的时候选择页码
     		$("#paging-agency").pagination("selectPage",pageCurrent);
     	}
	});
}
function initareaAgencyPage(param){
	$("#paging-agency-area").pagination({
		prevText:$.i18n.prop('comm.Lastpage'),
		nextText:$.i18n.prop('comm.Nextpage'),
		items: atotalRow,
     	itemsOnPage: param.pageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param,event){//点击查询指定页数数据
     		if(event && (event.type=="click" || event.type=="change")){
     			apageCurrent = pageNumber;
     			param.pageSize=pageSize;
     			
     			getAgencyarea(apageCurrent,param);
     		}
     	},
     	onInit : function (){//初始化的时候选择页码
     		$("#paging-agency-area").pagination("selectPage",pageCurrent);
     	}
	});
}

function getAgency(pageCurrent,param){
	
	if(param.pageSize==undefined){
		param.pageSize=pageSize;
	}
	
	param.pageCurrent=pageCurrent;
	$.ajax({
		type:"post",
		async: true,
	    cache: false,
	    dataType :"json",
		beforeSend:function(XHR){
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
			tableHeaderAutoWidth("#clientTableHeader","#clientTableContent");//设备表格头部自动宽度
		},
	    data:param,
	    url:_ctx+"rest/loginController/getAgency",
		success:function(ret){
			if(ret.statusCode==0){
				var data =null;
				if(ret.data!=null){
					data = {"result":ret.data.list};
					totalRow=ret.data.totalRow;
					initAgencyPage(param);
				}else{
					initAgencyPage(param);
				}
				
				$("#markAgencyTable").html(template('agency-info',data));
				
				checkboxSelectLine("#userAllCheck","#clientTableContent input[type='checkbox']");//选中行背景换色
			
			}
		},
		error:function(e){
			ajaxError("customer_search.jsp",e);
		}
	});
	
}

function getAgencyarea(pageCurrent,param){
	
	if(param.pageSize==undefined){
		param.pageSize=apageSize;
	}
	
	param.pageCurrent=apageCurrent;
	$.ajax({
		type:"post",
		async: true,
	    cache: false,
	    dataType :"json",
		beforeSend:function(XHR){
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
			tableHeaderAutoWidth("#aclientTableHeader","#aclientTableContent");//设备表格头部自动宽度
		},
	    data:param,
	    url:_ctx+"rest/geozoneControl/arealist",
		success:function(ret){
			if(ret.statusCode==0){
				var data =null;
				if(ret.data!=null){
					data = {"result":ret.data};
					//atotalRow=ret.data.totalRow;
					//initareaAgencyPage(param);
				}else{
					//initareaAgencyPage(param);
				}
				
				$("#markAgencyAreaTable").html(template('agency-area-info',data));
				
				checkboxSelectLine("#userAllCheck","#clientTableContent input[type='checkbox']");//选中行背景换色
			
			}
		},
		error:function(e){
			ajaxError("customer_search.jsp",e);
		}
	});
	
}
//区域管理
$("#searchArea").on("click",function(){
	
	
	var id=null;
	var leftNode = leftTree.getSelectedNodes()[0];
	if(id==null){
		id=leftNode.id;
	}
	var param ={"id":id};
	//当前页
	apageCurrent = 1;
	//每页条数
	apageSize = 10;
	atotalRow=0;
	getAgencyarea(pageCurrent,param);
	
})
$("#searchAgency").on("click",function(){
	
	
	searchAgencyFunc();
	
})
function searchAgencyFunc(){
	
	var id=null;
	var leftNode = leftTree.getSelectedNodes()[0];
	if(id==null){
		id=leftNode.id;
	}
	var param ={"id":id};
	//当前页
	pageCurrent = 1;
	//每页条数
	pageSize = 10;
	totalRow=0;
	if($("#searchAgentVal").val()!=""){
		param.agencyName=$("#searchAgentVal").val();
	}
	getAgency(pageCurrent,param);
}


function saveAgency(type){
	
	//基础校验
	var url="";
	if(type=="add"){
		url="rest/loginController/addAgency";
	}else if(type=="update"){
		url="rest/loginController/updateAgency";
	}
	//ajax接口
	var param = {
			"id":$("#userId").val(),
			"agencyName":$("#agencyName").val(),
			"agencyCode":$("#agencyCode").val(),
			"agencyAddress":$("#agencyAddress").val(),
			"agencyMailCode":$("#agencyMailCode").val(),
			"agencyPhone":$("#agencyPhone").val(),
			"agencyFax":$("#agencyFax").val(),
			"agencyContacts":$("#agencyContacts").val(),
			"agencyContactsName":$("#agencyContactsName").val(),
			"agencyLat":$("#agencyLat").val(),
			"agencyLon":$("#agencyLon").val(),
			"agencyAreaId":$("select[name='agencyAreaId']").val(),
			
		};
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:param,
	    url:_ctx+url,
		error:function(e){
			ajaxError("customer_search.jsp",e);
		},
		success:function(ret){
			if(ret &&ret.statusCode==0){
				layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});	
				$("#searchAgency").click();
				$("#addAgency").modal('hide');
				
			} else if(ret.code==213){
				layer.msg($.i18n.prop('cust.Accountalreadyexists'),{icon:2});	
			} else{
				layer.msg($.i18n.prop('comm.Failed'),{icon:2});   
			}
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
	
}
function saveAgencyarea(type){
	
	//基础校验
	var url="";
	if(type=="add"){
		url="rest/geozoneControl/areainsert";
	}else if(type=="update"){
		url="rest/geozoneControl/areaupdate";
	}
	//ajax接口
	var param = {
			"changshagnUserId":$("#changshangUid").val(),
			"areaId":$("#id").val(),
			"areaName":$("#areaName").val(),
			"areaCode":$("#areaCode").val(),
			"areaManager":$("#areaManager").val(),
			"areaRail":$("#areaRail").val(),
			"id":$("#id").val(),
		};
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:param,
	    url:_ctx+url,
		error:function(e){
			ajaxError("customer_search.jsp",e);
		},
		success:function(ret){
			if(ret &&ret.statusCode==0){
				layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});	
				$("#searchArea").click();
				$("#addAgencyarea").modal('hide');
				
			} else if(ret.code==213){
				layer.msg($.i18n.prop('cust.Accountalreadyexists'),{icon:2});	
			} else{
				layer.msg($.i18n.prop('comm.Failed'),{icon:2});   
			}
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}