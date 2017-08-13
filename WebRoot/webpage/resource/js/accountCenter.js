$(document).ready(function() {
		// getUserInfo("displayUser");
		// $("#ac_putDevice_custTree").initCustomTree({
			// treeType : "simple",
			// async : true,
			// head_userId : userId,
			// loadingSelector : "TreeLogindata",
			// onClick : ac_sale_zTreeOnClick,
			// ajaxDataFilter : simple_ajaxDataFilter
		// });
		// $("#treeSubUser").initCustomTree({
			// treeType : "stock_repertory",
			// async : true,
			// head_userId : userId,
			// onClick : treeSubUser_zTreeOnClick,
			// loadingSelector : "TreeLogindata",
			// ajaxDataFilter : stock_ajaxDataFilter
		// });
		//getUserAndDevNum();
		//默认密码，建议修改密码
		// $.ajax({
			// type : "post",
			// dataType : "json",
			// url : _ctx + "/isWeakPassword",
			// success : function(ret) {
				// if (!ret.ok) {
					// $('#changePasswordModal_advise').modal({
						// backdrop: 'static'
					// });
				// }
			// }
		// });
	});
	
	//下级用户库存-全局搜索
	$("#treeSubUser_search_btn").click(function(){
		globalSearchCustomerTree($("#treeSubUser_search_input"),userId,true,"treeSubUser",null);
	});
	$("#treeSubUser_search_input").keydown(function(e){
		if(e.keyCode == 13){
			globalSearchCustomerTree($("#treeSubUser_search_input"),userId,true,"treeSubUser",null);
		}
	});
	function treeSubUser_zTreeOnClick(event, treeId, treeNode){
		
		$.fn.zTree.getZTreeObj("treeSubUser").selectNode(treeNode);
		$(".main").scrollTop(0);
	}
	
	//快速销售-选择用户全局搜索
	$("#ac_putDevice_globalSearch_btn").click(function(){
		globalSearchCustomerTree($("#ac_putDevice_globalSearch_SalesName"),userId,false,null,putDevice_globalResultClick);
	});
	$("#ac_putDevice_globalSearch_SalesName").keydown(function(e){
		if(e.keyCode == 13){
			globalSearchCustomerTree($("#ac_putDevice_globalSearch_SalesName"),userId,false,null,putDevice_globalResultClick);
		}
	});
	function putDevice_globalResultClick(userId,parentId , fullParent,account){
		$("#selectedUserId").val(userId);
		$("#selectedParentId").val(parentId);
		$("#selectUserSalesName").val(account);
		$("#selectUserSalesName").removeClass("form-control-error");
		//隐藏树
		$(".js-select-user-sales-tree-box").hide();
		$(".js-select-sales-btn").find(".fa").attr("class","fa fa-caret-down");
	}

	function ac_sale_zTreeOnClick(event, treeId, treeNode) {
		$.fn.zTree.getZTreeObj("ac_putDevice_custTree").selectNode(treeNode);
		$("#selectedUserId").val(treeNode.id);
		$("#selectedParentId").val(treeNode.pId);
		$("#selectUserSalesName").val(treeNode.name);
		$("#selectUserSalesName").removeClass("form-control-error");
		//隐藏树
		$(".js-select-user-sales-tree-box").hide();
		$(".js-select-sales-btn").find(".fa").attr("class","fa fa-caret-down");
	}
	
	function toAccountTab(){
		$("#searchIMEI").removeClass("form-control-error");
		$("#selectUserSalesName").removeClass("form-control-error");
	}
	

	//重置
	$("#resetDevice").click(function() {
		$("#succList").empty();
		$("#selectedCount").text(0);
		$("#searchIMEI").val("");
		$("#selectUserSalesName").val("");
		$("#selectedUserId").val("");
		$("#selectedParentId").val("");
		$("#ac_dev_num").text("0");
	});
	

	//统计设备数量
	function getUserAndDevNum() {
		$.post(_ctx+"/customer/getUserAndDevNum", {
			"userId" : userId,
			"searchType":"more"
		}, function(ret) {
			if (ret.code == 0) {
				result = ret.data;
				$("#stock").text(result.stock);
				$("#repertory").text(result.receiving);
				$("#active").text(result.active);
				$("#noActive").text(result.noactive);
				$("#onLine").text(result.onLineNum);
				$("#noOnLine").text(result.offLineNum);
				$("#devExpired").text(result.expired);
				$("#devExpiring").text(result.aboutToExpire);
				
				//首页快捷链接
				$("#stock2").text(result.stock);
				$("#repertory2").text(result.receiving);
				$("#active2").text(result.active);
				$("#noActive2").text(result.noactive);
				$("#onLine2").text(result.onLineNum);
				$("#noOnLine2").text(result.offLineNum);
				$("#devExpired2").text(result.expired);
				$("#devExpiring2").text(result.aboutToExpire);
			}
		}, "json");
		
		$.post(_ctx+"/deviceAttention/count", {}, function(ret) {
			if(ret && ret.code==0){
				$("#followNum").text(ret.data);
			}
		},'json');
	}
	
	
	//添加imei显示切换
	addDeviceBoxToggle("#searchIMEI");
	
	$("#searchIMEI").focus(function(){
		var imeis = getInputImeis();
		if(imeis){
			$("#ac_dev_num").text(imeis.split(",").length);
			$("#searchIMEI").removeClass("form-control-error");
		}else{
			$("#ac_dev_num").text("0");
		}
	});
	
	function getInputImeis(){
		var inputImeis = $("#searchIMEI").val();
		inputImeis = inputImeis.replace(/\r\n/ig, ",").replace(/\n/ig, ",").replace(/(^\s+)|(\s+$)/g,"").replace(/\s/g,"");
		var imeis = "";
		if(inputImeis){
			$.each(inputImeis.split(","),function(i,v){
				if(v){
					if(imeis){
						imeis+= "," + v;
					}else{
						imeis = v;
					}
				}
			});
		}
		return imeis;
	}
	
	//添加设备
	function putDevice() {
		var imeis = getInputImeis();
		if (!imeis) {
			$("#searchIMEI").addClass("form-control-error").focus();
			return false;
		}else{
			$("#putdevice_loading").show();
		}
		//重复添加的imei
		var repeatPutedImies = dealImeis(imeis, false);
		//去除已添加imei后的imeis
		imeis = dealImeis(imeis, true);
		if (!imeis) {
			$("#putdevice_loading").hide();
			$("#searchIMEI").removeClass("form-control-error").parent().removeClass("focus");
			var failedArr = new Array();
			if (repeatPutedImies) {
				$.each(repeatPutedImies.split(","), function(i, v) {
					var tempFailObj = {
						"imei" : v,
						"failed" : $.i18n.prop('Asset.failure'),
						"failReason" : $.i18n.prop('Asset.repeat')
					};
					failedArr.push(tempFailObj);
				});
			}
			var retData = {
				"failedArr" : failedArr
			};
			$("#failCount").text(failedArr.length);
			$("#succCount").text(0);
			$("#failedList").html(template("failed-info", retData));
			failedArr = [];
			$("#addResultsModal").modal();
		} else {
			$.ajax({
				url : _ctx+"/customer/putDevice",
				async : true,
				cache : false,
				type : "POST",
				data : {
					"imeis" : imeis.replace(/(^\s+)|(\s+$)/g, ""),
					"allotFlag" : "batchSale"
				},
				datatype : "json",
				success : function(ret) {
					if (ret.code == 0) {
						$("#putdevice_loading").hide();
						$("#searchIMEI").removeClass("form-control-error").parent().removeClass("focus");
						var retData = ret.data;
						if (retData) {
							//IMEI验证成功列表
							if (retData.succDeviceList) {
								if ($("#succList tr").length > 0) {
									$.each(retData.succDeviceList,function(i, v) {
										if ($("#"+ v.imei+ "_tr").length == 0) {
											$("#succList").append(template("succ-info-one",v));
										}
									});
								} else {
									$("#succList").html(template("succ-info",retData));
								}
							}
							$("#selectedCount").text($("#succList tr").length);
	
							//IMEI验证失败列表
							var failedArr = new Array();
							$.each(retData.failImeisList,function(i, v) {
								$.each(v,function(key,value) {
									var tempFailObj;
									if (value == 1) {
										tempFailObj = {
											"imei" : key,
											"failed" : $.i18n.prop('Asset.failure'),
											"failReason" : $.i18n.prop('Asset.notExist')
										};
									} else if (value == 2) {
										tempFailObj = {
											"imei" : key,
											"failed" : $.i18n.prop('Asset.failure'),
											"failReason" : $.i18n.prop('Asset.bounded')
										};
									} else {
										tempFailObj = {
											"imei" : key,
											"failed" : $.i18n.prop('Asset.failure'),
											"failReason" : $.i18n.prop('Asset.repeat')
										};
									}
									failedArr.push(tempFailObj);
								});
							});
							if (repeatPutedImies) {
								$.each(repeatPutedImies.split(","),function(i, v) {
									var tempFailObj = {
										"imei" : v,
										"failed" : $.i18n.prop('Asset.failure'),
										"failReason" : $.i18n.prop('Asset.repeat')
									};
									failedArr.push(tempFailObj);
								});
							}
							retData.failedArr = failedArr;
							$("#failCount").text(failedArr.length);
							$("#succCount").text(retData.succCount);
							if (failedArr.length != 0) {
								$("#failedList").html(template("failed-info",retData));
								failedArr = [];
								$("#addResultsModal").modal();
							}
						}
					}
				},
				error : function(e) {
					ajaxError("putDevice", e);
				}
			});
		}
	}

	/**
	 * @param imeis
	 * @param flag (true: 返回去除已添加的imei后的imeis   false: 返回重复添加的imei)
	 * @returns
	 */
	function dealImeis(imeis, flag) {
		var retImies = "";
		var selectedImeis = getPutedImeis();
		if (selectedImeis) {
			$.each(imeis.split(","), function(i, v) {
				if (flag) {
					//去除已经添加的imei
					if ($.inArray(v, selectedImeis.split(",")) == -1) {
						if (retImies) {
							retImies += "," + v;
						} else {
							retImies = v;
						}
					}
				} else {
					//获取重复添加的imei 
					if ($.inArray(v, selectedImeis.split(",")) != -1) {
						if (retImies) {
							retImies += "," + v;
						} else {
							retImies = v;
						}
					}
				}
			});
		} else {
			if (flag) {
				return imeis;
			}
		}
		return retImies;
	}

	//获取已选中的imei集合
	function getPutedImeis() {
		var imeis = "";
		$.each($("td[name='putedImei']"), function(i, v) {
			if (imeis) {
				imeis += "," + $(this).text();
			} else {
				imeis = $(this).text();
			}
		});
		return imeis;
	}

	//快速销售
	function saleDevice() {
		var selectedUserId = $("#selectedUserId").val();
		var selectedParentId = $("#selectedParentId").val();
		var imeis = getPutedImeis();
		var validateFlag = true;
		if (!selectedUserId) {
			$("#selectUserSalesName").addClass("form-control-error");
			validateFlag = false;
		}
		if (imeis.length == 0) {
			$("#searchIMEI").addClass("form-control-error");
			validateFlag = false;
		}
		if(!validateFlag){
			return;
		}
		$(".dev-tohandle").hide();
		$(".dev-handling").show();
		$.ajax({
			url : _ctx + "/customer/fastSale",
			type : "post",
			async : false,
			cache : false,
			data : {
				"userId" : selectedUserId,
				"parentId" : selectedParentId,
				"imeis" : imeis,
				"expiredType" : $("#expiredType").val(),
				"allotFlag" : "batchSale"
			},
			complete:function(XHR, TS){
				$(".dev-handling").hide();
				$(".dev-tohandle").show();
			},
			success : function(ret) {
				if (ret.code == 0) {
					layer.msg($.i18n.prop('comm.Operationdone'), {
						time:2000,icon : 1
					});

					$("#succList").empty();
					$("#selectedCount").text(0);
					$("#searchIMEI").val("");

					getUserAndDevNum();
				} else {
					layer.msg($.i18n.prop('comm.Failed'), {
						time:2000,icon : 2
					});
				}
			}
		});
	}

	//设备移除
	function dropDevice(imei) {
		if (imei) {
			$("#" + imei + "_tr").remove();
			$("#selectedCount").text($("#succList tr").length);
		}
	}

	var addRole_cust_tree_obj = "";
	//新增用户
	$(".js-add-customers").click(function() {
		$(".autocompleter-nodata").remove();
		reset_addRole_userForm();
		var putDevice_cus_tree_obj = $.fn.zTree.getZTreeObj("ac_putDevice_custTree");
		if (putDevice_cus_tree_obj && typeof (putDevice_cus_tree_obj) != 'undefined') {
			$("#ac_addRole_TreeLogindata").hide();
			$("#ac_addRole_custTree").initCustomTree({
				treeType:"simple",
				async : true,
				zNodes : putDevice_cus_tree_obj.getNodes(),
				head_userId : userId,
				onClick : ac_addRole_zTreeOnClick,
				ajaxDataFilter : simple_ajaxDataFilter
			});
			addRole_cust_tree_obj = $.fn.zTree.getZTreeObj("ac_addRole_custTree");
			superioNode = addRole_cust_tree_obj.getNodesByParam("id", userId, null)[0];
			addRole_cust_tree_obj.selectNode(superioNode);
			$("#addRole_userForm input[name='fullPid']").val(superioNode.fullParentId);
			$("#addRole_userForm input[name='parentId']").val(superioNode.id);
			$("#addRole_userForm input[name='parentName']").val(superioNode.name);
		} else {
			$("#ac_addRole_custTree").initCustomTree({
				treeType : "simple",
				loadingSelector : "ac_addRole_TreeLogindata",
				async : true,
				head_userId : userId,
				onClick : ac_addRole_zTreeOnClick,
				ajaxDataFilter : simple_ajaxDataFilter
			});
		}
		
		$("#addRole").modal().on("hidden.bs.modal",clearFormError("#addRole_userForm"));

		$("#ac_addRole_globalSearch_SalesName").val("");
		$("#ac_addRole_globalSearch_SalesName").autocompleter('destroy');
		ac_userValid();
	});
	
	//新增用户-选择上级用户全局搜索 
	$("#ac_addRole_globalSearch_btn").click(function(){
		globalSearchCustomerTree($("#ac_addRole_globalSearch_SalesName"),userId,true,"ac_addRole_custTree",null);
	});
	$("#ac_addRole_globalSearch_SalesName").keydown(function(e){
		if(e.keyCode == 13){
			globalSearchCustomerTree($("#ac_addRole_globalSearch_SalesName"),userId,true,"ac_addRole_custTree",null);
		}
	});

	var superioNode = "";
	function ac_addRole_zTreeOnClick(event, treeId, treeNode) {
		superioNode = treeNode;
		if(!treeNode.open){
			var treeObj = $.fn.zTree.getZTreeObj(treeId); 
			if(treeObj){
				treeObj.expandNode(treeNode,true,false,true);
			}
		}
		$.fn.zTree.getZTreeObj("ac_addRole_custTree").selectNode(treeNode);
		$("#addRole_userForm input[name='fullPid']").val(treeNode.fullParentId);
		$("#addRole_userForm input[name='parentId']").val(treeNode.id);
		$("#addRole_userForm input[name='parentName']").val(treeNode.name);
	}

	$("#addRole").on("hide.bs.modal",function(){
		$("#nickName").val("");
		$("#account").val("");
		$("#passWord").val("888888");
		$("#phone").val("");
		$("#email").val("");
		//$("#recharge").iCheck("uncheck");
		$("input[name=webLogin]").iCheck("check");
		$("input[name=appLogin]").iCheck("check");
	});
	
	var newUseraccount = "", newUserFullParen = "";
	function saveUser() {
		if (!$("#addRole_userForm").valid()) {
			return false;
		}
		//新建用户的父节点用户Id
		if (!$("#addRole_userForm input[name='parentId']").val()) {
			return false;
		}
		if (!$("#addRole_userForm input[name='type']").val()) {
			return false;
		}
		if ($("input[name=appLogin]").attr("checked")) {
			$("input[name=appLogin]").val("1");
		} else {
			$("input[name=appLogin]").val("0");
		}
		if($("input[name=webLogin]").attr("checked")){
			$("input[name=webLogin]").val("1");
		}else{
			$("input[name=webLogin]").val("0");
		}
		$.ajax({
			type : "post",
			async : false,
			cache : false,
			dataType : "json",
			data : $("#addRole_userForm").serialize(),
			url : _ctx + "/customer/saveUser",
			success : function(ret) {
				if (ret.code == 0) {
					var newUserData = ret.data;
					layer.msg($.i18n.prop('comm.Operationdone'),{icon : 1});
					
					//默认选中销售给新添加的用户
					var newUserName = "";
					if(newUserData.nickName){
						newUserName = newUserData.nickName;  
					}else{
						newUserName = newUserData.account;  
					}
					var newFullParent = $("#addRole_userForm input[name='fullPid']").val()
									  + $("#addRole_userForm input[name='parentId']").val() + ",";
					var newUserIconSkin = "ptuser";
					if(newUserData.type == '11'){
						newUserIconSkin = "xiaoshou"; 
					}else if(newUserData.type == '8'){
						newUserIconSkin  = "onepoxy";
					}
					
					var newUserNode = {
							"id" : newUserData.userId,
							"name" : newUserName,
							"iconSkin" : newUserIconSkin,
							//"pId" : newUserData.createdBy,
							"pId" : $("#addRole_userForm input[name='parentId']").val(),
							"fullParentId" : newFullParent,
							"type" : newUserData.type,
							"phone" : newUserData.phone,
							"isParent" : false
					};
					afterAddUser(newUserNode);
					superioNode = "";
					$("#addRole").modal("hide");
				} else if (ret.code == 213) {
					layer.msg($.i18n.prop('cust.Accountalreadyexists'),{time:2000,icon : 2});
				} else {
					layer.msg($.i18n.prop('comm.Failed'), {time:2000,icon : 2});
				}
			},
			error : function(e) {
				ajaxError("saveUser()", e);
			}
		});
	}

	
	function afterAddUser(newUserNode) {
		if (superioNode) {
			var treeObj = $.fn.zTree.getZTreeObj("ac_addRole_custTree");
			treeObj.addNodes(superioNode, newUserNode);	
			$("#ac_putDevice_custTree").initCustomTree({
				treeType:"simple",
				async : true,
				zNodes : $.fn.zTree.getZTreeObj("ac_addRole_custTree").getNodes(),
				head_userId : userId,
				onClick : ac_sale_zTreeOnClick,
				ajaxDataFilter : simple_ajaxDataFilter
			});
			var putDevice_tree_obj = $.fn.zTree.getZTreeObj("ac_putDevice_custTree");
			var newNode = putDevice_tree_obj.getNodesByFilter(ac_nodeFilter, true, superioNode, {
				"id" : newUserNode.id,
				"fullParentId" : newUserNode.fullParentId
			});
			if(newNode){
				//putDevice_tree_obj.selectNode(newNode);
				$("#selectUserSalesName").val(newUserNode.name);
				$("#selectedUserId").val(newUserNode.id);
				$("#selectedParentId").val(newUserNode.pId);
				$("#selectUserSalesName").removeClass("form-control-error");
			}
			
			var node = treeObj.getSelectedNodes()[0];
			if(node){
				complex_updateTreeNode("complex_search_tree", null, {"userId":node.id,"fullParentId":node.fullParentId}, "add");
			}
			
			var subUserTreeObj = $.fn.zTree.getZTreeObj("treeSubUser");
			var subNewSuperioNode = subUserTreeObj.getNodesByFilter(ac_nodeFilter, true, null, {
				"id" : superioNode.id,
				"fullParentId" : superioNode.fullParentId
			});
			newUserNode.name = newUserNode.name + "(0/0)"; 
			if(subNewSuperioNode){
				subUserTreeObj.addNodes(subNewSuperioNode, newUserNode);
			}
			$("#treeSubUser").initCustomTree({
				treeType : "stock_repertory",
				async : true,
				zNodes : $.fn.zTree.getZTreeObj("treeSubUser").getNodes(),
				head_userId : userId,
				onClick : treeSubUser_zTreeOnClick,
				loadingSelector : "TreeLogindata",
				ajaxDataFilter : stock_ajaxDataFilter
			});
			
		}
	}
	
	function ac_nodeFilter(node, invokeParam) {
		return (node.id == invokeParam.id && node.fullParentId == invokeParam.fullParentId);
	}

	function reset_addRole_userForm() {
		$("#addRole_userForm input[name='account']").val("");
		$("#addRole_userForm input[name='passWord']").val("888888");
		$("#addRole_userForm input[name='phone']").val("");
		$("#addRole_userForm input[name='email']").val("");
		$("#addRole_userForm input[name='language']").val("");
		//$("#addRole_userForm input[name='timezones']").val("");
	}

	function ac_userValid() {
		$.validator.addMethod("validIsDiscount",function(value, element) {
			var result = false;
			if (!value) {
				result = true;
			} else if (/^0[1-9]$|^[1-9][0-9]?$|^00?\.(?:0[1-9]|[1-9][0-9]?)$|^(?:0[1-9]|[1-9][0-9]?)\.[0-9]$/
					.test(value)) {
				result = true;
				if (value<=1 && value>0) {
					result = true;
				} else {
					result = false;
				}
			}
			return result;
		}, $.i18n.prop('Business.Rangingfrom')
				+ "0.01~1");
		$("#addRole_userForm").validate(
		{
			rules : {
				account : {
					required : true,
					minlength : 3,
					maxlength : 30,
					accountValid : true
				},
				nickName : {
					required : true,
					minlength : 3,
					maxlength : 50,
					nickNameValid : true
				},
				passWord : {
					required : false,
					minlength : 6,
					validatorSaveCustPassword : true
				},
				pswAgain : {
					required : true,
					equalTo : "#passWord"
				},
				/*phone : {
					required : false,
					phone : true,
				},*/
				discount : {
					validIsDiscount : true
				},
				email : {
					email : true
				}
			},
			messages : {
				account : {
					required : $.i18n.prop('cust.Accountcannotbeempty'),
					minlength : $.i18n.prop('cust.AccountLength'),
					maxlength : $.i18n.prop('cust.AccountLength'),
					accountValid : $.i18n.prop('cust.accountValid')
				},
				nickName : {
					required : $.i18n.prop('cust.Usernamecannotbeempty'),
					minlength : $.i18n.prop('cust.UserNameMinLength'),
					maxlength : $.i18n.prop('cust.UserNameMaxLength'),
					nickNameValid : $.i18n.prop('cust.nickNameValid')
				},
				passWord : {
					required : $.i18n.prop('cust.Passwordcannotbeblank'),
					minlength : $.i18n.prop('cust.PasswordLength'),
					validatorSaveCustPassword : $.i18n.prop('user.passwordFormat')
				},
				pswAgain : {
					required : $.i18n.prop('cust.surePassword'),
					equalTo : $.i18n.prop('cust.Thetwopasswordsdonotmatch')
				},
				email : {
					email : $.i18n.prop('user.emailFormat')
				},
				/*phone : {
					required : $.i18n.prop('cust.Pleaseentertelephone')
				},*/
				discount:{
					validIsDiscount :$.i18n.prop('Business.Rangingfrom')+'0.01~1'		
				}
			},
			errorPlacement : function(error, element) {
				error.appendTo(element.parent());
			}
		});
	}

	function showConfirmPwd() {
		if ($("#passWord").val() != "888888") {
			$("#markPswAgain").slideDown();
		} else {
			$("#markPswAgain").slideUp();
		}
	};
	
	//贴片点击切换告警显示
	function alarmSwitch(self){
		$("#alarmMessage").toggle("",function(){
			if($(self).is(":visible")){
	    		tableHeaderAutoWidth("#alarmMessageTableHeader","#alarmMessageTableContent");
	    	}
		});
	}