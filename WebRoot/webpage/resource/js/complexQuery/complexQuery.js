$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
}; 	

function  scroollToVisible(el,ob){
	var box = el;
	var b_top = box.offset().top;
	var b_bom = b_top + box.outerHeight();

	var obj = ob;
	var o_top = obj.offset().top;
	var o_h = obj.outerHeight();

	var s = null;
	if(o_top - b_top <=0){//超出可视区域头部
		s = box.scrollTop() + o_top - b_top;
	}else if(o_top >=b_bom - o_h){//超出可视区域底部
		var b_s = box.scrollTop();
		s = o_top  + o_h + b_s - b_bom ;
	}else{
		//在可视区域
	}
	if(s!=null){
		box.scrollTop(s);
	}
}

	/**
	 * 修改用户信息的ztree配置
	 */
	var complex_userInfo_tree_setting = {
		async: {
			enable: true,
			type: "post",
			contentType: "application/x-www-form-urlencoded",
			url: _ctx+"rest/loginController/getUserTree",
			autoParam: ["id=parentId","fullParentId=fullParentId"],
			dataFilter: complex_ajaxDataFilter
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
			onClick : complex_zTreeOnClick,
			onAsyncSuccess: complex_zTreeOnAsyncSuccess,
			beforeClick: complex_zTreeBeforeClick
		}
	};
	
	/**
	 * 节点点击之前的事件。修改用户时。禁止选择被修改的用户
	 * @param treeId
	 * @param treeNode
	 * @param clickFlag
	 */
	function complex_zTreeBeforeClick(treeId, treeNode, clickFlag){
		if(treeId.indexOf("complex_userInfo_tree") >= 0){
			if(treeNode.id == complex_see_userId || treeNode.fullParentId.indexOf(complex_see_userId+",") >= 0){
				layer.msg($.i18n.prop("cust.Selecttheusercannotbedoneasasuperioruser"));
				return false;
			}
		}
		if(treeId.indexOf("transCustom_tree") >= 0){
			// 被转移的客户 数组，用‘,’分开
			var userIds = $("form[id^='transCustom_form']:visible").find("input[name='userId']").val().split(",");
			for(var i=0;i<userIds.length;i++){
				var userId = userIds[i];
				if(!userId || (treeNode.id == userId || treeNode.fullParentId.indexOf(userId+",") >= 0)){
					layer.msg($.i18n.prop("cust.Selecttheusercannotbedoneasasuperioruser"));
					return false;
				}
			}
		}
		if(treeId == "treeDemo2"){
			var updateUserId = $("#userForm").find("input[id='userId']").val();
			if(updateUserId && (treeNode.id == updateUserId || treeNode.fullParentId.indexOf(updateUserId+",") >= 0)){
				layer.msg($.i18n.prop("cust.Selecttheusercannotbedoneasasuperioruser"));
				return false;
			}
		}
		return true;
		/*if(treeId.indexOf("complex_allotDev_tree") >= 0){
			if(complex_see_device){
				if(treeNode.id == complex_see_device.userId && treeNode.fullParentId == complex_see_device.fullParent){
					layer.msg($.i18n.prop("cust.Equipmentalreadybelongtotheaccount"));
					return false;
				}
			}else{
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
				var selectNode = treeObj.getSelectedNodes()[0];
				if(selectNode && selectNode.id == treeNode.id && selectNode.fullParentId == treeNode.fullParentId){
					layer.msg($.i18n.prop("cust.Equipmentalreadybelongtotheaccount"));
					return false;
				}
			}
		}*/
	}
	
	
	/**
	 * 节点数据过滤
	 */
	function complex_ajaxDataFilter(treeId, parentNode, responseData){
		if(responseData && responseData.data){
			$.each(responseData.data,function(i,v){
				v.typeName = complex_buildTypeName(v);
			});
		}
		return responseData.data;
	}
	
	/**
	 * 节点点击事件
	 */
	function complex_zTreeOnClick(event, treeId, treeNode){
		if(treeId.indexOf("complex_userInfo_tree") >= 0){
			var id = treeId.substring((treeId.lastIndexOf("_")+1),treeId.length);
			$("#complex_userInfo_Form_"+id+" input[name='parentName']").val(treeNode.name);
			$("#complex_userInfo_Form_"+id+" input[name='createdBy']").val(treeNode.id);
			$("#complex_userInfo_Form_"+id+" input[name='fullParentId']").val(treeNode.fullParentId);
		}
		if(treeId == "complex_search_tree"){
			$("#complex_advanced_search_form input[id='complex_search_userName']").val(treeNode.name);
			$("#complex_advanced_search_form input[name='userId']").val(treeNode.id);
			advancedSearchSalesUserTreeToggle(true);
		    $(this).find(".fa").attr("class","fa fa-caret-down");
		}
		if(treeId.indexOf("complex_allotDev_tree") >= 0){
			var id = treeId.substring((treeId.lastIndexOf("_")+1),treeId.length);
			$("#allot_to_"+id).html(treeNode.name);
		}
		if(treeId == "treeDemo2"){
			getIdAndName(null,treeId,treeNode);
		}
		if(treeId.indexOf("transCustom_tree") >= 0){
			var formId = $("#" + treeId).parent().parent().parent().attr("id");
			$("#" + formId + " input[name='parentName']").val(treeNode.name);
			$("#" + formId + " input[name='createdBy']").val(treeNode.id);
			$("#" + formId + " input[name='fullParentId']").val(treeNode.fullParentId);
		}
	}
	
	/**
	 * 异步加载成功回调
	 */
	function complex_zTreeOnAsyncSuccess(event, treeId, treeNode, msg){
		complex_locationUser(complex_location_userId,complex_location_fullParent,treeId,complex_location_nodeFlag);
	}
	
	//需要定位的用户的全父ID
	var complex_location_fullParent = "";
	//需要定位的用户的ID
	var complex_location_userId = "";
	//需要定位的用户的父节点
	var complex_location_parentNode = null;
	//
	var complex_location_nodeFlag = "";
	
	var option = {};
	
	//搜索类型select的记录
	var complex_select_history = "";
	
	/**
	 * 定位用户
	 * nodeFlag 选择需要定位父节点还是定位节点本身
	 * locationParentId 需要定位的用户的全父ID
	 */
	function complex_locationUser(userId,locationParentId,treeId,nodeFlag){
		
		var locationNode = null;
		
		//获取ztree实例
		var treeObj = $.fn.zTree.getZTreeObj(treeId);
		//给目标树添加回调方法
		treeObj.setting.callback.onAsyncSuccess = function(event, treeId, treeNode, msg){
			complex_locationUser(complex_location_userId,complex_location_fullParent,treeId,complex_location_nodeFlag);
		};
		//保存需要选中的节点类型
		complex_location_nodeFlag = nodeFlag;
		complex_location_userId = userId;
		if(userId){
			//标志是否已搜索到需要的节点
			var flag = true;  
			//在父节点下搜索需要定位的节点,初始父节点为null,在根节点下搜索
			var node = treeObj.getNodesByFilter(complex_nodeFilter,true,complex_location_parentNode,{"userId":userId});
			//如果搜索到节点且节点的全父ID与目标节点相同,则确定为需要的节点
			
			if(node && node.pId == locationParentId){
				//需要定位到父节点
				if(nodeFlag == "parent"){
					node = node.getParentNode();
				}
				//清空本次搜索的记录 ,避免影响到下一次定位
				complex_location_fullParent = "";
				complex_location_userId = "";
				complex_location_parentNode = null;
				complex_location_nodeFlag = "";
				/*var beforeClickCallBack = treeObj.setting.callback.beforeClick;
				if(beforeClickCallBack && typeof(beforeClickCallBack) != "undefined"){
					var beforeClickFlag = treeObj.setting.callback.beforeClick(treeId,node,null);
					if(!beforeClickFlag){
						return;
					}
				}*/
				//选中节点
				treeObj.selectNode(node);
				treeObj.setting.callback.onClick(null,treeId,node);
				flag = false;
				locationNode = node;
				setTimeout(function(){
					scroollToVisible($("#"+treeId).parent(), $("#"+treeId+" a.curSelectedNode"));
				},400);
				
			}
			if(flag){  //没有搜索到节点，异步加载下级节点后继续搜索
				//全父ID数组
				var parentArray = "";  
				if(locationParentId){
					complex_location_fullParent = locationParentId;
					parentArray = locationParentId.substring(0,locationParentId.length-1).split(',');
					if(parentArray.length>0){
						//依次展开父级节点
						$.each(parentArray,function(i,v){
							complex_location_parentNode = treeObj.getNodeByParam("id", v, complex_location_parentNode);
							if(complex_location_parentNode){
								treeObj.expandNode(complex_location_parentNode,true,false,true,true);
								//如果节点还没有异步加载过下一级节点，则展开节点，结束本次循环，等待异步加载完成后继续搜索
								if(!complex_location_parentNode.zAsync){
									return false;
								}
							}
						});
					}
				}else{
					return false;
				}
			}
		}
		return locationNode;
	}
	
	/**
	 * 聚焦组织点击事件。 当前页面为客户管理页面时。 显示全部客户tab并定位用户
	 * @param userId  定位的用户
	 * @param locationParentId  定位的用户的上级用户ID
	 * @param treeId  在哪颗树上定位
	 * @param nodeFlag  是否定位到上级（修改用户信息时用到）
	 */
	function complex_locationUser_Click(userId,locationParentId,treeId,nodeFlag){
		var ev = window.event || arguments.callee.caller.arguments[0];
		if (window.event) {
			ev.cancelBubble = true;
		} else {
			ev.stopPropagation();
		}
		complex_locationUser(userId,locationParentId,treeId,nodeFlag);
		if(treeId == "treeDemo"){
			$(".tab-nav-customer li").eq(0).addClass("active").siblings().removeClass("active");
			$(".expired-customers-box").hide();
			$(".all-customers-box").show();
			$(".main-tab").show();
			$(".expired-con-box").hide();
		}
	}
	
	
	
	/**
	 * 获取类型名称
	 */
	function complex_buildTypeName(data){
		var typeName = "";
		if(data.type == 0){
			typeName = $.i18n.prop("cust.Manager");
		}else if(data.type == 8 || data.type == 10){
			typeName = $.i18n.prop("cust.Distributor");
		}else if(data.type == 11){
			typeName = $.i18n.prop("cust.Sale");
		}else{
			typeName = $.i18n.prop("cust.User");
		}
		return typeName;
	}
    /**
     * @zhangyafeng
     */
	function errorFunction(){
		
		layer.msg($.i18n.prop('功能正在测试中。。。'),{icon:2});
		return;
	}
	//初始化
	$(function(){
		
		var target = $("#complexQuery");
		
		if(target){
			
			var user_option = $(target).attr("data-option");
			if(user_option){
				option = eval('('+user_option+')');
				if(!option.renderingFlag){
					return ;
				}
			}
			
			//渲染搜索框
			$(target).html(template("complex_search_tmp",null));
			
			//兼容文本框提示
			if($.browser.msie&&($.browser.version < 10 )){
				$("#basicKeyword").placeholder();
			}
			tabs(".js-device-search-con .tab", "active", ".js-device-search-con .modal-tab-con");
			tabs(".js-user-search-con .tab", "active", ".js-user-search-con .modal-tab-con");
			
				//绑定手机用户查询点击事件
				$(".js-search-mobileUser").click(function (){
					$("#complex_modal_title").text($.i18n.prop("cust.appUserSearch"));
					complex_showMobileUserSearchModal();
					$(".js-modal-mobileUser-search").val("");
					$("#searchUserEquipment").modal();
					var keyword = $("#basicKeyword").val();
					if(keyword.replace(/(^\s*)|(\s*$)/g, "")){
						$(".js-modal-mobileUser-search").val(keyword);
						complex_basicQuery('mobileUser');
					}
				});
			
			  	$(".js-search-user,.js-search-device,.js-advanced-search-device").click(function () {
			  		$("#complex_modal_title").text($.i18n.prop("cust.userAndDeviceSearch"));
			  		complex_cleanHistory();
			  		$(".js-modal-user-device-search").val("");
			  		$(".js-mobilUser-search-con").hide();
			  		$(".modal-mobileUser-search").hide();
			  		$(".modal-user-device-search").show();
				    $("#searchUserEquipment").modal();
				    
				    var keyword = $("#basicKeyword").val().replace(/(^\s*)|(\s*$)/g, "");
				    
					var type = "";
				    if($(this).hasClass("js-search-user")){
				      //搜索用户
				      $(".js-toggle-user-device").easyDropDown("select",0);
				      //complex_showUserSearchModal();
				      type = "user";
				      complex_select_history = "user";
				    }else{
				    	$(".autocompleter-nodata").remove();
				      //选中设备类型
			    	  $(".js-toggle-user-device").easyDropDown("select",1); 
			    	  
			    	  //显示设备搜索面板
			    	  //complex_showDeviceSearchModal();
			    	  complex_select_history = "device";
			    	  //设备高级搜索
				      if($(this).hasClass("js-advanced-search-device")){
				        $(".js-normal-search-box").hide();
				        $(".js-advanced-search-box").show();
				        $(".js-device-search-table").show();
				        $(".js-device-related-table").hide();
				      	
				        $(".device-export-btn").attr("onclick","complex_export('advanced')");
				        
				        //初始重置搜索条件
						$(".js-clear-advanced-search").click();
						
						$("#complex_advanced_search_form").find("input[name='keyword']").val(keyword);

						if(keyword && /^[0-9]*$/.test(keyword.replace(/(^\s*)|(\s*$)/g, ""))){
							$(".js-advanced-search-button").click();
						}
				      }else{
				    	//普通搜索，根据IMEI搜索
				        $(".js-normal-search-box").show();
				        $(".js-advanced-search-box").hide();
				        $(".device-export-btn").attr("onclick","complex_export('device')");
				        type = "device";
				      }
				    }
				    complex_user_pageNo = 1;
				    complex_device_pageNo = 1;
			      	if(type && keyword){
			      	  $(".js-modal-user-device-search").val(keyword);
				      complex_showSearchModal(keyword,type);
			        }
				  });
				  	$(".js-advanced-search-btn").click(function(){
				  		$(".js-normal-search-box").hide();
				  		
				  		$(".device-export-btn").attr("onclick","complex_export('advanced')");
				  		
				  		$(".js-advanced-search-box").show();
				  		//初始重置搜索条件
				  		$(".js-clear-advanced-search").click();
				  		
				  		
				  		$("#complex_advanced_search_form").find("input[name='keyword']").val($(".js-modal-user-device-search").val());
				  	});
				  	
				  	$(".js-back-normal-search").click(function(){
				  		$(".js-normal-search-box").show();
				  		$(".js-advanced-search-box").hide();
				  		$(".js-toggle-user-device").easyDropDown("select",1);
				  		$(".device-export-btn").attr("onclick","complex_export('device')");
				  		$(".js-modal-user-device-search").val($("#complex_advanced_search_form").find("input[name='keyword']").val());
				  		if($.browser.msie &&($.browser.version < 10 )){ //兼容ie9及以下日期选择框不消失的问题
				  			$("#laydate_box").css("z-index","-1");
				  		}
				  	});
				  	
				  	//切换用户与设备搜索
				  	$(".js-toggle-user-device").easyDropDown().change(function(){
				  		var selectVal = $(this).val();
				  		if(selectVal != complex_select_history){
				  			$(".js-modal-user-device-search").val("");
				  			complex_cleanHistory();
				  			if(selectVal=="user"){
				  				if(device_placeholder_flag){
				  					user_placeholder_flag = true;
				  				}
				  				complex_showUserSearchModal();
				  				
				  			}else if(selectVal=="device"){
				  				if(user_placeholder_flag){
				  					device_placeholder_flag = true;
				  				}
				  				complex_showDeviceSearchModal();
				  			}
				  			complex_select_history = selectVal;
				  		}
				  	});
	
				  //高级搜索
				  $(".js-advanced-search-select-user").click(function(){
					  var flag = $(".js-advanced-select-user-tree-box").is(":visible");
					  advancedSearchSalesUserTreeToggle(flag);
				  });
				  
				  $(".js-advanced-search-select-btn").click(function(){
					  var flag = $(this).find(".fa").hasClass("fa-caret-up");
					  advancedSearchSalesUserTreeToggle(flag);
				  });
				
				//选择号码类型  
				$(".js-select-number-type").easyDropDown().change(function(){
				  var change_val = $(this).val();
				  switch(change_val){
				    case "IMEI":
				      placeholder_txt = $.i18n.prop("cust.PleaseenterIMEI");
				      break;
				    case "VEHICLENUMBER":
				      placeholder_txt = $.i18n.prop("cust.Pleaseenterlicenseplatenumber");
				      break;
				    case "SN":
				      placeholder_txt = $.i18n.prop("cust.pleasePutSN");
				      break;
				    case "CARFRAME":
				      placeholder_txt = $.i18n.prop("cust.PleaseEnterCarFrame");
				      break;
				    case "SIM":
				      placeholder_txt = $.i18n.prop("Asset.EnterDeviceSIMcardNo");
				    	break;
				    case "DEVICENAME":
				    	placeholder_txt = $.i18n.prop("cust.PleaseEnterDeviceName");
				    	break;
				    default :
				      placeholder_txt = "";
				        break;
				  }
				  if(change_val == "MCTYPE"){
					  $(".js-select-mcType-div").show();
					  $(".js-search-number-text").hide();
					  if($(".js-select-mcType").length<=0){
						  complex_initDevMcType();
					  }else{
						  $("select[name='mcType']").easyDropDown("select",0);
					  }
				  }else{
					  $(".js-select-mcType-div").hide();
					  $(".js-search-number-text").show();
					  $(".js-search-number-text").val("");
				  }
				  $(".js-search-number-text").attr("placeholder",placeholder_txt);
				  lessThanIE10PlaceholderVal(".js-search-number-text");
				});
				
				$(".js-select-number-type").easyDropDown("select",0);
				
				//选择时间类型
				$("#advancedSearchSelectEndTime").val("").hide();
				$(".js-select-time-type").easyDropDown();
				$("[name = 'timeLimit']").iCheck().on('ifChecked', function(event){
					$("#advancedSearchSelectEndTime").show();
					$("#advancedSearchSelectStartTime").attr("placeholder",$.i18n.prop("Alert.startTime"));					

				}).on('ifUnchecked', function(event){
					$("#advancedSearchSelectEndTime").val("").hide();
					$("#advancedSearchSelectStartTime").attr("placeholder",$.i18n.prop("cust.chooseDate"));
				});
	
				
				laydate({
				  elem: '#advancedSearchSelectEndTime',
				  event: 'focus' //响应事件。
				});
				
				laydate({
				  elem: '#advancedSearchSelectStartTime',
				  event: 'focus' //响应事件。
				});
	
				//设备状态
				$("[name = 'statusStr']").iCheck();
	
				//重置
				$(".js-clear-advanced-search").click(function(){
					$("#complex_search_userName").val("");
					$("#complex_advanced_search_form").find("input[name='userId']").val("");
					$("#complex_advanced_search_form").find("input[name='keyword']").val("");
					$("#advancedSearchSelectStartTime").val("");
					$("#advancedSearchSelectEndTime").val("");
					$("#complex_advanced_search_form").find("select[name='dateType']").easyDropDown('select',0);
					$("#complex_advanced_search_form").find("select[name='basicType']").easyDropDown('select',0);
					$("[name = 'timeLimit']").iCheck('uncheck');
					$("#complex_advanced_search_form").find("input[name='statusStr']").iCheck('unCheck');
					var treeObj = $.fn.zTree.getZTreeObj("complex_search_tree");
					if(treeObj){
						treeObj.cancelSelectedNode();
					}
				});
				
				$('#searchUserEquipment').on('hidden.bs.modal', function (e) {
					  complex_see_device = null;
					  complex_see_fullParentId = "";
					  complex_see_name = "";
					  complex_see_parentId = "";
					  complex_see_userId = "";
					  complex_select_history = "";
				});
		}
	});
	
//高级搜索销售用户树切换显示
function advancedSearchSalesUserTreeToggle(flag){
    if(!flag){
    	$(".js-advanced-select-user-tree-box").show();
	$(".js-advanced-search-select-btn>.fa").attr("class","fa fa-caret-up");
	if(!$.fn.zTree.getZTreeObj("complex_search_tree")){
    	  //显示加载
    	  $("#complex_search_tree_logindata").show();
    	  var result = complex_getTreeNode(complex_loginUserId);
	      $.fn.zTree.init($("#complex_search_tree"),complex_userInfo_tree_setting,result);
	      //隐藏加载
	      $("#complex_search_tree_logindata").hide();
      }
}else{
	$(".js-advanced-select-user-tree-box").hide();
	$(".js-advanced-search-select-btn").find(".fa").attr("class","fa fa-caret-down");
    }
    advancedSearchTreeClickOutHide();
}

//鼠标如果没有点击在高级搜索选择树的元素上，元素隐藏
function advancedSearchTreeClickOutHide(){

  $(document).bind("click",function(e){
    var target = $(e.target);
    if(!target.closest(".select-user").length){
      $(".js-advanced-select-user-tree-box").hide();//hide(); 可以设置隐藏或销毁
      $(document).unbind("click");
      $(".js-advanced-search-select-btn>.fa").attr("class","fa fa-caret-down");
    }
  });
}


//当前查看的用户ID
var complex_see_userId = "";
var complex_see_name = "";
var complex_see_fullParentId = "";
//当前查看的用户父ID
var complex_see_parentId = "";

//当前查看的设备对象
var complex_see_device = null;

//清除查询记录
function complex_cleanHistory(){
	$("#complex_device_detail_tbody").empty();  //设备详情列表
	$("#complex_device_user_realtion_tbody").empty();  //设备所属关系
	$("#complex_user_tbody").empty();        //用户列表
	$("#complex_user_relation_tbody").empty();  //用户关系
	$("#complex_user_info").empty();         //用户信息修改表单
	$("#complex_device_tbody").empty();     //设备列表
	$("#complex_device_info").empty();      //设备详情表单
	$("#complex_addUser_info").empty();      //新增下级用户表单
	$("div[id*=logindata]").remove();
	$("#complex_paging_user").hide();
	$("#complex_user_table_nodata").show();
	$("#complex_paging_device").hide();
	$("#complex_device_table_nodata").show();
	
	$("#complex_globalSearch_input").val("");//清空高级搜索时,选择客户的客户树全局搜索框
	$("#complex_globalSearch_input").autocompleter('destroy');//清空高级搜索时,选择客户的客户树全局搜索结果

	$("#complexUpdate_globalSearch_input").val("");//清空高级搜索-修改用户信息时,选择客户的客户树全局搜索框
	$("#complexUpdate_globalSearch_input").autocompleter('destroy');//清空高级搜索-修改用户信息时,选择客户的客户树全局搜索结果

	$("#complexTrans_globalSearch_input_transCust1").val("");//清空高级搜索-转移客户时,选择客户的客户树全局搜索框
	$("#complexTrans_globalSearch_input_transCust1").autocompleter('destroy');//清空高级搜索-转移客户时,选择客户的客户树全局搜索结果

	$("#complexAllot_globalSearch_input").val("");//清空高级搜索-转移设备时,选择客户的客户树全局搜索框
	$("#complexAllot_globalSearch_input").autocompleter('destroy');//清空高级搜索-转移设备时,选择客户的客户树全局搜索结果
	
}


/**
 * 用户列表页码
 */
var complex_user_pageNo = 1;
var complex_user_pageSize = 10;
var complex_user_totalRecord = "";
function complex_userPage(totalRecord,param){
	$("#complex_paging_user").pagination({
		prevText: $.i18n.prop("page.previous") ,
		nextText: $.i18n.prop("page.next"),
		items: totalRecord,
		param:param,
     	itemsOnPage: complex_user_pageSize,
     	onPageClick: function(pageNumber,pageSize,param, event){
     		if(event && (event.type=="click" || event.type=="change")){
     			complex_user_pageNo = pageNumber;
     			complex_user_pageSize = pageSize;
     			complex_showSearchModal($(".js-modal-user-device-search").val(),"user",param);
     		}
     	},
     	onInit : function (){
     		$("#complex_paging_user").pagination("selectPage",complex_user_pageNo);
     	}
	});
}
/**
 * 手机用户列表页码
 */
var complex_mobileUser_pageNo = 1;
var complex_mobileUser_pageSize = 10;
var complex_mobileUser_totalRecord = "";
var complex_mobileUser_keyword = "";
function complex_mobileUserPage(totalRecord,param){
	$("#complex_paging_mobileUser").pagination({
		prevText: $.i18n.prop("page.previous") ,
		nextText: $.i18n.prop("page.next"),
		items: totalRecord,
		param:param,
		itemsOnPage: complex_mobileUser_pageSize,
		onPageClick: function(pageNumber,pageSize,param, event){
			if(event && (event.type=="click" || event.type=="change")){
				complex_mobileUser_pageNo = pageNumber;
				complex_mobileUser_pageSize = pageSize;
				complex_showSearchModal($(".js-modal-user-device-search").val(),"mobileUser",param);
			}
		},
		onInit : function (){
			$("#complex_paging_mobileUser").pagination("selectPage",complex_mobileUser_pageNo);
		}
	});
}


/**
 * 设备列表页码
 */
var complex_device_pageNo = 1;
var complex_device_pageSize = 10;
function complex_devicePage(totalRecord,param){
	$("#complex_paging_device").pagination({
		prevText: $.i18n.prop("page.previous") ,
		nextText: $.i18n.prop("page.next"),
		items: totalRecord,
		param : param,
     	itemsOnPage: complex_device_pageSize,
     	onPageClick: function(pageNumber,pageSize,param, event){
     		if(event && (event.type=="click" || event.type=="change")){
     			complex_device_pageNo = pageNumber;
     			complex_device_pageSize = pageSize;
     			if($("#complex_advanced_search_form").is(":hidden")){
	     			complex_showSearchModal($(".js-modal-user-device-search").val(),"device",param);
     			}else{
     				complex_advancedSearch(complex_device_pageNo,param);
     			}
     		}
     	},
     	onInit : function (){
     		$("#complex_paging_device").pagination("selectPage",complex_device_pageNo);
     	}
	});
}



//绑定用户详情tab的点击事件
function bindUserDetailClick(){
	//查看用户关系
    $(".js-view-user-related").click(function(){
        $(".js-user-search-table").hide();
        $(".js-user-related-table").show();
        $(".js-back-user-search").click(function(){
	        $(".js-user-search-table").show();
	        $("#complex_paging_user").show();
	        $(".js-user-related-table").hide();
	        $(".js-view-user-related").show();
	    });
    });

    //聚焦组织结构
    /* $(".js-focus-tree").click(function(){
        $(".side-left").css("z-index",1051);
        $("#searchUserEquipment").on('hidden.bs.modal', function (e) {
            $(".side-left").css("z-index",1);
        });
    }); */
}

//绑定设备详情tab的点击事件
function bindDeviceDetailCilck(){
		$(".js-view-device-related").click(function(){
			$(".js-device-search-table").hide();
			$(".js-device-related-table").show();
			$(".js-back-device-search").click(function(){
				$(".js-device-search-table").show();
				$("#complex_paging_device").show();
				$(".js-device-related-table").hide();
				$(".js-view-device-related").show();
			});
		});
}
var user_placeholder_flag = false;
var device_placeholder_flag = false;
/**
 * 显示用户搜索面板
 */
function complex_showUserSearchModal(){
	if($(".js-modal-user-device-search").attr("placeholder") != $.i18n.prop("cust.Pleaseenterusernameoraccount")){
		$(".js-modal-user-device-search").attr("placeholder",$.i18n.prop("cust.Pleaseenterusernameoraccount"));
		lessThanIE10PlaceholderVal(".js-modal-user-device-search");
		user_placeholder_flag = true;
	}
	
	$(".js-user-search-con").show();
    $(".js-advanced-search-box").hide();
    $(".js-normal-search-box").show();
    $(".js-device-search-con").hide();
    $(".js-user-related-table").hide();
    $(".js-user-search-table").show();
    //$(".js-toggle-user-device").easyDropDown("select",0);
    $(".js-advanced-search-btn").hide();
    //清空设备查看记录
    complex_see_device = null;
}

/**
 * 显示设备搜索面板
 */
function complex_showDeviceSearchModal(){
	if($(".js-modal-user-device-search").attr("placeholder") != $.i18n.prop("Asset.IMEIorDriverorLicensePlate")){
		$(".js-modal-user-device-search").attr("placeholder",$.i18n.prop("Asset.IMEIorDriverorLicensePlate"));
		if(device_placeholder_flag){
			lessThanIE10PlaceholderVal(".js-modal-user-device-search");
		}
		device_placeholder_flag = true;
	}
	
    $(".js-user-search-con").hide();
    $(".js-device-search-con").show();
    $(".js-device-related-table").hide();
    $(".js-device-search-table").show();
    //$(".js-toggle-user-device").easyDropDown("select",1);
    $(".js-advanced-search-btn").show();
    //清空用户查看记录
    complex_see_userId = "";
    complex_see_fullParentId = "";
    complex_see_parentId = "";
    complex_see_name = "";
}


/**
 * 显示手机用户搜索面板
 */
function complex_showMobileUserSearchModal(){
	$(".js-device-search-con").hide();
	$(".js-user-search-con").hide();
	$(".mark_mobileUser_detail").hide();
	$(".mark_mobileUser_list").show();
	$(".js-mobilUser-search-con").show();
	$(".modal-user-device-search").hide();
	$(".modal-mobileUser-search").show();
	$('.js-normal-search-box').show();
	$("#complex_mobileUser_tbody").empty();
	$("#complex_paging_mobileUser").hide();
	$("#complex_mobileUser_table_nodata").show();
}


/**
 * 弹出搜索框
 */
function complex_showSearchModal(keyword,type,param){
	if(!param){
		param = {"keyword":keyword,"queryType":type};
	}
	if(type == "device"){
		param.basicType = "IMEIDRIVERVEHICLENUMBER";
		param.pageNo = complex_device_pageNo;
		param.pageSize = complex_device_pageSize;
		$(".js-device-related-table .modal-tab-con div.con").eq(0).show().siblings().hide();
		$(".complex_device_tab li").eq(0).addClass('active').siblings().removeClass('active');
	}
	if(type == "user"){
		param.pageNo = complex_user_pageNo;
		param.pageSize = complex_user_pageSize;
		if(complex_loginUserType == 3 || complex_loginUserType == 12 || complex_loginUserType == 9){
			$(".complex_user_tab li").eq(3).hide();
		}
	}
	if(type == "mobileUser"){
		$(".mark_mobileUser_list").show();
		$(".mark_mobileUser_detail").hide();
		param.pageNo = complex_mobileUser_pageNo;
		param.pageSize = complex_mobileUser_pageSize;
	}
	param.type = type;
	complex_Search(param,complex_showSearchModal_callback);
}

function complex_showSearchModal_callback(result,param){
	if(param.type == "user"){
		if(result && result.user.length>0){
			var data = result.user[0];
			if(result.flag != 0){
				//多个用户，显示列表
				var tmp_data = {"data":data,"loginUserId":complex_loginUserId,"locationTree":option.treeId,"pageNo":complex_user_pageNo,"pageSize":complex_user_pageSize};
				$("#complex_user_tbody").html(template("complex_user_tbody_tmp",tmp_data));
				
				//渲染分页
				if(complex_user_pageNo == 1){
					complex_user_totalRecord = result.totalRecord;
					complex_userPage(result.totalRecord,param);
				}
				//显示用户列表，隐藏详情tab
				$(".js-user-search-table").show();
			    $(".js-user-related-table").hide();
				//绑定事件
				bindUserDetailClick();
				//隐藏无数据提示信息，显示分页插件
				$("#complex_user_table_nodata").hide();
				$("#complex_paging_user").show();
			}else{
				//隐藏用户列表，显示详情tab
				$(".js-user-search-table").hide();
			    $(".js-user-related-table").show();
				//考虑到用户有可能会有多重关系，返回的是集合中放的集合，修改后数据结构没有变，所以直接取第一个即可。
				//生成用户关系列表
				complexBuildRealtionTable(data);
				//隐藏返回列表按钮
				$(".js-back-user-search").hide();
				//隐藏查看按钮
				$(".js-view-user-related").hide();
			}
		}else{
			//显示用户列表，隐藏详情tab
			$(".js-user-search-table").show();
		    $(".js-user-related-table").hide();
			//显示无数据提示信息，隐藏分页插件
			$("#complex_user_table_nodata").show();
			$("#complex_paging_user").hide();
		}
	}
	if(param.type == "device"){
		if(result && result.device){
			//搜索到单个设备。直接显示详情tab
			if(result.flag == 0){
				//隐藏设备列表，显示详情tab
				$(".js-device-related-table").show();
				$(".js-device-search-table").hide();
				//生成列表
				complexBuildDeviceRelationTable(result,false);
				//隐藏返回列表按钮
				$(".js-back-user-search").hide();
				//隐藏详情按钮
				$(".js-view-device-related").hide();
			}else{
				//多个设备，显示设备列表
				if(result.device.length > 0){
					var tem_data = {data:result.device,"pageNo":complex_device_pageNo,"pageSize":complex_device_pageSize};
					$("#complex_device_tbody").html(template("complex_device_tbody_tmp",tem_data));
					//渲染分页
					if(complex_device_pageNo == 1){
						complex_devicePage(result.totalRecord,param);
					}
					//隐藏无数据提示信息，显示分页插件
					$("#complex_device_table_nodata").hide();
					$("#complex_paging_device").show();
				}else{
					$("#complex_device_table_nodata").show();
					$("#complex_paging_device").hide();
				}
			}
			//绑定切换到详情tab的点击事件
			bindDeviceDetailCilck();
		}else{
			//显示设备列表，隐藏详情tab
			$(".js-device-related-table").hide();
			$(".js-device-search-table").show();
			
			$("#complex_device_table_nodata").show();
			$("#complex_paging_device").hide();
		}
	}
	if(param.type == "mobileUser"){
		if(result && result.mobileUser.length>0){
			var data = result.mobileUser[0];
			if(result.flag != 0){
				//多个用户，显示列表
				var tmp_data = {"data":data,"loginUserId":complex_loginUserId,"locationTree":"","pageNo":complex_mobileUser_pageNo,"pageSize":complex_mobileUser_pageSize,"type":"mobileUser"};
				$("#complex_mobileUser_tbody").html(template("complex_user_tbody_tmp",tmp_data));
				
				//渲染分页
				if(complex_mobileUser_pageNo == 1){
					complex_mobileUser_totalRecord = result.totalRecord;
					complex_mobileUserPage(result.totalRecord,param);
				}
				//显示用户列表，隐藏详情tab
				$(".js-mobileUser-search-table").show();
				$(".mobileUser-export-btn").show();
			    $(".js-mobileUser-related-table").hide();
				//绑定事件
//				bindUserDetailClick();
				//隐藏无数据提示信息，显示分页插件
				$("#complex_mobileUser_table_nodata").hide();
				$("#complex_paging_mobileUser").show();
			}else{
				//隐藏用户列表，显示详情tab
				$(".mark_mobileUser_list").hide();
			    $(".mark_mobileUser_detail").show();
				if(result.mobileUser && result.mobileUser.length > 0){
					var tmp_data = {"data":result.mobileUser[0],"loginUserId":complex_loginUserId,"locationTree":"","pageNo":complex_user_pageNo,"pageSize":complex_user_pageSize,type:"mobileUser"};
					$("#complex_mobileUser_detail_tbody").html(template("complex_user_tbody_tmp",tmp_data));
				}
			    if(result.device && result.device.length > 0){
			    	var tem_data = {data:result.device,"pageNo":complex_device_pageNo,"pageSize":complex_device_pageSize,viewType:"mobileUser","userId":result.mobileUser[0][0].userId};
			    	$("#complex_mobileUser_device_tbody").html(template("complex_device_tbody_tmp",tem_data));
			    	$(".js-view-user-related").hide();
			    }
			    //隐藏返回列表按钮
				$(".js-back-device-search").hide();
			    $(".mobileUser-export-btn").hide();

			}
			//隐藏查看按钮
			$(".js-editor-users-btn").hide();
		}else{
			complex_showMobileUserSearchModal();
		}
	}
}


//设备高级搜索
function complex_advancedSearch(pageNo,param){
	complex_cleanHistory();  //清空上次的搜索记录
	if(!param){
		param = $("#complex_advanced_search_form").serializeObject();
		if(param.statusStr && param.statusStr.length == 2){
			param.statusStr = param.statusStr[0]+","+param.statusStr[1];
		}
	}
	param.pageNo = pageNo;
	param.pageSize = complex_device_pageSize;
	if(param.startTime && param.endTime){
		if(new Date(param.startTime).getTime() > new Date(param.endTime).getTime()){
			layer.msg($.i18n.prop("comm.StarttimegtEndtime"));
			return ;
		}
	}
	$(".js-device-related-table .modal-tab-con div.con").eq(0).show().siblings().hide();
	$(".complex_device_tab li").eq(0).addClass('active').siblings().removeClass('active');
	complex_Search(param,complex_advancedSearch_callback);
}

function complex_advancedSearch_callback(result,param){
	if(result && result.device){
		//搜索到单个设备。直接显示详情tab
		if(result.flag == 0){
			//隐藏设备列表，显示详情tab
			$(".js-device-related-table").show();
			$(".js-device-search-table").hide();
			//生成详情列表
			complexBuildDeviceRelationTable(result,false);
			//隐藏详情按钮
			$(".js-view-device-related").hide();
		}else{
			complex_device_pageNo = param.pageNo;
			//多个设备，显示设备列表
			var tem_data = {data:result.device,"pageNo":complex_device_pageNo,"pageSize":complex_device_pageSize};
			$("#complex_device_tbody").html(template("complex_device_tbody_tmp",tem_data));
			
			//渲染分页
			if(param.pageNo == 1){
				complex_devicePage(result.totalRecord,param);
			}
			
			//隐藏无数据提示信息，显示分页插件
			$("#complex_device_table_nodata").hide();
			$("#complex_paging_device").show();
			//显示设备列表，隐藏详情tab
			$(".js-device-related-table").hide();
			$(".js-device-search-table").show();
			//显示返回列表按钮
			$(".js-back-device-search").show();
		}
		//绑定切换到详情tab的点击事件
		bindDeviceDetailCilck();
	}else{
		//显示设备列表，隐藏详情tab
		$(".js-device-related-table").hide();
		$(".js-device-search-table").show();
		$("#complex_device_table_nodata").show();
		$("#complex_paging_device").hide();
	}
}


//窗口中的普通搜索
function complex_basicQuery(type){
	var keyword = "";
	complex_cleanHistory();
	if(!type){
		type = $(".js-toggle-user-device").val();
		keyword = $(".js-modal-user-device-search").val();
	}else{
		keyword = $(".js-modal-mobileUser-search").val();
	}
	complex_mobileUser_keyword = keyword;
	if(type == "user"){
		complex_user_pageNo = 1;
		if(!$(".js-user-search-con").is(":visible")){
			complex_showUserSearchModal();
		}
	}
	if(type == "device"){
		complex_device_pageNo = 1;
		if(!$(".js-device-search-table").is(":visible")){
			complex_showDeviceSearchModal();
		}
	}
	if(type == "mobileUser"){
		complex_mobileUser_pageNo = 1;
		if(!$(".js-mobileUser-search-table").is(":visible")){
			complex_showMobileUserSearchModal();
		}
	}
	complex_showSearchModal(keyword,type);
}

/**
 * 初始化转移客户信息表单
 * 
 */
function complex_buildTransCustForm(formId,targetId){
	if(complex_see_userId && complex_see_parentId){
		$("#" + targetId).empty();
		$(".js-user-related-table .modal-tab-con div.con").eq(4).show().siblings().hide();
		$(".complex_user_tab li").eq(4).addClass('active').siblings().removeClass('active');
		var param = {"userId":complex_see_userId,"parentId":complex_see_parentId,"formId":formId,"targetId":targetId,"genBut":"true"};
//		complex_queryUserInfo(param,complex_buildTransCustForm_callback);
		$.ajax({
			type:'POST',
			url:_ctx+"/customer/getUserInfo",  
			data: param,
			async: false, 
			cache: false,
			beforeSend:function(XHR){
				var ele = $(".markLoading:visible");
				ele.append(template("complex_loading_tmp",{}));
			},
			complete:function(XHR, TS){
				$("div[id*=logindata]").remove();
				var ele = $(".markLoading:visible");
				ele.children().show();
			},
			success:function(ret){
				result = ret;
				complex_buildTransCustForm_callback(result,param);
			},
			error : function(e) {
				ajaxError("complex_queryUserInfo()", e);
			}
		});
	}
}
/**
* 转移客户,查询客户信息回调函数
* @param result
* @param param
*/
function complex_buildTransCustForm_callback(result,param){
	 if(result && result.code == 0){
		 var info = result.data;
		 $("#"+param.targetId).html(template("transCustom_tmp",{"info":info,"fromId":param.formId,"genBut":param.genBut}));
		//转移客户-全局搜索 (ul id="transCustom_tree")
		$("#complexTrans_globalSearch_btn_"+param.formId).click(function(){
			globalSearchCustomerTree($("#complexTrans_globalSearch_input_"+param.formId),complex_loginUserId,false,"transCustom_tree_"+param.formId,globalSearchCustomerTree_callback);
		});
		$("#complexTrans_globalSearch_input_"+param.formId).keydown(function(e){
			var serachVal = $(this).val();
			if(e.keyCode == 13 && serachVal!=""){
				globalSearchCustomerTree($("#complexTrans_globalSearch_input_"+param.formId),complex_loginUserId,false,"transCustom_tree_"+param.formId,globalSearchCustomerTree_callback);
			}
		});
	    
		//初始化用户树
		var initNode = complex_getTreeNode(complex_loginUserId);
		var treeObj = $.fn.zTree.init($("#transCustom_tree_" +param.formId), complex_userInfo_tree_setting,initNode);
		if(param.genBut == "false"){
			$("#trans-cust").modal();
		}
		if(param.userId == complex_loginUserId){
			$.post(_ctx+"/customer/getUserInfo",{userId:info.createdBy},function(ret){
				if(ret && ret.code == 0){
					$("#transCustom_form_"+param.formId).find("input[name='createdBy']").val(ret.data.id);
					$("#transCustom_form_"+param.formId).find("input[name='fullParentId']").val(ret.data.fullParentId);
					$("#transCustom_form_"+param.formId).find("input[name='parentName']").val(ret.data.name);
				}
			},"json");
		}else{
			//定位父级用户
			complex_locationUser(info.id,info.fullParentId,"transCustom_tree_"+param.formId,"parent");
		}
		
//		if(param.genBut == "true"){
//			//绑定提交按钮事件
//			$("#complex_transCustBtn_" + param.formId).bind('click',function(){transCustBtnSave(treeObj,param.formId);});
//		}
		return treeObj;
	 }
}


function globalSearchCustomerTree_callback(userId,parentId,fullParent,label){
	var node = {"id":userId,"fullParentId":fullParent};
	var treeId = "";
	if($("form[id^='transCustom_form']:visible").length > 0){
		//客户转移树Id
		treeId = $("form[id^='transCustom_form']:visible").find("ul.ztree").attr("id");
	}
	if($("form[id='userForm']:visible").length > 0){
		/*if($("form[id='userForm']:visible").find("#userId").val()){
		}*/
		//客户管理-客户修改树ID
		treeId = $("form[id='userForm']:visible").find("ul.ztree").attr("id");
	}
	if($("form[id='complex_userInfo_Form_complexUpdate']:visible").length > 0){
		//高级收索-客户详情树ID
		treeId = $("form[id='complex_userInfo_Form_complexUpdate']:visible").find("ul.ztree").attr("id");
	}
	if(treeId){
		var flag = complex_zTreeBeforeClick(treeId,node,null);
		if(flag){
			complex_locationUser(userId, fullParent, treeId, null);
		}
	}
}

/**
* 客户转移保存方法
* @param fromId
*/
function transCustBtnSave(treeId,formId){
	var param = $("#transCustom_form_"+formId).serializeObject();
	var ord_parentId = $("#index_userId").val();
	if(param.old_parentId == param.createdBy){
		param.flag = "0";
	}else{
		param.flag = "1";
	}
	$.ajax({
		type:'POST',
		url:_ctx+"/customer/updateUser",  
		data: param,
		async: false, 
		cache:false,
		success:function(ret){
			if(ret && ret.code==0){
				$("#trans-cust").modal('hide');
				layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});
				var treeObj = $.fn.zTree.getZTreeObj(treeId);
				var treeNode = treeObj.getNodesByFilter(complex_nodeFilter,true,null,{"userId":param.userId,"fullParentId":param.old_fullParentId});
				if(treeNode){
					treeNode.old_fullParentId = param.old_fullParentId;
					treeNode.fullParentId = param.fullParentId + param.createdBy + ",";
					treeNode.pId = param.createdBy;
					treeNode.iconSkin = complex_getUserType(Number(param.type));
				}
				var targetNode = treeObj.getSelectedNodes()[0];
				if(formId == "transCust1"){
					targetNode.isParent = true;
					treeObj.updateNode(targetNode,false);
					if(!targetNode.zAsync){
						treeObj.removeNode(treeNode);
						treeObj.expandNode(targetNode,true,false,true,true);
					}else{
						treeObj.moveNode(targetNode,treeNode,"inner",false);
					}
					var old_parentNode = treeObj.getNodesByFilter(complex_nodeFilter,true,null,{"userId":param.old_parentId,"fullParentId":param.old_fullParentId.replace(param.old_parentId+",","")});
					if(old_parentNode && old_parentNode.children && old_parentNode.children.length==0){
						old_parentNode.isParent = false;
						treeObj.updateNode(old_parentNode,false);
					}
//					complex_updateTreeNode(treeObj.setting.treeId, treeNode, targetNode, {"userId":param.old_parentId,"fullParentId":param.old_fullParentId.replace(param.old_parentId+",","")}, "update");
					$("#transCustom_form_transCust1").find("input[name='old_fullParentId']").val(targetNode.fullParentId+targetNode.id+",");
					$("#transCustom_form_transCust1").find("input[name='old_parentId']").val(targetNode.id);
					//修改缓存的当前查看用户的信息
					complex_see_parentId = param.createdBy;
					complex_see_fullParentId = param.fullParentId;
					//修改用户详情界面第一个tab的点击事件参数
					if(complex_user_totalRecord > 0){
						$(".complex_user_tab li").eq(0).attr("onclick","complex_showRelation('"+complex_see_userId+"','"+complex_see_parentId+"',"+true+")");
					}else{
						$(".complex_user_tab li").eq(0).attr("onclick","complex_showRelation('"+complex_see_userId+"','"+complex_see_parentId+"',"+false+")");
					}
				}
				complex_updateTreeNode(leftTree.setting.treeId, treeNode, targetNode, {"userId":param.old_parentId,"fullParentId":param.old_fullParentId.replace(param.old_parentId+",","")}, "update");
				var leftNode = leftTree.getNodesByFilter(complex_nodeFilter,true,null,{"userId":targetNode.id,"fullParentId":targetNode.fullParentId});
				if(leftNode){
					leftTree.selectNode(leftNode);
					leftTree.setting.callback.onClick(null,"treeDemo",leftNode);
				}
			}else if(ret.code == -2){
				layer.msg($.i18n.prop('cust.Accountalreadyexists'),{icon:2});	
			}else {
				layer.msg($.i18n.prop('comm.Failed'),{icon:2});		
			}
		},
		error : function(e) {
			ajaxError("transCustBtnSave()", e);
		}
	});
}

/**
* (批量)客户转移保存方法
* @param fromId
*/
function pl_transCustBtnSave(treeId,formId){
	var param = $("#transCustom_form_"+formId).serializeObject();
	var ord_parentId = $("#index_userId").val();
	if(ord_parentId == param.createdBy){
		param.flag = "0";
	}else{
		param.flag = "1";
	}
	$.ajax({
		type:'POST',
		url:_ctx+"/customer/transCust",  
		data: param,
		async: false, 
		cache:false,
		success:function(ret){
			if(ret && ret.code==0){
				$("#trans-cust").modal('hide');
				layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});
				//***************************
				var treeObj = $.fn.zTree.getZTreeObj(treeId);
				var targetNode = treeObj.getSelectedNodes()[0];//转移客户弹框树上选中的目标节点
				//重新刷新根节点
				$("#treeDemo").initCustomTree({
					treeType : "stock_repertory",
					head_userId : complex_loginUserId, 
					chkOrNot : false,
					onClick : zTreeOnClick,
					onClickFlag : false,
					ajaxDataFilter : stock_ajaxDataFilter
				});
				leftTree = $.fn.zTree.getZTreeObj("treeDemo");
				
				//左侧客户树上，对应在弹框中选中的用户节点
				var leftNode = leftTree.getNodesByFilter(complex_nodeFilter,true,null,{"userId":targetNode.id,"fullParentId":targetNode.fullParentId});
				if(leftNode){
					leftTree.selectNode(leftNode);
					leftTree.setting.callback.onClick(null,"treeDemo",leftNode);
				}
				//转移，强行异步加载父节点的子节点
				leftTree.reAsyncChildNodes(leftNode, "refresh");
				
//				var tempUserIdArray = param.userId.split(",");
//				//批量转移时param.userId是多个ID值，用‘，’分割
//				for(var i=0;i<tempUserIdArray.length;i++){
//					var tempUserId = tempUserIdArray[i];
//					var treeNode = treeObj.getNodesByFilter(complex_nodeFilter,true,null,{"userId":tempUserId,"fullParentId":param.old_fullParentId});
//					
//					if(treeNode){
//						treeNode.old_fullParentId = param.old_fullParentId;
//						treeNode.fullParentId = param.fullParentId + param.createdBy + ",";
//						treeNode.pId = param.createdBy;
//					}
//					
//					var targetNode = treeObj.getSelectedNodes()[0];
//					//complex_updateTreeNode(leftTree.setting.treeId, treeNode, targetNode, {"userId":param.old_parentId,"fullParentId":param.old_fullParentId.replace(param.old_parentId+",","")}, "update");
//					
//					var leftNode = leftTree.getNodesByFilter(complex_nodeFilter,true,null,{"userId":targetNode.id,"fullParentId":targetNode.fullParentId});
//					if(leftNode){
//						leftTree.selectNode(leftNode);
//						leftTree.setting.callback.onClick(null,"treeDemo",leftNode);
//					}
//					//转移，强行异步加载父节点的子节点
//					leftTree.reAsyncChildNodes(leftNode, "refresh");
//				}
				
			}else {
				layer.msg($.i18n.prop('comm.Failed'),{icon:2});		
			}
		},
		error : function(e) {
			ajaxError("transCustBtnSave()", e);
		}
	});
}




/**
 * 初始化用户信息表单
 */
 function complex_buildUserInfoForm(formId,targetId){
	if(complex_see_userId && complex_see_parentId){
		$(".js-user-related-table .modal-tab-con div.con").eq(1).show().siblings().hide();
		$(".complex_user_tab li").eq(1).addClass('active').siblings().removeClass('active');
		var param = {"userId":complex_see_userId,"parentId":complex_see_parentId,"formId":formId,"targetId":targetId};
		complex_queryUserInfo(param,complex_buildUserInfoFrom_callback);
	}
}

 function complex_buildUserInfoFrom_callback(result,param){
	 if(result && result.code == 0){
			var info = result.data;
			$("#"+param.targetId).html(template("complex_user_info_tmp",{"info":info,"fromId":param.formId,"loginUserId":complex_loginUserId,"loginUserType":complex_loginUserType}));
			//初始化用户类型checkbox
			$("#complex_userInfo_Form_"+param.formId).find("input[name='type']").iCheck();
			//充值权限checkbox初始化及点击事件
			$("#complex_userInfo_Form_"+param.formId).find("input[name='rechargeCheck']").iCheck().on('ifChecked',function(event){
				$("#complex_userInfo_Form_"+param.formId).find("input[name='recharge']").val("1");
				$(".show-discount-inp").show();
			}).on('ifUnchecked',function(event){
				$("#complex_userInfo_Form_"+param.formId).find("input[name='recharge']").val("0");
				$(".show-discount-inp").hide();
				$("#complex_userInfo_Form_"+param.formId).find("input[name='discount']").val("");
			});
			//app登陆权限checkbox初始化及点击事件
			$("#complex_userInfo_Form_"+param.formId).find("input[name='appLoginCheck']").iCheck().on('ifChecked',function(event){
				$("#complex_userInfo_Form_"+param.formId).find("input[name='appLogin']").val("1");
			}).on('ifUnchecked',function(event){
				$("#complex_userInfo_Form_"+param.formId).find("input[name='appLogin']").val("0");
			});
			//web登陆权限checkbox初始化及点击事件
			$("#complex_userInfo_Form_"+param.formId).find("input[name='webLoginCheck']").iCheck().on('ifChecked',function(event){
				$("#complex_userInfo_Form_"+param.formId).find("input[name='webLogin']").val("1");
			}).on('ifUnchecked',function(event){
				$("#complex_userInfo_Form_"+param.formId).find("input[name='webLogin']").val("0");
			});
			
			//用户修改-全局搜索 (ul id="complex_userInfo_tree_complexUpdate")
			$("#complexUpdate_globalSearch_btn").click(function(){
				globalSearchCustomerTree($("#complexUpdate_globalSearch_input"),complex_loginUserId,false,"complex_userInfo_tree_complexUpdate",globalSearchCustomerTree_callback);
			});
			$("#complexUpdate_globalSearch_input").keydown(function(e){
				if(e.keyCode == 13){
					globalSearchCustomerTree($("#complexUpdate_globalSearch_input"),complex_loginUserId,false,"complex_userInfo_tree_complexUpdate",globalSearchCustomerTree_callback);
				}
			});
			//初始化用户树
			var initNode = complex_getTreeNode(complex_loginUserId);
			var treeObj = $.fn.zTree.init($("#complex_userInfo_tree_"+param.formId), complex_userInfo_tree_setting,initNode);
			if(param.userId == complex_loginUserId){
				$.post(_ctx+"/customer/getUserInfo",{userId:info.createdBy},function(ret){
					if(ret && ret.code == 0){
						$("#complex_userInfo_Form_"+param.formId).find("input[name='createdBy']").val(ret.data.id);
						$("#complex_userInfo_Form_"+param.formId).find("input[name='fullParentId']").val(ret.data.fullParentId);
						$("#complex_userInfo_Form_"+param.formId).find("input[name='parentName']").val(ret.data.name);
					}
				},"json");
			}else{
				//定位父级用户
				complex_locationUser(info.id,info.fullParentId,"complex_userInfo_tree_"+param.formId,"parent");
			}
			//绑定验证
			complex_user_validate("complex_userInfo_Form_"+param.formId);
			//绑定提交按钮事件
			$("#complex_updateUserBtn").bind('click',function(){
				if(!$("#complex_userInfo_Form_"+param.formId).valid()){
					//聚焦验证失败的第一个输入框
					$("#complex_userInfo_Form_"+param.formId).find("[name='"+$("label.error:visible").eq(0).attr("for")+"']").focus();
					return ;
				}
				var result = complex_updateUser(param.formId);
				if(result){
					if(result.code == 0){
						var old_fullParent = $("#complex_userInfo_Form_"+param.formId).find("input[name='old_fullParentId']").val();
						var old_parentId = $("#complex_userInfo_Form_"+param.formId).find("input[name='old_parentId']").val();
						var userId = $("#complex_userInfo_Form_"+param.formId).find("input[name='userId']").val();
						//更新节点数据
						var treeNode = treeObj.getNodesByFilter(complex_nodeFilter,true,null,{"userId":userId,"fullParentId":old_fullParent});
						treeNode.name = $("#complex_userInfo_Form_"+param.formId).find("input[name='nickName']").val();
						treeNode.type = $("#complex_userInfo_Form_"+param.formId).find("input[name='type']:checked").val();
						treeNode.typeName = complex_buildTypeName(treeNode);
						treeNode.iconSkin = complex_getUserType(Number(treeNode.type));
						treeNode.phone = $("#complex_userInfo_Form_"+param.formId).find("input[name='phone']").val();
						treeNode.pId = $("#complex_userInfo_Form_"+param.formId).find("input[name='createdBy']").val();
						treeNode.fullParentId = $("#complex_userInfo_Form_"+param.formId).find("input[name='fullParentId']").val()+treeNode.pId+",";
						treeObj.updateNode(treeNode,false);
						//修改缓存的当前查看用户的信息
						complex_see_name = treeNode.name;
						complex_see_parentId = treeNode.pId;
						complex_see_fullParentId = treeNode.fullParentId;
						layer.msg($.i18n.prop("comm.Operationdone"),{icon:1});
						if(old_fullParent != $("#complex_userInfo_Form_"+param.formId).find("input[name='fullParentId']").val()+$("#complex_userInfo_Form_"+param.formId).find("input[name='createdBy']").val()+","){
							var targetNode = treeObj.getSelectedNodes()[0];
							//修改用户详情界面第一个tab的点击事件参数
							if(complex_user_totalRecord > 0){
								$(".complex_user_tab li").eq(0).attr("onclick","complex_showRelation('"+complex_see_userId+"','"+treeNode.pId+"',"+true+")");
							}else{
								$(".complex_user_tab li").eq(0).attr("onclick","complex_showRelation('"+complex_see_userId+"','"+treeNode.pId+"',"+false+")");
							}
							//修改原父ID和原全父ID ，防止用户继续修改时发生错误。
							$("#complex_userInfo_Form_"+param.formId).find("input[name='old_fullParentId']").val(targetNode.fullParentId+targetNode.id+",");
							$("#complex_userInfo_Form_"+param.formId).find("input[name='old_parentId']").val(targetNode.id);
							//修改目标节点为父节点
							targetNode.isParent = true;
							treeObj.updateNode(targetNode,false);
							//未异步加载过的节点,使用moveNode移动节点数据、并展开时会出现节点重复的问题。
							if(!targetNode.zAsync){
								treeObj.removeNode(treeNode);
								treeObj.expandNode(targetNode,true,false,true,true);
							}else{
								treeObj.moveNode(targetNode,treeNode,"inner",false);
							}
							var old_parentNode = treeObj.getNodesByFilter(complex_nodeFilter,true,null,{"userId":old_parentId,"fullParentId":old_fullParent.replace(old_parentId+",","")});
							if(old_parentNode && old_parentNode.children && old_parentNode.children.length==0){
								old_parentNode.isParent = false;
								treeObj.updateNode(old_parentNode,false);
							}
							//记录原父ID，更新其他树时寻找节点需要
							treeNode.old_fullParentId = old_fullParent;
							//若有配置需要更新的树
							if(option && option.updateTreeId){
								var selectNode = treeObj.getSelectedNodes()[0];
								if(selectNode){
									$("#"+option.updateTreeId).initCustomTree({
										treeType : "stock_repertory",
										head_userId : header == "customerManagement"?complex_loginUserId:global_userId, 
										head_parentId :parentId,
										loadingSelector : "TreeLogindata",
										onClick : zTreeOnClick,
										onClickFlag : false,
										ajaxDataFilter : stock_ajaxDataFilter
									});
									if(header == "customerManagement"){
										leftTree = $.fn.zTree.getZTreeObj(option.updateTreeId);
									}
									complex_locationUser(selectNode.id, selectNode.fullParentId, option.updateTreeId, null);
								}
							}
							//更新高级搜索中的树
							complex_updateTreeNode("complex_search_tree",treeNode,targetNode,{"userId":old_parentId,"fullParentId":old_fullParent.replace(old_parentId+",","")},"update");
						}else{
							treeNode.old_fullParentId = old_fullParent;
							if(option && option.updateTreeId){
								complex_updateTreeNode(option.updateTreeId,treeNode,null,null,"update");
								if(option.updateTreeId == "treeDemo" && leftTree){
									var leftNode = leftTree.getSelectedNodes()[0];
									if(leftNode){
										leftTree.setting.callback.onClick(null,leftTree.setting.treeId,leftNode);
									}
								}
							}
						}
					}else if(result.code == -2){
						layer.msg($.i18n.prop("cust.superiorExistThisUser"),{icon:2});
					}else{
						layer.msg($.i18n.prop("comm.Failed"),{icon:2});
					}
				}
			});
		}
 }
 

/**
 * 修改用户信息时更新树节点
 * @param treeId
 * @param treeNode
 * @param targetNode
 * @param flag 当flag="add"时。targetNode参数不是ztree节点数据，而是userId和fullParentId
 */ 
function complex_updateTreeNode(treeId,treeNode,targetNode,oldParent,flag){
	var treeObj = $.fn.zTree.getZTreeObj(treeId);
	if(treeObj){
		if(flag == "update"){
			//在树上寻找被修改的节点
			var up_node = treeObj.getNodesByFilter(complex_nodeFilter,true,null,{"userId":treeNode.id,"fullParentId":treeNode.old_fullParentId});
			//如果找到被修改的节点，更新节点的数据
			if(up_node){
				if(treeNode.name.indexOf("/") < 0){
					treeNode.name += up_node.countStr;
				}
				up_node.name = treeNode.name ;
				up_node.iconSkin = treeNode.iconSkin;
				up_node.pId = treeNode.pId;
				up_node.fullParentId = treeNode.fullParentId;
				up_node.type = treeNode.type;
				up_node.phone = treeNode.phone;
				up_node.typeName = treeNode.typeName;
				treeObj.updateNode(up_node,false);
			}
			if(targetNode){
				//查找目标节点
				var up_targetNode = treeObj.getNodesByFilter(complex_nodeFilter,true,null,{"userId":targetNode.id,"fullParentId":targetNode.fullParentId});
				//如果被修改的节点和目标节点同时存在
				if(up_node && up_targetNode){
					//目标节点未异步加载,使用moveNode移动节点数据、并展开时会出现节点重复的问题。
					if(!up_targetNode.zAsync){
						//删除原节点，在目标节点下重新加载被修改的节点
						treeObj.removeNode(up_node);
						treeObj.expandNode(up_targetNode,true,false,true,true);
					}else{
						//将被修改的节点移动到目标节点下。inner 做为子节点
						treeObj.moveNode(up_targetNode,up_node,"inner",false);
					}
				}else if(!up_node && up_targetNode){
					//如果寻找到目标节点，但未找到被修改的节点，强行异步加载目标节点的子节点
					treeObj.reAsyncChildNodes(up_targetNode, "refresh");
				}else if(up_node && !up_targetNode){
					//如果未寻找到目标节点，但找到被修改的节点，直接删除被修改的节点
					treeObj.removeNode(up_node,false);
				}
			}
			//更新原父节点
			if(oldParent){
				var old_parentNode = treeObj.getNodesByFilter(complex_nodeFilter,true,null,oldParent);
				if(old_parentNode && old_parentNode.children && old_parentNode.children.length==0){
					old_parentNode.isParent = false;
					treeObj.updateNode(old_parentNode,false);
				}
			}
		}
		if(flag == "add"){
			//若找到目标节点，强行刷新目标节点的子节点。
			var add_targetNode = treeObj.getNodesByFilter(complex_nodeFilter,true,null,{"userId":targetNode.userId,"fullParentId":targetNode.fullParentId});
			if(add_targetNode){
				//将目标节点修改为父节点
				add_targetNode.isParent = true;
				treeObj.updateNode(add_targetNode,false);
				treeObj.reAsyncChildNodes(add_targetNode, "refresh");
			}
		}
	}
	return treeObj;
} 
 
 
/**
 * 自定义节点过滤方法
 * @param node
 * @param invokeParam
 * @returns {Boolean}
 */ 
function complex_nodeFilter(node,invokeParam){
	return (node.id == invokeParam.userId);
}

function complex_nodeFilterByParent(node,invokeParam){
	return (node.id == invokeParam.userId && node.pId == invokeParam.parentId);
}

function complex_getUserType(type){
	var icon = "";
	switch (type) {
	case 0:
		icon = "adminuser";
		break;
	case 8:
		icon = "onepoxy";
		break;
	case 9:
		icon = "ptuser";
		break;
	case 10:
		icon = "ptpoxy";
		break;
	case 11:
		icon = "xiaoshou";
		break;
	default:
		icon = "ptuser";
		break;
	}
	return icon;
}
 
 
/**
 * 生成设备详情tab
 */
function complexBuildDeviceRelationTable(data,param){
	if(data){
		if(data.device){
			//设备信息
			var tmp_data = {data: data.device,"pageNo":1,"pageSize":complex_device_pageSize};
			$("#complex_device_detail_tbody").html(template("complex_device_tbody_tmp",tmp_data));
			complex_see_device = data.device[0];
			//隐藏详情按钮
			$(".js-view-device-related").hide();
		}else{
			$("#complex_device_detail_tbody").empty();
		}
		if(data.user){
			//用户关系
			var userData = data.user[0];
			if(userData){
				var level = "└─&nbsp;";
				$.each(userData,function(i,v){
					if(i>0){
						v.levelName = level+v.nickName;
						level = "&emsp;"+level;
					}
				});
				var tmp_data = null;
				if(param.viewType && param.viewType == "mobileUser"){
					tmp_data = {"data":userData,"loginUserId":complex_loginUserId,"locationTree":"","pageNo":1,"pageSize":complex_device_pageSize,"type":param.viewType};
				}else{
					tmp_data = {"data":userData,"loginUserId":complex_loginUserId,"locationTree":option.treeId,"pageNo":1,"pageSize":complex_device_pageSize,"type":param.viewType};
				}
				$("#complex_device_user_realtion_tbody").html(template("complex_user_tbody_tmp",tmp_data));
				//高亮用户最后一行
				$("#complex_device_user_realtion_tbody tr:last").attr("class","active");
				//隐藏详情按钮
				$(".js-view-user-related").hide();
			}
		}else{
			$("#complex_device_user_realtion_tbody").empty();
		}
		if(param.flag){
			//显示返回列表按钮
			$(".js-back-device-search").show();
			$(".js-back-device-search").unbind();
			if(param.viewType == "mobileUser"){
				$(".js-back-device-search").click(function(){
					$('.js-device-search-con').hide();
					$('.js-mobilUser-search-con').show();
					$(".js-view-device-related").show();
				});
			}else{
				$(".js-back-device-search").click(function(){
					$(".js-device-search-table").show();
					$("#complex_paging_device").show();
					$(".js-device-related-table").hide();
					$(".js-view-device-related").show();
				});
			}
		}else{
			//隐藏返回列表按钮
			$(".js-back-device-search").hide();
		}
		
		//显示第一个tab
		$(".complex_device_tab li").eq(0).attr("onclick","complex_showDeviceRelation('"+complex_see_device.imei+"',"+param.flag+",'"+param.viewType+"')");
	}
}

/**
 * 验证IMEI点击事件
 */
var complex_selectedFlag = false;
function complex_slae_validate(id,selectedImeis){
	var imeis = "";
	var inputImeis = "";
	if(selectedImeis){
		complex_selectedFlag = true;
		inputImeis = selectedImeis;
	}else{
		complex_selectedFlag = false;
		inputImeis = $("#sale_imei_"+id).val().replace(/\r\n/ig,",").replace(/\n/ig,",").replace(/(^\s+)|(\s+$)/g,"").replace(/\s/g,"");
	}
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
	if(imeis){
		$("#complex_putdevice_loading").show();
		if(id == "complexSale"){
			complex_validateImei({"imeis":imeis,"allotFlag":"batchsale"},id);
		}else{
			complex_validateImei({"imeis":imeis,"allotFlag":"devmove"},id);
		}
	}else{
		/*layer.msg($.i18n.prop("cust.PleaseenterIMEI"));*/
		$("#sale_imei_"+id).addClass("form-control-error");
	}
}

/**
 * 生成用户关系列表
 */
function complexBuildRealtionTable(data,flag){
	if(data && data.length > 0){
		//遍历,用户名称缩进
		var level = "└─&nbsp;";
		$.each(data,function(i,v){
			if(i>0){
				v.levelName = level+v.nickName;
				level = "&#12288;"+level;
			}
		});
		var tmp_data = {"data":data,"loginUserId":complex_loginUserId,"locationTree":option.treeId,"pageNo":1,"pageSize":complex_user_pageSize};
		$("#complex_user_relation_tbody").html(template("complex_user_tbody_tmp",tmp_data));
		//最后一条数据为当前查看的用户,保存其他tab需要的数据;
		var last = data[data.length-1];
		complex_see_userId = last.userId;
		complex_see_name = last.nickName;
		complex_see_fullParentId = last.fullParentId;
		var parentArray = complex_see_fullParentId.substring(0, complex_see_fullParentId.length-1).split(",");
		complex_see_parentId = parentArray[parentArray.length-1];
		
		
		//显示第一个tab
		$(".complex_user_tab li").eq(0).attr("onclick","complex_showRelation('"+complex_see_userId+"','"+complex_see_parentId+"',"+flag+")").addClass('active').siblings().removeClass('active');
		$(".js-user-related-table .modal-tab-con div.con").eq(0).show().siblings().hide();
		
		//突显最后一行
		$("#complex_user_relation_tbody tr:last").attr("class","active");
		//隐藏查看按钮
		$("#complex_user_relation_tbody .js-view-user-related").hide();
	}
}

function complex_showMobileUserDevice(userId,obj,flag){
	$(".mark_mobileUser_list").hide();
	$(".mobileUser-export-btn").hide();
	$(".mark_mobileUser_detail").show();
	//清除上一次的记录
	$("#complex_mobileUser_detail_tbody").empty();
	$("#complex_mobileUser_device_tbody").empty();
	var param = {"userId":userId,"flag":flag,"ele":obj};
	complex_queryMobileUserDevice(param,complex_queryMobileUserDevice_callback);
}

/**
 * 查询手机用户绑定的设备
 * @param param
 * @param callback
 * @returns {String}
 */
function complex_queryMobileUserDevice(param,callback){
	var result = "";
	if(param){
		$.ajax({
			type:"post",
			async: true,
			cache: false,
			dataType:"json",
			data: {"userId":param.userId},
			url:_ctx+"/device/getMobileUserDevice",
			beforeSend:function(XHR){
				complex_showLoading();
			},
			complete:function(XHR, TS){
				complex_hideLoading();
			},
			success:function(ret){
				if(ret && ret.code == 0){
					result = ret.data;
					if(callback && typeof(callback) == "function"){
						callback(result,param);
					}
				}
			}
		});
	}
	return result;
}

/**
 * 返回手机用户列表
 */
function complex_backMobileUserList(){
	$(".mark_mobileUser_detail").hide();
	$(".mobileUser-export-btn").show();
	$(".mark_mobileUser_list").show();
	$(".js-view-user-related").show();
	
	$("#complex_paging_mobileUser").show();
	var type = "mobileUser";
	complex_showSearchModal(complex_mobileUser_keyword,type);
	
	
}

function complex_queryMobileUserDevice_callback(result,param){
	if(result && result.length > 0){
		$("#complex_mobileUser_detail_tbody").append($(param.ele).parent().parent().clone());
		$("#complex_mobileUser_detail_tbody tr td:first").html(1);  //序号修改为1
		var tem_data = {data:result,"pageNo":complex_device_pageNo,"pageSize":complex_device_pageSize,viewType:"mobileUser","userId":param.userId};
		$("#complex_mobileUser_device_tbody").html(template("complex_device_tbody_tmp",tem_data));
		$(".js-view-user-related").hide();
		$(".js-back-device-search").show();
	}
}

/**
 * 查看用户关系
 */
function complex_showRelation(userId,parentId,flag){
	if(complex_loginUserType == 3 || complex_loginUserType == 12 || complex_loginUserType == 9){
		$(".complex_user_tab li").eq(3).hide();
	}
	//隐藏用户列表，显示详情tab
	$(".js-user-search-table").hide();
    $(".js-user-related-table").show();
	var param = {"userId":userId,"parentId":parentId,"flag":flag};
	complex_queryRelation(param,complex_showRelation_callback);
}

function complex_showRelation_callback(result,param){
	if(result && result.length > 0){
		//考虑到用户有可能会有多重关系，返回的是集合中放的集合，修改后数据结构没有变，所以直接取第一个即可。
		var data = result[0];
		//生成关系列表
		complexBuildRealtionTable(data,param.flag);
		//显示返回用户列表按钮
		if(param.flag){
			$(".js-back-user-search").show();
		}else{
			$(".js-back-user-search").hide();
		}
//		//给第一个tab添加点击事件;
//		$(".complex_user_tab li").eq(0).attr("onclick","complex_showRelation('"+param.userId+"','"+param.parentId+"',"+param.flag+")");
	}
};

function complex_showMobileUserRelation(imei,obj){
	$('.js-mobileUser-search-table').hide();
	$('.js-mobileUser-related-table').show();
	//清空上一次的记录
	$("#complex_mobileUser_relation_device_tbody").empty();
	$("#complex_mobileUser_relation_tbody").empty();
	//显示用户关系面板
	$(".js-mobileUser-related-table .modal-tab-con .con").eq(0).show();
	//克隆需要查看的设备信息
	$("#complex_mobileUser_relation_device_tbody").append($(obj).parent().parent().clone());
	//序号始终为1
	$("#complex_mobileUser_relation_device_tbody tr td:first").html(1);
	
	//获取用户关系
	var result = complex_getMobileUserRelation(imei);
	if(result && result.length > 0 && result[0].length > 0){
		var data = result[0];
		var level = "└─&nbsp;";
		$.each(data,function(i,v){
			if(i>0){
				v.levelName = level+v.nickName;
				level = "&#12288;"+level;
			}
		});
		var tmp_data = {"data":data,"loginUserId":complex_loginUserId,"locationTree":"","pageNo":1,"pageSize":complex_user_pageSize,type:"mobileUser"};
		$("#complex_mobileUser_relation_tbody").html(template("complex_user_tbody_tmp",tmp_data));
	}
}

/**
 * 返回手机用户设备列表
 */
function complex_backMobileUserDeviceList(){
	$(".js-mobileUser-related-table").hide();
	$(".js-mobileUser-search-table").show();
	
}

/**
 * 获取手机用户的上级用户
 * @param imei
 * @returns {String}
 */
function complex_getMobileUserRelation(imei){
	var result = "";
	$.ajax({
		type:"post",
		async: false,
		cache: false,
		dataType:"json",
		data: {"imei":imei},
		url:_ctx+"/device/getMobileUserRelation",
		beforeSend:function(XHR){
			complex_showLoading();
		},
		complete:function(XHR, TS){
			complex_hideLoading();
		},
		success:function(ret){
			if(ret && ret.code == 0){
				result = ret.data;
			}
		}
	});
	return result;
}


/**
 * 查看设备所属用户的关系
 */
function complex_showDeviceRelation(imei,flag,viewType){
	//隐藏设备列表，显示详情tab
	if(viewType && viewType == "mobileUser"){
		$(".js-mobilUser-search-con").hide();
		$(".js-device-search-con").show();
	}
	$(".js-device-search-table").hide();
	$(".js-device-related-table").show();
	$(".js-view-device-related").hide();
	$(".js-device-related-table .modal-tab-con div.con").eq(0).show().siblings().hide();
	$(".complex_device_tab li").eq(0).addClass('active').siblings().removeClass('active');
	var param = {"queryType":"device","keyword":imei,"basicType":"IMEI","flag":flag,"viewType":viewType};
	complex_Search(param,complex_showDeviceRelation_callback);
}

function complex_showDeviceRelation_callback(result,param){
	if(result){
		complexBuildDeviceRelationTable(result,param);
		//保存当前查看的设备信息
		complex_see_device = result.device[0];
		//给第一个tab添加点击事件;
		$(".complex_device_tab li").eq(0).attr("onclick","complex_showDeviceRelation('"+complex_see_device.imei+"',"+param.flag+",'"+param.viewType+"')");
	}
}

/**
 * 新增用户，提交form
 */
function complex_addUserClick(){
	if(!$("#complex_addUser_form").valid()){
		$("#complex_addUser_form").find("[name='"+$("label.error:visible").eq(0).attr("for")+"']").focus();
		return ;
	}
	var result = complex_saveUser("complex_addUser_form");
	if(result){
		if(result.code == 0){
			layer.msg($.i18n.prop("comm.Operationdone"),{icon:1});
			//配置中有需要更新的树则更新
			if(option && option.updateTreeId){
				complex_updateTreeNode(option.updateTreeId,null,{"userId":complex_see_userId,"fullParentId":complex_see_fullParentId},null,"add");
			}
			//更新高级搜索中的树
			complex_updateTreeNode("complex_search_tree",null,{"userId":complex_see_userId,"fullParentId":complex_see_fullParentId},null,"add");
		}else if(result.code==213){
			layer.msg($.i18n.prop('cust.Accountalreadyexists'),{icon:2});
		}else{
			layer.msg($.i18n.prop("comm.Failed"),{icon:2});
		}
	}
}

var complex_parentUserexpiration = "";
var complex_parentMonth = "";

//删除设备
function toDeleteDevice_report(id){	
	
	$.ajax({
		type:"post",
		async: false,
		cache: false,
		dataType:"json", 
		data: {"id":id},
		url:_ctx+"rest/deviceControl/delete",
		beforeSend:function(XHR){
		},
		complete:function(XHR, TS){
		},
		success:function(ret){
			if(ret && ret.statusCode == 0){
				layer.msg($.i18n.prop("comm.Operationdone"),{icon:1});
				searchList();
			}
		}
	});
}

/**
 * 生成设备详细信息表单
 */
function complex_buildDeviceInfoForm(id,devid,modal){
	
	if(id=="add"){
		$("#addDevice").modal();
		var userId=$.parseJSON(getCookie("selectHistory")).userId;
		var name=$.parseJSON(getCookie("selectHistory")).name;
		$("input[name='devuserId']").val(userId);
		$("input[name='belonguser']").val(name);
		$(".complex-group-select-add").easyDropDown();
		//$(".complex-mcType").easyDropDown();
		complex_initDevMcType();
		return ;
	}
	$(".js-device-related-table .modal-tab-con div.con").eq(1).show().siblings().hide();
	$(".complex_device_tab li").eq(1).addClass('active').siblings().removeClass('active');
//	if(imei!=undefined&&!imei){
//		imei = complex_see_device.imei;
//	}
	
	var result = comlex_getDeviceInfo(devid);
	if(result && result.code == 0){
		$("#edit_device_info_"+id).html(template("complex_device_info_tmp",{"info":result.data,"id":id,"modal":modal}));
		$.fn.citySelect();
		tabs(".js-equipment-tab-nav", "active");
		$('#installTime_'+id).focus(function(){
			laydate({
				  elem: '#installTime_'+id,
				  event: 'focus' //响应事件。
				});
		});
//		var images = $("#installImage_"+id).val().split(',');
//		if(images.length>=10){
//			$("#fileButton_"+id).hide();
//		}
		
		complex_parentUserexpiration = result.data.parentUserExpiration;
		complex_parentMonth = result.data.parentMonth;
		
		complex_device_validate("device_info_form_"+id);
		$(".complex-group-select").easyDropDown();
		$(".complex-group-package").easyDropDown();
		$(".complex-mcType").easyDropDown();
		if(!result.data.activationTime){
			$(".complex-userexpirtion-select-"+id).easyDropDown();
		}else{
			$('#userExpiration_'+id).focus(function(){
				laydate({
					  elem: '#userExpiration_'+id,
					  event: 'focus', //响应事件。
				});
			});
			//$("#device_info_form_"+id).find("input[name='userExpiration']").datetimepicker({format:'Y-m-d',step:1,timepicker:false,allowBlank:true});
		}
	}
	if(modal){
		$("#"+modal).modal();
	}
}

/**
 * 初始化新增用户表单
 */
function complex_buildAddUserForm(formId,targetId){
	$("#"+targetId).html(template("complex_addUser_tmp",{"formId":formId,"parentName":complex_see_name,"parentId":complex_see_userId,"fullPid":complex_see_fullParentId,"loginUserType":complex_loginUserType})).show();
	$("#"+formId).find("input[name='type']").eq(0).iCheck('check');
	$("#"+formId).find("input[name='rechargeCheck']").iCheck().on('ifChecked',function(event){
		$("#"+formId).find("input[name='recharge']").val("1");
		 $(".show-discount-inp").show();
	}).on('ifUnchecked',function(event){
		$("#"+formId).find("input[name='recharge']").val("0");
		$(".show-discount-inp").hide();
		$("#"+formId).find("input[name='discount']").val("");
	});
	$("#"+formId).find("input[name='appLoginCheck']").iCheck().on('ifChecked',function(event){
		$("#"+formId).find("input[name='appLogin']").val("1");
	}).on('ifUnchecked',function(event){
		$("#"+formId).find("input[name='appLogin']").val("0");
	});
	$("#"+formId).find("input[name='webLoginCheck']").iCheck().on('ifChecked',function(event){
		$("#"+formId).find("input[name='webLogin']").val("1");
	}).on('ifUnchecked',function(event){
		$("#"+formId).find("input[name='webLogin']").val("0");
	});
	$("#"+formId).find("input[name='type']").iCheck();
	//绑定验证
	complex_user_validate(formId);
}

/**
 * 初始化用户销售
 */
function complex_buildUserSale(id,treeFlag,expirationFlag,modalId){
	
	var temp_data = {'id':id,"treeFlag":treeFlag,"expirationFlag":expirationFlag,"modalId":modalId};
	if(treeFlag == "false"){
		temp_data.saleTo = complex_see_name;
	}
	$("#complex_user_sale_"+id).html(template("complex_user_sale_tmp",temp_data));
	
	//设备转移-全局搜索 (ul id="complex_allotDev_tree_complexAllot")
	$("#complexAllot_globalSearch_btn").click(function(){
		globalSearchCustomerTree($("#complexAllot_globalSearch_input"),complex_loginUserId,true,"complex_allotDev_tree_complexAllot",null);
	});
	$("#complexAllot_globalSearch_input").keydown(function(e){
		if(e.keyCode == 13){
			globalSearchCustomerTree($("#complexAllot_globalSearch_input"),complex_loginUserId,true,"complex_allotDev_tree_complexAllot",null);
		}
	});

	//设备转移-全局搜索 (ul id="complex_allotDev_tree_complexAllot")
	$("#batchSaleid_globalSearch_btn").click(function(){
		globalSearchCustomerTree($("#batchSaleid_globalSearch_input"),complex_loginUserId,true,"complex_allotDev_tree_batchSaleid",null);
	});
	$("#batchSaleid_globalSearch_input").keydown(function(e){
		if(e.keyCode == 13){
			globalSearchCustomerTree($("#batchSaleid_globalSearch_input"),complex_loginUserId,true,"complex_allotDev_tree_batchSaleid",null);
		}
	});
	
	if($(".js-toggle-user-device").val() == "user"){
		if(complex_see_userId && complex_see_userId == complex_loginUserId){
			layer.msg($.i18n.prop("cust.saleToSelf"));
		}
	}
	
	addDeviceBoxToggle("#sale_imei_"+id);
	//默认添加当前查看的设备
	if(complex_see_device){
		complex_slae_validate(id,complex_see_device.imei);
		/*$("#sale_tbody_"+id).html(template('complex_sale_success_tr',{"data":new Array({"imei":complex_see_device.imei,"mcType":complex_see_device.mcType}),"id":id}));
		$("#sale_count_"+id).html(1);*/
	}
	
	//初始化用户树
	if(treeFlag == "true"){
	    var result = complex_getTreeNode(complex_loginUserId);
	    $.fn.zTree.init($("#complex_allotDev_tree_"+id),complex_userInfo_tree_setting,result);
	}
	if(expirationFlag == "true"){
		$(".complex-js-select-"+id).easyDropDown();
	}
}
 
 

/**
 * 设备图标切换
 */
function complex_selectCarIoc(carIocStyle,id,obj){
	$("#device_info_form_"+id+" input[name='vehicleIcon']").val(carIocStyle);
	$("#device_info_form_"+id+" ul>li").removeClass("c-primary");
	$(obj).addClass("c-primary");
}

/**
 * 查询主方法
 */
function complex_Search(param,callback){
	var result = "";
	if(param){
		$.ajax({
			type:"post",
			async: true,
		    cache: false,
		    dataType:"json",
			data: param,
			url:_ctx+"/device/queryDevAndUserInfo",
			beforeSend:function(XHR){
				complex_showLoading();
			},
			complete:function(XHR, TS){
				complex_hideLoading();
			},
			success:function(ret){
				if(ret && ret.code == 0){
					if(ret.data.device && ret.data.device.length > 0){
						var expiratedDaysNum = "";
						$.each(ret.data.device,function(i,v){
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
						});
					}
					result = ret.data;
					if(callback && typeof(callback) == "function"){
						callback(result,param);
					}
				}
			},
			error : function(e) {
				ajaxError("complex_Search()", e);
			}
		});
	}
	return result;
}

//获取即将到期天数
function getExpirateDaysNum(expirationStr){
	var expirateDaysNum = "";
	if(expirationStr){
		expirateDaysNum = expirationStr.substring(expirationStr.indexOf('(')+1,expirationStr.indexOf('天内过期')); 
		if(isNaN(expirateDaysNum)){
			expirateDaysNum = '';
		}
	}
	return expirateDaysNum;
}

/**
 * 提交设备信息form
 * @param id
 */
function complex_device_info_submit(id,modal){
	if(!$("#device_info_form_"+id).valid()){
		$("#device_info_form_"+id).find("[name='"+$("label.error:visible").eq(0).attr("for")+"']").focus();
		return ;
	}
	
	//验证设备到期时间/月份是否大于上级
	var putedUserexpiration = $("#userExpiration_" + id).val();
	var selectedMonth = $("select[name='month']").val();
	if(selectedMonth && complex_parentMonth){
		if(selectedMonth != '1000' && selectedMonth > complex_parentMonth){
			layer.msg($.i18n.prop("Asset.compareUserexpiration"));
			return;
		}
	}
	if(putedUserexpiration && complex_parentUserexpiration){
		var putedUserexpiration_long = new Date(putedUserexpiration.replace(/\-/g, "\/")).getTime();
		var complex_parentUserexpiration_long = new Date(complex_parentUserexpiration.replace(/\-/g, "\/")).getTime();
		if(putedUserexpiration_long > complex_parentUserexpiration_long){
			layer.msg($.i18n.prop("Asset.compareUserexpiration"));
			return;
		}
	}
	
	var result = complex_updateDevInfo(id);
	
	if(result && result.statusCode == 0){
		layer.msg($.i18n.prop("comm.Operationdone"),{icon:1});
		//编辑后刷新列表
		if("editDevice"==modal || $("#customerManagement").hasClass('active')){
			if($("#expirationUser").hasClass("active")){
				initExpirationDevTable();
			}else{
				initDevTableAndPage();	
			}
		}
		
		if("indexeditDevice"==modal){
			var device=result.data;
			/*编辑成功后把名字显示出	 */
			$("#dev_"+device.imei).html('<a  onclick="vehicleLocationClick('+device.imei+')"  href="javascript:;" title="'+device.deviceName+'" id="dev_'+device.imei+'"><span class="c-red"></span> '+device.deviceName+'</a>');
			searchCondition('all');
		}
		
		if("editDevice_report"==modal && Grloba_Tindex!=null){
			initTabData(Grloba_Tindex);
		}
		if("alarmDeviceInfo" == modal){
			$.each($("#alarmInfoTable tr"),function(i,v){
				if($(v).find("td").eq(1).attr("title") == $("#device_info_form_"+id).find("input[name='imei']").val()){
					$(v).find("td").eq(0).text($("#device_info_form_"+id).find("input[name='deviceName']").val());
				}
			});
		}
		
	}else{
		layer.msg($.i18n.prop("comm.Failed"),{icon:2});
	}
	if(modal){
		$("#"+modal).modal('hide');
	}
}


/**
 * 自定义验证规则
 */
//折扣
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
},  $.i18n.prop("Business.Rangingfrom")+'0.01~1');
//身份证
$.validator.addMethod("idCard",function(value,element){
	if(value.length>18){
		return false;
	}else{
		return true;
	}
});
/**
 * 用户表单验证
 * @param formId
 */
function complex_user_validate(formId){
	//确认密码
	$.validator.addMethod("equalToPsw",function(value,element){
		var result=false;
		if(value == $("#"+formId).find("[name='passWord']").val()){
			result = true;
		}
		return result;
	});
	$("#"+formId).validate({
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
				maxlength : 50,
				nickNameValid : true
			},
			passWord:{
				required: true,
				minlength : 6,
				validatorSaveCustPassword:true	
			},
			pswAgain:{
				required: true,
				equalToPsw : true,
			},
			/*phone:{
				//required: true,
				phone : true,
			},*/
			discount:{
				validIsDiscount:true
			},
			email:{
				//required: true,
				email:true
			}
		},
		messages:{
			account:{
				required: $.i18n.prop("cust.Accountcannotbeempty"),
				minlength: $.i18n.prop("cust.AccountLength"),
				maxlength: $.i18n.prop("cust.AccountLength"),
				accountValid : $.i18n.prop("cust.accountValid")
			},
			nickName:{
				required: $.i18n.prop("cust.Usernamecannotbeempty"),
				minlength: $.i18n.prop("cust.nickNameMinLength"),
				maxlength : $.i18n.prop('cust.UserNameMaxLength'),
				nickNameValid : $.i18n.prop('cust.nickNameValid')
			},
			passWord:{
				required: $.i18n.prop("cust.Pleaseenterpassword"),
				minlength : $.i18n.prop('cust.PasswordLength'),
				validatorSaveCustPassword: $.i18n.prop("user.passwordFormat")
			},
			pswAgain:{
				required: $.i18n.prop("cust.Pleaseconfirmpassword") ,
				equalToPsw: $.i18n.prop("cust.Thetwopasswordsdonotmatch")
			} ,
			email:{
				//required: $.i18n.prop("user.email"),
				email:$.i18n.prop("user.emailFormat")
			}/*,
			phone:{
				required :$.i18n.prop("user.phone")
			}*/
		},
		errorPlacement: function(error, element){
			error.appendTo(element.parent());
		}
	});
}

function complex_device_validate(formId){
	$.validator.addMethod("devicePhone",function(value,element){
		var result=false;
		if (!value || /^[0-9]{1,15}$/.test(value)) {
			result = true;
		}
		return result;
	},$.i18n.prop("user.phoneFormat"));
	
	$("#"+formId).validate({
		rules:{
			driverName:{
				//required: true
				maxlength: 20
			},
			sim:{
				//digits: true
				maxlength:20
			},
			vehicleNumber:{
				//required: true
				maxlength:50
			},
			/*driverPhone:{
				//required: true,
				maxlength:20
				//devicePhone : true
			},*/
			idCard:{
				idCard: true
			},
			sn:{
				maxlength:50
			},
			carFrame:{
				maxlength:50
			},
			reMark:{
				maxlength:500
			}
		},
		messages:{
			sim:{
				//digits: $.i18n.prop("Alert.digits")
				maxlength: $.i18n.prop("Asset.DeviceSIMcardNoLength") 
			},
			vehicleNumber:{
				//required: $.i18n.prop("Asset.LicenceNotEmpty")
				maxlength: $.i18n.prop("Asset.LicenceLength")
			},
			driverName:{
				//required: $.i18n.prop("Asset.FillInDriverName")
				maxlength: $.i18n.prop("Asset.DriverNameLength")
			},
			/*driverPhone:{
				//required: $.i18n.prop("user.phone"),
				devicePhone : $.i18n.prop("user.phoneFormat")
			},*/
			idCard:{
				idCard: $.i18n.prop("Asset.IdCardNoFormat")
			},
			sn:{
				maxlength:$.i18n.prop("Asset.SNLength")
			},
			carFrame:{
				maxlength:$.i18n.prop("Asset.CarFrameLength")
			},
			reMark:{
				maxlength:$.i18n.prop("Asset.ReMarkLength")
			}
		},
		errorPlacement: function(error, element){
			error.appendTo(element.parent());
		}
	});
}



/**
 * 查询用户关系
 * userId 用户ID
 * parentId 父ID
 */
function complex_queryRelation(param,callback){
	var result = "";
	$.ajax({
		type:"post",
		async: true,
	    cache: false,
	    dataType:"json",
		data:param,
		url:_ctx+"/device/getParentUser",
		beforeSend:function(XHR){
			complex_showLoading();
		},
		complete:function(XHR, TS){
			complex_hideLoading();
		},
		success:function(ret){
			if(ret && ret.code == 0){
				result = ret.data;
				if(callback && typeof(callback) == "function"){
					callback(result,param);
				}
			}
		},
		error : function(e) {
			ajaxError("complex_queryRelation()", e);
		}
	});
	return result;
}

/**
 * 查询用户的详细信息
 */
function complex_queryUserInfo(param,callback){
	var result = "";
	$.ajax({
		type:'POST',
		url:_ctx+"/customer/getUserInfo",  
		data: param,
		async: true, 
		cache: false,
		beforeSend:function(XHR){
			complex_showLoading();
		},
		complete:function(XHR, TS){
			complex_hideLoading();
		},
		success:function(ret){
			result = ret;
			if(callback && typeof(callback) == "function"){
				callback(result,param);
			}
		},
		error : function(e) {
			ajaxError("complex_queryUserInfo()", e);
		}
	});
	return result;
}

/**
 * 获取初始化ztree的节点(不传参默认加载当前登录用户及下一级用户)
 */
function complex_getTreeNode(userId){
	var result = "";
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data : {"userId":userId},
	    dataType:"json",
	    url:'rest/loginController/getUserTree',//_ctx+"/customer/getOrgUserTree",
		success:function(ret){
			if(ret && ret.code == 0){
				$.each(ret.data,function(i,v){
					v.typeName = complex_buildTypeName(v);
				});
				result = ret.data;
			}
		},
		error : function(e) {
			ajaxError("complex_getTreeNode()", e);
		}
	});
	return result;
}

/**
 * 获取设备详情
 */
function comlex_getDeviceInfo(devId){
	var result = "";
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    dataType:"json",
		data:{"devId":devId},
		url:_ctx+"rest/deviceControl/detail",
		beforeSend:function(XHR){
			complex_showLoading();
		},
		complete:function(XHR, TS){
			complex_hideLoading();
		},
		success:function(ret){
			result = ret;
		},
		error : function(e) {
			ajaxError("comlex_getDeviceInfo()", e);
		}
	});
	return result;
}

/**
 * 新增用户
 */
function complex_saveUser(formId){
	var result = "";
	var param = $("#"+formId).serialize();
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    dataType :"json",
	    data: param,
	    url:_ctx+"/customer/saveUser",
		success:function(ret){
			result = ret;
		},
		error : function(e) {
			ajaxError("complex_saveUser()", e);
		}
	});
	return result;
}


/**
 * 修改用户信息
 */
function complex_updateUser(formId){
	var result = "";
	if(formId){
		//修改后的用户上级不能为下级用户
		if($("#complex_userInfo_Form_"+formId).find("input[name='fullParentId']").val().indexOf($("#complex_userInfo_Form_"+formId).find("input[name='userId']").val()) > 0){
			layer.msg($.i18n.prop("cust.Selecttheusercannotbedoneasasuperioruser"));
			return ;
		}
		var param = $("#complex_userInfo_Form_"+formId).serialize();
		if($("#complex_userInfo_Form_"+formId).find("input[name='old_parentId']").val() == $("#complex_userInfo_Form_"+formId).find("input[name='createdBy']").val()){
			param += "&flag=0";
		}else{
			param += "&flag=1";
		}
		$.ajax({
			type:'POST',
			url:_ctx+"/customer/updateUser",  
			data: param,
			async: false, 
			cache:false,
			success:function(ret){
				result = ret;
			},
			error : function(e) {
				ajaxError("complex_updateUser()", e);
			}
		});
	}
	return result;
}

/**
 * 重置销售（分配）表单
 * @param id
 * @param treeFlag
 * @param expirationFlag
 */
function complex_resetAllotDev(id,treeFlag,expirationFlag){
	var form = $("#complex_user_sale_"+id);
	if(form){
		$(".dev-num").text("0");
		$("#sale_count_"+id).html(0);
		if(treeFlag == "true"){
			$("#sale_to_"+id).html("");
			var treeObj = $.fn.zTree.getZTreeObj("complex_allotDev_tree_"+id);
			if(treeObj){
				treeObj.cancelSelectedNode();
			}
			$("#allot_to_"+id).html("");
		}else{
			$("#sale_to_"+id).html(complex_see_name);
		}
		$("#sale_imei_"+id).val("");
		$("#sale_tbody_"+id).empty();
		if(expirationFlag == "true"){
			$(".complex-js-select-"+id).easyDropDown('select',0);
		}
	}
}

/**
 * 跳转到客户管理并定位指定用户
 * @param userId
 * @param parentId
 */
function toCustomer(userId,parentId){
	$("#toCustomerForm").find("input[name='userId']").val(userId);
	$("#toCustomerForm").find("input[name='parentId']").val(parentId);
	$("#toCustomerForm").submit();
}


/**
 * 快速销售添加IMEI时的验证方法
 */
function complex_validateImei(param,id){
	if(!param.imeis){
		return false;
	}
	var repeatPutedImies = complex_dealImeis(id,param.imeis,false);
	param.imeis = complex_dealImeis(id,param.imeis, true);
	if(!param.imeis){
		if(repeatPutedImies){
			var failArr = new Array();
			$.each(repeatPutedImies.split(","),function(i,v){
				var obj = {imei:v,reason:3};
				failArr.push(obj);
			});
			var tmp_faildData = {"data":failArr,"successNum":0,"faildNum":failArr.length};
			$("#device_add_result_div").html(template("complex_sale_faild_tr",tmp_faildData));
			complex_showFaildPrompty();
			
			$("#complex_putdevice_loading").hide();
			$("#sale_imei_"+id).removeClass("form-control-error").parent().removeClass("focus");
		}
	}else{
		//服务器验证IMEI操作权限
		$.ajax({
			url : _ctx + "rest/deviceControl/putDevice",
			async : true,
			cache : false,
			type : "POST",
			data : {"imeis" : param.imeis,"allotFlag":param.allotFlag},
			datatype : "json",
			success : function(ret) {
				$("#complex_putdevice_loading").hide();
				$("#sale_imei_"+id).removeClass("form-control-error").parent().removeClass("focus");
				if(ret && ret.code == 0){
					var data = ret.data;
					if(data.failCount > 0 ){
						var failData = data.failImeisList;
						var failArr = complex_mapToJson(failData);
						if(repeatPutedImies){
							$.each(repeatPutedImies.split(","),function(i,v){
								var obj = {imei:v,reason:3};
								failArr.push(obj);
							});
						}
						var tmp_faildData = {"data":failArr,"successNum":data.succCount,"faildNum":failArr.length};
						$("#device_add_result_div").html(template("complex_sale_faild_tr",tmp_faildData));
						complex_showFaildPrompty();
					}else{
						if(!complex_selectedFlag){
							//layer.msg($.i18n.prop("cust.AddSuccess"),{icon:1});	
						}
					}
					if(data.succCount > 0 ){
						var successData = data.succDeviceList;
						var resultSuccData = new Array();
						if(id){
							var successTr = $("#sale_tbody_"+id+" tr");
							if(successTr && successTr.length > 0){
								var successImeiArray = [];
								$.each(successTr,function(i,v){
									successImeiArray.push($(v).find("td:first").text());
								});
								$.each(successData,function(i,v){
									if($.inArray(v.imei,successImeiArray) < 0){
										resultSuccData.push(v);
									}
								});
							}else{
								resultSuccData = successData;
							}
						} 
						var tmp_successData = {"data":resultSuccData,"id":id};
						var sucessHtml = template("complex_sale_success_tr",tmp_successData);
						if(sucessHtml){
							$("#sale_tbody_"+id).append(sucessHtml);
							$("#sale_count_"+id).html(Number($("#sale_count_"+id).text())+data.succCount);
						}
					}
				}else{
					layer.msg($.i18n.prop("cust.AddFaild"),{icon:2});	
				}
			},
			error : function(e) {
				ajaxError("complex_validateImei()", e);
			}
		});
	}
}

/**
 * @param imeis
 * @param flag (true: 返回去除已添加的imei后的imeis   false: 返回重复添加的imei)
 * @returns
 */
function complex_dealImeis(id,imeis,flag){
	var retImies = "";
	var selectedImeis = complex_getPutedImeis(id);
	if(selectedImeis){
		$.each(imeis.split(","),function(i,v){
			if(flag){
				//去除已经添加的imei
				if($.inArray(v,selectedImeis.split(",")) == -1 ){
					if(retImies){
						retImies+= "," + v;
					}else{
						retImies = v;
					}
				}
			}else{
				//获取重复添加的imei 
				if($.inArray(v,selectedImeis.split(",")) != -1 ){
					if(retImies){
						retImies+= "," + v;
					}else{
						retImies = v;
					}
				}
			}
		});
	}else{
		if(flag){
			return imeis;
		}
	}
	return retImies;
}

//获取已选中的imei集合
function complex_getPutedImeis(id){
	var imeis = "";
	var successTr = $("#sale_tbody_"+id+" tr");
	if(successTr && successTr.length > 0){
		$.each(successTr,function(i,v){
			if(imeis){
				imeis+="," + $(v).find("td:first").text();
			}else{
				imeis = $(v).find("td:first").text();
			}
		});
	}
	return imeis;
}

/**
 * 显示失败提示框
 */
function complex_showFaildPrompty(){
	layerIndex = layer.open({
      type: 1,
      shade: false,
      title: false, //不显示标题
      content: $("#device_add_result_div"), //捕获的元素
    });
}

/**
 * map转json
 */
function complex_mapToJson(map){
	var result = [];
	$.each(map,function(i,v){
		$.each(v,function(key,value){
			var obj = {imei:key,reason:value};
			result.push(obj);
		});
	});
	return result;
}

/**
 * 获取重复IMEI
 */
function complex_getRepeatImei(arr1,arr2){
	var repeatArray = [];
	if(arr2 && arr2.length > 0){
		for(var s in arr1){
		    for(var x in arr2){
		        if(arr1[s]==arr2[x]){
		        	var obj = {"imei":arr1[s],"reason":3};
					repeatArray.push(obj);
		        }
		    }
		}
	}else{
		var n = []; //一个新的临时数组
		for(var i = 0; i < arr1.length; i++){
			//如果当前数组的第i已经保存进了临时数组，那么跳过，
			//否则把当前项push到临时数组里面
			if (n.indexOf(arr1[i]) == -1){
				n.push(arr1[i]);
			} else{
				var obj = {"imei":arr1[i],"reason":3};
				repeatArray.push(obj);
			}
		}
	}
	return repeatArray;
}

/**
 * 删除已添加的IMEI
 */
function complex_drop_sale_imei(obj,id){
	$(obj).parent().parent().remove();
	$("#sale_count_"+id).html(Number($("#sale_count_"+id).text())-1);
}

/**
 * 销售（分配）设备的请求
 */
function complex_allotDev(id,treeFlag,expirationFlag,modalId){
	var param = {};
	if(treeFlag == "true"){
		var treeObj = $.fn.zTree.getZTreeObj("complex_allotDev_tree_"+id);
		var selectNode = treeObj.getSelectedNodes();
		if(selectNode && selectNode.length > 0){
			param.userId = selectNode[0].id;
			param.parentId = selectNode[0].pId;
			//不能销售给自己
			/*if(selectNode[0].level == 0){
				layer.msg($.i18n.prop("cust.saleToSelf"));
				return;
			}*/
			
		}else{
			layer.msg($.i18n.prop("Asset.PleaseChooseCustomer"));
			return;
		}
		if(expirationFlag == "true"){
			param.allotFlag = "batchsale";
		}else{
			param.allotFlag = "devmove";
		}
	}else{
		if($(".js-toggle-user-device").val() == "user"){
			if(complex_see_userId && complex_see_userId == complex_loginUserId){
				layer.msg($.i18n.prop("cust.saleToSelf"));
				return;
			}
		}
		param.userId = complex_see_userId;
		param.parentId = complex_see_parentId;
		param.allotFlag = "batchsale";
	}
	if(expirationFlag == "true"){
		param.expiredType = $(".complex-js-select-"+id).val();
	}
	var imeis = "";
	var trArray = $("#sale_tbody_"+id+" tr");
	if(trArray && trArray.length > 0){
		$.each(trArray,function(i,v){
			imeis += $(v).find("td:first").text()+",";
		});
	}
	if(imeis){
		param.imeis = imeis.substring(0,imeis.length-1);
	}else{
		layer.msg($.i18n.prop("cust.PleaseAddDevices"));
		return ;
	}
	$(".dev-tohandle").hide();
	$(".dev-cancel").hide();
	$(".dev-handling").show();
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
		data : param,
		url : _ctx + "rest/deviceControl/fastSale",
		complete:function(XHR, TS){
			$(".dev-cancel").show();
			$(".dev-handling").hide();
			$(".dev-tohandle").show();
		},
		success : function(ret) {
			if (ret.statusCode == 0) {
				layer.msg($.i18n.prop("comm.Operationdone"), {icon : 1});
				//重置form
				complex_resetAllotDev(id, treeFlag, expirationFlag);
				//客户管理销售设备，需要关闭modal框
				if(modalId){
					$("#"+modalId).modal('hide');
					initDevTableAndPage(true);
					getUserAndDevNum(treeNodeToComplexQuery);
					//刷新左侧的树，并且选中
					window.location.href=_ctx+"meunController.do?search";
					
				}
			} else {
				layer.msg($.i18n.prop("comm.Failed"), {icon : 2});
			}
		},
		error : function(e) {
			ajaxError("complex_allotDev()", e);
		}
	});
}

/**
 * 初始化机型select
 */
function complex_initDevMcType(){
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
		url : _ctx + "rest/deviceControl/getDevMcType",
		success : function(ret) {
			if (ret.code == 0) {
				if(ret.data){
					$("#mcType_dev").html(template("complex_dev_mcType_options",ret));
					$("select[name='mcType']").easyDropDown();
					$("select[name='mcType']").easyDropDown().change(function(){
						$(".js-search-number-text").val($(this).val());
					});
					$("select[name='mcType']").easyDropDown("select",0);
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

/**
 * 修改设备信息
 */
function complex_updateDevInfo(id){
	var result = "";
	var param = $("#device_info_form_"+id).serializeObject();
	if(param.userExpiration && param.userExpiration.length <= 10){
		param.userExpiration += " 23:59:59";
	}
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data : param,
		url : _ctx + "rest/deviceControl/insert",
		success : function(ret) {
			result = ret;
			searchList();
		},
		error : function(e) {
			ajaxError("complex_updateDevInfo()", e);
		}
	});
	return result;
}

//设备指令tab
function complex_showInstruction(){
	if(complex_see_device){
		if(!complex_see_device.userExpiration){
			$("#complex_command").hide();
			layer.msg($.i18n.prop("Commands.Device_noActive"));
			return false;
		}else {
			var ue = new Date(complex_see_device.userExpiration.replace(/\-/g, "\/")).getTime();
			var cu = new Date().getTime();
			if(ue < cu){
				$("#complex_command").hide();
				layer.msg($.i18n.prop("Commands.Device_expired"));
				return false;
			}
		}
		$("#complex_command").show();
		$("#custom_search_command").empty();
		$("#index_command").empty();
		$("#complex_command").html(template("sendInstruction-form",complex_see_device));
		
		$("#ins_div").hide();
		$("#ins_div_loading").show();
		
		getInstructionType(complex_see_device.imei);
	}
}



//延长设备平台到期时间窗口
function openAllotDevProlongModal(imei,id){
	//生成选中设备列表
	complex_initAllotTabel(imei,id);  
	//获取套餐
	complex_getPackage("2",id);  
	
	$("#allotDevProlong_"+id).modal();
}

/**
 * 生成窗口中的设备列表
 * @param imei
 * @param id
 */
function complex_initAllotTabel(imei,id){
	$.post(_ctx+"/device/getDevInfoByImei",{ids:imei},function(ret){
		if(ret && ret.code == 0){
			$("#allotProlong_"+id).html(template("allotProlong_table_tmp",{data:ret.data,id:id}));
		}
	},"json");
}



/**
 * 获取套餐 
 * type : 套餐类型
 * ul : 生成的位置
 * tmpId : 模板Id
 */
function complex_getPackage(type,target){
	$.post(_ctx+"/customer/getPackage",{"type":type},function(ret){
		if(ret && ret.code==0){
			$("#prolongPackage_"+target).html(template("complex_package_tmp",ret));
			$("#prolongPackage_"+target+" li").eq(0).addClass("active");
			tabs(".js-package-list","active");
		}
	},"json");
}


/**
 * 延长设备到期
 */
function complex_allotDevProlong(id){
	var imeis = "";
	$.each($("input[name='allotProlong_imei_"+id+"']"),function(i,v){
		imeis += $(v).val()+",";
	});
	if(imeis){
		imeis = imeis.substring(0, imeis.length -1);
		$.ajax({
			type:"post",
			async: false,
			cache: false,
			dataType:"json",
			data:{"imeis":imeis,"packageCode":$("#prolongPackage_"+id+" li.active").attr("data")},
			url:_ctx+"/device/allotDevProlong",
			success:function(ret){
				if(ret.code==0){
					layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});
					$("#allotDevProlong_"+id).modal('hide');
				}else{
					layer.msg($.i18n.prop('comm.Failed'),{icon:2});
				}
			}
		});
	}
	
}

function complex_showLoading(){
	var ele = $(".markLoading:visible");
	if(ele.find("table") && ele.find("table").length > 0){
		$(ele).find("div[id*=nodata],div[id*=paging]").hide();
		ele = ele.find("table");
		$.each(ele,function(i,v){
			$(v).find("tbody").hide();
			$(v).after(template("complex_loading_tmp",{}));
		});
	}else{
		ele.children().hide();
		ele.append(template("complex_loading_tmp",{}));
//		ele.before(template("complex_loading_tmp",{}));
	}
}

function complex_hideLoading(){
	var ele = $(".markLoading:visible");
	if(ele.find("table") && ele.find("table").length > 0){
		ele = ele.find("table");
		$.each(ele,function(i,v){
			$(v).find("tbody").show();
		});
	}else{
		ele.children().show();
	}
	$("div[id*=logindata]").remove();
}

//折扣显示隐藏
function ShowDiscount(){
	$("[name=rechargeCheck]").iCheck().on("ifChecked",function(event){
		 $(".show-discount-inp").show();
	}).on("ifUnchecked",function(even){
		$(".show-discount-inp").hide();
	});
}

//添加设备文本框显示
function addDeviceBoxToggle(input){
	$(input).on("focus",function(){
		$(this).parent().addClass("focus");
		$(document).bind("click",function(e){
			var target = $(e.target); 
			if(!target.closest(".imei-textarea-box").length>0){
				$(input).parent().removeClass("focus");
			}
		});
	}).on('input propertychange', function(){
		var v = $(this).val();
		arr = v.split(/\n/);
				
		imeis = [];
		for(var len = arr.length, i = 0; i < len; i++){
			var item = arr[i].replace(/\s|,|;|\|/g, '');
			if(item){
				imeis.push(item);
			}
		}
		$(this).parent().find(".dev-num").text(imeis.length);

	}) ;
	$(input).parent().find(".js-close").click(function(){
		$(input).removeClass("form-control-error").val("");
		$(input).parent().removeClass("focus").find(".dev-num").text(0);
	});
}

//兼容ie10以下切换文本框placeholder				  
function lessThanIE10PlaceholderVal(input){
	if($.browser.msie&&($.browser.version < 10 )){
		$(input).val($(input).attr("placeholder"));
	}
}

/**
 * 客户树全局搜索
 * @param inputSelector 文本框ID选择器
 * @param headUserId 根节点用户ID
 * @param locatFlag 定位标识
 * @param treeId locatFlag = true时传入，clickCallback不会触发
 * @param clickCallback locatFlag = false时，触发全局搜索点击回调事件
 * 			回调事件入参：clickCallback(userId,parentId,fullParent,account/nickName)
 */
var _cus_search_colors = [];
function globalSearchCustomerTree(inputSelector,headUserId,locatFlag,treeId,clickCallback){
	if(!inputSelector){
		return;
	}
	var condition = inputSelector.val().replace(/(^\s*)|(\s*$)/g, "");
	if(!condition){
		return;
	}
	
	$(inputSelector).focus(function(){
		$(this).addClass("placeholder-transparent");
		$(".autocompleter-nodata").remove();
	}).blur(function(){
		$(this).removeClass("placeholder-transparent");
		if($(this).val().length == 0){
			$(this).attr("placeholder",$.i18n.prop('comm.GlobalSearch'));
		}
	});
	
	var global_html = '<div class="autocompleter-nodata" id="globalLoading-div">'
		+'<span>&nbsp;<i class="fa fa-spinner fa-pulse fa-fw"></i>'+$.i18n.prop('comm.loadingData')+'&nbsp;</span>'
		+'</div>';
	inputSelector.after(global_html);
	$.ajax({
		url:_ctx + "rest/loginController/getUserSearch",
		async : true,
		cache : false,
		type:"post",
		dataType:"json",
		data:{"nickName":condition,"userId":headUserId},
		success:function(ret){
			$("#globalLoading-div").remove();
			if(ret.code == 0 && ret.data){
				if(ret.data.length > 0){
					_cus_search_colors = [];
					$(inputSelector).autocompleter('destroy');
					$(inputSelector).blur();
					$(".autocompleter-nodata").remove();
					$.each(ret.data,function(i,v){
						var _source_data = "";
						if(typeof(v.fullParentId )== 'undefined'){
							_source_data = {
								'hex':'根目录','label':v.nickName,'rgb':'(239, 222, 205)','userId':v.userId,'fullParent':'',"parentId":''
							};
						}else{
							if(v.nickName.indexOf(condition) >= 0 || v.nickName.toLowerCase().indexOf(condition.toLowerCase()) >= 0){
								_source_data = {
									'hex':v.parentName+'/'+v.parentAccount,'label':v.nickName,'rgb':'(239, 222, 205)','userId':v.userId,'fullParent':v.fullParentId,"parentId":v.parentId
								};
							}
							if(v.account.indexOf(condition) >= 0 || v.account.toLowerCase().indexOf(condition.toLowerCase()) >= 0){
								_source_data = {
									'hex':v.parentName+'/'+v.parentAccount,'label':v.account,'rgb':'(239, 222, 205)','userId':v.userId,'fullParent':v.fullParentId,"parentId":v.parentId
								};
							}
						}
						if(_source_data){
							var _repeat_flag = false;
							if(_cus_search_colors.length > 0){
								$.each(_cus_search_colors,function(i,v){
									if(v.userId == _source_data.userId && v.fullParent == _source_data.fullParent){
										_repeat_flag = true;
									}
								});
							}
							if(!_repeat_flag){
								_cus_search_colors.push(_source_data);
								_repeat_flag = false;
							}
						}
					});
					if(_cus_search_colors.length > 0){
						$(inputSelector).autocompleter({
							source : _cus_search_colors,	        				// object to local or url to remote search
							template : '{{ label }}',	// custom template
							limit : 200 ,
							highlightMatches : true,	        					// marker for autocomplete matches
							hint : true,	        								// show hint
							selectFirst : true,
							cache : false,
							focusOpen : true,
							empty : true,// abort source if empty field
							callback: function (value, index, selected) {
								if (selected) {
									$('.icon').css('background-color', selected.hex);
									if(locatFlag){
										$(inputSelector).blur();
										complex_locationUser(selected.userId, selected.fullParent, treeId, null);
									}else{
										if(clickCallback){
											clickCallback(selected.userId,selected.parentId , selected.fullParent,selected.label);
										}
									}
								}
							}
						});
						$("#globalLoading-div").remove();
						$(inputSelector).focus();
					}
				}else{
					var noDataHtml = '<div class="autocompleter-nodata">'
									+'<span>&nbsp;<i class="fa fa-bell-o"></i> '+$.i18n.prop('comm.noData')+'&nbsp;</span>'
									+'</div>';
					$(inputSelector).blur().after(noDataHtml);
				}
			}
		}/*,
		error:function(e){
			ajaxError("customTree", e);
		}*/
	});
}

//选择用户-全局搜索 (ul id="complex_search_tree")
$("#complex_globalSearch_btn").click(function(){
	globalSearchCustomerTree($("#complex_globalSearch_input"),complex_loginUserId,false,null,complex_globalResultClick);
});
$("#complex_globalSearch_input").keydown(function(e){
	if(e.keyCode == 13){
		globalSearchCustomerTree($("#complex_globalSearch_input"),complex_loginUserId,false,null,complex_globalResultClick);
	}
});
function complex_globalResultClick(userId,parentId , fullParent,account){
	$("#complex_advanced_search_form input[id='complex_search_userName']").val(account);
	$("#complex_advanced_search_form input[name='userId']").val(userId);
	advancedSearchSalesUserTreeToggle(true);
    $(this).find(".fa").attr("class","fa fa-caret-down");
}

$("#searchUserEquipment").on("hide.bs.modal",function(){
//	if(layerIndex){
//		layer.close(layerIndex);
//	}
});

function deleteInstallImage(obj,fileName,id){
	$(obj).parent().remove();
	var installImage = $("#installImage_"+id).val();
	installImage = installImage.replace(","+fileName,"");
	$("#installImage_"+id).val(installImage);
	$("#fileButton_"+id).show();
	$.ajax({
		type:"post",
		async: false,
		cache: false,
		dataType:"json",
		data:{"key":fileName},
		url:_ctx+"/qiniu/delFile",
		success:function(ret){
			if(ret.code==0){
			}else{
				layer.msg($.i18n.prop('comm.Failed'),{icon:2});
			}
		}
	});
}

function uploadFile(obj,id){
	$.ajaxFileUpload({
		url : _ctx+"/qiniu/upload?fileType=0",
        secureuri: false,
        fileElementId : $(obj).attr("id"),
        dataType : 'json',
        success: function (data, status){
        	var fileInfo = data;
			$("#uploadInstall_ul_"+id).append(
					"<li>"+
	                    "<div class=\"delete-pic\" onclick=\"deleteInstallImage(this,\'"+fileInfo.data.fileName+"\',\'"+id+"\')\"></div>"+
	                    "<div class=\"p-pic\"><img src=\""+fileInfo.data.path+fileInfo.data.fileName+"\" /></div>"+
	                "</li>"
			);
			var installImage = $("#installImage_"+id).val();
			$("#installImage_"+id).val(installImage+","+fileInfo.data.fileName);
			var images = $("#installImage_"+id).val().split(',');
			if(images.length>=10){
				$("#fileButton_"+id).hide();
			}
        },
        error: function (data, status, e)//服务器响应失败处理函数
        {
        	layer.msg($.i18n.prop('comm.Failed'),{icon:2});
        }
	});
}

function complex_export(type){
	var param = "";
	if(type == "user"){
		if($("#complex_user_tbody tr").length <= 0){
			layer.msg($.i18n.prop("comm.noData"));
			return;
		}
		param = "keyword="+$(".js-modal-user-device-search").val()+"&queryType="+type;
	}
	if(type == "mobileUser"){
		if($("#complex_mobileUser_tbody tr").length <= 0){
			layer.msg($.i18n.prop("comm.noData"));
			return;
		}
		param = "keyword="+$(".js-modal-mobileUser-search").val()+"&queryType="+type;
	}
	if(type == "device"){
		if($("#complex_device_tbody tr").length <= 0){
			layer.msg($.i18n.prop("comm.noData"));
			return;
		}
		param = "keyword="+$(".js-modal-user-device-search").val()+"&queryType="+type+"&basicType=IMEIDRIVERVEHICLENUMBER";
	}
	if(type == "advanced"){
		if($("#complex_device_tbody tr").length <= 0){
			layer.msg($.i18n.prop("comm.noData"));
			return;
		}
		var formValue = $("#complex_advanced_search_form").serializeObject();
		if(formValue.statusStr && formValue.statusStr.length == 2){
			formValue.statusStr = formValue.statusStr[0]+","+formValue.statusStr[1];
		}
		for ( var key in formValue ){
			param += key+"="+formValue[key]+"&";
		}
		param = param.substring(0, param.length-1);
	}
	window.location.href = _ctx + "/device/complexQueryExport?"+param;
}

function relieveBinding(imei,userId){
	$.ajax({
		type:"post",
		async: false,
		cache: false,
		dataType:"json",
		data:{"imei":imei},
		url:_ctx+"/device/relieveBinding",
		success:function(ret){
			if(ret.code==0){
				layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});
				var param = {"userId":userId};
				complex_queryMobileUserDevice(param,relieveBinding_callback);
			}else{
				layer.msg($.i18n.prop('comm.Failed'),{icon:2});
			}
		}
	});
}

function relieveBinding_callback(result,param){
	if(result && result.length > 0){
		var tem_data = {data:result,"pageNo":complex_device_pageNo,"pageSize":complex_device_pageSize,viewType:"mobileUser","userId":param.userId};
		$("#complex_mobileUser_device_tbody").html(template("complex_device_tbody_tmp",tem_data));
	}else{
		$("#complex_mobileUser_device_tbody").html("");
		$("#complex_mobileDevice_table_nodata").show();
	}
	var deviceCount = ($("#complex_mobileUser_detail_tbody tr td:eq(5)").html()-1);
	$("#complex_mobileUser_detail_tbody tr td:eq(5)").html(deviceCount)
}


function device_info_basic(id){
	$("#device_info_form_"+id).find("[id='device_info_a']").show();
	$("#device_info_form_"+id).find("[id='device_info_b']").hide();
}

function device_info_customer(id){
	$("#device_info_form_"+id).find("[id='device_info_a']").hide();
	$("#device_info_form_"+id).find("[id='device_info_b']").show();
}
function addAddress(id){
	$("#device_info_form_"+id).find("[id='editAddAdress']").toggle();
}

function saveAddress(id){
	var addressName = $("#device_info_form_"+id).find("[name='addressName']").val();
	var addressProvince = $("#device_info_form_"+id).find("[name='cho_Province']").val();
	var addressCity = $("#device_info_form_"+id).find("[name='cho_City']").val();
	var addressArea = $("#device_info_form_"+id).find("[name='cho_Area']").val();
	var addressDetail = $("#device_info_form_"+id).find("[name='addressDetail']").val();
	var addOrUdate = $("#device_info_form_"+id).find("[name='flag']").val();
	var addressValues = addressName+"_,_"+addressProvince+"_,_"+addressCity+"_,_"+addressArea+"_,_"+addressDetail;
	var addressHiddenName = "addressValue_"+id;
	var html = "<tr>";
	html += "<td>"+addressName+"</td>";
	html += "<td>"+addressProvince+addressCity+addressArea+"</td>";
	html += "<td>"+addressDetail+"</td>";
	html += "<td title=\"操作\"><a href=\"#\" onclick=\"updAddress(this,'"+id+"')\" >修改</a>"+"<input type=\"hidden\" value=\""+addressValues+"\" name=\""+addressHiddenName+"\" />"+"<a href=\"#\" onclick=\"delAddress(this)\" >删除</a></td>";
	html += "</tr>";
	if(addOrUdate==""){
		$("#device_info_form_"+id).find("[id='addressTable']").append(html);
	}else{
		html = "<td>"+addressName+"</td>";
		html += "<td>"+addressProvince+addressCity+addressArea+"</td>";
		html += "<td>"+addressDetail+"</td>";
		html += "<td title=\"操作\"><a href=\"#\" onclick=\"updAddress(this,'"+id+"')\" >修改</a>"+"<input type=\"hidden\" value=\""+addressValues+"\" name=\""+addressHiddenName+"\" />"+"<a href=\"#\" onclick=\"delAddress(this)\" >删除</a></td>";
		$("#device_info_form_"+id).find("[id='addressTable']").find("tr").eq(addOrUdate).html(html);
	}
	
	clearaddressValues(id);
	
}

function cancelAddress(id){
	$("#device_info_form_"+id).find("[id='editAddAdress']").toggle();
	clearaddressValues(id);
}

function delAddress(obj){
	$(obj).parent().parent().remove();
}

function updAddress(obj,id){
	var addressValues = $(obj).next().val().split("_,_");
	var index = $("#device_info_form_"+id).find("[id='addressTable']").find("tr").index($(obj).parent().parent());
	$("#device_info_form_"+id).find("[name='addressName']").val(addressValues[0]);
	$("#device_info_form_"+id).find("[name='cho_Province']").val(addressValues[1]);
	$("#device_info_form_"+id).find("[name='cho_City']").val(addressValues[2]);
	$("#device_info_form_"+id).find("[name='cho_Area']").val(addressValues[3]);
	$("#device_info_form_"+id).find("[name='addressDetail']").val(addressValues[4]);
	
	$("#device_info_form_"+id).find("[id='Province']").find("i").html(addressValues[1]);
	$("#device_info_form_"+id).find("[id='City']").find("i").html(addressValues[2]);
	$("#device_info_form_"+id).find("[id='Area']").find("i").html(addressValues[3]);
	$("#device_info_form_"+id).find("[name='flag']").val(index);
	
}

function clearaddressValues(id){
	$("#device_info_form_"+id).find("[name='addressName']").val("");
	$("#device_info_form_"+id).find("[name='cho_Province']").val("");
	$("#device_info_form_"+id).find("[name='cho_City']").val("");
	$("#device_info_form_"+id).find("[name='cho_Area']").val("");
	$("#device_info_form_"+id).find("[name='addressDetail']").val("");
	
	$("#device_info_form_"+id).find("[id='Province']").find("i").html("");
	$("#device_info_form_"+id).find("[id='City']").find("i").html("");
	$("#device_info_form_"+id).find("[id='Area']").find("i").html("");
	
	$("#device_info_form_"+id).find("[name='flag']").val("");
}