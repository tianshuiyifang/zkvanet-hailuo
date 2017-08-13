/**
 * 使用说明
 * 1,	js引用:customTree.js
 * 2,	jsp页面:
 * 			<i class="tree-search-icon" id="cusTreeSearchBtn"></i>
 *  		<input type="text" id="cusTreeKey" value="" placeholder="搜索" class="empty fs-12"/>
 *			<input type="radio" id="name" name="keyType" class="hide" checked  />
 *			<input type="radio" checked="" style="margin-left:36px;" class="hide" name="funType" id="getNodesByParamFuzzy">
 *  		<ul id="treeDemo" class="ztree"></ul>
 *  
 * 3,	js初始化:
 * 	 		$("#treeDemo").initCustomTree({
				treeType : "stock_repertory",
				head_userId : userId, 
				chkOrNot : false,
				loadingSelector : "TreeLogindata",
				onClick : zTreeOnClick
			});
 *			
 *			//客户树节点的点击事件,
 *			function zTreeOnClick(event, treeId, treeNode) {
 *				console.info(treeId);
 *				console.info(treeNode);
 *			};
 * 	 
 */

(function($) {
	$.fn.initCustomTree = function(options) {
		/**
		 * 客户树类型 
		 * 	active_repertory : 客户姓名 激活/进货 
		 * 	stock_repertory  : 客户姓名 库存/总数 
		 * simple 			 : 客户姓名
		 */
		var _cus_tree_type_arr = [ "active_repertory", "stock_repertory", "simple","repertory" ];
		var _cus_tree_key;
		var _cus_setting;

		var _cus_fullParent = "";
		var _cus_parentNode = "";
		
		var _cus_search_colors = [];
		
		var defaults = {
			treeType : _cus_tree_type_arr[0],			//客户树类型
			treeId : $(this).attr("id"),				//treeId
			zNodes : null,
			async : false,								//加载方式,默认为同步加载
			head_userId : "1",							//首个节点用户ID
			head_parentId:"",                           //父ID
			loadingSelector : "TreeLogindata",			//加载样式标签ID(树加载完毕之前)
			plate : "WEB",
			defaultClickRootFlag : true,      			//客户树加载完成后,是否默认点击根节点标识
			chkOrNot : false,							//树节点是否可勾选
			beforeClick : null,
			onClick : null,						//节点点击事件回调函数名称
			beforeCheck : null,					//用于捕获 勾选 或 取消勾选 之前的事件回调函数
			onCheck : null,						//用于捕获 checkbox / radio 被勾选 或 取消勾选的事件回调函数
			onClickFlag : true,
			zTreeOnAsyncSuccess : zTreeOnAsyncSuccess,
			ajaxDataFilter : null
		};
		var opts = $.extend(defaults, options);
		/**
		 * 初始化setting
		 */
		function initCusSetting() {
			_cus_setting = {
				async : {
					enable : true,
					type : "post",
					contentType : "application/x-www-form-urlencoded",
					url : opts.plate == "WEB"?_ctx + "rest/loginController/getUserTree":_ctx + "/api/custTree?ver=2&method=getLowerUser&loginUserId="+opts.head_userId,
					autoParam : [ "id=parentId", "fullParentId=fullParentId" ],
					dataFilter : opts.ajaxDataFilter
				},
				view : {
					showLine : false,
					showTitle : true
				// showIcon: false
				},
				check: {
					enable: opts.chkOrNot,
					chkStyle: "radio",
					radioType: "all"
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
					beforeCheck : opts.beforeCheck,
					onCheck : opts.onCheck,
					beforeClick : opts.beforeClick,
					onClick : opts.onClick,
					onAsyncSuccess: opts.zTreeOnAsyncSuccess
				}
			}
		}
		
		/**
		 * 初始化客户树
		 */
		function initCustomTree() {
			initCusSetting();
			if(opts.zNodes){
				initZnodesTreeData();
			}else{
				initTreeData();
			}
			//return initTreeData();
		}
		function initTreeData() {
			$.ajax({
				type : "get",
				async : opts.async,
				cache : false,
				dataType : "json",
				url : opts.plate == "WEB"?_ctx + "rest/loginController/getUserTree":_ctx + "/api/custTree?ver=2&method=getOrgUserTree",
				data : {
					"userId" : opts.head_userId,
					"parentId": opts.head_parentId
				},
				success : function(ret) {
					if (ret.code == 0) {
						$.each(ret.data, function(i, v) {
							
							if (v.type == 0) {
								v.typeName = $.i18n.prop('cust.Manager');
							} else if (v.type == 8 || v.type == 10) {
								v.typeName = $.i18n.prop('cust.Distributor'); //
							} else if (v.type == 9) {
								v.typeName = $.i18n.prop('cust.User'); //用户
							} else if (v.type == 11) {
								v.typeName = $.i18n.prop('cust.Sale');
							} else {
								v.typeName = "";
							}
						/*	if (opts.treeType == _cus_tree_type_arr[0]) {
								// 拼接成 (激活/进货)
								if (opts.head_userId == v.id) {
									v.countStr = "("
										+ $.i18n.prop('custom_tree.active')
										+ v.deviceCount.active + "/"
										+ $.i18n.prop('custom_tree.repertory')
										+ v.deviceCount.repertory + ")";
								} else {
									v.countStr = "(" + v.deviceCount.active
									+ "/" + v.deviceCount.repertory + ")";
								}
							} else if (opts.treeType == _cus_tree_type_arr[1]) {
								if (opts.head_userId == v.id) {
									v.countStr = "("
										+ $.i18n.prop('custom_tree.stock')
										+ v.deviceCount.stock + "/"
										+ $.i18n.prop('custom_tree.repertory')
										+ v.deviceCount.repertory + ")";
								} else {
									v.countStr = "(" + v.deviceCount.stock
									+ "/" + v.deviceCount.repertory + ")";
								}
							}else if(opts.treeType == _cus_tree_type_arr[3]){
								if (opts.head_userId == v.id) {
									v.countStr = "("
										+ $.i18n.prop('custom_tree.repertory')
										+ v.deviceCount.repertory + ")";
								} else {
									v.countStr = "(" + v.deviceCount.repertory + ")";
								}
							}*/
							v.countStr = "("
								+ v.deviceCount.repertory + ")";
							
							if (v.type == 9){
								v.countStr="("+v.deviceCount.repertory+")";
							}
							if(typeof(v.countStr) != 'undefined'){
								v.name = v.name + v.countStr;
							}
							/*v.name = v.name + "(" +v.deviceCount.stock + "/" + v.deviceCount.repertory + "/" + v.deviceCount.active + "/" + v.deviceCount.noactive +")";*/
						});
						$("#" + opts.loadingSelector).hide();
						var treeObj = $.fn.zTree.init($("#" + opts.treeId), _cus_setting, ret.data);
						if(opts.defaultClickRootFlag){
							var defaultNode = treeObj.getNodesByParam("id", opts.head_userId, null);
							if(!opts.chkOrNot){
								//treeObj.selectNode(defaultNode[0],false);
								if(opts.beforeClick){
									opts.beforeClick(opts.treeId,defaultNode[0],null);
								}
								if(opts.onClick && opts.onClickFlag){
									//treeObj.selectNode(defaultNode[0],false);
									opts.onClick(null,opts.treeId,defaultNode[0]);
								}
							}else{
								//treeObj.checkNode(defaultNode[0],true,true);
								if(opts.beforeCheck){
									opts.beforeCheck(opts.treeId,defaultNode[0]);
								}
								if(opts.onCheck){
									//treeObj.checkNode(defaultNode[0],true,true);
									opts.onCheck(null,opts.treeId,defaultNode[0]);
								}
								if(opts.beforeClick){
									opts.beforeClick(opts.treeId,defaultNode[0],null);
								}
								if(opts.onClick && opts.onClickFlag){
									//treeObj.selectNode(defaultNode[0],false);
									opts.onClick(null,opts.treeId,defaultNode[0]);
								}
							}
						}
						return treeObj;
					}
				},
				error : function(e) {
					ajaxError("customTree", e);
				}
			});
		}
		
		function initZnodesTreeData(){
			$.fn.zTree.init($("#" + opts.treeId),_cus_setting, opts.zNodes);
		}
		
		function beforeClick(treeId, treeNode, clickFlag){
			return !opts.chkOrNot;
		}
		
		function findParent(zTree, node) {
			//zTree.expandNode(node, true, false, false);
			var pNode = node.getParentNode();
			if (pNode != null) {
				nodeList.push(pNode);
				findParent(zTree, pNode);
			}
		}
		function filter(node) {
			return !node.isParent && node.isFirstNode;
		}
		
		function zTreeOnAsyncSuccess(event, treeId, treeNode, msg){
			
		}
		
		return initCustomTree();
	}
})(jQuery);