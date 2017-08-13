	var organizes = [];
	var searchParentId=1;
	var uindex  =1;
	var imeis		= "";      //选择的IMEI 
	var imeis_temp	= "" ;     //临时IMEI
	var devName ="";       	   //搜索参数
	var imeiDatas=null;
	var history_tree_select = userId;
	var pId = "";
	var fullParentId = "";
	if(parentFlag && parentFlag != 'false'){
		$(".js-side-tree-box").show();
	}else{
		$(".js-side-tree-box").hide();
	}
	
	//用户树加载
	$(document).ready(function(){
		 $("#treeDemo").initCustomTree({
			 treeType : "stock_repertory",
			 head_userId : global_userId,
			 loadingSelector : "TreeLogindata",
			 onClick : ztreeOnClick,
			 onClickFlag : false,
			 searchAlert : true,
			 ajaxDataFilter : stock_ajaxDataFilter
		 });
		 //控制台选中某个用户，需要记忆，即刷新界面，还是默认选中之前的用户
		 var selectHistory= getCookie("selectHistory");
		 if(selectHistory){
			 selectHistory = eval('('+selectHistory+')');
			 if(selectHistory.userId && selectHistory.fullParentId.indexOf(userId+",") >= 0){
				 complex_locationUser(selectHistory.userId, selectHistory.fullParentId, "treeDemo", null);
				 return;
			 }
		 }
		 var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		 ztreeOnClick(null,"treeDemo",treeObj.getNodes()[0]);
		 selectRTimeat('Yesterday','Report0');
	});

	//设备名称搜索回车
	function keyDownMileage(e){
		  var ev= window.event||e;
		  if (ev.keyCode == 13) {
			  initMileageReport('1','10');
		  }
	}
	function keyDownOverspeed(e){
		  var ev= window.event||e;
		  if (ev.keyCode == 13) {
			  initOverspeedReport('1','10');
		  }
	}
	function keyDownParking(e){
		  var ev= window.event||e;
		  if (ev.keyCode == 13) {
			  initStopCarReport('stopCar','1','10');
		  }
	}
	function keyDownStopNotOff(e){
		  var ev= window.event||e;
		  if (ev.keyCode == 13) {
			  initStopCarReport('stopNotOff','1','10');
		  }
	}
	function keyDownAcc(e){
		  var ev= window.event||e;
		  if (ev.keyCode == 13) {
			  getAccInfo();
		  }
	}
	function keyDownAlarmReport(e){
		  var ev= window.event||e;
		  if (ev.keyCode == 13) {
			  getAlarmReport();
		  }
	}
	function keyDownAlarmInfo(e){
		  var ev= window.event||e;
		  if (ev.keyCode == 13) {
			  getAlarmInfo('1','10');
		  }
	}
	function keyDownGeozone(e){
		  var ev= window.event||e;
		  if (ev.keyCode == 13) {
			  getGeozoneAlarm('1','10');
		  }
	}
	function keyDownSport(e){
		  var ev= window.event||e;
		  if (ev.keyCode == 13) {
			  initRunReport(param);
		  }
	}
	//客户树-全局搜索 (ul id="treeDemo")
	$("#cusTreeSearchBtn").click(function(){
		globalSearchCustomerTree($("#cusTreeKey"),global_userId,true,"treeDemo",null);
	});
	$("#cusTreeKey").keydown(function(e){
		if(e.keyCode == 13){
			globalSearchCustomerTree($("#cusTreeKey"),global_userId,true,"treeDemo",null);
		}
	});
	var userId;
	function showorder(id){
		if(id==null||id==undefined){
			id=userId;
		}
		
		var param ={"id":id};
		$.ajax({
			type:"post",
			async: true,
		    cache: false,
		    dataType :"json",
			beforeSend:function(XHR){
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
				//tableHeaderAutoWidth("#clientTableHeader","#clientTableContent");//设备表格头部自动宽度
			},
		    data:param,
		    url:_ctx+"rest/Gps/getOrder",
			success:function(ret){
				if(ret.statusCode==0){
					var data = {"result":ret.data};
					$("#run-tbody").html(template("run-tbody-json",data));
					
					//checkboxSelectLine("#userAllCheck","#clientTableContent input[type='checkbox']");//选中行背景换色
				
				}
			},
			error:function(e){
				ajaxError("customer_search.jsp",e);
			}
		});
	}
	
	function ztreeOnClick(event,treeId, treeNode){
		query_history="";
		var treeObj = $.fn.zTree.getZTreeObj(treeId);
		var customerNodes = treeObj.getNodes();
		showorder(treeNode.id);
		userId=customerNodes.id;
		if(customerNodes[0].type == "9" && !customerNodes[0].isParent){
			treeObj.hideNode(customerNodes[0]);
			$(".show-userlist").hide();
		}
		if(customerNodes.isParent){
			for(var i=0;i<customerNodes.length;i++){
				var typeChil = customerNodes[i].children;
				for(var j=0;j<typeChil.length;j++){
					if(typeChil[j].type == "3"){
						treeObj.hideNode(customerNodes[i]);
					}
				}
			}
		}else{
			if(customerNodes[0].type=="3"){
				treeObj.hideNode(customerNodes[0]);
			}
		}
		//3终端
		treeObj.selectNode(treeNode);
		var nodes = treeObj.getSelectedNodes();
		var name = "";
		if(nodes){
			if(nodes.isParent){
				var children = nodes[0].children;
				name = children[0].name;
			}else{
				name = nodes[0].name;
			}
		}
		pId = nodes[0].pId;
		fullParentId = nodes[0].fullParentId;
		userId=treeNode.id;
		if(name){
			$("#account").text(name).attr("title",name);
		}else{
			$("#account").text(account).attr("title",account);
		}
		if(switchMotionAlarm == 0){
			target = $(".motion-nav .tab-nav li.active").attr("data");
		}else if(switchMotionAlarm == 1){
			target = $(".alarm-nav .tab-nav li.active").attr("data");
		}else if(switchMotionAlarm == 2){
			target = $(".offline-nav .tab-nav li.active").attr("data");
		}
		//allTableTree(target);
// 		showQueryTab({
// 			target: target,
// 			checkFlag : true,
// 			isQuery: true,
// 			treeFlag: true
// 		});
		if(history_tree_select != treeNode.id){
			$("#queryDevice_select_"+target).val("");
			$('.deviceAllCheckbox').iCheck('uncheck');
			switchUserClean(target);
		}
		history_tree_select = treeNode.id;
		var selectHistory = {};
		if(treeNode.pId){
			selectHistory.pId = treeNode.pId;
		}else{
			selectHistory.pId = "";
		}
		if(treeNode.fullParentId){
			selectHistory.fullParentId = treeNode.fullParentId;
		}else{
			selectHistory.fullParentId = "";
		}
		selectHistory.userId = treeNode.id;
		selectHistory.name = treeNode.name;
		SetCookie("selectHistory", JSON.stringify(selectHistory));
	}
	function switchUserClean(target){
		if(target == "mileage"){
			showMileageTab();
		}else if(target == "Overspeed"){
			showOverspeedTab();
		}else if(target == "stopCar"){
			showStopCarTab();
		}else if(target == "stopNotOff"){
			showStopNotOffTab();
		}else if(target == "acc"){
			showAccTab();
		}else if(target == "offline"){
			cleanOffLineData();
		}else if(target == "online"){
			cleanOnLineData();
		}else if(target == "alarmReport"){
			showAlarmReportTab();
		}else if(target == "alarmInfo"){
			showAlarmInfoTab();
		}else if(target == "geozone"){
			showGeozoneTab();
		}else if(target == "sport"){
			cleanRunData(1);
		}
	}
	
	//移除选项卡选中效果

	function removeActive(ele,tar){
//		var $this = $(tar);
//		var val = $this.val();
//		if($.browser.msie){
//			$(tar)[0].onpropertychange = clearActive;
//		
//		}
//		function clearActive(){
//			if($this.val()!=val){
//				$("#qucikTime_"+ele).children().removeClass("btn-primary");
//			}
//		}
	};
	//TODO
	function addActive(ele){
		$("#qucikTime_"+ele).children().eq(0).click();
	};
	
	/**
	 * 初始化IMEI集合
	 * 
	 * @returns {String}
	 */
	function initPramsImeis(userId){
		cache_imeis = "" ;
		if(query_history ==""){
			var result = queryDevice({"userId":userId,"imeis":null,"devName":null,"fullParent":fullParentId});
			 if(result && result.code == 0){
				$.each(result.data,function(i,v){
					if(v.userExpirationStr == 0){
						cache_imeis+=v.imei+",";
					}
				});
				if(cache_imeis!="" && cache_imeis !=null){
					cache_imeis=cache_imeis.substring(0,cache_imeis.length-1);
				}
			} 
		}
		return  cache_imeis;
	}
	
	/**
	 * 搜索设备
	 * @param target
	 */
	function queryDevice(param){
		var result = "";
		$.ajax({
			type:"post",
			async: false,
		    cache: false,
		    data: param,
			url : _ctx + "/setup/queryDevice",
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			},
			success : function(ret) {
				if(ret.data&&ret.data.length>0){
					result = ret;
				}
			}
		});
		return result;
	}

	//TODO 报表树
	var setting = {
			view: {
				dblClickExpand: false,
				showLine: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			check: {
				enable: true
			},
			callback: {
				beforeClick: zTreeTableBeforeClick,
				onCheck: zTreeOnCheck,
				onClick: zTreeTableOnClick
			}
	};
	
	var alarmInfoSetting = {
			view: {
				dblClickExpand: false,
				showLine: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeClick: zTreeTableBeforeClick,
				onClick: zTreeTableOnClick
			}
	};
	var checkNum = 0;
	function zTreeOnCheck(event, treeId, treeNode) {
		var mgs = checkboxIsCheck(treeNode);
		if(mgs){
			layer.msg(mgs.replace("#","50"),{time: 2000, icon: 2});
			return;
		}
	 };  
	
	function checkboxIsCheck(node){
	
			var msg = "";
			checkNum = 0;
			 var changedNodes = tree1.getChangeCheckedNodes();
			 for ( var i=0 ; i < changedNodes.length ; i++ ){
				    var treeNode = changedNodes[i];
				    if(treeNode.checked){
				    	checkNum++;
				    }
			}
			if(checkNum>50){
	    		msg = $.i18n.prop("header.Report.ExceedImeiRange");
	    		if(node){
	    			tree1.checkNode(node,false);
	    		}
				return msg;
			}
		
		return msg;
	}
	function zTreeTableBeforeClick(treeId, treeNode, clickFlag){
		if(treeNode.nocheck){
			return false;
		}
		if(treeNode.chkExpire){
			return false;
		}
		
	}
	
	function zTreeTableOnClick(event, treeId, treeNode) {
		var getImeis = $("#queryDevice_select_"+tableTarget).val();
		var nodes = tree1.getNodes();
		var value = "";
		if(query_history && query_history.indexOf(",")>0){
			var check = query_history.substring(query_history.lastIndexOf(",")+1,query_history.length);
			if(check && check.length!=15){
				var newCheck = query_history.substring(query_history.lastIndexOf(","),query_history.length);
				query_history = query_history.replace(newCheck,",");
			}
			if(check && check.length==15){
				var newCheck = query_history.substring(query_history.lastIndexOf(","),query_history.length);
				query_history = query_history + ",";
			}
		}else{
			query_history = "";
		}
		if(nodes){
			if(tableTarget == "alarmInfo"){
				var nodes = tree1.getSelectedNodes()[0];
				query_history = nodes.id;
			}else{
				var nodes = tree1.getSelectedNodes();
// 				var nodesCheck = tree1.getCheckedNodes(true);//获取当前被勾选的节点集合
// 				if(nodesCheck){
// 					for(var j=0; j<nodesCheck.length; j++){
// 						query_history += nodesCheck[j].id+ ",";
// 					}
// 				}
				for (var i=0, l=nodes.length; i < l; i++) {
					tree1.checkNode(nodes[i],true);
					//tree1.hideNode(nodes[i]);
					tree1.selectNode(nodes[i]);
					$("#"+nodes[i].tId+"_a").removeClass("curSelectedNode");
					query_history += nodes[i].id+ ",";
				}
			}
			if(query_history){
				value = clearRepetition(query_history);
			}
			//$("#queryDevice_div_"+tableTarget+" .TreeLogindataTable").hide();
				$("#queryDevice_select_"+tableTarget).val(value);
				$("#queryDevice_div_"+tableTarget).hide();
				$("#queryDevice_select_"+tableTarget).focus();
		}		
	};
	
	$(".deviceAllCheckbox").iCheck().on("ifClicked",function(){
		if($(".deviceAllCheckbox").parent().hasClass("checked")){
			tree1.checkAllNodes(false);
		}else{
			var allNode = tree1.transformToArray(tree1.getNodes());
			if(allNode && allNode.length > 50){
				layer.msg($.i18n.prop("header.Report.ExceedImeiRange").replace("#","50"));
				setTimeout(function(){
					$('.deviceAllCheckbox').iCheck('uncheck');
				},100);
				return;
			}
			tree1.checkAllNodes(true);
		}
//		var arrayNode = checkboxBackElection();
//		tree1.checkAllNodes(true);
//		var mgs = checkboxIsCheck(null);
//		if(mgs){
//			layer.msg(mgs.replace("#","50"),{time: 2000, icon: 2});
//			setTimeout(function(){
//				$('.deviceAllCheckbox').iCheck('uncheck');
//				if(arrayNode){
//					for(var i=0;i<arrayNode.length;i++){
//						tree1.checkNode(arrayNode[i],true);
//					}
//				}
//			},100);
//		}
	});
	
	function checkboxBackElection(){
		var array = [];
		if(tableTarget == "alarmReport" || tableTarget == "geozone"){
			 var changedNodes = tree1.getChangeCheckedNodes();
			 for ( var i=0 ; i < changedNodes.length ; i++ ){
				 var treeNode = changedNodes[i];
				 if(treeNode.checked){
					 array.push(treeNode);
				 }
			}
		}
		return array;
	}
	
	function getTreeSelectValue(target,imeis,enFlag){
		tree1.checkAllNodes(false);
		$('.deviceAllCheckbox').iCheck('uncheck');
		if(imeis){
			var arrayImeis = imeis.split(",");
			for(var i=0;i<arrayImeis.length;i++){
				if(arrayImeis[i]){
					var node = tree1.getNodeByParam("id", arrayImeis[i], null);
					if(node){
						
						if(tableTarget == "alarmInfo"){
							tree1.selectNode(node);
						}else{
							tree1.checkNode(node,true);
						}
					}
				}
			}
			$("#queryDevice_Tree_"+target).show();
			$("#queryDevice_div_"+target+" .noDataHide").hide();
			$("#queryDevice_div_"+target+" .hideConfirmClose").show();
			if(tableTarget == "alarmInfo"){
				$("#queryDevice_div_"+target+" .hideConfirmClose").hide();
			}
		}
	}
	
	//查找一个字符串在另一个字符串中出现的次数  
	function FindCount(targetStr, FindStr) {  
	    var start = 0;  
	    var aa = 0;  
	    var ss =targetStr.indexOf(FindStr, start);  
	    while (ss > -1) {  
	        start = ss + FindStr.length;  
	        aa++;  
	        ss = targetStr.indexOf(FindStr, start);  
	    }
	    if(aa>50){
			tree1.checkAllNodes(false);
			layer.msg($.i18n.prop("header.Report.ExceedImeiRange").replace("#","50"),{time: 2000, icon: 2});
			return true;
		}
	    return false;
	}  


	
	function treeCheckboxAllSelect(target){
		var imeis = "";
		var nodes = tree1.getCheckedNodes(true);//获取当前被勾选的节点集合
		if(!nodes){
			$("#queryDevice_select_"+target).val("");
			return;
		}
		if(query_history && query_history.indexOf(",")>0){
			var check = query_history.substring(query_history.lastIndexOf(",")+1,query_history.length);
			if(check && check.length!=15){
				var newCheck = query_history.substring(query_history.lastIndexOf(","),query_history.length);
				imeis = query_history.replace(newCheck,",");
			}
			if(check && check.length==15){
				var newCheck = query_history.substring(query_history.lastIndexOf(","),query_history.length);
				imeis = query_history + ",";
			}
		}
		for(var i=0;i<nodes.length;i++){
			imeis += nodes[i].id + ",";
			//tree1.hideNode(nodes[i]);		
		}
		var newImeis = "";
		if(imeis){
			newImeis = clearRepetition(imeis);
			if(tableTarget == "alarmReport" || tableTarget == "geozone"){
				if(FindCount(newImeis.toString(),",")){
					return;
				}
			}
		}
		$("#queryDevice_select_"+target).val(newImeis);
		query_history = $("#queryDevice_select_"+target).val();
		$("#queryDevice_select_"+target).focus();
		$('#queryDevice_div_'+target).hide();
	}

	var tree1;
	var tableTarget;
	function allTableTree(target,check,devName){
		tableTarget = target;
		var flag = true;
		$.ajax({
			type:"post",
		    cache: false,
		    data : {"userId":userId,"pId":pId,"imeisOrdevName":check},
		    url:_ctx+"/device/getReportDevice",
		    complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			},
		    beforeSend:function(){
		    	$("#queryDevice_Tree_"+target).hide();
		    	$("#queryDevice_div_"+target+" .TreeLogindataTable").show();
		    	$("#queryDevice_div_"+target+" .noDataHide").hide();
		    	$("#queryDevice_div_"+target+" .hideConfirmClose").hide();
			},
			complete:function(XHR, TS){
				if(target == "alarmInfo"){
					if(flag){
						$("#queryDevice_Tree_"+target).show();
						$("#queryDevice_div_"+target+" .TreeLogindataTable").hide();
					}else{
						$("#queryDevice_div_"+target+" .noDataHide").show();
						$("#queryDevice_div_"+target+" .TreeLogindataTable").hide();
					}
				}else{
					if(flag){
						$("#queryDevice_Tree_"+target).show();
						$("#queryDevice_div_"+target+" .hideConfirmClose").show();
						$("#queryDevice_div_"+target+" .TreeLogindataTable").hide();
					}else{
						$("#queryDevice_div_"+target+" .noDataHide").show();
						$("#queryDevice_div_"+target+" .TreeLogindataTable").hide();
					}
				}
			},
			success:function(ret){
				//ret=eval("("+ret+")");
				var devNodes = ret.data;
				if(devNodes && ret.code == 0){
					$.each(devNodes,function(i,v){
						if(v.iconSkin == "group"){
							if(v.name.indexOf("默认组") >= 0){
								v.name = v.name.replace("默认组",$.i18n.prop("Asset.Defaultgroup"));
							}
							devNodes[i] = {"id":v.id,"name":v.name, "nocheck":true};
							devNodes[i].open = true;
						}else{
							if(!v.chkExpire){
								v.name = v.vehicleId+"["+v.id+"]";
							}
//							if(v.chkExpire){
//								if(v.vehicleId.indexOf("Inactive") >= 0){
//									v.name = v.vehicleId.replace("Inactive",'')+"["+v.id+"]"+'('+$.i18n.prop("cust.Inactive")+')';
//								}else{
//									v.name = v.vehicleId.replace("Expired",'')+"["+v.id+"]"+'('+$.i18n.prop("cust.Expired")+')';
//								}
//								
//							}
						}
					});
					
					if(target == "alarmInfo"){
						tree1 = $.fn.zTree.init($("#queryDevice_Tree_"+target), alarmInfoSetting, devNodes);
					}else{
						tree1 = $.fn.zTree.init($("#queryDevice_Tree_"+target), setting, devNodes);
					}
					//setInactiveAndExpire();
					if(devName){
						getTreeSelectValue(target,devName);
					}
					
				}else{
					tree1 = "";
					flag = false;
				}
			}
		});
	}
//	function setInactiveAndExpire(){
//		nodes = tree1.getNodes(); //不能被操作
//		for(var pIndex = 0; pIndex < nodes.length; pIndex++){
//			if(nodes[pIndex].isParent){
//				var children = tree1.getNodesByFilter(nodeFilter, false);
//				if(children){
//					for(var cIndex = 0; cIndex < children.length; cIndex++){
//						if(children[cIndex].iconSkin == "group"){
//							return false;
//			    		}else{
//			    			if(children[cIndex].chkExpire){
//			    				//$("#"+children[cIndex].tId+"_a").addClass("disabled");
//			    				//tree1.hideNode(children[cIndex]);
//			    				tree1.removeNode(children[cIndex]);
//			    			}
//			    			//tree1.selectNode(children[cIndex],true);
//			    		}
//					}
//				}
//			}
//		}
//	}
	
	function nodeFilter(node) {
 		return !node.isParent;	 
 	}

//初始化快捷时间
function initYesterdayTime(staisType){
	if($("#startTime_"+staisType).val()==""){
		selectRTimeat('Yesterday',staisType);
	}
}
var cache_imeis = "";
//initQuickTime('mileage');
//addActive('mileage');
//initTodayTime('mileage');
//initTime('mileage');
initTime('sport');
initYesterdayTime('sport');
$("#motion-ReportTab>ul>li").click(function(){
	
	switch ($(this).index()) {
	case 0:
		initTime('sport');
		sportTotalRecord=0;
		sportPageNo = 1;
		sportPageSize =10;
		break;
	case 1:
		initTime('mileage');
		MileageTotalRecord=0;
		MileagePageNo = 1;
		MileagePageSize =10;
		break;
	case 2:
		initTime("overspeed");
		OverSpeedTotalRecord=0;
		OverSpeedPageNo = 1;
		OverSpeedPageSize =10;
		break;
	case 3:
		initTime("stopCar");
		StopCarPageNo = 1;
		StopCarPageSize = 10;
		StopCarTotalRecord=0;
		break;
	case 4:
		initTime("stopNotOff");
		StopCarPageNo = 1;
		StopCarPageSize = 10;
		StopCarTotalRecord=0;
		break;
	case 5:
		initTime("acc");
		break;
	default:
		initTime("mileage");
	    addActive('mileage');
		break;
	}
 });

$("#StateStatistics-ReportTab>ul>li").click(function(){
	
	switch ($(this).index()) {
	case 0:
		offLineTotalRecord=0;
		offLinePageNo = 1;
		offLinePageSize = 10;
		break;
	case 1:
		onLineTotalRecord=0;
		onLinePageNo = 1;
		onLinePageSize = 10;
		break;
	default:
		offLineTotalRecord=0;
		offLinePageNo = 1;
		offLinePageSize = 10;
		break;
	}
 });


function showMileageTab(){
	addActive('mileage');
	selectRTimeat('Today','mileage');
	$("#paging-day").hide();
	$("#paging-mileage").hide();
	$("#checkSegment").iCheck('check');
	$("#queryDevice_select_mileage").val("");
	$("#queryDevice_div_mileage").hide();
	//按里程统计
	$("#allmileages").html(0);
	$("#allmileageshours").html(0);
	$('#mileage-tbody').html(template('mileage-tbody-json',null));
	$("#mileage-noData").show();
	$("#mileage-loading").hide();
	//按天统计
	$("#allmileages-day").html(0);
	$('#mileage-day-tbody').html(template('mileage-day-tbody-json',null));
	$("#mileage-day-noData").show();
	$("#mileage-day-loading").hide();
	$("#queryDevice_select_mileage").removeClass("form-control-error");
	isExportMileage = false;
}

function showOverspeedTab(){
	addActive('overspeed');
	selectRTimeat('Today','overspeed');
	$("#queryDevice_select_Overspeed").removeClass("form-control-error");
	$("#queryDevice_select_Overspeed").val("");
	$("#queryDevice_div_overspeed").hide();
	$("input[name=speed]").val(""); 
	//超速报表
	$('#overspeed-tbody').html(template('overspeed-tbody-json',null));
	$("#overspeed-noData").show();
	$("#paging-overspeed").hide();
	$("#overspeed-loading").hide();
	isOverspeed = false;
}

function showStopNotOffTab(){
	addActive('stopNotOff');
	selectRTimeat('Today','stopNotOff');
	$("#queryDevice_select_stopNotOff").val("");
	$("#queryDevice_div_stopNotOff").hide();
	//$("#acc-statue").easyDropDown('select', 0);
	//停留报表
	$("#stopNotOff-alltimes").html(0);
	$('#stopNotOff-tbody').html(template('stopNotOff-tbody-json',null));
	$("#paging-stopNotOff").hide();
	$("#noData-stopNotOff").show();
	$("#loading-stopNotOff").hide();
	$("#queryDevice_select_stopNotOff").removeClass("form-control-error");
	isStopCarRun = false;
}

function showStopCarTab(){
	addActive('stopCar');
	selectRTimeat('Today','stopCar');
	$("#queryDevice_select_stopCar").val("");
	$("#queryDevice_div_stopCar").hide();
	//$("#acc-statue").easyDropDown('select', 0);
	//停留报表
	$("#stopCar-alltimes").html(0);
	$('#stopCar-tbody').html(template('stopCar-tbody-json',null));
	$("#paging-stopCar").hide();
	$("#noData-stopCar").show();
	$("#loading-stopCar").hide();
	$("#queryDevice_select_stopCar").removeClass("form-control-error");
	isStopCarRun = false;
}

function showAccTab(){
	addActive('acc');
	selectRTimeat('Today','acc');
	$("#queryDevice_select_acc").val("");
	$("#queryDevice_div_acc").hide();
	$("#accTable").html(template("acc-info",null));
	$('#aCCTotalTime').html(0);
	$('#aCCOn').html(0);
	$('#aCCOff').html(0);
	$("#acc_info_nodata").show();
	$("#acc_info-loading").hide();
	$("#accStatu").easyDropDown('select', 0);
	$("#queryDevice_select_acc").removeClass("form-control-error");
	accflag=false;
}
//TODO
function initTime(allType){
	$("#startTime_"+allType).focus(function(){
		var start = {
			    elem: '#startTime_'+allType,
			    event: 'focus',
			    format: "YYYY-MM-DD hh:mm",
			    //min: laydate.now(), //设定最小日期为当前日期
			    min: laydate.now(-90),
			    max: laydate.now(), //最大日期
			    istime: true,
			    istoday: true,
			    choose: function(datas){
			    	$("#qucikTime_"+allType).children().removeClass("btn-primary");
			    }
			};
		laydate(start);
	});
	$("#endTime_"+allType).focus(function(){
		var end = {
		    elem: '#endTime_'+allType,
		    event: 'focus',
		    format: "YYYY-MM-DD hh:mm",
		    //min: laydate.now(),
		    min: laydate.now(-90),
		    max: laydate.now(), //最大日期
		    istime: true,
		    istoday: true,
		    choose: function(datas){
		    	$("#qucikTime_"+allType).children().removeClass("btn-primary");
		    }
		};
		laydate(end);
	});
}

//function initQuickTime(staisType){
//	var start = {
//		    elem: '#startTime_'+staisType,
//		    event: 'focus',
//		    format: 'YYYY-MM-DD',
//		    //min: laydate.now(), //设定最小日期为当前日期
//		    max: '2099-06-16', //最大日期
//		    istime: false,
//		    istoday: true,
//		    choose: function(datas){
//		         end.min = datas; //开始日选好后，重置结束日的最小日期
//		         end.start = datas //将结束日的初始值设定为开始日
//		    }
//		};
//		var end = {
//		    elem: '#endTime_'+staisType,
//		    format: 'YYYY-MM-DD',
//		    event: 'focus',
//		    //min: laydate.now(),
//		    max: '2099-06-16',
//		    istime: false,
//		    istoday: true,
//		    choose: function(datas){
//		        start.max = datas; //结束日选好后，重置开始日的最大日期
//		    }
//		};
//		laydate(start);
//		laydate(end);
//}

//初始化快捷时间
function initTodayTime(staisType){
	if($("#startTime_"+staisType).val()==""){
		selectRTimeat('Today',staisType);
	}
}

//设备列表全选
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

/**
* 经纬度地图定位 
*
* @param lat
* @param lng
**/
//TODO 经纬度地图定位 
function Mapposition(mappoint){
	var allMapType = $.cookie('currtMapType');
	$.ajax({
		type:'POST',
		url:_ctx+"/runReport/getPoint",  
		async:true, 
		cache:false,
		data:{"language":window._language,"Lat":mappoint.lat,"Lng":mappoint.lng,"allMapType" : allMapType},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
		error:function(e){
			ajaxError("Mapposition() ",e);
		},  
		success:function(returnData){
			if(returnData.code==0){
				$("#MappostionModal").modal();
				if(allMapType){
					if(allMapType == "googleMap"){
						initMapGoogel(returnData.data);
					}else{
						initMapBaidu(returnData.data);
					}
				}else{
					if(window._language!='zh'){
						initMapGoogel(returnData.data);
					}else{
						initMapBaidu(returnData.data);
					}
				}
			}else{
				$("#MappostionModal").modal();
				if(allMapType){
					if(allMapType == "googleMap"){
						initMapGoogel(mappoint);
					}else{
						initMapBaidu(mappoint);
					}
				}else{
					if(window._language!='zh'){
						initMapGoogel(mappoint);
					}else{
						initMapBaidu(mappoint);
					}
				}
			}
		}
	});
	
//	$("#MappostionModal").modal();
//	if(window._language=='en'){
//		initMapGoogel(mappoint);
//	}else{
//		initMapBaidu(mappoint);
//	}
}
	
	/**
	* 初始化Baidu地图 
	**/
	function initMapBaidu(mappoint){
		var map = new BMap.Map("allmap");
		var point = new BMap.Point(mappoint.lng,mappoint.lat);
		map.centerAndZoom(point, 16);
		map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
		var marker = new BMap.Marker(point,{icon:null});  
		map.addOverlay(marker); 
	}
	
	/**
	* 初始化Googel地图
	**/
    function initMapGoogel(mappoint){
    	var myCenter=new google.maps.LatLng(mappoint.lat,mappoint.lng);
    	var mapProp = {center:myCenter,zoom:16,mapTypeId:google.maps.MapTypeId.ROADMAP};
    	var map=new google.maps.Map(document.getElementById("allmap"),mapProp);
    	var marker=new google.maps.Marker({position:myCenter,icon:null });
    	marker.setMap(map);
    }

/**
* 初始化运动报表
*
* @param imeis
* @param startTime
* @param endTime
**/
//TODO 运动统计 
var isExportRun = false;
var sportTotalRecord=0;
var sportPageNo = 1;
var sportPageSize =10;

function cleanRunData(statu){
	if(statu == 1){
		$("#qucikTime_sport>button:eq(0)").trigger("click").addClass("btn-primary");
	}
	$('#run-tbody').html(template('run-tbody-json',null));
	$("#run-noData").show(); 
	$("#run-loading").hide();
	$("#allmileage").html(0);   
	$("#alloverSpeedTimes").html(0);
	$("#allstopTimes").html(0);
	//$("#run-paging").hide();
	isExportRun = false;
}

function initRunPage(param){
	$("#run-paging").pagination({
		prevText: $.i18n.prop("page.previous") ,
		nextText: $.i18n.prop("page.next"),
		items: sportTotalRecord,
     	itemsOnPage: sportPageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param, event){
     		if(event && (event.type=="click" || event.type=="change")){
     			sportPageNo = pageNumber;
     			sportPageSize = pageSize;
     			initRunReport(sportPageNo,sportPageSize,param);
     		}
     	},
     	onInit : function (){
     		$("#run-paging").pagination("selectPage",sportPageNo);
     	}
	});
}
function initRunReport(param){
	isExportRun = false;
	$('#run-tbody').html(template('run-tbody-json',null));
	$("#run-noData").hide();
	$("#run-loading").show();
	//$("#run-paging").hide();
	var startTime = $("#startTime_sport").val();		
	var endTime   = $("#endTime_sport").val();
	
	if(!initCheckPickerTime({"startTime":startTime,"endTime":endTime},null)){
		cleanRunData(0);
		return
	}
//	if(!checkInputDevNameAndImei("sport")){
//		cleanRunData();
//		return
//	}
//	var imeis = $("#queryDevice_select_mileage").val();
//	if(imeis){
//		var checkImeis = checkExpiredActivation(imeis);
//		if(checkImeis.indexOf("b")>=0){
//			cleanMileageData();
//			return;
//		}
//		if(checkImeis){
//			parent.layer.confirm(checkImeis+$.i18n.prop("cust.CheckExpiredActivation"), {
//				btn: [$.i18n.prop("comm.Confirm")] //按钮
//			});
//			cleanMileageData();
//			return;
//		}
//	}
	initPramsImeis(userId);
	setCaching(userId,"Sport",null,startTime,endTime,cache_imeis,null);
	if(!param){
		param = {"userId":userId,"startTime":startTime,"imeis":cache_imeis,"endTime":endTime,"startRow":sportPageNo,"pageSize":sportPageSize};
	}
	param.startRow = sportPageNo;
	param.sportPageSize = sportPageSize;
	$.ajax({
		type:'POST',
		url:_ctx+"/runReport/getList",  
		async:true, 
		cache:false,
		data:param,
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
		error:function(e){
			ajaxError("initRunReport() ",e);
		},  
		success:function(returnData){
			if(returnData.code==0 && returnData.data && returnData.data.length>0){
				var allmileage=0;       		 //总里程
				var alloverSpeedTimes=0;		 //总超速次数
				var allstopTimes=0;              //总停留次数
				var data = {"result":returnData.data}
				$.each(data.result,function(i,v){
					allmileage	     = (Number(allmileage)+Number(v.mileage)).toFixed(3);
					alloverSpeedTimes= Number(alloverSpeedTimes)+Number(v.overSpeedTimes);
					allstopTimes     = Number(allstopTimes)+Number(v.stopTimes);
				});
				if(data.result.length>0){
					isExportRun=true;
				}
				$("#allmileage").html(allmileage);   
				$("#alloverSpeedTimes").html(alloverSpeedTimes);
				$("#allstopTimes").html(allstopTimes); 
				$('#run-tbody').html(template('run-tbody-json',data));
				$("#run-noData").hide(); 
				if(sportPageNo == 1){
					initRunPage(param);
				}
			}else{
				$('#run-tbody').html(template('run-tbody-json',null));
				$("#run-noData").show(); 
				$("#allmileage").html(0);   
				$("#alloverSpeedTimes").html(0);
				$("#allstopTimes").html(0);
			}
			tableHeaderAutoWidth("#sportTableHeader","#sportTableContent");//运动总览表头自动宽度
			
			$("#run-loading").hide();
		}
	});
}

/**
 * 导出运动统计
 */
// TODO  导出运动统计
function exportRunReport(){
	$("#userIdSport").val(userId);
	if(isExportRun){
		$("#runForm").submit();
	}else{
		layer.msg($.i18n.prop("header.MileageReport.NoDataForExporting"), {time: 2000}); 
	}
}

$("input[type='radio']").on('ifChecked', function(){
	isExportMileage = false;
	if($("input[name=type]:checked").val()=="segment"){   //按里程统计
		$("#allmileages").html(0);
		$("#allmileageshours").html(0);
		$('#mileage-tbody').html(template('mileage-tbody-json',null));
		$("#mileage-noData").show();
		tableHeaderAutoWidth("#mileageTableHeader","#mileageTableContent");//里程统计表格
	}else{
		$("#allmileages-day").html(0);
		$('#mileage-day-tbody').html(template('mileage-day-tbody-json',null));
		$("#mileage-day-noData").show();
		tableHeaderAutoWidth("#dayTableHeader","#dayTableHeader");//里程按天统计表格
	}
	//setCaching("Mileage",null,$("#startTime_mileage").val(),$("#endTime_mileage").val(),$("#queryDevice_select_mileage").val(),$("input[name=type]:checked").val());
});
/**
* 初始化里程报表
*
* @param imeis
* @param startTime
* @param endTime
**/
//TODO 里程统计
var MileageTotalRecord=0;
var MileagePageNo = 1;
var MileagePageSize =10;
var isExportMileage = false;
function cleanMileageData(){
	$('#mileage-tbody').html(template('mileage-tbody-json',null));
	$("#allmileages-day").html(0);
	$('#mileage-day-tbody').html(template('mileage-day-tbody-json',null));
	$("#allmileages").html(0);
	$("#allmileageshours").html(0);
	$("#mileage-noData").show();
	$("#paging-day").hide();
	$("#paging-mileage").hide();
	$("#mileage-day-noData").show();
	$("#mileage-loading").hide();
	$("#mileage-day-loading").hide();
}
function initMileagePage(param){
	$("#paging-mileage").pagination({
		prevText: $.i18n.prop("page.previous") ,
		nextText: $.i18n.prop("page.next"),
		items: MileageTotalRecord,
     	itemsOnPage: MileagePageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param, event){
     		if(event && (event.type=="click" || event.type=="change")){
     			MileagePageNo = pageNumber;
     			MileagePageSize = pageSize;
     			initMileageReport(MileagePageNo,MileagePageSize,param);
     		}
     	},
     	onInit : function (){
     		$("#paging-mileage").pagination("selectPage",MileagePageNo);
     	}
	});
}

function initMileageDayPage(param){
	$("#paging-day").pagination({
		prevText: $.i18n.prop("page.previous") ,
		nextText: $.i18n.prop("page.next"),
		items: MileageTotalRecord,
     	itemsOnPage: MileagePageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param, event){
     		if(event && (event.type=="click" || event.type=="change")){
     			MileagePageNo = pageNumber;
     			MileagePageSize = pageSize;
     			initMileageReport(MileagePageNo,MileagePageSize,param);
     		}
     	},
     	onInit : function (){
     		$("#paging-day").pagination("selectPage",MileagePageNo);
     	}
	});
}

function initMileageReport(pageNo,intPageSize,param){
	
	if(pageNo){
		MileagePageNo = pageNo;
	}
	if(intPageSize){
		MileagePageSize = intPageSize;
	}
	isExportMileage = false;
	$("#mileage-noData").hide();
	$("#mileage-loading").show();
	$("#mileage-day-noData").hide();
	$("#mileage-day-loading").show();
	$('#mileage-day-tbody').hide();
	$('#mileage-tbody').hide();
	$("#paging-mileage").hide();
	$("#paging-day").hide();
	var startTime = $("#startTime_mileage").val();	
	var endTime   = $("#endTime_mileage").val();
	var type	  = $("input[name=type]:checked").val();
	if(!initCheckPickerTime({"startTime":startTime,"endTime":endTime},type)){
		cleanMileageData();
		return
	}
	if(!checkInputDevNameAndImei("mileage")){
		//parent.layer.msg($.i18n.prop("cust.PleaseenterthedevicenameorIMEI"),{icon: 7});
		cleanMileageData();
		return
	}
	var imeis = $("#queryDevice_select_mileage").val();
	if(imeis){
		var checkImeis = checkExpiredActivation(imeis);
		
		if(checkImeis.indexOf("b")>=0){
//			parent.layer.confirm($.i18n.prop("header.Report.ImeiNoData")+": "+checkImeis.replace("b",""), {
//				btn: [$.i18n.prop("comm.Confirm")] //按钮
//			});
			cleanMileageData();
			return;
		}
		if(checkImeis){
			layer.confirm(checkImeis+$.i18n.prop("cust.CheckExpiredActivation"), {
				btn: [$.i18n.prop("comm.Confirm")] //按钮
			});
			cleanMileageData();
			return;
			//parent.layer.msg(all+$.i18n.prop("cust.CheckExpiredActivation"), {time: 2000});
		}
	}
	setCaching(userId,"Mileage",null,startTime,endTime,$("#queryDevice_select_mileage").val(),type);
	if(!param){
		param = {"userId": userId,"imeis":$("#queryDevice_select_mileage").val(),"startTime":startTime,"endTime":endTime,"type":type,"startRow":MileagePageNo,"pageSize":MileagePageSize};
	}
	param.startRow = MileagePageNo;
	param.pageSize = MileagePageSize;
	$.ajax({
		type:'POST',
		url:_ctx+"/mileageReportController/getList",  
		async:true, 
		cache:false,
		data:param,
		complete: function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
			if(type=="segment"){
				tableHeaderAutoWidth("#mileageTableHeader","#mileageTableContent");//里程统计表格
			}else{
				tableHeaderAutoWidth("#dayTableHeader","#dayTableHeader");//里程按天统计表格
			}
		},
		error:function(e){
			ajaxError("initMileageReport() ",e);
		},  
		success:function(returnData){
			if(returnData.code==0 && returnData.data.data && returnData.data.data.length>0){
				isExportMileage = true;
				//var allmileages=0;       		 //总里程
				//var allmileageshours=0;		 	 //总耗时
				var data = {"result":returnData.data.data}
				
//				$.each(data.result,function(i,v){
//					allmileages	     = (Number(allmileages)+Number(v.dis)).toFixed(3);
//					allmileageshours = Number(allmileageshours)+Number(v.runTime);
//				});
//				$.each(data.result,function(i,v){
//					v.startAddr = "";
//					v.endAddr = "";
//					
//				});
				if(type=="segment"){   //按里程统计
					var  time = 0;
//					if (allmileageshours!="" && allmileageshours !=null) {
//						var hour = Math.floor (allmileageshours / 3600);
//						var other = allmileageshours % 3600;
//						var minute = Math.floor (other / 60);
//						var second = (other % 60).toFixed (0);
//						time = hour + "小时" + minute + "分"+second+"秒";
//					}
					time=returnData.data.totalTime.replace("小时",$.i18n.prop('header.MileageReport.hours')).replace("分", $.i18n.prop('header.MileageReport.minutes')).replace("秒", $.i18n.prop('Alert.seconds'));
					$("#allmileages").html(returnData.data.totalDistiance);
					$("#allmileageshours").html(time);
					if(data.result && data.result.length > 0){
						$.each(data.result,function(i,v){
							if(v.runTimeSecond){
								v.runTimeSecond = v.runTimeSecond.replace("小时",$.i18n.prop('header.MileageReport.hours')).replace("分", $.i18n.prop('header.MileageReport.minutes')).replace("秒", $.i18n.prop('Alert.seconds'));
							}
						});
					}
					$('#mileage-tbody').html(template('mileage-tbody-json',{result: data.result,pageNo:MileagePageNo,pageSize:MileagePageSize}));
					$("#mileage-noData").hide();
					$("#mileage-day-noData").hide();
					$("#paging-mileage").show();
					$("#pageNoMileage").val(MileagePageNo);
					$("#pageSizeMileage").val(MileagePageSize);
					MileageTotalRecord = returnData.data.dataTotalRows;
					$('#mileage-tbody').show();
					$(".mileage-statistical-box .table-scrollbar").scrollTop(0);
					if(MileagePageNo == 1){
						initMileagePage(param);
					}
				}else{
					
					$("#allmileages-day").html(returnData.data.totalDistiance);
					$('#mileage-day-tbody').html(template('mileage-day-tbody-json',{result: data.result,pageNo:MileagePageNo,pageSize:MileagePageSize}));
					$("#paging-day").show();
					$("#mileage-noData").hide();
					$("#mileage-day-noData").hide();
					
					MileageTotalRecord = returnData.data.dataTotalRows;
					$("#mileage-day-tbody").show();
					if(MileagePageNo == 1){
						initMileageDayPage(param);
					}
				}
			}else{
				if(type=="segment"){   //按里程统计
					$("#allmileages").html(0);
					$("#allmileageshours").html(0);
					$('#mileage-tbody').html(template('mileage-tbody-json',null));
					$("#mileage-noData").show();
					$("#paging-mileage").hide();
				}else{
					$("#allmileages-day").html(0);
					$("#paging-day").hide();
					$('#mileage-day-tbody').html(template('mileage-day-tbody-json',null));
					$("#mileage-day-noData").show();
				}
			}
			$("#mileage-loading").hide();
			$("#mileage-day-loading").hide();
		}
	});
} 

/**
 * 里程统计
 */
//TODO 导出里程统计
function exportMileageReport(){
	$("#Mileageimeis").val();
	if(isExportMileage){
		if($("#language").val()!="zh" && $("#typeMileage").val() == "segment"){
			var jsonMileage = getJsonMileage();
			$("#jsonMileage").val(jsonMileage);
		}
		$("#MileageFrom").submit();
	}else{
		layer.msg($.i18n.prop("header.MileageReport.NoDataForExporting"), {time: 2000}); 
	}
}


/**
* 初始化超速报表
*
* @param imeis
* @param startTime
* @param endTime
**/
//TODO 超速报表
var OverSpeedTotalRecord=0;
var OverSpeedPageNo = 1;
var OverSpeedPageSize =10;
var isOverspeed = false;

function cleanOverSpeedData(){
	$('#overspeed-tbody').html(template('overspeed-tbody-json',null));
	$("#overspeed-noData").show();
	$("#paging-overspeed").hide();
	$("#overspeed-loading").hide();
	$("input[name=speed]").val(""); 
}


function initOverspeedReport(pageNo,intPageSize,param){
	$("#overspeed-noData").hide();
	$("#overspeed-loading").show();
	$('#overspeed-tbody').hide();
	$("#paging-overspeed").hide();
	if(pageNo){
		OverSpeedPageNo = pageNo;
	}
	if(intPageSize){
		OverSpeedPageSize = intPageSize;
	}
	isOverspeed = false;
	var startTime = $("#startTime_overspeed").val();		
	var endTime   = $("#endTime_overspeed").val();
	var speed     = $("input[name=speed]").val(); 
	if(!initCheckPickerTime({"startTime":startTime,"endTime":endTime})){
		cleanOverSpeedData();
		return
	}
	if(!checkInputDevNameAndImei("Overspeed")){
		cleanOverSpeedData();
		return
	}
	if(speed){
	    if(!((/^(\+|-)?\d+$/.test(speed)) && speed > 0 )){  
	    	layer.msg($.i18n.prop("comm.IsNum"), {time: 2000});
	    	$("input[name=speed]").focus();
	    	$('#overspeed-tbody').html(template('overspeed-tbody-json',null));
	    	$("#overspeed-noData").show();
	    	$("#paging-overspeed").hide();
	    	$("#overspeed-loading").hide();
		    return;
	    }  
	}
	var imeis = $("#queryDevice_select_Overspeed").val();
	if(imeis){
		
		var checkImeis = checkExpiredActivation(imeis);
		if(checkImeis.indexOf("b")>=0){
//			parent.layer.confirm($.i18n.prop("header.Report.ImeiNoData")+": "+checkImeis.replace("b",""), {
//				btn: [$.i18n.prop("comm.Confirm")] //按钮
//			});
			cleanOverSpeedData();
			return;
		}
		if(checkImeis){
			layer.confirm(checkImeis+$.i18n.prop("cust.CheckExpiredActivation"), {
				btn: [$.i18n.prop("comm.Confirm")] //按钮
			});
			cleanOverSpeedData();
			return;
		}
	}
	setCaching(userId,"Overspeed",null,startTime,endTime,$("#queryDevice_select_Overspeed").val(),null);
	if(!param){
		param = {"speed":speed,"userId":userId,"imeis":$("#queryDevice_select_Overspeed").val(),"startTime":startTime,"endTime":endTime,"startRow":OverSpeedPageNo,"pageSize":OverSpeedPageSize};
	}
	param.startRow = OverSpeedPageNo;
	param.pageSize = OverSpeedPageSize;
	$("#pageNoOverspeed").val(OverSpeedPageNo);
	$("#pageSizeOverspeed").val(OverSpeedPageSize);
	//if(!checkInputDevNameAndImei("Overspeed") && !initCheckPickerTime({"startTime":startTime,"endTime":endTime})){$("#overspeed-loading").hide();return}
	$.ajax({
		type:'POST',
		url:_ctx+"/overspeed/getList",  
		async:true, 
		cache:false,
		data:param,
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
		error:function(e){
			ajaxError("initOverspeedReport() ",e);
		},  
		success:function(returnData){
			if(returnData.code==0 && returnData.data && returnData.data.length>0){
//				$.each(returnData.data,function(i,v){
//					v.addr = "";
//				});
				isOverspeed = true;
				OverSpeedTotalRecord = returnData.dataTotalRows;
				if(OverSpeedPageNo == 1){
					initOverSpeedPage(param);
				}
				$('#overspeed-tbody').html(template('overspeed-tbody-json',{"result":returnData.data,pageNo:OverSpeedPageNo,pageSize:OverSpeedPageSize}));
				$('#overspeed-tbody').show();
				$("#overspeed-noData").hide();
				$("#paging-overspeed").show();
			}else{
				$('#overspeed-tbody').html(template('overspeed-tbody-json',null));
				$("#overspeed-noData").show();
				$("#paging-overspeed").hide();
			}
			tableHeaderAutoWidth("#overspeedTableHeader","#overspeedTableContent");//超速统计表格
			
			$("#overspeed-loading").hide();
		}
	});
}

function CheckValue(obj){
	if(obj>0){
		$("#SpeedLimit").removeClass("form-control-error");
	}
}
function CheckInputValue(endCName){
	if($("#queryDevice_select_"+endCName).val()!=""){
		$("#queryDevice_select_"+endCName).removeClass("form-control-error");
	}
}

/**
 * 分页插件初始化
 * 
 */
//TODO 超速报表分页
function initOverSpeedPage(param){
	$("#paging-overspeed").pagination({
		prevText: $.i18n.prop("page.previous") ,
		nextText: $.i18n.prop("page.next"),
		items: OverSpeedTotalRecord,
     	itemsOnPage: OverSpeedPageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param, event){		
     		if(event && (event.type=="click" || event.type=="change")){
     			OverSpeedPageNo  = pageNumber;
     			OverSpeedPageSize = pageSize;
     			initOverspeedReport(OverSpeedPageNo,OverSpeedPageSize,param);
     		}
     	},
     	onInit : function (){//初始化的时候选择页码
     		$("#paging-overspeed").pagination("selectPage",OverSpeedPageNo);
     	}
	});
}

/**
 * 导出超速报表
 */
//TODO 导出超速报表
function exportOverspeedReport(){ 
	$("#OverspeedUserId").val(userId);
	if($("#language").val()!="zh"){
		var jsonOverspeed = getJsonOverspeed();
		$("#jsonOverspeed").val(jsonOverspeed);
	}
	
	if(isOverspeed){
		$("#OverspeedFrom").submit();
	}else{
		layer.msg($.i18n.prop("header.MileageReport.NoDataForExporting"), {time: 2000}); 
	}
}



/**
* 初始化停留报表
*
* @param imeis
* @param startTime
* @param endTime
**/
//TODO 初始化停留报表

var StopCarTotalRecord=0;
var StopCarPageNo = 1;
var StopCarPageSize = 10;
var isStopCarRun = false;
function cleanStopCarData(type){
	$("#"+type+"-tbody").html(template(type+"-tbody-json",null));
	$("#paging-"+type).hide();
	$("#noData-"+type).show();
	$("#"+type+"-alltimes").html(0);
	$("#loading-"+type).hide();
}
function initStopCarReport(type,pageNo,intPageSize,param){
	$("#noData-"+type).hide();
	$("#loading-"+type).show();
	$("#"+type+"-tbody").hide();
	$("#paging-"+type).hide();
	if(pageNo){
		StopCarPageNo = pageNo;
	}
	if(intPageSize){
		StopCarPageSize = intPageSize;
	}
	isStopCarRun = false;
	var startTime = $("#startTime_"+type).val();		
	var endTime   = $("#endTime_"+type).val();
	var acc	  = $("#acc-statue-"+type).val();
	if(!initCheckPickerTime({"startTime":startTime,"endTime":endTime})){
		cleanStopCarData(type);
		return
	}
	if(!checkInputDevNameAndImei(type)){
		cleanStopCarData(type);
		return
	}
	var imeis = $("#queryDevice_select_"+type).val();
	if(imeis){
		var checkImeis = checkExpiredActivation(imeis);
		if(checkImeis.indexOf("b")>=0){
//			parent.layer.confirm($.i18n.prop("header.Report.ImeiNoData")+": "+checkImeis.replace("b",""), {
//				btn: [$.i18n.prop("comm.Confirm")] //按钮
//			});
			cleanStopCarData(type);
			return;
		}
		if(checkImeis){
			layer.confirm(checkImeis+$.i18n.prop("cust.CheckExpiredActivation"), {
				btn: [$.i18n.prop("comm.Confirm")] //按钮
			});
			cleanStopCarData(type);
			return;
		}
	}
	setCaching(userId,type,acc,startTime,endTime,$("#queryDevice_select_"+type).val(),null);
	$("#type"+type).val(type);
	if(!param){
		param = {"userId": userId,"imeis":$("#queryDevice_select_"+type).val(),"startTime":startTime,"endTime":endTime,"acc":acc,"startRow":StopCarPageNo,"pageSize":StopCarPageSize};
	}
	param.startRow = StopCarPageNo;
	param.pageSize = StopCarPageSize;
	if(acc == "off"){
		$("#pageNoStopCar").val(StopCarPageNo);
		$("#pageSizeStopCar").val(StopCarPageSize);
	}else{
		$("#pageNoStopNotOff").val(StopCarPageNo);
		$("#pageSizeStopNotOff").val(StopCarPageSize);
	}
	//if(!checkInputDevNameAndImei("Parking") && !initCheckPickerTime({"startTime":startTime,"endTime":endTime})){$("#stopcar-loading").hide();return}
	$.ajax({
		type:'POST',
		url:_ctx+"/stopCar/getList",  
		async:true, 
		cache:false,
		data:param,
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
		error:function(e){
			ajaxError("initStopCarReport() ",e);
		},
		complete: function(){
			if(type == "stopNotOff"){
				tableHeaderAutoWidth("#notExtinguishTableHeader","#notExtinguishTableContent");//停车未熄火统计表格
			}else{
				tableHeaderAutoWidth("#remainTableHeader","#remainTableContent");//停留统计表格
			}
		},
		success:function(returnData){
			if(returnData.code==0 && returnData.data && returnData.data.length>0){
//				$.each(returnData.data,function(i,v){
//					v.addr = "";
//				});
				isStopCarRun=true;
				var  time = 0;
				var data = {"result":returnData.data}
				$.each(data.result,function(i,v){
					//stopcar_alltimes = stopcar_alltimes*1+v.stopSecond*1;
					if(v.acc=="on"){
						v.acc=$.i18n.prop("comm.ParkingNotOFF");
					}else{
						v.acc=$.i18n.prop("header.StopCarReport.Stop");
					}
				});
				var stopcar_alltimes=returnData.msg;	
				if (stopcar_alltimes!="" && stopcar_alltimes !=null) {
					var hour = Math.floor (stopcar_alltimes / 3600);
					var other = stopcar_alltimes % 3600;
					var minute = Math.floor (other / 60);
					var second = (other % 60).toFixed (0);
					time = hour + "小时" + minute + "分"+second+"秒";
				}
				if($("#language").val()!="zh"){
					time=time.replace("小时",$.i18n.prop('header.MileageReport.hours')).replace("分", $.i18n.prop('header.MileageReport.minutes')).replace("秒", $.i18n.prop('Alert.seconds'));
					//time=time.replace("小时","hours").replace("分", "minutes").replace("秒", "second");
				}
				$("#"+type+"-alltimes").html(time);
				$("#"+type+"-tbody").html(template(type+"-tbody-json",{result:data.result,pageNo:StopCarPageNo,pageSize:StopCarPageSize}));
				StopCarTotalRecord = returnData.dataTotalRows;
				$("#"+type+"-tbody").show();
				if(StopCarPageNo == 1){
					initStopCarPage(param,type);
				}
				$("#paging-"+type).show();
			}else{
				cleanStopCarData(type);
			}		
			$("#loading-"+type).hide();
		}
	});
}

/**
 * 停留报表分页插件初始化
 * 
 */
//TODO 停留报表分页
function initStopCarPage(param,type){
	$("#paging-"+type).pagination({
		prevText: $.i18n.prop("page.previous"),
		nextText: $.i18n.prop("page.next"),
		items: StopCarTotalRecord,
     	itemsOnPage: StopCarPageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param, event){		
     		if(event && (event.type=="click" || event.type=="change")){
     			StopCarPageNo   = pageNumber;
     			StopCarPageSize = pageSize;
     			initStopCarReport(type,StopCarPageNo,StopCarPageSize,param);
     		}
     	},
     	onInit : function (){//初始化的时候选择页码
     		$("#paging-"+type).pagination("selectPage",StopCarPageNo);
     	}
	});
}

/**
 * 导出停留报表
 */
//TODO 导出停留报表
function exportStopCarReport(){
	$("#StopCarUserId").val(userId);
	if(isStopCarRun){
		if($("#language").val()!="zh"){
			var jsonStopCar = getJsonstopCar();
			$("#jsonStopCar").val(jsonStopCar);
		}
		$("#StopCarFrom").submit();
	}else{
		layer.msg($.i18n.prop("header.MileageReport.NoDataForExporting"), {time: 2000}); 
	}
}

/**
 * 导出停留报表
 */
//TODO 导出停留报表
function exportstopNotOffReport(){
	$("#stopNotOffUserId").val(userId);
	if(isStopCarRun){
		if($("#language").val()!="zh"){
			var jsonStopNotOff = getJsonStopNotOff();
			$("#jsonStopNotOff").val(jsonStopNotOff);
		}
		$("#stopNotOffFrom").submit();
	}else{
		layer.msg($.i18n.prop("header.MileageReport.NoDataForExporting"), {time: 2000}); 
	}
}

/**
 * 验证选择时间     
 * 
 * @param times
 * 	      times.startTime
 * 		  times.endTimes
 */
//TODO 时间校验
function  initCheckPickerTime(times,type){
//	if(!times.startTime){
//		$("input[name='startTime']").addClass("form-control-error");
//		return false;
//	}
//	if(!times.endTime){
//		$("input[name='endTime']").addClass("form-control-error");
//		return false;
//	}
    var start=new Date(times.startTime);  
    var end=new Date(times.endTime);
//    if(type == "day"){
//		var toDay = CheckToDay(0, "Today");
//		var checkToDay = new Date(toDay);
//		 if(checkToDay-start == 0){
//		    parent.layer.msg($.i18n.prop("comm.CanNotChooseToDay"), {time: 2000,icon: 7});
//		    return false;  
//		 }else if(checkToDay-end == 0){
//		    parent.layer.msg($.i18n.prop("comm.CanNotChooseToDay"), {time: 2000,icon: 7});
//		    return false;
//		 }
//	}
//   
    if(end-start < 0){
    	layer.msg($.i18n.prop("comm.StarttimegtEndtime"), {time: 2000,icon: 7}); 
        return false;  
    }  
    return true;  
}
	
//function CheckToDay(days,staisType){
//	var toDay = "";
//	var d=new Date(); 
//	d.setDate(d.getDate()+days); 
//	var month=d.getMonth()+1; 
//	var day = d.getDate(); 
//	if(month<10){ 
//		month = "0"+month; 
//	} 
//	if(day<10){ 
//		day = "0"+day; 
//	}
//	var hh=d.getHours();      //获取当前小时数(0-23)
//	var mm=d.getMinutes();    //获取当前分钟数(0-59)
//	var ss=d.getSeconds();    //获取当前秒数(0-59)
//	if(hh<10){
//		hh= "0" + hh; 
//	}
//	if(mm<10){
//		mm= "0" + mm; 
//	}
//	if(ss<10){
//		ss= "0" + ss; 
//	}
//	
//	toDay = d.getFullYear()+"-"+month+"-"+day
//	return toDay;
//}

/***
 * 点击运动报表里程
 * 
 * @param imei
 */
//TODO 点击运动报表 查看里程信息
function toMileageInfo(imei){
	query_history= "";
	$("#motion-ReportTab>ul>li").eq(1).click();
	query_history=imei+",";
	$("#queryDevice_select_mileage").val(query_history);
	
	var startTime = $("#startTime_sport").val();
	var endTime   = $("#endTime_sport").val();
	
	$("#startTime_mileage").val(startTime);
	$("#endTime_mileage").val(endTime);
	
	//判断是否还有btn-primary 样式
	$("#qucikTime_mileage").children().removeClass("btn-primary");
	
	initMileageReport('1','10');
}

/**
 * 点击查看地址
 * 
 * @param index
 * @param lng
 * @param lat
 * @param name
 */
//TODO 里程统计    
function clickAddres(index,lng,lat,type){
	$("#"+type+"_a_"+index).hide();
	$("#"+type+"_"+index).show();
	var allMapType = $.cookie('currtMapType');
	if(window._language!='zh'){
		$.ajax({
			type:'POST',
			url:_ctx+"/runReport/getPoint",  
			async:true, 
			cache:false,
			data:{"language":window._language,"Lat":lat,"Lng":lng,"allMapType" : allMapType},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			},
			error:function(e){
				ajaxError("Mapposition() ",e);
			},  
			success:function(returnData){
				if(returnData.code==0){
						//var point = new google.maps.LatLng(returnData.data.lat,returnData.data.lng);
						//var point = returnData.data.lat.toFixed(6)+','+returnData.data.lng.toFixed(6);
						var point = "";
						if($.browser.msie){
							point = new google.maps.LatLng(returnData.data.lat,returnData.data.lng);	
						}else{
							point = returnData.data.lat + ',' + returnData.data.lng;
						}
						//var point = lat+','+lng;
						getAddress(point,type+"_"+index,type+"_a_"+index,type);
					}
				}
			});
	}else{
		if(allMapType){
			if(allMapType == "googleMap"){
				$.ajax({
				type:'POST',
				url:_ctx+"/runReport/getPoint",  
				async:true, 
				cache:false,
				data:{"language":window._language,"Lat":lat,"Lng":lng,"allMapType" : allMapType},
				error:function(e){
					ajaxError("Mapposition() ",e);
				},  
				success:function(returnData){
					if(returnData.code==0){
						//var point = new google.maps.LatLng(returnData.data.lat,returnData.data.lng);
						//var point = returnData.data.lat.toFixed(6)+','+returnData.data.lng.toFixed(6);
						var point = "";
						if($.browser.msie){
							point = new google.maps.LatLng(returnData.data.lat,returnData.data.lng);	
						}else{
							point = returnData.data.lat + ',' + returnData.data.lng;
						}
						//var point = lat+','+lng;
						getAddress(point,type+"_"+index,type+"_a_"+index,type);
						}
					}
				});
		}else{
			var point = {"lat":lat,"lng":lng};
			getAddress(point,type+"_"+index,type);
			}
		}else{
			var point = {"lat":lat,"lng":lng};
			getAddress(point,type+"_"+index,type);
		}
	}
}

   /***
* 解析地址
* 
* @param point
* @param text
* @param name
*/
function reportWidth(type){
	if(type == "mileage"){
		tableHeaderAutoWidth("#mileageTableHeader","#mileageTableContent");//里程统计表格
	}else if(type == "overspeed"){
		tableHeaderAutoWidth("#overspeedTableHeader","#overspeedTableContent");//超速统计表格
	}else if(type == "stopcar"){
		tableHeaderAutoWidth("#remainTableHeader","#remainTableContent");//停留统计表格
	}else if(type == "stopNotOff"){
		tableHeaderAutoWidth("#notExtinguishTableHeader","#notExtinguishTableContent");//停车未熄火统计表格
	}else if(type == "alarm"){
		tableHeaderAutoWidth("#alarmDetailTableHeader","#alarmDetailTableContent");//告警详情表格
	}
}
//TODO 百度、谷歌地址解析回调    通用
function getAddress(point,text,cleanText,type){
	var allMapType = $.cookie('currtMapType');
	if(window._language!='zh'){
//		console.log(123);
//		$.ajax({
//            type:"post",
//            url:"https://maps.googleapis.com/maps/api/geocode/json?latlng="+point+"&language=en&sensor=false",
//            async:false,
//            dataType: "json",
//            success:function(data){
//            	alert(data);
//            	console.log(data);
//            	//console.log(data);
//            	if(data.results[0]){
//            		var address = data.results[0].formatted_address;
//            		console.log(address);
//            		//console.log(address);
//            		$("#"+text).attr("title",address);
//					$("#"+text).text(address);
//            	}else{
//            		$("#"+text).text($.i18n.prop("header.Addressresolutionfailure"));
//            	}
//            }
//        });
		if($.browser.msie){
			var geocoder = new google.maps.Geocoder();
			geocoder.geocode({
				'latLng' : point
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					if (results[0]) {
						$("#"+cleanText).text("");
						var address = results[0].formatted_address;
						var sindex = address.indexOf("邮政编码");
						if (sindex > 0) {
							$("#"+text).attr("title",address.substring(0, sindex));
							$("#"+text).text(address.substring(0, sindex));
						} else {
							$("#"+text).attr("title",address);
							$("#"+text).text(address);
						}
					}
				}else{
					$("#"+text).text($.i18n.prop("header.Addressresolutionfailure"));
				}
				reportWidth(type);
			});
		}else{
			$.post("https://maps.googleapis.com/maps/api/geocode/json?latlng=" +
					point + "&language="+window._language+"&sensor=false",function(data){
				if(data){
                	if(data.results[0]){
                		$("#"+cleanText).text("");
                		var address = data.results[0].formatted_address;
                		$("#"+text).attr("title",address);
						$("#"+text).text(address);
                	}else{
                		$("#"+text).text($.i18n.prop("header.Addressresolutionfailure"));
                	}
                	reportWidth(type);
				}
			},'json');
		}
	}else if(window._language=='zh'){
		if(allMapType){
			if(allMapType == "googleMap"){
				if($.browser.msie){
					var geocoder = new google.maps.Geocoder();
					geocoder.geocode({
						'latLng' : point
					}, function(results, status) {
						if (status == google.maps.GeocoderStatus.OK) {
							if (results[0]) {
								$("#"+cleanText).text("");
								var address = results[0].formatted_address;
								var sindex = address.indexOf("邮政编码");
								if (sindex > 0) {
									$("#"+text).attr("title",address.substring(0, sindex));
									$("#"+text).text(address.substring(0, sindex));
								} else {
									$("#"+text).attr("title",address);
									$("#"+text).text(address);
								}
							}
						}else{
							$("#"+text).text($.i18n.prop("header.Addressresolutionfailure"));
						}
						reportWidth(type);
					});
				}else{
					$.post("https://maps.googleapis.com/maps/api/geocode/json?latlng=" +
							point + "&language="+window._language+"&sensor=false",function(data){
						if(data){
		                	if(data.results[0]){
		                		$("#"+cleanText).text("");
		                		var address = data.results[0].formatted_address;
		                		$("#"+text).attr("title",address);
								$("#"+text).text(address);
		                	}else{
		                		$("#"+text).text($.i18n.prop("header.Addressresolutionfailure"));
		                	}
		                	reportWidth(type);
						}
					},'json');
				}
			}else{
				$.post("http://api.map.baidu.com/geocoder/v2/?ak=BunoOO8YbcdZjySu8wK3KclU&location=" +
						point.lat + "," + point.lng + "&pois=0&output=json&coordtype=wgs84ll",function(ret){
					if(ret){
						var formatted_address = ret.result.formatted_address;
						var sematic_description = ret.result.sematic_description;
						$("#"+text).attr("title",formatted_address+sematic_description);
						$("#"+text).text(formatted_address+sematic_description);
						reportWidth(type);
					}else{
                		$("#"+text).text($.i18n.prop("header.Addressresolutionfailure"));
                	}
				},'jsonp');
			}
		}else{
			$.post("http://api.map.baidu.com/geocoder/v2/?ak=BunoOO8YbcdZjySu8wK3KclU&location=" +
					point.lat + "," + point.lng + "&pois=0&output=json&coordtype=wgs84ll",function(ret){
				if(ret){
					var formatted_address = ret.result.formatted_address;
					var sematic_description = ret.result.sematic_description;
					$("#"+text).attr("title",formatted_address+sematic_description);
					$("#"+text).text(formatted_address+sematic_description);
					reportWidth(type);
				}else{
            		$("#"+text).text($.i18n.prop("header.Addressresolutionfailure"));
            	}
			},'jsonp');
		}
	}
}

/**
 * 导出告警总览
 */
//TODO  导出告警总览
function exportAlarmsReport(){
	if(alarmFromObj){
		$("#alarmForm").submit();
	}else{
		layer.msg($.i18n.prop("header.MileageReport.NoDataForExporting"), {time: 2000}); 
	}
}

/**
 * 导出告警详情
 */
//TODO  围栏告警统计
function exportAlarmInfoReport(){
	if(AlarmInfoFromObj){
		if($("#language").val()!="zh"){
			var jsonAlarmInfo = getJsonAlarmInfo();
			$("#jsonAlarmInfo").val(jsonAlarmInfo);
		}
		$("#alarmInfo_search_form").submit();
	}else{
		layer.msg($.i18n.prop("header.MileageReport.NoDataForExporting"), {time: 2000}); 
	}
}

/**
 * 导出围栏告警统计
 */
//TODO  围栏告警统计
function exportgeozoneReport(){
	if(geozoneFromObj){
		$("#geozonForm").submit();
	}else{
		layer.msg($.i18n.prop("header.MileageReport.NoDataForExporting"), {time: 2000}); 
	}
}

/**
 * 检查输入框
 */
//TODO  
function checkInputDevNameAndImei(endCName){
	if($("#queryDevice_select_"+endCName).val()=="" || $("#queryDevice_select_"+endCName).val()==null){
		$("#queryDevice_select_"+endCName).addClass("form-control-error");
		return false;
	}else{
		$("#queryDevice_select_"+endCName).removeClass("form-control-error");
		return true;
	}
}

/**
 * 获取ACC列表
 */
var accReportList;
var accflag=false;
function cleanAccData(){
	$("#accTable").html(template("acc-info",null));
	accflag=false;
	$("#acc_info_nodata").show();
	$("#acc_info-loading").hide();
	$('#aCCTotalTime').html(0);
	$('#aCCOn').html(0);
	$('#aCCOff').html(0);
}
function getAccInfo(){
	$("#acc_info_nodata").hide();
	$("#acc_info-loading").show();
	$("#accTable").hide();
	var statu = $("#accStatu option:selected").val();
	var startTime = $("#startTime_acc").val();		
	var endTime   = $("#endTime_acc").val();
	var accImeis = "";
	
	if(!initCheckPickerTime({"startTime":startTime,"endTime":endTime})){
		cleanAccData();
		return
	}
	if(!checkInputDevNameAndImei("acc")){
		cleanAccData();
		return
	}
	accImeis = $("#queryDevice_select_acc").val();
	if(accImeis){
		var checkImeis = checkExpiredActivation(accImeis);
		if(checkImeis.indexOf("b")>=0){
//			parent.layer.confirm($.i18n.prop("header.Report.ImeiNoData")+": "+checkImeis.replace("b",""), {
//				btn: [$.i18n.prop("comm.Confirm")] //按钮
//			});
			cleanAccData();
			return;
		}
		if(checkImeis){
			layer.confirm(checkImeis+$.i18n.prop("cust.CheckExpiredActivation"), {
				btn: [$.i18n.prop("comm.Confirm")] //按钮
			});
			cleanAccData();
			return;
		}
	}
	
	$.ajax({
		type:"post",
	    cache: false,
	    data: {"userId": userId,"imeis":$("#queryDevice_select_acc").val(),"startTime":startTime,"endTime":endTime,"status":statu,"order":"1"},
		url : _ctx + "/accReport/getList",
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
		success : function(ret) {
			if(ret && ret.code == 0){
				if(ret.data && ret.data.length > 0){
					var aCCTotalTime = 0;
					var minute = 0;
					var hour = 0;
					var newHour = 0 ;
					var countOn = 0;
					var countOff = 0;
					$.each(ret.data,function(i,v){
//						var startTime = v.startTime;
//						var endTime = v.endTime;
//						
//						var strStart = startTime.replace(/-/g,"/");
//						var strEnd = endTime.replace(/-/g,"/");
//						var dateStart = new Date(strStart );
//						var dateEnd = new Date(strStart );
//						var start = dateStart.getFullYear()+"-"+((dateStart.getMonth()+1)<10?"0":"")+(dateStart.getMonth()+1)+"-"+(dateStart.getDate()<10?"0":"")+dateStart.getDate();
//						var end = dateEnd.getFullYear()+"-"+((dateEnd.getMonth()+1)<10?"0":"")+(dateEnd.getMonth()+1)+"-"+(dateEnd.getDate()<10?"0":"")+dateEnd.getDate();
//						v.startTime = start;
//						v.endTime = end;
						var accStr = v.acc;
						if(accStr=="打开"){
							countOn++;
							v.acc = $.i18n.prop('header.ACCReport.open');
						}else if(accStr=="关闭"){
							countOff++;
							v.acc = $.i18n.prop('header.ACCReport.close');
						}
						if(v.durSecond){
							v.durSecond = v.durSecond.replace("小时",$.i18n.prop('header.MileageReport.hours')).replace("分", $.i18n.prop('header.MileageReport.minutes')).replace("秒", $.i18n.prop('Alert.seconds'));
						}
					});
					if(ret.msg){
						ret.msg = ret.msg.replace("小时",$.i18n.prop('header.MileageReport.hours')).replace("分", $.i18n.prop('header.MileageReport.minutes')).replace("秒", $.i18n.prop('Alert.seconds'));
					}
					$('#aCCTotalTime').html(ret.msg);
					$('#aCCOn').html(countOn);
					$('#aCCOff').html(countOff);
					$("#accTable").html(template("acc-info",{result:ret.data}));
					$("#statuTable").val(statu);
					$("#startTimeTable").val(startTime);
					$("#endTimeTable").val(endTime);
					$("#accImeisTable").val(accImeis);
					$("#userIdTable").val(userId);
					$("#accTable").show();
					accflag = true;
					accReportList = ret.data;
					$("#acc_info_nodata").hide();
				}else{
					$('#aCCTotalTime').html(0);
					$('#aCCOn').html(0);
					$('#aCCOff').html(0);
					$("#accTable").html(template("acc-info",null));
					accflag=false;
					$("#acc_info_nodata").show();
				}
			}else{
				$("#acc-info").html(template("acc-info",null));
				accflag=false;
				$("#acc_info_nodata").show();
				$('#aCCTotalTime').html(0);
				$('#aCCOn').html(0);
				$('#aCCOff').html(0);
			}
			tableHeaderAutoWidth("#accTableHeader","#accTableContent");//ACC统计表格
			$("#acc_info-loading").hide();
		},
		error : function(e) {
			ajaxError("getAccInfo()", e);
		}
	});
	
}
 
/**
 * 导出acc报表
 */
//TODO 导出acc报表
function accNewExport(){
	if(accflag){
		$("#accFrom").submit();
	}else{
		layer.msg($.i18n.prop("header.MileageReport.NoDataForExporting"), {time: 2000});
	}
}

/**
 * 获取离线列表
 */
var offLineflag=false;
var dayCondition="all";
var containSubordinate = 1;
var offLineTotalRecord=0;
var offLinePageNo = 1;
var offLinePageSize = 10;
$("#icheckOffLine input[type='radio']").on("ifChecked",function(event){
	dayCondition = $(this).val();
});
$("#icheckContainSub").iCheck().on("ifChecked",function(event){
	containSubordinate = 0;
}).on("ifUnchecked",function(event){
	containSubordinate = 1;
});
function cleanOffLineData(){
	dayCondition="all";
	containSubordinate = 1;
	offLineTotalRecord=0;
	offLinePageNo = 1;
	offLinePageSize = 10;
	$("#icheckOffLine input[type='radio']").eq(0).iCheck('check');
	$("#icheckContainSub").iCheck("uncheck");
	$("#offLineTable").html(template("offLine-info",null));
	$("#offLine_nodata").show();
	$("#offLine-loading").hide();
	$("#paging-offLine").hide();
	offLineflag=false;
}
function getOffLineReport(offLinePageNo,offLinePageSize,param){
	$("#offLineTable").html(template("offLine-info",null));
	$("#offLine_nodata").hide();
	$("#offLine-loading").show();
	$("#paging-offLine").hide();
	if(!param){
		param = {"dayCondition":dayCondition,"containSubordinate":containSubordinate,"userId":userId,"pageNo":offLinePageNo,"pageSize":offLinePageSize};
	}
	param.pageNo = offLinePageNo;
	param.pageSize = offLinePageSize;
	$.ajax({
		type:"post",
	    cache: false,
	    data: param,
		url : _ctx + "/offLineReportController/getList",
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
		success : function(returnData) {
			if(returnData.data && returnData.data.length>0){
//				$.each(returnData.data,function(i,v){
//					if(v.offLineNumberOfDays){
//						v.offLineNumberOfDays = v.offLineNumberOfDays.replace('天',$.i18n.prop('index.day')).replace("小时",$.i18n.prop('header.MileageReport.hours')).replace("分", $.i18n.prop('header.MileageReport.minutes')).replace("秒", $.i18n.prop('Alert.seconds'));
//					}
//				});
				$("#offLineTable").html(template("offLine-info",{result:returnData.data,"pageNo":offLinePageNo,"pageSize":offLinePageSize}));
				$("#paging-offLine").show();
				$("#offLine_nodata").hide();
				$("#offLineDayCondition").val(dayCondition);
				$("#offLineContainSubordinate").val(containSubordinate);
				$("#offLineUserId").val(userId);
				$("#offLinePageNo").val(offLinePageNo);
				$("#offLinePageSize").val(offLinePageSize);
				offLineflag=true;
				offLineTotalRecord = returnData.dataTotalRows;
				if(offLinePageNo == 1){
					initOffLinePage(offLinePageNo,offLinePageSize,param);
				}
			}else{
				$("#offLineTable").html(template("offLine-info",null));
				$("#offLine_nodata").show();
				$("#paging-offLine").hide();
				offLineflag=false;
			}
			$("#offLine-loading").hide();
			tableHeaderAutoWidth("#offlineTableHeader","#offlineTableContent");//离线统计表格
		},
		error : function(e) {
			ajaxError("getOffLineReport()", e);
		}
	});
	
}

/**
 *离线报表分页
 * 
 */
function initOffLinePage(offLinePageNo,offLinePageSize,param){
	$("#paging-offLine").pagination({
		prevText: $.i18n.prop("page.previous"),
		nextText: $.i18n.prop("page.next"),
		items: offLineTotalRecord,
     	itemsOnPage: offLinePageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param, event){		
     		if(event && (event.type=="click" || event.type=="change")){
     			offLinePageNo   = pageNumber;
     			offLinePageSize = pageSize;
     			getOffLineReport(offLinePageNo,offLinePageSize,param);
     		}
     	},
     	onInit : function (){//初始化的时候选择页码
     		$("#paging-offLine").pagination("selectPage",offLinePageNo);
     	}
	});
}

/**
 * 导出离线报表
 */
function OffLineExport(){
	if(offLineflag){
		$("#OffLineFrom").submit();
	}else{
		layer.msg($.i18n.prop("header.MileageReport.NoDataForExporting"), {time: 2000});
	}
}

/**
 * 获取在线列表
 */
var onLineflag=false;
var dayCondition="all";
var containSubordinate = 1;
var onLineTotalRecord=0;
var onLinePageNo = 1;
var onLinePageSize = 10;
$("#icheckOnLine input[type='radio']").on("ifChecked",function(event){
	dayCondition = $(this).val();
});
$("#icheckContainSubOnLine").iCheck().on("ifChecked",function(event){
	containSubordinate = 0;
}).on("ifUnchecked",function(event){
	containSubordinate = 1;
});
function cleanOnLineData(){
	dayCondition="all";
	containSubordinate = 1;
	onLineTotalRecord=0;
	onLinePageNo = 1;
	onLinePageSize = 10;
	$("#icheckOnLine input[type='radio']").eq(0).iCheck('check');
	$("#icheckContainSubOnLine").iCheck("uncheck");
	$("#onLineTable").html(template("onLine-info",null));
	$("#onLine_nodata").show();
	$("#onLine-loading").hide();
	$("#paging-onLine").hide();
	onLineflag=false;
}
function getOnLineReport(onLinePageNo,onLinePageSize,param){
	$("#onLineTable").html(template("onLine-info",null));
	$("#onLine_nodata").hide();
	$("#onLine-loading").show();
	$("#paging-onLine").hide();
	if(!param){
		param = {"status": "on","dayCondition":dayCondition,"containSubordinate":containSubordinate,"userId":userId,"pageNo":onLinePageNo,"pageSize":onLinePageSize};
	}
	param.pageNo = onLinePageNo;
	param.pageSize = onLinePageSize;
	$.ajax({
		type:"post",
	    cache: false,
	    data: param,
		url : _ctx + "/offLineReportController/getList",
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
		success : function(returnData) {
			if(returnData.data && returnData.data.length>0){
				$("#onLineTable").html(template("onLine-info",{result:returnData.data,"pageNo":onLinePageNo,"pageSize":onLinePageSize}));
				$("#paging-onLine").show();
				$("#onLine_nodata").hide();
				$("#onLineDayCondition").val(dayCondition);
				$("#onLineContainSubordinate").val(containSubordinate);
				$("#onLineUserId").val(userId);
				$("#onLinePageNo").val(onLinePageNo);
				$("#onLinePageSize").val(onLinePageSize);
				$("#onLineStatus").val("on");
				onLineflag=true;
				onLineTotalRecord = returnData.dataTotalRows;
				if(onLinePageNo == 1){
					initOnLinePage(onLinePageNo,onLinePageSize,param);
				}
			}else{
				$("#onLineTable").html(template("onLine-info",null));
				$("#onLine_nodata").show();
				$("#paging-onLine").hide();
				onLineflag=false;
			}
			$("#onLine-loading").hide();
			tableHeaderAutoWidth("#onlineTableHeader","#onlineTableContent");//在线统计表格
		},
		error : function(e) {
			ajaxError("getOnLineReport()", e);
		}
	});
	
}

/**
 *离线报表分页
 * 
 */
function initOnLinePage(onLinePageNo,onLinePageSize,param){
	$("#paging-onLine").pagination({
		prevText: $.i18n.prop("page.previous"),
		nextText: $.i18n.prop("page.next"),
		items: onLineTotalRecord,
     	itemsOnPage: onLinePageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param, event){		
     		if(event && (event.type=="click" || event.type=="change")){
     			onLinePageNo   = pageNumber;
     			onLinePageSize = pageSize;
     			getOnLineReport(onLinePageNo,onLinePageSize,param);
     		}
     	},
     	onInit : function (){//初始化的时候选择页码
     		$("#paging-onLine").pagination("selectPage",onLinePageNo);
     	}
	});
}

/**
 * 导出离线报表
 */
function OnLineExport(){
	if(onLineflag){
		$("#OnLineFrom").submit();
	}else{
		layer.msg($.i18n.prop("header.MileageReport.NoDataForExporting"), {time: 2000});
	}
}

//去重
function clearRepetition(imeis){
	var new_arr=[];
	var arr= imeis.split(",");
	for(var i=0;i<arr.length;i++) {
		var items=arr[i];//判断元素是否存在于new_arr中，如果不存在则插入到new_arr的最后
		if($.inArray(items,new_arr)==-1) {
			new_arr.push(items);
		}
	}
	return new_arr;
}

function getJsonMileage(){
	var result = [];
	$("#mileageTableContent").find("tr").each(function(e){
		var trValue = $(this).children();
		var value = {"serialNumber":trValue[0].innerText, "deviceName":trValue[1].innerText, "imei":trValue[2].innerText,
				"mcType":trValue[3].innerText, "startTime":trValue[4].innerText, "endTime":trValue[5].innerText,
				"startAddr": trValue[6].innerText, "endAddr":trValue[7].innerText, "dis":trValue[8].innerText,
				"runTimeSecond":trValue[9].innerText, "avgSpeed":trValue[10].innerText}
		result.push(value);
	})
	
	//console.log(result);
	var resultV = {"data" : result};
	//console.log(resultV);
	var json = JSON.stringify(resultV);
	return json;
}

function getJsonOverspeed(){
	var result = [];
	$("#overspeedTableContent").find("tr").each(function(e){
		var trValue = $(this).children();
		var value = {"serialNumber":trValue[0].innerText, "deviceName":trValue[1].innerText,"imei":trValue[2].innerText,"mcType":trValue[3].innerText, 
		"time":trValue[4].innerText ,"speed":trValue[5].innerText ,"addr":trValue[6].innerText}
		result.push(value);
	})
	
	//console.log(result);
	var resultV = {"data" : result};
	//console.log(resultV);
	var json = JSON.stringify(resultV);
	return json;
}

function getJsonstopCar(){
	var result = [];
	$("#remainTableContent").find("tr").each(function(e){
		var trValue = $(this).children();
		var value = {"serialNumber":trValue[0].innerText, "deviceName":trValue[1].innerText,"imei":trValue[2].innerText,"mcType":trValue[3].innerText, 
		"acc":trValue[4].innerText ,"startTime":trValue[5].innerText ,"endTime":trValue[6].innerText
		 ,"addr":trValue[7].innerText ,"durSecond":trValue[9].innerText}
		result.push(value);
	})
	
	//console.log(result);
	var resultV = {"data" : result};
	//console.log(resultV);
	var json = JSON.stringify(resultV);
	return json;
}

function getJsonStopNotOff(){
	var result = [];
	$("#notExtinguishTableContent").find("tr").each(function(e){
		var trValue = $(this).children();
		var value = {"serialNumber":trValue[0].innerText, "deviceName":trValue[1].innerText,"imei":trValue[2].innerText,"mcType":trValue[3].innerText, 
		"acc":trValue[4].innerText ,"startTime":trValue[5].innerText ,"endTime":trValue[6].innerText
		 ,"addr":trValue[7].innerText ,"durSecond":trValue[9].innerText}
		result.push(value);
	})
	
	//console.log(result);
	var resultV = {"data" : result};
	//console.log(resultV);
	var json = JSON.stringify(resultV);
	return json;
}

function getJsonAlarmInfo(){
	var result = [];
	$("#alarmDetailTableContent").find("tr").each(function(e){
		var trValue = $(this).children();
		var value = {"serialNumber":trValue[0].innerText, "statusName":trValue[1].innerText,"pushTime":trValue[2].innerText,"speed":trValue[4].innerText,"addr":trValue[5].innerText}
		result.push(value);
	})
	
	//console.log(result);
	var resultV = {"data" : result};
	//console.log(resultV);
	var json = JSON.stringify(resultV);
	return json;
}
