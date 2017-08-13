var dateType;
var startDate;
var endDate;
var devDateType;
var devStartDate;
var devEndDate;

$(".due-type,.due-timetype,#dueTime,#devDueTime").easyDropDown();
tabs(".all-customer-list", "active", ".right-tab-con",function(i){
	if(i.attr("id") =="allUser"){
		 if(leftTree){
			 var selectNodes = leftTree.getSelectedNodes();
			 var node=selectNodes[0];
			 getUserAndDevNum(node);
			 zTreeOnClick(null, "treeDemo", node);
			 }
		
	}else if(i.attr("id") =="expirationUser"){
	   if(leftExpirationTree){
		   var nodes = leftExpirationTree.getSelectedNodes();
		   var node=nodes[0];
		   getUserAndDevNum(node);
		   expirationzTreeOnClick(null,"treeDemo7",node);
		   }
	}	
});
tabs(".tab-nav-customer", "active", ".tab-customer-con");
tabs("#EC_list", "active", ".tab-con");
$("#devAllCheck,#userAllCheck,#expirationDevAllCheck").iCheck();

//页面高度自适应
(function($){
	var a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,z,all_tree_h,expired_tree_h,device_table_h,client_table_h,expired_table_h;

	//切换左侧选项卡刷新树高度
	function allExpiredTreeHeight(){
		a = $(window).height();
		b = $(".header").outerHeight();
		c = $(".menu-seach").outerHeight();
		z = $(".footer").outerHeight();
		d = $(".customer-leftsidebar").outerHeight() - $(".customer-leftsidebar").height();
		e = $(".side-subtitle").outerHeight();
		f = $("#cusType").outerHeight(true);
		g = $("#overdueType").outerHeight(true);
		h = $(".all-customers-box .side-tree-box").outerHeight() - $(".all-customers-box .side-tree-box").height();
		i = $(".expired-customers-box .side-tree-box").outerHeight() - $(".expired-customers-box .side-tree-box").height();
		j = $(".all-customers-box .tree-search").outerHeight(true);

		all_tree_h = a - b - c - z - d - e - f - h - j;
		expired_tree_h = a - b - c - z - d - e - f - g - i;

		$(".all-customers-box .tree-scroll").css("height",all_tree_h);
		$(".expired-customers-box .tree-scroll").css("height",expired_tree_h);
	}

	//过期表格高度
	function expiredTabelHeight(){
		k = ($(".customer-rightsidebar").outerHeight() - $(".customer-rightsidebar").height()) + ($(".customer-con-box").outerHeight() - $(".customer-con-box").height());
		l = $(".basic-info").outerHeight();
		m = $(".expired-con-box .drop-list").outerHeight();
		n = $(".expired-con-box>.func").outerHeight();
		o = $(".expired-con-box>.table-header").outerHeight();
		expired_table_h = a - b - c - z - k - l - m - n - o;

		($.browser.mozilla) ? expired_table_h -= 1 : expired_table_h;

		$(".expired-con-box .table-scrollbar").css("height",expired_table_h);
	}

	//切换右侧选项卡刷新表格高度
	function deviceClientTableHeight(){
		p = $(".main-tab .tab-navbar").outerHeight();
		q = $(".device-con-box>.func").outerHeight();
		r = $(".client-con-box>.func").outerHeight();
		s = $(".device-con-box>.table-header").outerHeight();
		t = $(".client-con-box>.table-header").outerHeight();

		device_table_h = a - b - c - z - k - l - p - q - s;
		client_table_h = a - b - c - z - k - l - p - r - t;

		$(".device-con-box .table-scrollbar").css("height",device_table_h);
		$(".client-con-box .table-scrollbar").css("height",client_table_h);

	}

	//设备客户表格头部自动宽度
	function deviceClientTableHeaderAutoWidth(){
		tableHeaderAutoWidth("#deviceTableHeader","#deviceTableContent");//设备表格头部自动宽度
		tableHeaderAutoWidth("#clientTableHeader","#clientTableContent");//客户表格头部自动宽度
	}

	//动态改变尺寸方法集合
	function sizeChangeCollective(){
		allExpiredTreeHeight();
		expiredTabelHeight();
		deviceClientTableHeight();
		deviceClientTableHeaderAutoWidth();//设备客户表格头部自动宽度
		tableHeaderAutoWidth("#expiraTableHeader","#expiraTableContent");//过期表格头部自动宽度
	}

	//左侧选项卡
	tabs(".tab-nav-customer", "active", ".tab-customer-con",function(){
		setTimeout(function(){
			sizeChangeCollective();
		},50);
		
	});

	//过期选项卡
	tabs(".all-customer-list", "active", ".right-tab-con",function(){
		sizeChangeCollective();
	});

	//右侧选项卡
	tabs(".js-equipment-tab-nav", "active", ".tab-con",function(){
		deviceClientTableHeaderAutoWidth();//设备客户表格头部自动宽度
		deviceClientTableHeight();
	});

	//浏览器窗口大小变化尺寸自适应
	$(window).resize(function(){
		if($(window).height()>500){
			sizeChangeCollective();
		}
	});

})(jQuery);

$("#expirationUser").one("click",function(){
	getDueTimeId();
	$("#"+dueTimeId).easyDropDown('select',1);
	$("#"+devDueTimeId).easyDropDown('select',1);
});

//到期用户树setting
var setting_expiration;
var leftExpirationTree;
var leftExpirationTreeNodes;
var _ctx;
var currUserId;
function loadExpirationTree(){
	$("#noData").hide();
	$("#ExpirationTreeLogindata").show();
	$("#treeDemo7").hide();
	
	setDateType();
	setEndDate();
	getUserTreeNodes();
}

function getUserTreeNodes() {
	$.ajax({
		type : "post",
		async : true,
		cache : false,
		dataType : "json",
		data : {"dateType":dateType,"startDate":startDate,"endDate":endDate},
		url : _ctx + "/customer/getOrgExpireUserTree",
		error:function(e){
			ajaxError("customer_search.jsp",e);
		},
		success : function(ret) {
			if (ret.code == 0) {
				if(ret.data&&ret.data.length>0){
					$("#noData").hide();
					$.each(ret.data,function(i, v) {
							if (v.type == 0) {
								v.typeName = $.i18n.prop('cust.Manager');
							} else if (v.type == 8 || v.type == 10) {
								v.typeName = $.i18n.prop('cust.Distributor');
							} else if (v.type == 9) {
								v.typeName = $.i18n.prop('cust.User');
							} else if (v.type == 11) {
								v.typeName = $.i18n.prop('cust.Sale');
							} else {
								v.typeName = $.i18n.prop('cust.User');
							}
							var countNumber;
							if($("#dueTimeType").val()==$.i18n.prop('cust.AboutToExpire')){
								countNumber=v.deviceCount.aboutToExpire;
							}else{
								countNumber=v.deviceCount.expired;
							}
							if (currUserId == v.id) {
								v.name = v.name + "("
										+ $("#dueTimeType").val()
										+ countNumber + "/"
										+ $.i18n.prop('cust.total')
										+ v.deviceCount.repertory + ")";
							} else {
								v.name = v.name + "(" + countNumber
										+ "/" + v.deviceCount.repertory + ")";
							}
					});
					userNodes = ret.data;
					
					setting_expiration = {
						async : {
							enable : true,
							type : "post",
							contentType : "application/x-www-form-urlencoded",
							url : _ctx + "/customer/getLowerExpireUserTree",
							autoParam : [ "id=parentId", "fullParentId=fullParentId" ],
							otherParam: {"dateType":dateType,"startDate":startDate,"endDate":endDate},
							dataFilter : ajaxDataFilter
						},
						view : {
							showLine : false,
							showTitle : true
						},
						data : {
							simpleData : {
								enable : true
							},
							keep : {
								parent : true
							},
							key : {
								name : "name",
								title : "typeName"
							}
						},
						callback : {
							onClick : expirationzTreeOnClick, 
							onAsyncSuccess : zTreeOnAsyncSuccess
						}
					};
				}else{
					$("#noData").show();
					userNodes=null;
					$('#markExpirationDevTable').empty();
					$("#logindata-expiration-dev").hide();
					$("#paging-expiration-dev").hide();
					$("#expiraTableContent").hide();
					$("#expiration-dev-noData").show();
				}
			}

			var rootNode = null;
			leftExpirationTreeNodes=null;
			if(userNodes){
				leftExpirationTree = $.fn.zTree.init($("#treeDemo7"), setting_expiration,userNodes); //初始化左侧到期用户树
				leftExpirationTreeNodes = userNodes;
				$("#treeDemo7").show();
				rootNode = leftExpirationTree.getNodeByParam("id",loginUserId,null);
			}else{
				$("#treeDemo7").hide();
				$("#devDueType").easyDropDown('select',$("#dueType option:selected").index());
				$("#devDueTimeType").easyDropDown('select',$("#dueTimeType option:selected").index());
				$("#"+devDueTimeId).easyDropDown('select',$("#"+dueTimeId+" option:selected").index());
			}
			$("#ExpirationTreeLogindata").hide();
			if(rootNode){
				if(rootNode.fullParentId){
					fullParentId = rootNode.fullParentId;
				}else{
					fullParentId = "";
				}
				leftExpirationTree.selectNode(rootNode);
				
				expirationzTreeOnClick("", "", rootNode);
			}
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}

var expirationParentId;
var expitationSearchPid;
var isUpdateDev=1;
function expirationzTreeOnClick(event, treeId, treeNode) {
	expirationParentId = treeNode.id;
	expitationSearchPid = treeNode.pId;
	if(treeNode.fullParentId){
		fullParentId = treeNode.fullParentId;
	}else{
		fullParentId = "";
	}
	if($("#expirationUser").hasClass("active")){
		getUserAndDevNum(treeNode);	//加载头部数据
	}
	if(expirationParentId==userId){
		$("#ProlongUserExpiration").hide();
	}else{
		$("#ProlongUserExpiration").show();
	}

	isUpdateDev=0;
	$("#devDueType").easyDropDown('select',$("#dueType option:selected").index());
	$("#devDueTimeType").easyDropDown('select',$("#dueTimeType option:selected").index());
	setEndDate();
	getDueTimeId();
	$("#"+devDueTimeId).easyDropDown('select',$("#"+dueTimeId+" option:selected").index());
	isUpdateDev=1;
	initExpirationDevTable();
};

function initExpirationDevTable(param){
	
	$("#expirationUser").addClass("active");
	return true;
	setDateType();
	setEndDate();
	if(isUpdateDev==1&&$("#expirationUser").hasClass("active")){
		if(leftExpirationTreeNodes){
			var sn;
			var devName;
			var orgId;
			if(!param){
				param = {"dateType":devDateType,"startDate":devStartDate,"endDate":devEndDate,"dayNum":dayNum,"userId":expirationParentId,"devName":devName,"sn":sn,"orgId":orgId,"isActivation":isActivation,"parentId":expitationSearchPid};
				expirationDevPageNo=1;
			}
			param.pageSize=expirationDevPageSize;
			param.pageCurrent=expirationDevPageNo;

			$("#expiration-dev-noData").hide();
			$("#expiraTableContent").hide();
			$("#logindata-expiration-dev").show();
			$("#expirationDevAllCheck").iCheck('uncheck');
			$("#paging-expiration-dev").hide();
			
			$.ajax({
				type:'get',
				url:_ctx+"rest/deviceControl/list",  
				async:true, 
				cache:false,
				complete:function(XMLHttpRequest, textStatus){
					authorityValide(XMLHttpRequest);
					tableHeaderAutoWidth("#expiraTableHeader","#expiraTableContent");//过期表格头部自动宽度
				},
				data:param,
				error:function(e){
					ajaxError("customer_search.jsp",e);
				},  
				success:function(returnData){
					
					if(returnData.code==0 && returnData.data && returnData.data.result&&$("#expirationUser").hasClass("active")){
						$.each(returnData.data.result,function(i,v){
							if(v.expirationStr){
								expiratedDaysNum = getExpirateDaysNum(v.expirationStr);
								if(expiratedDaysNum){
									v.expirationStr = v.expirationStr.substring(0,v.expirationStr.indexOf('('))+'('+$.i18n.prop('cust.dayExpired').replace('()',expiratedDaysNum)+')';
								}else{
									v.expirationStr = v.expirationStr.replace('已过期',$.i18n.prop('cust.Expired')).replace('正常使用',$.i18n.prop('cust.NormalUse'));
								}
							}
							if(v.userExpirationStr){
								expiratedDaysNum = getExpirateDaysNum(v.userExpirationStr);
								if(expiratedDaysNum){
									v.userExpirationStr = v.userExpirationStr.substring(0,v.userExpirationStr.indexOf('('))+'('+$.i18n.prop('cust.dayExpired').replace('()',expiratedDaysNum)+')';
								}else{
									v.userExpirationStr = v.userExpirationStr.replace('已过期',$.i18n.prop('cust.Expired')).replace('正常使用',$.i18n.prop('cust.NormalUse'));
								}
							}
						});//替换过期时间文字说明
						var data = {"result":returnData.data.result,"userType":SESSION_LOGIN_USER_type,"pageNo":expirationDevPageNo,"pageSize":expirationDevPageSize};
						$('#markDevTable').empty();
						$('#markExpirationDevTable').html(template('dev-info',data));//装填数据
						$("input[name='devCheck']").iCheck().on('ifUnchecked',function(event){//取消全选
							$("#expirationDevAllCheck").iCheck("uncheck");
						}).on('ifChecked',function(event){//检查全选
							var allCheckNum = $("input[name='devCheck']").length;
							var CheckNum = 0;
							$.each($("input[name='devCheck']"),function(i,v){
								if($(v).attr("checked")){
									CheckNum++;
								}
							});
							if(CheckNum == allCheckNum){
								$("#expirationDevAllCheck").iCheck("check");
							}
						});
						$("#logindata-expiration-dev").hide();
						checkboxSelectLine("#expirationDevAllCheck","#expiraTableContent input[type='checkbox']");//选中行背景换色
						expirationDevTotalRecord = returnData.data.totalRecord;//分页
						if(expirationDevPageNo == 1){
							initExpirationDevPage(param);
						}
						if(expirationDevTotalRecord!=0){
							$("#paging-expiration-dev").show();
							$("#expiraTableContent").show();
							$("#expiration-dev-noData").hide();
						}else{
							$("#paging-expiration-dev").hide();
							$("#expiraTableContent").hide();
							$("#expiration-dev-noData").show();
						}
					}
				}
			});
		}else{
			$('#markExpirationDevTable').empty();
			$("#logindata-expiration-dev").hide();
			$("#paging-expiration-dev").hide();
			$("#expiraTableContent").hide();
			$("#expiration-dev-noData").show();
		}
	}
}

/**
 * 到期设备分页
 */
var expirationDevTotalRecord=0;
//到期设备当前页
var expirationDevPageNo = 1;
//到期设备每页条数
var expirationDevPageSize = 10;

function initExpirationDevPage(param){
	$("#paging-expiration-dev").pagination({
		prevText:$.i18n.prop('comm.Lastpage'),
		nextText:$.i18n.prop('comm.Nextpage'),
		items: expirationDevTotalRecord,
     	itemsOnPage: expirationDevPageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param, event){//点击查询指定页数数据
     		if(event && (event.type=="click" || event.type=="change")){
     			expirationDevPageNo = pageNumber;
     			expirationDevPageSize = pageSize;
         		initExpirationDevTable(param);
     		}
     	},
     	onInit : function (){//初始化的时候选择页码
     		$("#paging-expiration-dev").pagination("selectPage",expirationDevPageNo);
     	}
	});
}

$("input[name='radio-user-device']").iCheck();

$(".language,#timeZones").easyDropDown();

$(".tab-nav li").click(function(){
	if($(this).index()==0){
		$(".js-user-toggle").hide();
		$(".js-device-toggle").show();
	}else{
		$(".js-user-toggle").show();
		$(".js-device-toggle").hide();	
	}
});


function initRemovAndSearchGroup(){
	//getGroupList();
	$("#markGroup").html(template("group-info",groupList));
	
	$(".userGroup").easyDropDown();
	$(".userGroup").easyDropDown().change(function(){//组改变时加载设备
		devPageNo = 1;
		initDevTable(devPageNo);
	});
}

//ztree
var setting = {
	async: {
		enable: true,
		type: "post",
		contentType: "application/x-www-form-urlencoded",
		url: _ctx + "/customer/getLowerUser",
		autoParam: ["id=parentId","fullParentId=fullParentId"],
		dataFilter: ajaxDataFilter
	},	
	view: {
		showLine: false,
		showTitle:true
	},
	data: {
		simpleData: {
			enable: true
		},
		keep: {
			parent: true
		},
		key: {
			name:"name",
			title:"typeName"
		}
	},
	callback:{
		onClick : zTreeOnClick,
		onAsyncSuccess: zTreeOnAsyncSuccess,
		beforeClick: complex_zTreeBeforeClick
	}
};

function zTreeOnAsyncSuccess(event, treeId, treeNode, msg){
	if(treeNode.children.length == 0){
		var newTreeObj =  $.fn.zTree.getZTreeObj(treeId);
		treeNode.isParent = false;
		newTreeObj.updateNode(treeNode);
	}
	locationUser(locationUserId,locationParent,treeId);
	if(treeId == "treeDemo2"){
		disableNode(treeId,$("#userId").val());
	}
//	if(treeNode.children && treeNode.children.length>0 && treeNode.iconSkin == "ptuser"){
//		treeNode.iconSkin = "onepoxy";
//		leftTree.updateNode(treeNode,false);
//	}
	if(isCallbackNode==1){
		var node = leftExpirationTree.getNodeByParam("id", CallbackNodeId, null);
		if(node){
			leftExpirationTree.selectNode(node);
		}else{
			leftExpirationTree.selectNode(leftExpirationTree.getNodeByParam("id", userId, null));
		}
		isCallbackNode=0;
	}
}

var asyncNode = "";
function ajaxDataFilter(treeId, parentNode, responseData){
	$.each(responseData.data,function(i,v){
		if(treeId == "treeDemo3"){
			if(v.type == 11){
				v.chkDisabled = true;
			}
		}
		if(v.type == 0){
			v.typeName = $.i18n.prop('cust.Manager');
		}else if(v.type == 8 || v.type == 10){
			v.typeName = $.i18n.prop('cust.Distributor');
		}else if(v.type == 9){
			v.typeName = $.i18n.prop('cust.User');
		}else if(v.type == 11){
			v.typeName = $.i18n.prop('cust.Sale');
		}else{
			v.typeName = $.i18n.prop('cust.User');
		}
		var countNumber;
		if($("#dueTimeType").val()==$.i18n.prop('cust.AboutToExpire')){
			countNumber=v.deviceCount.aboutToExpire;
		}else{
			countNumber=v.deviceCount.expired;
		}
		v.name = v.name + "(" + countNumber	+ "/" + v.deviceCount.repertory + ")";
		v.countStr = "(" + countNumber	+ "/" + v.deviceCount.repertory + ")";
	});
	asyncNode = parentNode;
	return responseData.data;
}

var searchPid = "";
var treeNodeToComplexQuery="";
//点击树结构 TODO
function zTreeOnClick(event, treeId, treeNode) {
	if(treeNode.type==9){
//		$("#extensionuponexpire").hide();
//		$("#prolongLifeExpire").hide();
		//$(".js-update").show();
		//隐藏新建客户功能 用户不能建
		$(".js-add-role").hide();
		
	}else{
		
//		$("#prolongLifeExpire").show();
//		$("#extensionuponexpire").show();
		//$(".js-update").hide();
		$(".js-add-role").show();
		
	}
	if($('#searchAgency').hasClass('active')){
		$("#searchAgency").click();
	}
	var treeObj = $.fn.zTree.getZTreeObj(treeId); 
	treeObj.selectNode(treeNode);
	parentId = treeNode.id;
	searchPid = treeNode.pId;
	if(treeNode.fullParentId){
		fullParentId = treeNode.fullParentId;
	}else{
		fullParentId = "";
	}
	treeNodeToComplexQuery=treeNode;
	//防止编辑用户的时候，点击树重新加载了用户设备列表
	if(treeId=="treeDemo"){
		getUserAndDevNum(treeNode);
		if($("#markUser").hasClass('active')){
			searchUser();
		}else{
			initDevTableAndPage(true);
		}
	}


	//点击编辑新增中的树的时候，把上级用户的信息显示出来
	if(treeId == "treeDemo2"){
		getIdAndName(null,treeId,treeNode);
	}
};

function getUserAndDevNum(param){
	
	var node = param;
	if(!node){
		var nodes = leftTree.getNodesByParam("id", parentId, null);
		if(nodes && nodes.length>0){
			$.each(nodes,function(i,v){
				if(v.fullParentId == fullParentId){
					node = v;
				}
			});
		}
	}
	var account_name = node.name.split("(")[0];
	
	$("#user_account").text(node.nickName).attr("title",node.nickName);
	$("#userAccount").text(node.account).attr("title",node.account);
	$("#index_userId").val(node.id);
	$("#index_account").val(node.name);
	$("#index_parentId").val(node.pId);

	var userType=node.type;
	if(userType=="0"){
		userType=$.i18n.prop('cust.Manager');
	}else if(userType == "8" || userType == "10"){
		userType=$.i18n.prop('cust.Distributor');
	}else if(userType=="9"){
		userType=$.i18n.prop('cust.User');
	}else if(userType=="11"){
		userType=$.i18n.prop('cust.Sale');
	}else{
		userType=$.i18n.prop('cust.User');
	}
	//管理员将编辑按钮隐藏
	if(currUserId==node.id){
		$("#editUserFast").hide();
	}else{
		$("#editUserFast").show();
	}
	
	$("#userType").html(userType).attr("title",userType);
	
	if(node.phone){
		$("#user_phone").html(node.phone).attr("title",node.phone);
	}else{
		$("#user_phone").html("").attr("title","");
	}
	var color = "mark-client";
	if(node.type == 8 || node.type == 10){
		color = "mark-agents";
	}else if(node.type == 11){
		color = "mark-sales";
	}else if(node.type == 0){
		color = "mark-admin";
	}
	$("#user_type").attr("class","media-left fs-40 "+color);
	$.post(_ctx+"rest/deviceControl/getUserAndDevNum",{"userId":node.id,"fullParent":fullParentId,"searchType":"simple"},function(ret){
		if(ret.code == 0){
			result = ret.data;
			$("#stock").text(result.stock);
			$("#receiving").text(result.receiving);
			$("#active").text(result.active);
			$("#noActive").text(result.noactive);
			$("#onLine").text(result.onLineNum);
			$("#noOnLine").text(result.offLineNum);
			
			highlightColor(result.expired>0,"#devExpired","c-red fw-b");
			$("#devExpired").text(result.expired);
			
			highlightColor(result.aboutToExpire>0,"#devExpiring","c-ff8d00 fw-b");
			$("#devExpiring").text(result.aboutToExpire);
		}
	},"json");
}

//高亮颜色
function highlightColor(flag,ele,cla){
	flag ? $(ele).addClass(cla) : $(ele).removeClass(cla);
}

var setting_radio = {
	async: {
		enable: true,
		type: "post",
		contentType: "application/x-www-form-urlencoded",
		url: _ctx + "/customer/getLowerUser",
		autoParam: ["id=parentId","fullParentId=fullParentId"],
		dataFilter: ajaxDataFilter
	},
	view: {
		showLine: false,
		//showIcon: false
	},
	data: {
		simpleData: {
			enable: true
		},
		key: {
			name:"name",
			title:"typeName"
		}
	},
	callback:{
		beforeCheck : unCheck,
		onCheck: getIdAndName,
		beforeClick: zTreeBeforeClick,
		onClick: getIdAndName,
		onAsyncSuccess: zTreeOnAsyncSuccess
	}
};

function unCheck(treeId, treeNode){
	if(treeNode.checked){
		return false;
	}else{
		return true;
	}
}

var setting_radio_dev = {
		async: {
			enable: true,
			type: "post",
			contentType: "application/x-www-form-urlencoded",
			url: _ctx + "/customer/getLowerUser",
			autoParam: ["id=parentId","fullParentId=fullParentId"],
			dataFilter: ajaxDataFilter
		},
		view: {
			showLine: false,
		},check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		data: {
			simpleData: {
				enable: true
			},
			key: {
				name:"name",
				title:"typeName"
			}
		},
		callback:{
			beforeClick: zTreeBeforeClick,
		}
	};
function getIdAndName(event, treeId, treeNode) {
	 if(treeNode.chkDisabled == true){
		 return false;
	 }
	 var treeObj = $.fn.zTree.getZTreeObj(treeId);
	 //如果checkbox/radio未被选中则添加选中
	 if(!treeNode.checked){
		 treeObj.checkNode(treeNode, true, true);
	 }
	 //选中节点文本。
	 treeObj.selectNode(treeNode,false);
	 $("#parentId").val(treeNode.id);
	 $("#topUser").val(treeNode.nickName);
	 $("#fullParentId").val(treeNode.fullParentId);
};
var setting_checkbox = {
	async: {
		enable: true,
		type: "post",
		contentType: "application/x-www-form-urlencoded",
		url: _ctx + "/customer/getLowerUser",
		autoParam: ["id=parentId","fullParentId=fullParentId"],
		dataFilter: ajaxDataFilter
	},
	view: {
		showLine: false,
		//showIcon: false
	},check: {
		enable: true,
		chkStyle: "checkbox",
		radioType: "all",
		chkboxType: { "Y" : "", "N" : "" }
	},
	data: {
		simpleData: {
			enable: true
		},
		key: {
			name:"name",
			title:"typeName"
		}
	},
	callback:{
		beforeClick: zTreeBeforeClick
	}
};
function zTreeBeforeClick(treeId, treeNode, clickFlag){
	if(treeId == "treeDemo5" ){
		return false;
	}
	if(treeId == "treeDemo2"){
		if(treeNode.chkDisabled){
			return false;
		}else{
			return true;
		}
	}
}

function updateNodes(highlight) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo7");
	var allNode = zTree.transformToArray(zTree.getNodes());
	zTree.hideNodes(allNode);
	for(var n in nodeList){
		findParent(zTree,nodeList[n]);
	}
	zTree.showNodes(nodeList);
}

function findParent(zTree,node){
	//zTree.expandNode(node,true,false,false);
	var pNode = node.getParentNode();
	if(pNode != null){
		nodeList.push(pNode);
		findParent(zTree,pNode);
	}
}

function getFontCss(treeId, treeNode) {
	return (!!treeNode.highlight) ? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
}
function filter(node) {
	return !node.isParent && node.isFirstNode;
}
var userNodes;
var userType = "",parentId = "" , fullParentId = "";
if(!parentId){
	parentId = currUserId;
}
var leftTree ;
//TODO 树加载
$(document).ready(function(){
	//批量更新提示
	if(batchUpdate){
		if(batchUpdate == -1){
			layer.msg($.i18n.prop('comm.Failed'),{icon:2});
		}else{
			layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});
			if(batchUpdateFailInfo&&batchUpdateFailInfo.length>0){
				var failInfos = batchUpdateFailInfo.split(",");
				var data = [];
				for(var i=0;i<failInfos.length;i++){
					var failInfo = failInfos[i].split(":");
					var row = {"imei":failInfo[0],"failReason":failInfo[1],"rowNumber":failInfo[2],"columnNumber":failInfo[3]};
					data[i]=row;
				}
				$("#batchUpdateDevFailImei").html(template("batchImportFailed_tmp",{"data":data}));
				$("#batchUpdateDevSuccess").html(batchUpdateSuccNumber);
				$("#batchUpdateDevFail").html(data.length);
				layerIndex = layer.open({
					type: 1,
					area: ['500px'],
					shade: false,
					title: false, //不显示标题
					content: $('#batchUpdate'), //捕获的元素
				});
			}
		}
	}
	$("#ProlongUserExpiration").hide();
	$("#extensionuponexpire").hide();
	$("#dev-noData").hide();
	userValid();
	$("#treeDemo").initCustomTree({
		treeType : "stock_repertory",
		head_userId : currUserId, 
		chkOrNot : false,
		onClick : zTreeOnClick,
		onClickFlag : false,
		ajaxDataFilter : stock_ajaxDataFilter
	});
	leftTree = $.fn.zTree.getZTreeObj("treeDemo"); 
	var locationUser = location_User;
	if(locationUser){
		locationUser = eval('('+locationUser+')');
		complex_locationUser(locationUser.userId, locationUser.fullParent, "treeDemo", null);
	}else{
		var node = leftTree.getNodes()[0];
		zTreeOnClick(null,"treeDemo",node);
	}
	
	if($("#isDueCustomer").val()==1){
		getDueTimeId();
		$("#"+dueTimeId).easyDropDown('select',1);
		tableHeaderAutoWidth("#expiraTableHeader","#expiraTableContent");
	}
	if($("#isDueCustomer").val()==2){
		$("#dueTimeType").easyDropDown('select',1);
		tableHeaderAutoWidth("#expiraTableHeader","#expiraTableContent");
	}
});

//用户-用户全局搜索 
$("#treeDemo_cusTreeSearchBtn").click(function(){
	globalSearchCustomerTree($("#treeDemo_cusTreeKey"),userId,true,"treeDemo",null);
});
$("#treeDemo_cusTreeKey").keydown(function(e){
	if(e.keyCode == 13){
		globalSearchCustomerTree($("#treeDemo_cusTreeKey"),userId,true,"treeDemo",null);
	}
});
//新增用户-用户全局搜索  
$("#treeDemo2_cusTreeSearchBtn").click(function(){
	globalSearchCustomerTree($("#treeDemo2_cusTreeKey"),userId,false,"treeDemo2",globalSearchCustomerTree_callback);
});
$("#treeDemo2_cusTreeKey").keydown(function(e){
	if(e.keyCode == 13){
		globalSearchCustomerTree($("#treeDemo2_cusTreeKey"),userId,false,"treeDemo2",globalSearchCustomerTree_callback);
	}
});

if($("#isDueCustomer").val()!=""&&$("#isDueCustomer").val()!=null&&$("#isDueCustomer").val()!=0){
	isUpdateDev=0;
	$("#expirationUser").click();
	isUpdateDev=1;
}

/**
 * 分页
 */
var totalRecord=0;
//当前页
var pageNo = 1;
//每页条数
var pageSize = 10;

/**
 * 用户列表分页插件初始化
 */
function initUserPage(param,userType,parentId){
	$("#pagingCustomer").pagination({
		prevText:$.i18n.prop('comm.Lastpage'),
		nextText:$.i18n.prop('comm.Nextpage'),
		items: totalRecord,
     	itemsOnPage: pageSize,
     	param:param,
     	onPageClick: function(pageNumber,size,param,event){
     		if(event && (event.type=="click" || event.type=="change")){
         		pageNo = pageNumber;
         		pageSize=size;
         		getUserList(userType,parentId,pageNo,param);
     		}
     	},
     	onInit : function (){
     		$("#pagingCustomer").pagination("selectPage",pageNo);
     	}
	});
}

var dayNum = "";
var isActivation = "";

/**
 * 分页
 */
var devTotalRecord=0;
//当前页
var devPageNo = 1;
//每页条数
var devPageSize = 10;

/**
 * 设备列表分页插件初始化
 */
function initDevPage(param){
	$("#paging-dev").pagination({
		prevText:$.i18n.prop('comm.Lastpage'),
		nextText:$.i18n.prop('comm.Nextpage'),
		items: devTotalRecord,
     	itemsOnPage: devPageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param,event){//点击查询指定页数数据
     		if(event && (event.type=="click" || event.type=="change")){
     			devPageNo = pageNumber;
     			devPageSize=pageSize;
         		initDevTable(devPageNo,param);
     		}
     	},
     	onInit : function (){//初始化的时候选择页码
     		$("#paging-dev").pagination("selectPage",devPageNo);
     	}
	});
}

function initDevTableAndPage(flag){
	if(flag){
		initRemovAndSearchGroup();
	}
	$(".userGroup").easyDropDown("select",0);
}



//设备列表
function initDevTable(devPageNo,param){
	var  searchSnImei=$("input[name='searchSnImei']:checked").val();	
	var  searchSnImeiVal=$("#searchSnImeiVal").val().replace(/(^\s+)|(\s+$)/g,"");
	if(searchSnImeiVal){
		$("#searchSnImeiVal").select();
	}
	var devName;
	var sim;
 		
	if(searchSnImei=="imei"){
		devName=searchSnImeiVal;
	}
	if(searchSnImei=="sim"){
		sim=searchSnImeiVal;
	}
	if(devPageNo){
		devPageNo=devPageNo;
	}

	if(!param){
		param = {"pageCurrent":devPageNo,"pageSize":devPageSize,"dayNum":dayNum,"belongUserId":parentId,"imei":devName,"sim":sim,"orgId":$(".userGroup").val(),"activStatus":$(".isActivation").val(),"parentId":searchPid};
	}
	//if(param.parentId==undefined||param.parentId=="")param.belongUserId="";
	param.pageCurrent = devPageNo;
	param.pageSize = devPageSize;

	$("#dev-noData").hide();
	$("#devAllCheck").iCheck('uncheck');
	
	$.ajax({
		type:'get',
		url:_ctx+"rest/deviceControl/list",  
		async:true, 
		cache:false,
		beforeSend:function(XHR){
			$("#markDevTable").hide();
			$("#dev-noData").hide(); 
			$("#devloading").show();
			$("#paging-dev").hide();
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
			
			$("#markDevTable").show();
			$("#devloading").hide();
			
			tableHeaderAutoWidth("#deviceTableHeader","#deviceTableContent");//设备表格头部自动宽度
		},
		data:param,
		error:function(e){
			ajaxError("customer_search.jsp",e);
		},  
		success:function(returnData){
			if(returnData.code==0 && returnData.data && returnData.data.result&&$("#allUser").hasClass("active")){
				var expiratedDaysNum = "";
				$.each(returnData.data.result,function(i,v){
					if(v.expirationStr){
						expiratedDaysNum = getExpirateDaysNum(v.expirationStr);
						if(expiratedDaysNum){
							v.expirationStr = v.expirationStr.substring(0,v.expirationStr.indexOf('('))+'('+$.i18n.prop('cust.dayExpired').replace('()',expiratedDaysNum)+')';
						}else{
							v.expirationStr = v.expirationStr.replace('已过期',$.i18n.prop('cust.Expired')).replace('正常使用',$.i18n.prop('cust.NormalUse'));
						}
					}
					if(v.userExpirationStr){
						expiratedDaysNum = getExpirateDaysNum(v.userExpirationStr);
						if(expiratedDaysNum){
							v.userExpirationStr = v.userExpirationStr.substring(0,v.userExpirationStr.indexOf('('))+'('+$.i18n.prop('cust.dayExpired').replace('()',expiratedDaysNum)+')';
						}else{
							v.userExpirationStr = v.userExpirationStr.replace('已过期',$.i18n.prop('cust.Expired')).replace('正常使用',$.i18n.prop('cust.NormalUse'));
						}
					}
				});//替换过期时间文字说明
				var data = {"result":returnData.data.result,"userType":SESSION_LOGIN_USER_type,"pageNo":devPageNo,"pageSize":devPageSize};
				$('#markExpirationDevTable').empty();
				$('#markDevTable').html(template('dev-info',data));//装填数据
				$("[name=show-question]").popover({
					placement: "top",
					trigger: 'hover',
					content:  $.i18n.prop("Alert.Reminder")
				});
				
				checkboxSelectLine("#devAllCheck","#deviceTableContent input[type='checkbox']");//选中行背景换色
				
				devTotalRecord = returnData.data.totalRecord;//分页
				if(devPageNo == 1){
					initDevPage(param);
				}
				if(devTotalRecord!=0){
					$("#paging-dev").show();
					$("#dev-noData").hide();
				}else{
					$("#paging-dev").hide();
					$("#dev-noData").show();
				}
			}
			 if(!parentId || parentId == currUserId){//不是当前登陆用户则隐藏组
				$(".markTableGroup").show();
				$(".userGroup").show();
				$("#markGroup").show();
				$("#markRemov").show();
			}else{
				$(".markTableGroup").hide();
				$("#markGroup").hide();
				$("#markRemov").hide();
			}			
		}
	});
}

/**
 * 按过期时间查询设备
 */
function devTabQuery(param){
	dayNum = param;
	isActivation = "";
	initDevTableAndPage();
}

function serverCreateTimeQuery(param){
	isActivation = param;
	dayNum = "";
	initDevTableAndPage();
}

/**
 * 生成分配窗口选中的设备列表
 */
function initAllotTabel(imeis,table,tmpId){
	var flag = 0;

	$.ajax({
		type:"post",
		async: false,
	    cache: false,
		data:{"ids":imeis},
		url:_ctx+"/device/getDevInfoByImei",
		error:function(e){
			ajaxError("customer_search.jsp",e);
		},
		success:function(ret){
			if(ret.code==0){
				if(table == 'markallotDevProlong'){
					$.each(ret.data,function(i,v){
						if(!v.expiration){
							flag ++;
						}
					});
				}
				$("#"+table).html(template(tmpId,ret));
			}
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
	return flag ;
}

var locationParent = "";
var locationUserId = "";
var parentNode = "";

/**
 * 禁用节点
 */
function disableNode(treeId,id){
	var treeObj = $.fn.zTree.getZTreeObj(treeId);
	var upNodes = treeObj.getNodesByParam("id", id, null);
	if(upNodes && upNodes.length>0){
		$.each(upNodes,function(i,v){
			v.chkDisabled = true;
			treeObj.updateNode(v,false);
		});
	}
}






tabs(".js-tab", "btn-primary");
$("[name=searchSnImei]").iCheck({});
$("[name=searchSnImei]").iCheck().on("ifChecked", function (event){
	if($(this).val() == "imei"){
		$("#searchSnImeiVal").attr("placeholder",$.i18n.prop('cust.pleasePutImei'));
		lessThanIE10PlaceholderVal("#searchSnImeiVal");
	}else{
		$("#searchSnImeiVal").attr("placeholder",$.i18n.prop('cust.pleasePutSIM'));	
		lessThanIE10PlaceholderVal("#searchSnImeiVal");
	}
});







/**
 * 到期设备列表全选
 */
$("#expirationDevAllCheck").iCheck().on('ifClicked',function(event){
	if($(this).attr("checked")){
		$("input[name='devCheck']").iCheck('uncheck');
	}else{
		$("input[name='devCheck']").iCheck('check');
	}
});

//设备更多功能
function morefunction(obj,imei,userExpirationStr){
  var selectNode = leftTree.getSelectedNodes()[0];
  var obj_id = $(obj).attr("data-id");
  var box_id = "funcBox-"+obj_id;
	var func_html = '';
	func_html += '<div class="func-box" id="funcBox-' + obj_id + '">';
	func_html += '<ul  class="func-list fs-12 lh-2">';

	//过期不显示轨迹回放，街景，下发指令，行车记录
	if(userExpirationStr && !(userExpirationStr.indexOf($.i18n.prop('cust.Expired')) > -1)){
		func_html += '<li><a href="javascript:replayrecord(\''+imei+'\');"  title="'+$.i18n.prop("index.Playback")+'">'+$.i18n.prop("index.Playback")+'</a></li>';
		/*func_html += '<li><a title="'+$.i18n.prop("index.StreeMap")+'" onclick="trackpresetStreet(\''+imei+'\')">'+$.i18n.prop("index.StreeMap")+'</a></li>';
		func_html += '<li><a title="'+$.i18n.prop("index.Issue_command")+'" onclick="sendCommand(\''+imei+'\',this)">'+$.i18n.prop("index.Issue_command")+'</a></li>';
	 	func_html += '<li><a title="'+$.i18n.prop("header.drivingRecord")+'" onclick="drivingrecord(\''+imei+'\')">'+$.i18n.prop("header.drivingRecord")+'</a></li>';*/
	}
	/* func_html += '<li><a title="<spring:message code="cust.TrackStorage"/> " class="cp" onclick="openAllotTrackerModal('+imei+');"><i class="fa fa-save"></i>&nbsp;<spring:message code="cust.TrackStorage"/></a></li>'; */
	/* func_html += '<li><a title="<spring:message code="cust.SingleExtensionuponexpire"/>" class="cp" onclick="openAllotDevProlongModal(\''+imei+'\');"><spring:message code="cust.SingleExtensionuponexpire"/></a></li>'; 
	func_html += '<li><a onclick="getQRCode('+imei+',this);" class="cp" >'+$.i18n.prop("cust.QRCode")+'</a></li>';
	//登录用户只能查看自己的围栏
	if(selectNode && selectNode.id==loginUserId){
		func_html += '<li><a onclick="seeGeo('+imei+');" class="cp" >'+$.i18n.prop("cust.viewFence")+'</a></li>';
	 }*/
	func_html += '</ul>';
	func_html += '</div>';
	createFuncBox(obj_id,obj,func_html);
	funcBoxPosition(obj,box_id);//设置定位位置
	
}

//轨迹回放
function replayrecord(imei) {
	$("#replayrecord_userId").val(userId);
	$("#replayrecord_account").val(account);
	
	$("#replayrecord_form").attr("action", _ctx+"rest/meunController/trackreplay?imei="+imei).submit();
}
//实时跟踪
function trackpreset(imei) {
	$("#replayrecord_userId").val(userId);
	$("#replayrecord_account").val(account);
	$("#replayrecord_form").attr("action", _ctx+"/trackpreset/tracking/"+imei+"?isTracking=0").submit();
}
//街景
function trackpresetStreet(imei) {
	$("#replayrecord_userId").val(userId);
	$("#replayrecord_account").val(account);
	$("#replayrecord_form").attr("action", _ctx+"/trackpreset/tracking/"+imei+"?isTracking=1").submit();
}
//行车记录
function drivingrecord(imei) {
	$("#replayrecord_userId").val(userId);
	$("#replayrecord_account").val(account);	
	$("#replayrecord_form").attr("action", _ctx+"/drivingrecord/driving?imei="+imei).submit();
}

//跳转到报表
function toReport(){
	window.open(_ctx+"/runReport/toReports");
}


//设置当前日期
function addDate(){ 
	var d=new Date(); 
	d.setDate(d.getDate()); 
	var month=d.getMonth()+1; 
	var day = d.getDate(); 
	if(month<10){ 
		month = "0"+month; 
	} 
	if(day<10){ 
		day = "0"+day; 
	} 
	var start = d.getFullYear()+"-"+month+"-"+day+" 00:00:00";
	var end = d.getFullYear()+"-"+month+"-"+day+" 23:59:59";

	$("#start_time").val(start);
	$("#end_time").val(end);
}

//跳转到监控台
function toIndex(userId,account,parentId){
	$("#index_userIdRow").val(userId);
	$("#index_accountRow").val(account);
	$("#index_parentIdRow").val(parentId);
	$("#toIndexFormRow").submit();
}

//快捷跳转到首页
function toIndexFast(){
	$("#toIndexForm").submit();
}

/**
 * 定位用户
 */
function locationUser(userId,locationParentId,treeId){
	var treeObj = $.fn.zTree.getZTreeObj(treeId);
	var parentArray = "";
	if(locationParentId){
		locationParent = locationParentId;
		parentArray = locationParentId.substring(0,locationParentId.length-1).split(',');
	}else{
		var node = treeObj.getNodesByParam("id", userId, null);
		$.each(node,function(i,v){
			if(v.fullParentId == locationParentId){
				treeObj.expandNode(node, false,true);
				treeObj.selectNode(node);
				zTreeOnClick(null,treeId,v);
				return false;
			}
		});
		return false;
	}
	if(userId){
		var nodes = treeObj.getNodesByParam("id", userId, parentNode);
		locationUserId = userId;
		var flag = true;
		if(nodes && nodes.length>0){
			$.each(nodes,function(i,v){
				if(v.fullParentId == locationParentId){
					if(treeId != "treeDemo"){
						if(parentNode){
							treeObj.checkNode(parentNode,true,true,true,true);
						}else{
							if(v.getParentNode() && v.getParentNode().id == old_parentId){
								parentNode = v.getParentNode();
								treeObj.selectNode(parentNode);
								getIdAndName(null,'treeDemo2',parentNode);
								//treeObj.checkNode(parentNode,true,true,true,true);
							}
						}
						disableNode(treeId,userId);
					}else{
						treeObj.expandNode(v, false,true);
						treeObj.selectNode(v);
						zTreeOnClick(null,treeId,v);
					}
					locationUserId = "";
					locationParent = "";
					parentNode = "";
					flag = false;
				}
			});
		}
		if(flag){
			if(parentArray && parentArray.length>0){
				$.each(parentArray,function(i,v){
					parentNode = treeObj.getNodeByParam("id", v, parentNode);
					if(parentNode){
						if(!parentNode.open){
							treeObj.expandNode(parentNode, true, false, true,true );
							if(!parentNode.zAsync){
								return false;
							}
						}
					}
				});
			}
		}
	}
}

/**
 * 去掉重复IMEI
 */
function intersectionImeis(arr1,arr2){
	if(arr2 && arr2.length > 0){
		for(var m in arr1){
			if(arr1[m]){
				for(var n in arr2){
					if(arr2[n]){
						if(arr1[m] == arr2[n]){
							delete arr1[m]; 
						}
					}
				}
			}
		}
	}
	return arr1;
}

//IMEI  SN搜索按下回车键
function keyDown(e){
	  var ev= window.event||e;
	  //13是键盘上面固定的回车键
	  if (ev.keyCode == 13) {
		  initDevTableAndPage()
	  }
	}

//客户回车搜索
function CustomerKeyDown(e){
	  var ev= window.event||e;
	  //13是键盘上面固定的回车键
	  if (ev.keyCode == 13) {
		  searchUser();
	  }
	}

//设备列表导出
function listExport(){

	var deviceSize;
	
	if($("#expirationUser").hasClass("active")){
		deviceSize=$("#markExpirationDevTable tr").length;
		if(deviceSize==0){
			layer.msg($.i18n.prop('comm.noData'),{icon:2});
			return;
		}
		$("#expiration-dev-noData").hide();
		$("#expirationDevAllCheck").iCheck('uncheck');
	}else{
		deviceSize=$("#markDevTable tr").length;
		if(deviceSize==0){
			layer.msg($.i18n.prop('comm.noData'),{icon:2});  
			return;
		}
		$("#dev-noData").hide();
		$("#devAllCheck").iCheck('uncheck');
	}
	
	var  searchSnImei=$("input[name='searchSnImei']:checked").val();	
	var  searchSnImeiVal=$("#searchSnImeiVal").val().replace(/(^\s+)|(\s+$)/g,"");
	var devName;
	var sn;
	if(searchSnImei=="imei"){
		devName=searchSnImeiVal;
	}
	if(searchSnImei=="sn"){
		sn=searchSnImeiVal;
	}
	if(!$("#expirationUser").hasClass("active")){
		var orgId=$(".userGroup").val();
		$("#dateTypeHidden").val("");
		$("#startDateHidden").val("");
		$("#endDateHidden").val("");
		$("#userIdHidden").val(parentId);
		$("#parentIdHidden").val(searchPid);
	}else{
		orgId="";
		$("#dateTypeHidden").val(devDateType);
		$("#startDateHidden").val(devStartDate);
		$("#endDateHidden").val(devEndDate);
		$("#userIdHidden").val(expirationParentId);
		$("#parentIdHidden").val(expitationSearchPid);
	}

	$("#dayNumHidden").val(dayNum);
	$("#devNameHidden").val(devName);
	$("#snHidden").val(sn);
	$("#orgIdHidden").val(orgId);
	$("#isActivationHidden").val(isActivation);
	$("#exportdevice").attr("action",_ctx+"/device/listExport").submit();
}

//设备编辑
function updatedevice(){
	if(validateFromDevice()){
		var datas=$("#js-vechleBund-from").serializeObject();
		$.ajax({  
			url: _ctx+"/device/updateDev", 
			type: "POST",
			data:datas,  
			async: false,
			cache: false,
			dataType: 'json',  
			success: function (returnData){
				var device=returnData.data;
				if (returnData.code==0){
					$("#editDevice").modal('hide');
					/*编辑成功后把名字显示出	 */	
					$("#dev_"+device.imei).html('<a  onclick="vehicleLocationClick('+device.imei+')"  href="javascript:;" title="'+device.driverName+" "+device.vehicleNumber+'" id="dev_'+device.imei+'"><span class="c-red"></span> '+device.driverName+" "+device.vehicleNumber+'</a>');
					initDevTableAndPage();
					//layer.msg($.i18n.prop('comm.Operationdone'), {icon: 1});		
				}else{
					layer.msg($.i18n.prop('comm.Failed'), {icon: 5});				
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
}

function deleteCurrentTr(obj,imei){
	$(obj).parent().parent().remove();
	$("#addDeviceCount").html(Number($("#addDeviceCount").html())-1);
	successImeiMap.remove(imei);
}

//INT carIocStyle
function selectCarIoc(carIocStyle,obj){
	$("#carioc-input").val(carIocStyle);
	$("#js-carioc>li").removeClass("c-primary");
	$(obj).addClass("c-primary");
}

/**
 * 获取用户分组信息
 */
var groupList = "";
function getGroupList(){
	$.ajax({
		type:'POST',
		url: _ctx+"/VOrganize/list",  
		async: false,
		cache:false,
		error:function(e){
			ajaxError("customer_search.jsp",e);
		},
		success:function(ret){
			if(ret.code==0){
				groupList = ret;
			}
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}

//创建用户
$(".js-add-role").click(function(){
	
	$("#customerTitle").text($.i18n.prop('cust.AddCustomer'));
	$("#userForm input").removeClass('error');
	$("#userForm").validate().resetForm();
	$(".autocompleter-nodata").remove();
	$("#addRole").modal().on("hidden.bs.modal",clearFormError("#userForm"));
	$("#password").removeAttr("disabled");
	$("#treeDemo2_cusTreeKey").val("");
	$("#treeDemo2_cusTreeKey").autocompleter('destroy');
	
	$("#treeRoleBox").show();
	$(".complex-area-select-add").easyDropDown();
	//var loginUserType = '${SESSION_LOGIN_USER.type}';
	userNodes = leftTree.getNodes();
	//var treeObj = $.fn.zTree.init($("#treeDemo2"),complex_userInfo_tree_setting, userNodes);
	var treeObj = $.fn.zTree.init($("#treeDemo2"),setting, userNodes);
	var nodes = treeObj.getNodesByParam("isHidden", true);
	treeObj.showNodes(nodes);
	var leftNode = leftTree.getSelectedNodes()[0];
	if(leftNode.type==0){ //集团用户
		$("#labelGroup").find("input[name=roleRadio]").removeClass("checked");
		//集团和用户经销商隐藏
		$("#labelUser").hide();
		$("#labelGroup").hide();
		$("#labelDistributor").hide();
		$("#treeRoleBox").hide();
		$("#labelCompany").show();
		$("#labelCompany").find("input[name=roleRadio]").iCheck('check');
	}
	if(leftNode.type==11){ //厂商
		$("#labelGroup").find("input[name=roleRadio]").removeClass("checked");
		//集团和厂商隐藏
		$("#labelGroup").hide();
		$("#labelCompany").hide();
		$("#labelUser").show();
		$("#labelDistributor").hide();
		$("#labelUser").find("input[name=roleRadio]").iCheck('check');
	}
	
	if(!leftNode){
		leftNode = leftTree.getNodes()[0];
	}
	var treeNode = treeObj.getNodesByFilter(complex_nodeFilter,true,null,{"userId":leftNode.id,"fullParentId":leftNode.fullParentId});
	treeObj.selectNode(treeNode);
	treeObj.setting.callback.onClick(null,"treeDemo2",treeNode);
	var role = "" ;
	$("input[name=roleRadio]").each(function(i,v){
		if($(v).attr("checked")){
			role = $(v).val();
		}
	});
	if(!role){
		$("input[name=roleRadio]").eq(0).iCheck('check');
	}
	$("#userId").val("");
	$("#nickName").val("");
	$("#account").val("").removeAttr("disabled");
	$("#password").val("888888");
	$("#phone").val("");
	$("#email").val("");
	$("#recharge").iCheck("uncheck");
	$("#discount").val("");
	$(".language").easyDropDown('select',0).show();
	$("#timeZones").easyDropDown('select',$("#timeZones option[value='TZ_077']").index()).show();
	$("#addUserBtn").show();
	$("#updateUserBtn").hide();
	//$("#markPassword").hide();
	$("#markPassword").show();
	//$("#markPswAgain").hide();
	ShowDiscount();
	initCheck();
	//$.fn.zTree.getZTreeObj("treeDemo").reAsyncChildNodes($.fn.zTree.getZTreeObj("treeDemo").getSelectedNodes()[0],"refresh");
});

$("input[id='recharge']").iCheck();
$("input[id='appLogin']").iCheck();
$("input[id='webLogin']").iCheck();
tabs(".js-tab","btn-primary");


function initCheck(){
	$("[name=roleRadio]").iCheck();
}

function showConfirmPwd(){
	if($("#password").val() != "888888"){
		//$("#markPswAgain").slideDown();
	}else{
		//$("#markPswAgain").slideUp();
	}
};

//新增用户
function saveUser(){
	if(!$("#userForm").valid()){
		return ;
	}
	var type="",recharge="",appLogin="",webLogin="";
	$.each($("input[name='roleRadio']"),function(i,v){
		if($(v).attr("checked")){
			type = $(v).val();
		}
	});
	if($("#recharge").attr("checked")){
		recharge = "1";
	}else{
		recharge = "0";
	}
	if($("#appLogin").attr("checked")){
		appLogin = "1";
	}else{
		appLogin = "0";
	}
	if($("#webLogin").attr("checked")){
		webLogin = "1";
	}else{
		webLogin = "0";
	}
	var param = {
			"parentId":$("#parentId").val(),
			"fullPid":$("#fullParentId").val(),
			"realName":$("#nickName").val(),
			"loginName":$("#account").val(),
			"roleKey":type,
			"passWord":$("#password").val(),
			//"language":$(".language").val(),
			"address":$("#address").val(),
			"mobile":$("#phone").val(),
			//"recharge":recharge,
			//"discount":$("#discount").val(),
			"email":$("#email").val(),
			"lon":$("#address_lon").val(),
			"lat":$("#address_lat").val(),
			"area":$("#area").val(),
			//"appLogin":appLogin,
			//"webLogin":webLogin
		};
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:param,
	    url:_ctx+"rest/loginController/register",
		error:function(e){
			ajaxError("customer_search.jsp",e);
		},
		success:function(ret){
			if(ret &&ret.statusCode==0){
				layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});	
				var node = leftTree.getSelectedNodes()[0];
				if(node){
					leftTree.reAsyncChildNodes(node, "refresh");
				}
				searchUser();
				updateLeftTree(true,"");
				$("#addRole").modal('hide');
				
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo2");
				var node = treeObj.getSelectedNodes()[0];
				if(node){
					complex_updateTreeNode("complex_search_tree", null, {"userId":node.id,"fullParentId":node.fullParentId},null, "add");
				}
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

//更新模板显示
$(".js-update").click(function(){
  $("#updateTemplate").modal().on('hidden.bs.modal', function (e) {
    $(".js-select-file-box").show();
    $(".js-update-file-list").hide();
  });

});

$(".js-select-file-btn").click(function(){
	$("#updateTemplateFile").click();
});
$("#updateTemplateFile").change(function(){
	$("#fileName").html($("#updateTemplateFile").val());
	$(".js-select-file-box").hide();
	$(".js-update-file-list").show();
});

//末班更新数据
function batchUpdateDev(){
	if($("#updateTemplateFile").val()){
		$("#batchUpdateDevForm").submit();
	}else{
		layer.msg($.i18n.prop('cust.chooseFile'),{icon:2});			
	}
}

//快捷显示更新窗口
function openUpdateModalFast(){
	$("#customerTitle").text($.i18n.prop('cust.editUser'));
	var node = leftTree.getSelectedNodes()[0];
	if(node){
		var userId= node.id;
		var pId=node.pId;
		openUpdateModal(userId,pId);
		ShowDiscount();
	}
}

/**
 * 编辑用户窗口
 */
 var old_parentId = "",old_fullParentId;
function openUpdateModal(userId,pId){
	$("#customerTitle").text($.i18n.prop('cust.editUser'));
	//$("#searchUserEquipment").modal("hide");
	$("#userForm input").removeClass('error');
	$(".autocompleter-nodata").remove();
	$("#userForm").validate().resetForm();
	$.ajax({
		type:'POST',
		url:_ctx+"rest/loginController/getUserInfo",  
		data:{"userId":userId,"parentId":pId},
		async: false, 
		cache:false,
		error:function(e){
			ajaxError("customer_search.jsp",e);
		},
		success:function(returnData){
			if(returnData.code==0){
				var data = returnData.data;
				old_parentId = data.createdBy;
				old_fullParentId = data.fullParentId;
				$("#userId").val(data.id);
				$("#account").val(data.loginName);
				$("#nickName").val(data.realName);
				
				$("#phone").val(data.mobile);
				$("#address_lat").val(data.lat);
				$("#address_lon").val(data.lon);
				$("#email").val(data.email);
				$("#area").val(data.area);
				$("#address").val(data.address);
				//$("#markPassword").hide();
				$("#addUserBtn").hide();
				$("#updateUserBtn").show();
				if(data.role.roleKey==='NORMAL_USER'){//普通用户
					data.type=9;
				}
				if(data.role.roleKey == 'AGENCY'){
					data.type=8;
				}
				$("#type").val(data.type);
				ShowDiscount();
				if(data.recharge == 1){
					$("#recharge").iCheck('check');
					
				}else{
					$("#recharge").iCheck('uncheck');
				}
//				if(data.appLogin == '1'){
//					$("#appLogin").iCheck('check');
//				}else{
//					$("#appLogin").iCheck('uncheck');
//				}
//				if(data.webLogin == '1'){
//					$("#webLogin").iCheck('check');
//				}else{
//					$("#webLogin").iCheck('uncheck');
//				}
				
				$("#discount").val(data.discount);
				if(data.language == "zh"){
					$(".language").easyDropDown('select',0);
				}
				if(data.language == "en"){
					$(".language").easyDropDown('select',1);
				}
				if(data.timeZones){
					$("#timeZones").easyDropDown('select',$("#timeZones option[value='"+data.timeZones+"']").index());
				}
				//$("#markPassword").hide();
				$("#password").attr("disabled","disabled");
				$("#account").attr("disabled","disabled");
				$("#area").attr("disabled","disabled");
				$("#add").hide();
				$("#update").show();
				userNodes = leftTree.getNodes();
				//var treeObj = $.fn.zTree.init($("#treeDemo2"), complex_userInfo_tree_setting, userNodes);
				var treeObj = $.fn.zTree.init($("#treeDemo2"), setting, userNodes);
				var nodes = treeObj.getNodesByParam("isHidden", true);
				treeObj.showNodes(nodes);
				//complex_locationUser(data.id,old_fullParentId,"treeDemo2","parent");
				//locationUser(data.id,old_fullParentId,"treeDemo2","");
//				var node = treeObj.getNodesByParam("id", pId, null);
//				treeObj.selectNode(node);
				
				$("#treeRoleBox").show();
			//	initCheck();
				
				
				
				if($("input[name='roleRadio'][value='"+data.type+"']")){
					$("input[name='roleRadio'][value='"+data.type+"']").iCheck('check');
				}else{
					$("input[name='roleRadio'][value='9']").iCheck('check');
				}
				
				
				$("#addRole").modal();
				
				if(data.role.id==3){ //集团用户
					$("#labelGroup").find("input[name=roleRadio]").removeClass("checked");
					//集团和用户经销商隐藏
					$("#labelUser").hide();
					$("#labelGroup").hide();
					$("#labelDistributor").hide();
					$("#treeRoleBox").hide();
					$("#labelCompany").show();
					$("#labelCompany").find("input[name=roleRadio]").iCheck('check');
				}
				$(".complex-area-select-add").easyDropDown();
				$("#treeDemo2_cusTreeKey").val("");
				$("#treeDemo2_cusTreeKey").autocompleter('destroy');
			}
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
	ShowDiscount();
}

/**
 * 转移客户
 * @param selectUserId
 * @param pId
 */
function transCustModal(selectUserId,pId){
	var userId = "";
	if(selectUserId==""){
		selectUserId = getCheckVal('userCheck');
		if(selectUserId == ""){
			layer.msg($.i18n.prop('cust.Pleaseselectcustomer'));
			return;
		}
		pId = $("#index_userId").val();
		if(selectUserId.split(",").length>1){
			userId = selectUserId.split(",")[0];
		}else{
			userId = selectUserId;
		}
	}else{
		userId = selectUserId;
	}
	var param = {"userId":selectUserId,"parentId":pId,"formId":"transCust2","targetId":"appendAfrom","genBut":"false"};
	$.ajax({
		type:'POST',
		url:_ctx+"/customer/getUserInfo",  
		data:{"userId":userId,"parentId":pId},
		async: false, 
		cache: false,
		error:function(e){
			ajaxError("customer_search.jsp",e);
		},
		success:function(returnData){
			complex_buildTransCustForm_callback(returnData,param);
			$("#transCustom_form_"+param.formId).find("input[name='userId']").val(selectUserId);
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}

//更新用户信息
function updateUser(){
	if(!$("#userForm").valid()){
		return ;
	}
	var type="",recharge="",appLogin="",webLogin="";
	$.each($("input[name='roleRadio']"),function(i,v){
		if($(v).attr("checked")){
			type = $(v).val();
		}
	});
	if($("#recharge").attr("checked")){
		recharge = "1";
	}else{
		recharge = "0";
	}
	if($("#appLogin").attr("checked")){
		appLogin = "1";
	}else{
		appLogin = "0";
	}
	if($("#webLogin").attr("checked")){
		webLogin = "1";
	}else{
		webLogin = "0";
	}
	if(!type){
		layer.msg($.i18n.prop('cust.PleaseselecteuserType'));
		return ;
	}
	var flag = 0;
	if(old_parentId != $("#parentId").val()){
		flag = 1;
	}
	if($("#fullParentId").val().indexOf($("#userId").val())>0){
		layer.msg($.i18n.prop('cust.noChooseLowerUser'),{icon:2});		
		return false;
	}
	//编辑的时候上级用户不能选择自己
	if($("#userId").val()==$("#parentId").val()){
		layer.msg($.i18n.prop('cust.saleToSelf'));		
		return false;
	}
	
	var param = {
			"id":$("#userId").val(),
			"parentId":$("#parentId").val(),
			"fullParentId":$("#fullParentId").val(),
			"nickName":$("#nickName").val(),
			"account":$("#account").val(),
			"realName":$("#nickName").val(),
			"loginName":$("#account").val(),
			"roleKey":type,
			"language":$(".language").val(),
			"timeZones":$("#timeZones").val(),
			"phone":$("#phone").val(),
			"recharge":recharge,
			"discount":$("#discount").val(),
			"old_parentId":old_parentId,
			"old_fullParentId":old_fullParentId,
			"email":$("#email").val(),
			"flag":flag,
			"appLogin":appLogin,
			"area":$("#area").val(),
			"address":$("#address").val(),
			"lon":$("#address_lon").val(),
			"lat":$("#address_lat").val(),
			};
	$.ajax({
		type:'POST',
		url:_ctx+"rest/loginController/register",  
		data: param,
		async: false, 
		cache:false,
		error:function(e){
			ajaxError("customer_search.jsp",e);
		},
		success:function(returnData){
			if(returnData.statusCode==0){
				$("#addRole").modal('hide');
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo2");
				var treeNode = treeObj.getSelectedNodes()[0];
				if(treeNode){
					$("#treeDemo").initCustomTree({
						treeType : "stock_repertory",
						head_userId : currUserId, 
						chkOrNot : false,
						onClick : zTreeOnClick,
						onClickFlag : false,
						ajaxDataFilter : stock_ajaxDataFilter
					});
					leftTree = $.fn.zTree.getZTreeObj("treeDemo");
					complex_locationUser(treeNode.id, treeNode.fullParentId, "treeDemo", null);
				}
//				var treeObj = $.fn.zTree.getZTreeObj("treeDemo2");
//				var treeNode = treeObj.getNodesByFilter(complex_nodeFilter,true,null,{"userId":$("#userId").val(),"fullParentId":old_fullParentId});
//				if(treeNode){
//					treeNode.old_fullParentId = old_fullParentId;
//					treeNode.fullParentId = $("#fullParentId").val() + $("#parentId").val() + ",";
//					treeNode.pId = param.createdBy;
//					treeNode.name = $("#nickName").val(); 
//					treeNode.phone = $("#phone").val(); 
//					treeNode.iconSkin = complex_getUserType(Number(type));
//					treeNode.type = type;
//					treeNode.phone = param.phone;
//					treeNode.email = param.email;
//					if(Number(type) == 0){
//						treeNode.typeName = $.i18n.prop('cust.Manager');
//					}else if(type == 8 || type == 10){
//						treeNode.typeName = $.i18n.prop('cust.Distributor');
//					}else if(type == 9){
//						treeNode.typeName = $.i18n.prop('cust.User');
//					}else if(type == 11){
//						treeNode.typeName = $.i18n.prop('cust.Sale');
//					}else{
//						treeNode.typeName = $.i18n.prop('cust.User');
//					}
//				}
//				var targetNode = treeObj.getSelectedNodes()[0];
//				complex_updateTreeNode("treeDemo", treeNode, targetNode, {"userId":old_parentId,"fullParentId":old_fullParentId.replace(old_parentId+",","")}, "update");
//				var leftNode = leftTree.getNodesByFilter(complex_nodeFilter,true,null,{"userId":treeNode.id,"fullParentId":treeNode.fullParentId});
//				if(leftNode){
//					leftTree.selectNode(leftNode);
//					leftTree.setting.callback.onClick(null,"treeDemo",leftNode);
//				}
				layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});	
			}else if(returnData.code == -2){
				layer.msg($.i18n.prop('cust.Accountalreadyexists'),{icon:2});	
			}else {
				layer.msg($.i18n.prop('comm.Failed'),{icon:2});		
			}
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}

//批量销售
function showSaleModel(imei){
	var batchSaleid ="batchSaleid";
	$("#batchSales").modal();
	complex_buildUserSale(batchSaleid,'true','true','batchSales');
	//var sale_tbody=$("#sale_tbody_"+batchSaleid);
	var imeis="";
	if(imei!=null&&imei!=""){
		imeis=imei;
	}else{
		imeis= getCheckVal('devCheck');
	}
	
	complex_slae_validate('batchSaleid',imeis);
	
	//获取勾选的设备信息
	/*if(imeis!=""){
		$.ajax({
			type:"post",
			async: false,
		    cache: false,
			data:{"ids":imeis},
			url:_ctx+"/device/getDevInfoByImei",
			error:function(e){
				ajaxError("customer_search.jsp",e);
			},
			success:function(ret){
				if(ret.code==0){
						$.each(ret.data,function(i,v){
							var tr_html = "";
							tr_html += '<tr  id=addSuccess_'+v.imei+'>';
							tr_html += '<td class="first" title='+v.imei+'>'+v.imei+'</td>';
							tr_html += '<td title='+v.mcType+'>'+v.mcType+'</td>';
							tr_html += '<td title='+$.i18n.prop("comm.Delete")+'><a  onclick="complex_drop_sale_imei(this,\''+batchSaleid+'\')">'+$.i18n.prop("comm.Delete")+'</a></td>';
							tr_html += '</tr>'
								sale_tbody.append(tr_html);
						});
				}
			}
		}); 
	}*/
	//设置数量
	//$("#sale_count_"+batchSaleid).text($("#sale_tbody_"+batchSaleid+" tr").length);
}

//删除用户
var l ; //确认框对象
function deleteUser(userId,parentId){
	    l = layer.confirm($.i18n.prop('Asset.Suredeleterecord'),   
		 {icon: 3,
		  title:$.i18n.prop('comm.Operationtips'),
		  btn: [$.i18n.prop('comm.Confirm'),$.i18n.prop('comm.Cancel')],  
		  shade: false 
		 }, function(){
			$.ajax({
				url: _ctx+"/customer/deleteUser? ="+new Date().valueOf(), 
				data:{"userId":userId,"parentId":parentId,"fullParentId":fullParentId},
			    async: false,
			    cache: false,
				error:function(e){
					ajaxError("customer_search.jsp",e);
				},  
			    success: function (returnData) {
			    	if(returnData.code==0){
						layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});		
						$("#userNum").html(Number($("#userNum").text())-1);
						var node = leftTree.getSelectedNodes()[0];
						if(node){
							leftTree.reAsyncChildNodes(node, "refresh");
						}
						searchUser();
					}else if(returnData.code==-2){
						layer.msg($.i18n.prop('cust.noDelHasLowerUser'),{icon:2});			
					}else if(returnData.code==-3){
						layer.msg($.i18n.prop('Asset.UnableDelete'),{icon:2});		
					}else{
						layer.msg($.i18n.prop('comm.Failed'),{icon:2});			
					}
			    },
				complete:function(XMLHttpRequest, textStatus){
					authorityValide(XMLHttpRequest);
				}
			});
			layer.close(l);
		});
}

function getRepeatImeis(imeiArr) {
	var retImies = [];
	var upImei = "";
	if(imeiArr && imeiArr.length > 1){
		$.each(imeiArr,function(i,v){
			if(v){
				if(upImei != v){
					$.each(imeiArr,function(m,n){
						if(n){
							if(v == n && m != i){
								retImies.push(v);
								upImei = v;
							}
						}
					});
				}
			}
		});
	}
	return retImies;
}

var successImeiMap = new Map();

function validImei(imeis){
	var addImeiMap = new Map();
	var failArray = new Array();
	var input = "";
	if(imeis){
		input = imeis;
	}else{
		input = $("#imeiUserexpiration").val().replace(/\r\n/ig,",").replace(/\n/ig,",").replace(/(^\s*)|(\s*$)/g, "");
	}
	if(!input){
		$("#imeiUserexpiration").addClass("form-control-error");
		return;
	}
	$("#validImei_loading").show();
	var inputArray = input.split(",");
	var imeis = "";
	$.each(inputArray,function(i,v){
		if(v){
			if(!/^[0-9]*$/.test(v)){
				failArray.push({"imei":v,"type":"NOTDIGIT"});
			}else if(v.length != 15){
				failArray.push({"imei":v,"type":"LENGTHERROR"});
			}else if(successImeiMap.get(v)){
				failArray.push({"imei":v,"type":"ISADD"});
			}else if(addImeiMap.get(v)){
				failArray.push({"imei":v,"type":"REPEAT"});
			}else{
				addImeiMap.put(v,{"imei":v,"type":"SUCCESS"});
				imeis += v+",";
			}
		}
	});
	if(imeis){
		imeis = imeis.substring(0, imeis.length-1);
		$.ajax({
			type:"post",
			async: false,
			cache: false,
			data:{"imeis":imeis},
			url:_ctx+"/customer/validImei",
			error:function(e){
				ajaxError("customer_search.jsp",e);
			},
			success:function(ret){
				$("#validImei_loading").hide();
				$("#imeiUserexpiration").parent().removeClass("focus");
				if(ret && ret.code == 0){
					$("#notExistImeis").empty();
					if((ret.data.fail && ret.data.fail.length>0) || failArray.length > 0){
						$("#notExistImeis").append(template("addFail_tmp",{"data":ret.data.fail}));
						$("#notExistImeis").append(template("addFail_tmp",{"data":failArray}));
						layerIndex = layer.open({
							type: 1,
							shade: false,
							title: false, //不显示标题
							content: $('#batchSetExpiration'), //捕获的元素
						});
						$("#addImeiFail").html(ret.data.fail.length + failArray.length);
					}
					if(ret.data.success && ret.data.success.length > 0){
						$("#userExpirationTable").append(template("addSuccess_tmp",{data:ret.data.success}));
						$.each(ret.data.success,function(i,v){
							successImeiMap.put(v.imei,v);
						});
						$("#addImeiSuccess").html(ret.data.success.length);
						$("#addDeviceCount").html(Number($("#addDeviceCount").html())+ret.data.success.length);
						tableHeaderAutoWidth("#userExpirationTable_thead","#userExpirationTable_content");
					}else{
						$("#addImeiSuccess").html("0");
					}
				}
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});
	}else if(failArray.length > 0){
		$("#validImei_loading").hide();
		$("#imeiUserexpiration").parent().removeClass("focus");
		$("#notExistImeis").empty();
		$("#notExistImeis").append(template("addFail_tmp",{"data":failArray}));
		layerIndex = layer.open({
			type: 1,
			shade: false,
			title: false, //不显示标题
			content: $('#batchSetExpiration'), //捕获的元素
		});
		$("#addImeiFail").html(failArray.length);
		$("#addImeiSuccess").html("0");
	}
}

$('#expiration_modal').on('hidden.bs.modal', function (e) {
	if(layerIndex){
		layer.close(layerIndex);
	}
	successImeiMap = new Map();
});


/**
 * 获取下级用户列表
 */
function getUserList(userType,parentId,pNo,param){
	var  searchAccount=$("#searchAccount").val().replace(/(^\s+)|(\s+$)/g,"");
	if(searchAccount!=null){
		$("#searchAccount").select();
	}
	$("#userAllCheck").iCheck('uncheck');
	
	if(pNo){
		pageNo = pNo;
	}
	if(!param){
		param ={"type":userType,"parentId":parentId,"fullPid":fullParentId,"pageNo":pageNo,"pageSize":pageSize,"keyword":searchAccount};
	}
	param.pageNo = pNo;
	param.pageSize = pageSize;
	
	$.ajax({
		type:"post",
		async: true,
	    cache: false,
	    dataType :"json",
		beforeSend:function(XHR){
			$("#markUserTable").hide();
			$("#user-noData").hide();
			$("#userloading").show();
			$("#pagingCustomer").hide();
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
			$("#markUserTable").show();
			$("#userloading").hide();
			tableHeaderAutoWidth("#clientTableHeader","#clientTableContent");//客户表格头部自动宽度
		},
	    data:param,
	    url:_ctx+"/customer/getUserInfoByPid",
		success:function(ret){
			if(ret.code==0){
				var data = {"result":ret.data.result,"pageNo":pNo,"pageSize":pageSize};
				$("#markUserTable").html(template("user-info",data));
				$("input[name='userCheck']").iCheck().on('ifUnchecked',function(event){
					$("#userAllCheck").iCheck("uncheck");
				}).on('ifChecked',function(event){
					var allCheckNum = $("input[name='userCheck']").length;
					var CheckNum = 0;
					$.each($("input[name='userCheck']"),function(i,v){
						if($(v).attr("checked")){
							CheckNum++;
						}
					});
					if(CheckNum == allCheckNum){
						$("#userAllCheck").iCheck("check");
					}
				});
				
				checkboxSelectLine("#userAllCheck","#clientTableContent input[type='checkbox']");//选中行背景换色
				
				
				
				totalRecord = ret.data.totalRecord;
				if(pNo == 1){
					initUserPage(param,userType,parentId);
				}
				if(totalRecord!=0){
					$("#pagingCustomer").show();
					$("#user-noData").hide();
				}else{
					$("#pagingCustomer").hide();
					$("#user-noData").show();
				}
			}
		},
		error:function(e){
			ajaxError("customer_search.jsp",e);
		}
	});
}

/**
 * 用户列表查询及分页
 */
function searchUser(pageNo){
	if(!pageNo){
		pageNo = 1;
	}
	getUserList(userType,parentId,pageNo);
};

var isCallbackNode=0;//是否回选节点 0否,1是
var CallbackNodeId;//需要回选的节点id
//批量  设置/延长  用户到期
function updateUserExpiration(target){
	var node = "" ,url = "" , userexpiration="";
	if(target == 'set'){
		userexpiration = $("#aLLUserExpiration").val();
		node = leftTree.getSelectedNodes()[0];
		url = _ctx+"/customer/updateDeviceExpiration";
	}
	if(target == 'update'){
		userexpiration=$("#extendedTime").val();
		node = leftExpirationTree.getSelectedNodes()[0];
		url = _ctx+"/customer/extendDeviceExpiration";
	}
	if(target == 'prolongLife'){
		//TODO 延长设备到期时间为终生
	}
	if(userexpiration==""||userexpiration=="0"){
		layer.msg($.i18n.prop('Alert.timecannotnull'),{icon:2});		
		return;
	}
	if(node){
		var imeis = "";
		if(successImeiMap.arr.length > 0){
			$.each(successImeiMap.arr,function(i,v){
				imeis += v.key+",";
			});
		}
		if(imeis){
			imeis = imeis.substring(0, imeis.length-1);
			$.ajax({
				type:"post",
				async: false,
			    cache: false,
				data:{"userexpiration":userexpiration,"imeis":imeis},
				url : url,
				error:function(e){
					ajaxError("customer_search.jsp",e);
				},
				success:function(ret){
					if(ret.code==0){
						layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});	
						if($("#expirationUser").hasClass("active")){
							initExpirationDevTable();
							var nodes = leftExpirationTree.getSelectedNodes();
							if (nodes.length>0) {
								var node = nodes[0].getParentNode();
								CallbackNodeId = nodes[0].id;
								if (node) {
									isCallbackNode=1;
									leftExpirationTree.reAsyncChildNodes(node, "refresh");
								}else{
									loadExpirationTree();
								}
							}
						}else{
							initDevTableAndPage(true);
						}
					}else{
						layer.msg($.i18n.prop('cust.illegalOperation'),{icon:2});
					}
					$("#expiration_modal").modal('hide');
				},
				complete:function(XMLHttpRequest, textStatus){
					authorityValide(XMLHttpRequest);
				}
			});
		}else{
			layer.msg($.i18n.prop('Asset.Pleaseadddevice'),{icon:2});	
		}
		
	}
}

//批量  设置/延长用户到期时间 ,延长设备到期时间为终生模态框
function openExpirationModal(target){
	$("#expiration_modal_mark").html(template('expiration_modal_tmp',{target:target}));
	addDeviceBoxToggle("#imeiUserexpiration");
	
	var imeis = "";
	if($("input[name='devCheck']").length > 0){
		$.each($("input[name='devCheck']"),function(i,v){
			if($(v).attr("checked")){
				imeis += $(v).val()+",";
			}
		});
	}
	if(imeis){
		imeis = imeis.substring(0, imeis.length-1);
	}
	validImei(imeis);
	
	if(target == "update"){
		$('#extendedTime').easyDropDown();
	}else if(target == 'set'){
		$("#aLLUserExpiration").focus(function(){
			 laydate({
				 elem: '#aLLUserExpiration', //需显示日期的元素选择器
				 event: 'focus', //触发事件
			 });
		 });
	}
	$("#expiration_modal").modal();
}

function userValid(){
	$.validator.addMethod("validIsDiscount",function(value,element){
	  	  var result=false;
	  	  if(!value){
	  		result = true;
	  	  }else if(/^0[1-9]$|^[1-9][0-9]?$|^00?\.(?:0[1-9]|[1-9][0-9]?)$|^(?:0[1-9]|[1-9][0-9]?)\.[0-9]$/.test(value)){
			 result = true;
			 if(value<=1 && value>0){
	  			result = true;   
	  		  }else{
	  			result=false;
	  		  }
		  }
	  	  return result;
	},$.i18n.prop('Business.Rangingfrom')+'0.01~1');			
	
	$("#userForm").validate({
		rules:{
			account:{
				required: true ,
				minlength:3,
				maxlength:30,
				accountValid : true
			},
			nickName:{
				required: true,
				minlength: 3,
				maxlength:50,
				nickNameValid : true
			},
			password:{
				required: true,
				minlength:6,
				validatorSaveCustPassword:true
			},
			pswAgain:{
				required: true,
				equalTo:"#password"
			},
			/*phone:{
				phone : true,
			},*/
			discount:{
				validIsDiscount:true
			},
			email:{
				email:true
			}
		},
		messages:{
			account:{
				required: $.i18n.prop('cust.Accountcannotbeempty'),		
				minlength: $.i18n.prop('cust.AccountLength'),	
				maxlength: $.i18n.prop('cust.AccountLength'),	
				accountValid : $.i18n.prop('cust.accountValid')			
			},
			nickName:{
				required: $.i18n.prop('cust.Usernamecannotbeempty'),	
				minlength:$.i18n.prop('cust.UserNameMinLength'),
				maxlength:$.i18n.prop('cust.UserNameMaxLength'),
				nickNameValid : $.i18n.prop('cust.nickNameValid')
			},
			password:{
				required: $.i18n.prop('cust.Passwordcannotbeblank'),		
				minlength:$.i18n.prop('cust.PasswordLength'),
				validatorSaveCustPassword:$.i18n.prop('user.passwordFormat')
			},
			pswAgain:{
				required: $.i18n.prop('cust.surePassword') ,	
				equalTo: $.i18n.prop('cust.Thetwopasswordsdonotmatch')	
			} ,
			email:{
				email:$.i18n.prop('user.emailFormat')
			},
			/*phone:{
				required :$.i18n.prop('cust.Pleaseentertelephone')		
			},*/
			discount:{
				validIsDiscount :$.i18n.prop('Business.Rangingfrom')+'0.01~1'		
			}
		},
		errorPlacement: function(error, element){
			error.appendTo(element.parent());
		}
	});
}

//获取二维码
function getQRCode(imei,obj){
	//$(".qrcode-pic").hide();
	if(imei){
		$(obj).find(".qrcode-pic img").attr("src",_ctx+"/device/getQRCode?imei="+imei);
		$(obj).find(".qrcode-pic").show();
	}else{
		layer.msg("cust.PleasesettheframenumberandIDnumberandtelephonenumber");
	}
	var imgsrc=_ctx+"/device/getQRCode?imei="+imei;

	var tmp_dData = {"imei":imei,"imgsrc":imgsrc};
	$("#deviceEWM").html(template("erweima",tmp_dData));
	 layer.open({
		    type: 1,
		    shade: false,
		    title: false, //不显示标题
		    content: $("#deviceEWM"), //捕获的元素
	});
}

//打印二维码
function  print(id){
	$("#printArea_"+id).jqprint();
	layer.closeAll();
}

/**
 * 获取套餐 
 * type : 套餐类型
 * ul : 生成的位置
 * tmpId : 模板Id
 */
function getPackage(type,ul,tmpId){
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
		data:{"type":type},
		url:_ctx+"/customer/getPackage",
		error:function(e){
			ajaxError("customer_search.jsp",e);
		},
		success:function(ret){
			if(ret.code==0){
				$("#"+ul).html(template(tmpId,ret));
			}
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}
/**
 * 获取单价
 */
function getUnitPrice(type,element){
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
		data:{"type":type},
		url:_ctx+"/customer/getUnitPrice",
		error:function(e){
			ajaxError("customer_search.jsp",e);
		},
		success:function(ret){
			if(ret.code==0 && ret.data){
				$("#"+element).html(ret.data.limit);
			}
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}
/**
 * 获取选中套餐的编码
 */
function setVal(id,value,userDefind){
	$("#"+id).val(value);
	if(userDefind){
		$("#"+userDefind).val("");
	}
}

//设备指令
function sendCommand(imei,obj){
	$("#command-modal").modal();
	$("#custom_search_command").html(template("sendInstruction-form",null));
	$("#ins_div").hide();
	$("#ins_div_loading").show();
	$("#index_command").empty();
	$("#complex_command").empty();
	getInstructionType(imei);
}

//$("#command-modal").on("hide.bs.modal",function(){
//	if(layerIndex){
//		layer.close(layerIndex);
//	}
//});
//
//$("#batchSales").on("hide.bs.modal",function(){
//	if(layerIndex){
//		layer.close(layerIndex);
//	}
//});

function initBaiDuMap(){
	// 百度地图API功能
 	allMap= new BMap.Map("allmap",{enableMapClick:false}); //创建Map实例 divID必须为allmap
 	allMap.centerAndZoom(new BMap.Point(108.90852,34.378244),5); // 初始化地图,设置中心点坐标和地图级别
 	allMap.addControl(new BMap.MapTypeControl()); //添加地图类型控件
 	allMap.addControl(new BMap.NavigationControl());//设置导航条 （左上角，添加默认缩放平移控件）
 	allMap.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
 	allMap.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_HYBRID_MAP]}));//控制地图模式去掉三维选择

}

function initGoogleMap(){
	//Google地图API功能
	//纬度&经度
	var myCenter=new google.maps.LatLng(21.7220357,14.7292155);
	var mapProp = {
			center:myCenter,
			zoom:2,
			mapTypeId:google.maps.MapTypeId.ROADMAP,
			mapTypeControlOptions: { 
				style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR, position: google.maps.ControlPosition.TOP_RIGHT
			}
	};
	allMap = new google.maps.Map(document.getElementById("allmap"),mapProp);
}

function seeGeo(imei){
//	var script=document.createElement("script");  
//	script.setAttribute("type", "text/javascript");  
//	script.setAttribute("src", "http://api.map.baidu.com/api?v=2.0&ak=S7gxefmASouTllUyjE71hWV3");  
//	var heads = document.getElementsByTagName("head");
//	if(heads.length)  
//	    heads[0].appendChild(script);  
//	else  
//	    document.documentElement.appendChild(script);
	$("#Geo_nodata").hide();
	$(".geoSaveAndCancel").show();
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
		url : _ctx + "/geozone/customerSeeGeozone",
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
		data:{"imei":imei},
		success : function(ret) {
			if(ret.ok){
				$.each(ret.data,function(i,v){
					if(v.status=="out,in"||v.status=="in,out"){
						v.status = "all";
					}
					if(!v.emails){
						v.emails = "no";
					}
					if($("#language").val()=="zh"){
						if(v.geoName){
							v.geoName = v.geoName.replace("[APP setting]","[APP端设置]");
						}
					}
					if($("#language").val()=="en"){
						if(v.geoName){
							v.geoName = v.geoName.replace("[APP端设置]","[APP setting]").replace("APP创建围栏","APP create a fence");
						}
					}
				});
				if(ret.code == 0){
					$("#show-fence-table").modal();
					$("#seeGeo_tbody").html(template("seeGeo_tmp",{"data" : ret.data}));
				}else{
					$("#show-fence-table").modal();
					$("#seeGeo_tbody").html(template("seeGeo_tmp",null));
					$("#Geo_nodata").show();
					$(".geoSaveAndCancel").hide();
				}
				$("input[name='icheckGao']").iCheck();
			}
		},
		error : function(e) {
			ajaxError("seeGeo", e);
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}

function setFen(){
	var language=$("#language").val();
	var statusResult = [];
	var emailsAndGeoIdAndImeiResult = [];
	
	
	$.each($("#show-fence-table tbody").find("tr"),function(){
		var statusArray = [];
		var emailsAndGeoIdAndImeiArray = [];
		$(this).find("input[type='hidden']").each(function(){ 
			var emailsAndGeoIdAndImei = $(this).val();
			emailsAndGeoIdAndImeiArray.push(emailsAndGeoIdAndImei);
		});
		
		$(this).find("input[type='checkbox']:checked").each(function(){ 
			var status = $(this).val();
			statusArray.push(status);
		});
		emailsAndGeoIdAndImeiResult.push(emailsAndGeoIdAndImeiArray);
		statusResult.push(statusArray);
	});
	var results = [];
	for(var j=0;j<emailsAndGeoIdAndImeiResult.length;j++){
		if(statusResult[j]==""){
			//statusResult[i] = "no";
			layer.msg($.i18n.prop("Geozones.CheckStatus"));
			$("#option"+i).css("color",'red');
			return;
		}else{
			var egi = emailsAndGeoIdAndImeiResult[j].toString().split(",");
			var newJson = {"status":statusResult[j].toString(),"emails":egi[0],"geoId":egi[1],"imei":egi[2],"language":language};
			results.push(newJson);
		}
	}
	var resultV = {"data" : results};
	//console.log(resultV);
	var json = JSON.stringify(resultV);
//	for(var i=0;i<statusResult.length;i++){
//		
//		var result = statusResult[i] + "-" + emailsAndGeoIdAndImeiResult[i] + "|";
//		results.push(result);
//	}
	//console.log(results);
	var param = "";
	param+="&json="+json;
	$.ajax({
		url: _ctx+'/alarmInfo/addGeozoneAlarm?'+param,
		type: "post",
	    async: false,
	    cache: false,
	    complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
	    success: function (ret){
	    	if(ret.ok){
		    		if(ret.code==-1){
		    			layer.msg($.i18n.prop("comm.Failed"), {time: 2000,icon: 2});
		    			return;
		    		}else if(ret.code==0){
		    			$("#show-fence-table").modal("hide");
		    			layer.msg($.i18n.prop("comm.Operationdone"), {time: 2000,icon: 1});
		    		}
		    	}
	    },
		error : function(e) {
			ajaxError("setUp.jspgetDeviceList", e);
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}

function deleteFen(index,imei,alarmType,geoId){
	var imeis = imei + ",";
	$.ajax({
		url: _ctx+'/geozone/customerdeleGeozone',
		type: "post",
	    async: false,
	    cache: false,
	    data: {"imei":imeis,"alarmType":alarmType,"geoId":geoId},
	    complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
	    success: function (ret){
	    	if(ret.ok){
	    		layer.msg($.i18n.prop("comm.RemoveSuccessful"),{time: 2000});
		    	seeGeo(imei);
		    }else{
		    	layer.msg($.i18n.prop("comm.RemoveFailed"),{time: 2000});
		    }
	    },
		error : function(e) {
			ajaxError("deleteFen", e);
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
	//$("#option"+index).remove();
}


$(".closeGeo,.cancelGeo").click(function(){
	$("#show-fence-table").modal("hide");
})
//查看地图
function seeGeozone(geozId, geoname, flag) {
	$("#id").val(geozId);
	if (flag == 0) {
		$.ajax({
			type : 'post',
			dataType: 'json',
			url : _ctx + '/geozone/platformSeegeozone?geozId=' + geozId + "&geoname="
					+ geoname,
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			},		
			success : function(ret) {
				if (ret.ok) {
					$("#viewFenceModal").modal();
					$("#checkGeo").html(geoname).attr("title",geoname);
					echoGeozone(geozId, geoname);
				}
			},
			error : function(e) {
				ajaxError("seeGeozone.seeGeozoneMap", e);
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});
	} else {
		$.ajax({
			type : 'post',
			dataType: 'json',
			url : _ctx + '/geozone/platformSeeBlandMark?geozId=' + geozId + "&geoname="
					+ geoname,
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			},
			success : function(ret) {
				if (ret.ok) {
					$("#viewFenceModal").modal();
					$("#checkGeo").html(geoname).attr("title",geoname);
					echoGeozone(geozId, geoname);
				}
			},
			error : function(e) {
				ajaxError("seeBlandMark.seeBlandMarkMap", e);
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});
	}
}

$("#viewFenceModal").on('hidden.bs.modal',function(e){
	 $("#allmap").empty();
});

$(".viewFenceModalClose").click(function(){
	$("#allmap").empty();
});
/**
 * 按用户类型查询用户列表
 */
function userTabQuery(param){
	userType = param;
	searchUser(1);
}


function getNodesArray(nodes){
	if(nodes && nodes.length>0){
		$.each(nodes,function(i,v){
			if(v.type == 11){
				v.chkDisabled = true;
			}
			if(v.children && v.children.length>0){
				getNodesArray(v.children);
			}
		});
	}
	return nodes;
}

/**
 * 用户列表全选
 */
$("#userAllCheck").iCheck().on('ifClicked',function(event){
	if($(this).attr("checked")){
		$("input[name='userCheck']").iCheck('uncheck');
	}else{
		$("input[name='userCheck']").iCheck('check');
	}
});

/**
 * 设备列表全选
 */
$("#devAllCheck").iCheck().on('ifClicked',function(event){
	if($(this).attr("checked")){
		$("input[name='devCheck']").iCheck('uncheck');
	}else{
		$("input[name='devCheck']").iCheck('check');
	}
});

//获取多选框的值
function getCheckVal(name){
	var allCheck = $("input[name='"+name+"']");
	var result = "";
	$.each(allCheck,function(i,v){
		if($(v).attr("checked")){
			result+= $(v).val()+",";
		}
	});
	if(result){
		result = result.substring(0,result.length-1);
	}
	return result;
}

//折扣显示隐藏
function ShowDiscount(){
	$("#recharge").iCheck().on("ifChecked",function(event){
		 $(".show-discount-inp").show();
	}).on("ifUnchecked",function(even){
		$(".show-discount-inp").hide();
	});
}

/**
 * 更新左侧用户树
 */
function updateLeftTree(flag,userId){
	var treeObj2 = $.fn.zTree.getZTreeObj("treeDemo2");
	if(flag){
		var node = treeObj2.getSelectedNodes()[0];
		if(node){
			complex_locationUser(node.id, node.fullParentId, "treeDemo", null);
		}
	}
	var nodes =  leftTree.getNodesByParam("id", $("#parentId").val(), null);
	if(nodes && nodes.length>0){
		$.each(nodes,function(i,v){
			if(v.fullParentId == $("#fullParentId").val()){
				v.isParent = true;
				leftTree.updateNode(v);
				leftTree.reAsyncChildNodes(v, "refresh");
				leftTree.selectNode(v);
				zTreeOnClick(null,"treeDemo",v);
			}
		});
	}
	if(userId){
		var history = leftTree.getNodesByParam("id", userId, null);
		if(history && history.length>0){
			$.each(history,function(i,v){
				if(v.fullParentId == old_fullParentId){
					leftTree.removeNode(v);
				}
			});
		}
	}
}

function showTree(){
	if(!$("#selectRole").prop("disabled")){
		$("#treeRoleBox").toggle();
	}
}
