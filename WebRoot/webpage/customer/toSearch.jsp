<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="zh-CN">
<head>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" >
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" >
<script type="text/javascript">
	//Js 上下文
	window._ctx="";
	window._language="zh";
	var _lang = "";
	if(window._language == "zh"){
		_lang = "zh";
	}else{
		_lang = "en"; //默认为英文
	}
</script>
<link rel="icon" href="webpage/resource/images/favicon.ico" type="image/x-icon"/> 
<link rel="tracker icon" href="webpage/resource/images/favicon.ico" type="image/x-icon"/> 
<link rel="stylesheet" href="webpage/resource/css/normalize.css">
<link rel="stylesheet" href="webpage/resource/css/base.css">
<link rel="stylesheet" href="webpage/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="webpage/resource/css/non-responsive.css">
<link rel="stylesheet" href="webpage/resource/css/font-awesome.min.css">
<link rel="stylesheet" href="webpage/resource/css/iconfont.css">
<link rel="stylesheet" href="webpage/resource/plugins/autocompleter/jquery.autocompleter.css">
<link rel="stylesheet" href="webpage/resource/plugins/mCustomScrollbar/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="webpage/resource/plugins/simplPagination/simplePagination.css">
<link rel="stylesheet" href="webpage/resource/plugins/easydropdown/easydropdown.css">
<link rel="stylesheet" href="webpage/resource/plugins/zTree/css/zTreeStyle.css">
<link rel="stylesheet" href="webpage/resource/plugins/nstSlider/jquery.nstSlider.css">
<link rel="stylesheet" href="webpage/resource/plugins/datetimepicker/jquery.datetimepicker.css">
<link rel="stylesheet" href="webpage/resource/plugins/timePicker/jquery.timePicker.css">
<link rel="stylesheet" href="webpage/resource/plugins/icheck/icheck.css">
<link rel="stylesheet" href="webpage/resource/plugins/ciTy/css/city.css">
<link rel="stylesheet" href="webpage/resource/css/site.css">


<!--CSS3 Media Queries (for IE 6-8)-->
<!--[if lte IE 8]><script src="webpage/resource/js/respond.min.js"></script><![endif]-->

<!-- Compatible with HTML5 tags -->
<script src="webpage/resource/js/modernizr-2.8.3.js"></script>
<script src="webpage/resource/js/jquery-1.8.3.min.js"></script>
<script src="webpage/resource/js/jquery.cookie.js"></script> 

<!-- 国际化 -->
<script src="webpage/resource/plugins/i18n/jquery.i18n.properties.js"></script>
<!-- 主题切换
<script src="webpage/resource/js/themes.js"></script> -->
<script type="text/javascript">

function setJsLanguage(locale){
	var propertiesObj=null;
	if(locale){
		propertiesObj = {
		    name:"messages", 
			path:_ctx+"webpage/resource/plugins/i18n/",
		    mode:"both",
		    language:locale, 
		    cache:true,
		    encoding:"UTF-8",
		    callback: function() {
		    }
		};
	}
	jQuery.i18n.properties(propertiesObj);
}

var locale='zh';

setJsLanguage(locale);

</script>
<script type="text/javascript" src="webpage/resource/js/map.js"></script>
<!-- 模板渲染 --> 
<script src="webpage/resource/plugins/artTemplate/template.js"></script> 
<script src="webpage/resource/plugins/artTemplate/template-plugin.js"></script>
<!-- page --> 
<script src="webpage/resource/plugins/simplPagination/jquery.simplePagination.js"></script>
<script src="webpage/resource/plugins/layer/layer.js"></script>
<!-- message --> 
<!-- easydropdown --> 
<script src="webpage/resource/plugins/easydropdown/jquery.easydropdown.min.js"></script> 
<!-- modal --> 
<script src="webpage/resource/js/modal.js"></script>
<script src="webpage/resource/plugins/autocompleter/jquery.autocompleter.js"></script>
<script src="webpage/resource/js/tooltip.js"></script>
<script src="webpage/resource/js/popover.js"></script>
<script src="webpage/resource/plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

<!-- datetimepicker --> 
<script src="webpage/resource/plugins/datetimepicker/jquery.datetimepicker.js"></script>

<!-- laydate -->
<script type="text/javascript" src="webpage/resource/plugins/laydate/laydate.js"></script>

<!-- tab --> 
<script src="webpage/resource/js/tab.js"></script>
<!-- icheck -->
<script src="webpage/resource/plugins/icheck/icheck.min.js"></script>

<!-- ztree --> 
<script src="webpage/resource/plugins/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script src="webpage/resource/plugins/zTree/js/jquery.ztree.exhide-3.5.js"></script>
<!-- validate -->
<script src="webpage/resource/plugins/validate/jquery.validate.js"></script>
<script src="webpage/resource/plugins/validate/additional-methods.js" ></script> 
<!-- nstSlider -->
<script src="webpage/resource/plugins/nstSlider/jquery.nstSlider.min.js"></script>

<script src="webpage/resource/js/index/devices.js"></script>
<!--timePicker-->
<script src="webpage/resource/plugins/timePicker/jquery.timePicker.js"></script>


<!--[if lte IE 9]>
<script src="webpage/resource/js/jquery.placeholder.min.js"></script>
<script>$(function() {$('input[type="text"],input[type="password"], textarea').placeholder();});</script>
<![endif]--> 
<script type="text/javascript">
// 	var sessionid_cc=0;
//检查用户是否打开多个会话
	/* var sessionid="0118E88B60CCF7BAD72F03A031B76213";
	$.cookie("sessionid",sessionid,{path: '/'});
	window.history.go(1);
	var	interval_sessionid =setInterval(function() {
		var _sessionid=$.cookie("sessionid");

// 		sessionid_cc++;
		if(sessionid!=_sessionid){
			clearInterval(interval_sessionid);
// 			layer.open('已经退出了')
// 			location.reload();
			window.location.href=window.location.href;
		}else{
// 			console.log('--------------------- sessionid_cc '+sessionid_cc);
		}
	},100); */
	
	//AJAX会话过期跳转登录
	function ajaxError(obj,e){
		var sessionid="0118E88B60CCF7BAD72F03A031B76213";
		var _sessionid=$.cookie("sessionid");
		// if(sessionid!=_sessionid){
			// window.location.href=window.location.href;
		// }
	}
	
	function authorityValide(XMLHttpRequest){
		if(XMLHttpRequest.responseText){
			var data = eval('('+XMLHttpRequest.responseText+')');
			if(data.code == 100001){
				layer.msg($.i18n.prop('cust.VirtualAccountPermissionDenied'),{icon:2});
			}else if(data.code == 100002){
				layer.msg("请勿重复操作",{icon:2});
			}
		}
	}
	
	
	/**
	* 同步浏览器时区
	*/
	function synUserConfig(){
		$.ajax({
			type:'POST',
			url:_ctx+"/useradmin/synUserConfig",
			data:{"cTimeZones":new Date().getTimezoneOffset()},
			dataType:'json',
			cache:true, 
		    async:true, 
			success: function(ret){
				//_language=ret.data.LOGIN_USER_TIMEZONES;
			}
		});
	}
	
	$(function(){
		//synUserConfig();
	});
	
</script>

<title>客户管理 </title>
<link rel="stylesheet" href="webpage/resource/plugins/icheck/icheck.css">
<script type="text/javascript" src="webpage/resource/js/assets/device.js"></script>
<script src="webpage/resource/js/tooltip.js"></script>
<script src="webpage/resource/js/popover.js"></script>
</head>

<body class="body bc-gray">
<input type="hidden" id="language" value="zh"/>
<div style="display: none;">
	<form id="toIndexFormRow" action="/index" method="post" target="_blank">
		<input type="hidden" name="userId" id="index_userIdRow"/>
		<input type="hidden" name="account" id="index_accountRow"/>
		<input type="hidden" name="parentId" id="index_parentIdRow"/>
	</form>
</div>
<script type="text/javascript" >
	var loginUserId="<%=request.getAttribute("userId")%>";
</script>
<div class="wrapper">

  <!-- header start -->
  	 

<header class="header navbar  navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<div class="navbar-brand">
				<a href="meunController.do?main">
					<img src="webpage/resource/images/timg.jpg"
					height="34" alt="Tracker" /></a>
				</a>
			</div>
		</div>
		<div class="navbar-collapse collapse">
			
			<div class="navbar-right p-15 p-b0 ta-r">
				<div class="user-time">
					
						<a  href="/business/ConmmandLogs/toBusinessLog">业务日志</a>&emsp;
					
				
		            
					当前时间：<span id="curr_time"></span>
				</div>
				<div class="system-setting">
					<span>您好，<b class="user-name" title="${userName}">${userName}</b></span>&emsp;
					
						<a class="js-edit-information"><i class="fa fa-pencil-square"></i>&nbsp;修改资料</a>&emsp;
						<a class="js-change-password"><i class="fa fa-key"></i>&nbsp;修改密码</a>&emsp;
					
					<a class="js-exit-system"><i class="fa fa-power-off"></i>&nbsp;退出系统</a>
				</div>
			</div>
		</div>
	</div>
</header>
<nav class="menu-seach bc-fff">
	<div class="container-fluid">
		<ul class="nav navbar-nav fs-14">
				<li id="index"><a id="index" href="meunController.do?index"><i class="fa fa-map-o" aria-hidden="true"></i>&nbsp;控制台</a></li>
				<li id="customerManagement"><a href="meunController.do?search"><i class="fa fa-group"></i>&nbsp;客户管理</a></li>
				<li id="reportsManagement"><a href="meunController.do?report"><i class="fa fa-table" aria-hidden="true"></i>&nbsp;统计报表</a></li>
				<li id="devicesManagement"><a href="meunController.do?device"><i class="fa fa-hdd-o" aria-hidden="true"></i>&nbsp;设备管理</a></li>
				<li id="orderManagement"><a href="meunController.do?order"><i class="fa fa-hdd-o" aria-hidden="true"></i>&nbsp;订单管理</a></li>
				</ul>
		<div id="complexQuery" class="navbar-right  p-10"></div>
	</div>
</nav>

<!-- 修改资料 -->
	<div class="modal fade" id="editInformationModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">个人资料</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal form-preset form-ellipsis p-tb25" id="edit-modal-userForm" action="">
						<div class="form-group">
							<label class="col-md-3 control-label" title="登录账号">登录账号：</label>
							<div class="col-md-6">
								<input type="text" value="" id="edit-modal-account" class="form-control" disabled>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" title="客户名称" ><span class="c-red">*</span>客户名称：</label>
							<div class="col-md-6">
								<input type="text" name="nickName" value="" placeholder="请输入用户名称"
									class="form-control" id="edit-modal-nickName">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" title="电话">电话：</label>
							<div class="col-md-6">
								<input type="text" name="phone" maxlength="20" value="" placeholder="请输入电话号码"
									class="form-control" id="edit-modal-phone">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" title="邮箱">邮箱：</label>
							<div class="col-md-6">
								<input type="text" name="email" value="" placeholder="请输入邮箱"
									class="form-control" id="edit-modal-email" maxlength="50">
							</div>
						</div>
						<input type="hidden" name="userId" id="edit-modal-userId" value="">
						<input type="hidden" name="flag" value="2">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary mw-100" id="saveUserInformation">保存</button>
					<button type="button" class="btn btn-default mw-100"
						data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

<!-- 修改密码 -->
	<div class="modal fade" id="changePasswordModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改密码</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal form-preset form-ellipsis p-tb25" id="editpwd-form" action="">
						<div class="form-group">
							<label class="col-md-4 control-label" title="旧密码"><span class="c-red">*</span>旧密码：</label>
							<div class="col-md-6">
								<input type="password" value="" id="oldPwd" name="oldPwd" placeholder="请输入旧密码"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" title="新密码"><span class="c-red">*</span>新密码：</label>
							<div class="col-md-6">
								<input type="password" value="" id="newPwd" name="newPwd" onkeyup="passwordStrength(this);" placeholder="请输入新密码" class="form-control">
								<div id="password-strength" class="password-strength">
									<ul class="strength-bar">
										<li class="first"><span></span></li>
										<li class="center"><span></span></li>
										<li class="last"><span></span></li>
									</ul>
								</div>
								<div id="password-strength-weak" class="password-strength weak dn">
									<ul class="strength-bar">
										<li class="first"><span></span></li>
										<li class="center"><span></span></li>
										<li class="last"><span></span></li>
									</ul>
								</div>
								<div id="password-strength-medium" class="password-strength medium dn">
									<ul class="strength-bar">
										<li class="first"><span></span></li>
										<li class="center"><span></span></li>
										<li class="last"><span></span></li>
									</ul>
								</div>
								<div id="password-strength-strong" class="password-strength strong dn">
									<ul class="strength-bar">
										<li class="first"><span></span></li>
										<li class="center"><span></span></li>
										<li class="last"><span></span></li>
									</ul>
								</div>
							</div>
							
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" title="确认新密码"><span class="c-red">*</span>确认新密码：</label>
							<div class="col-md-6">
								<input type="password" value="" id="renewPwd" name="renewPwd" placeholder="请输入确认新密码"
									class="form-control">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer"> 
					<button type="button" id="save" class="btn btn-primary mw-100" onclick="psw.save();">保存</button>
					<button type="button" class="btn btn-default mw-100"
						data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- 强制修改密码 -->
	<div class="modal fade" id="changePasswordModal_advise">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">修改密码</h4>
				</div>
				<div class="modal-body">
					<div class="c-f19b04 p-b5">温馨提示：默认密码过于简单，为了您的帐号安全请修改密码，新密码必须包含字母和数字！</div>
					<form class="form-horizontal form-preset form-ellipsis p-tb25" id="editpwd-form_advise" action="">
						<!-- 
						<div class="form-group">
							
							<label class="col-md-4 control-label" title="旧密码"><span class="c-red">*</span>旧密码：</label>
							<div class="col-md-6">
								<input type="password" value="" id="oldPwd_advise" name="oldPwd" placeholder="请输入旧密码"
									class="form-control">
							</div>
							
						</div>
						 -->
						 <input type="hidden" value="888888" id="oldPwd_advise" name="oldPwd">
						<div class="form-group">
							<label class="col-md-4 control-label" title="新密码"><span class="c-red">*</span>新密码：</label>
							<div class="col-md-6">
								<input type="password" style="display:none">
								<input type="password" value="" id="newPwd_advise" name="newPwd_advise" autocomplete="off" onkeyup="passwordStrengthAdvise(this);" placeholder="请输入新密码" class="form-control">
								<div id="password-strength-advise" class="password-strength">
									<ul class="strength-bar">
										<li class="first"><span></span></li>
										<li class="center"><span></span></li>
										<li class="last"><span></span></li>
									</ul>
								</div>
								<div id="password-strength-weak-advise" class="password-strength weak dn">
									<ul class="strength-bar">
										<li class="first"><span></span></li>
										<li class="center"><span></span></li>
										<li class="last"><span></span></li>
									</ul>
								</div>
								<div id="password-strength-medium-advise" class="password-strength medium dn">
									<ul class="strength-bar">
										<li class="first"><span></span></li>
										<li class="center"><span></span></li>
										<li class="last"><span></span></li>
									</ul>
								</div>
								<div id="password-strength-strong-advise" class="password-strength strong dn">
									<ul class="strength-bar">
										<li class="first"><span></span></li>
										<li class="center"><span></span></li>
										<li class="last"><span></span></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" title="确认新密码"><span class="c-red">*</span>确认新密码：</label>
							<div class="col-md-6">
								<input type="password" value="" id="renewPwd_advise" name="renewPwd_advise" placeholder="请输入确认新密码"
									class="form-control">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer"> 
					<button type="button" id="save_advise" class="btn btn-primary mw-100" onclick="psw.save_advise();">保存</button>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
var header_userId = "<%=request.getAttribute("userId")%>";
var header_account = "<%=request.getAttribute("userName")%>";
var header_type = "<%=request.getAttribute("userType")%>";
var projectName="TUQIANG";
</script>

<script type="text/javascript">


var header='customerManagement';
$("#"+header).addClass("active");
switch (header) {
case "customerManagement":
	$("#complexQuery").attr("data-option","{'treeId':'treeDemo','updateTreeId':'treeDemo','renderingFlag':true}");
	break;
case "accountCenter":
	$("#complexQuery").attr("data-option","{'updateTreeId':'cus_tree_demo','renderingFlag':true}");
	break;
default:
	$("#complexQuery").attr("data-option","{'renderingFlag':true}");
	break;
}

//日期拓展
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

/************************修改密码-start***************************/
	$(".js-change-password").click(function() {
		$("#changePasswordModal").modal();
		clearPwdForm();
	});
	
	$("#changePasswordModal").on("hide.bs.modal",function(){
		clearPwdForm();
	});
	
	function clearPwdForm(){
		$("#oldPwd").val("");
		$("#oldPwd").removeClass("error");
		$("label[for='oldPwd']").remove();

		$("#newPwd").val("");
		$("#newPwd").removeClass("error");
		$("label[for='newPwd']").remove();
		
		$("#renewPwd").val("");
		$("#renewPwd").removeClass("error");
		$("label[for='renewPwd']").remove();
	}
	
$.validator.addMethod("oldPwd",function(value,element){
	var result=false;
	if (/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/.test(value)) {
		result = true;
	}
	return result;
},"密码由6-16位数字、字母组成"); 

var pwdForm = $("#editpwd-form").validate({
	onkeyup:false,
	rules:{
		oldPwd:{
			required: true,
			minlength:6
		},
		newPwd:{
			required: true,
			minlength:6,
			lanum:true
		},
		renewPwd:{
			required: true,
			equalTo:"#newPwd",
			minlength:6
		}
	},
	messages:{
		oldPwd:{
			required: "请输入旧密码" ,
			minlength:"密码长度至少6位以上"
		},
		newPwd:{
			required: "请输入新密码" ,
			minlength:"密码长度至少6位以上",
			lanum:"密码格式错误，必须为字母和数字的组合"
		},
		renewPwd:{
			required: "请输入确认新密码",
			equalTo:"两次输入的密码不一致",
			minlength:"密码长度至少6位以上"
		}
	},
	 errorPlacement: function(error, element) {  
	    error.appendTo(element.parent());  
	} 
});

jQuery.validator.addMethod("updatePassword", function(value, element) {  
	return this.optional(element) || /^(?=^.{6,}$)(|(?=.*\W+))(?=.*[A-Z])(?=.*[a-z]).*$/.test(value);  
}, "一个大写，一个小写，不少于6位");

var pwdForm_advise = $("#editpwd-form_advise").validate({
	onkeyup:false,
	rules:{
		oldPwd_advise:{
			required: true,
			minlength:6
		},
		newPwd_advise:{
			required: true,
			minlength:6,
			lanum:true
		},
		renewPwd_advise:{
			required: true,
			equalTo:"#newPwd_advise",
			minlength:6
		}
	},
	messages:{
		oldPwd_advise:{
			required: "请输入旧密码" ,
			minlength:"密码长度至少6位以上"
		},
		newPwd_advise:{
			required: "请输入新密码" ,
			minlength:"密码长度至少6位以上",
			lanum:"密码格式错误，必须为字母和数字的组合"
		},
		renewPwd_advise:{
			required: "请输入确认新密码",
			equalTo:"两次输入的密码不一致",
			minlength:"密码长度至少6位以上"
		}
	},
	 errorPlacement: function(error, element) {  
	    error.appendTo(element.parent());  
	} 
});
	var psw = {
			save:function(){
				var oldPwd = $("#oldPwd").val();
				var newPwd = $("#newPwd").val();
				var t = $("#editpwd-form").valid();
				if (!t) {
					return;
				} 
				
				$.ajax({
					type:'POST',
					url:'/useradmin/editPwd',
					dataType:'json',
					data:{'oldPwd':oldPwd,'newPwd':newPwd},
					success:function(ret){
						if(ret.code==0){
							/* var log="";
							var home="";
							
							window.location.href=log+"/logout?service="+home; */
							layer.confirm('密码修改成功', {
							    btn: ['确定'], //按钮
							    shade: false, //不显示遮罩
							    title:"操作提示",
							    closeBtn: false
							}, function(){
								//delCookie("JSESSIONID");
								//$("#logoutFrom").submit();
								exitSys();
							});
						}
						else if(ret.code==12001){
							layer.msg("原密码不正确");
						}
						else{
							layer.msg("操作失败");
						}
						
					},
					complete:function(XMLHttpRequest, textStatus){
						authorityValide(XMLHttpRequest);
					}
				});
			},
			save_advise:function(){
				var oldPwd = $("#oldPwd_advise").val();
				var newPwd = $("#newPwd_advise").val();
				var t = $("#editpwd-form_advise").valid();
				if (!t) {
					return;
				} 
				
				$.ajax({
					type:'POST',
					url:'/useradmin/editPwd',
					dataType:'json',
					data:{'oldPwd':oldPwd,'newPwd':newPwd},
					success:function(ret){
						if(ret.code==0){
							/* var log="";
							var home="";
							
							window.location.href=log+"/logout?service="+home; */
							$("#save_advise").attr("disabled","disabled");
							layer.confirm('密码修改成功', {
							    btn: ['确定'], //按钮
							    shade: false, //不显示遮罩
							    title:"操作提示",
							    closeBtn: false
							}, function(){
								//delCookie("JSESSIONID");
								//$("#logoutFrom").submit();
								$.ajax({
									url : _ctx+"/logout",
									async : true,
									cache : false,
									type : "POST",
									data : $("#edit-modal-userForm").serialize(),
									datatype : "json",
									success : function(ret){
										window.parent.location.href="http://lbs.tuyouonline.com";
									}
								});
							});
						}
						else if(ret.code==12001){
							layer.msg("原密码不正确");
						}
						else{
							layer.msg("操作失败");
						}
						
					},
					complete:function(XMLHttpRequest, textStatus){
						authorityValide(XMLHttpRequest);
					}
				});
			}
	}
	
//删除cookie
function delCookie(name){
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}
	/************************修改密码-end**************************/ 
	
	/************************修改资料-start**************************/
	//查询用户资料
	$(".js-edit-information").click(function() {
		getUserInfo("beforeEdit");
	});
	function getUserInfo(oppType){
		$.ajax({
			url : "rest/loginController/getUserInfo",
			async : true,
			cache : false,
			type : "POST",
			data : {"userId" : header_userId},
			datatype : "json",
			success : function(ret){
				if(ret.code == 0){
					var userData = ret.data;
					if(userData){
						if(oppType == "displayUser"){
							$("#userAccount").text(userData.account);
							if(userData.type == 8){
								$("#userType").text("代理商"); 
							}else if(userData.type == 0){
								$("#userType").text("管理员");
							}else if(userData.type == 9){
								$("#userType").text("用户");
							}else if(userData.type == 11){
								$("#userType").text("销售");
							}
							$("#userName").text(userData.name).attr("title",userData.name);//账号中心-用户名显示
							$("#userPhone").text(userData.phone);
						}else if(oppType == "beforeEdit"){
							 $("#editInformationModal").find(".error").html('');
							 $("#editInformationModal").find(".error").removeClass("error");
							//$("#editpwd-form").reset();
							$("#edit-modal-userId").val(header_userId);
							$("#edit-modal-account").val(userData.loginName);
							
							$("#edit-modal-nickName").val(userData.loginName);
							$("#edit-modal-nickName").removeClass("error");
							$("label[for='edit-modal-nickName']").remove();
							
							$("#edit-modal-phone").val(userData.mobile);
							$("#edit-modal-phone").removeClass("error");
							$("label[for='edit-modal-phone']").remove();

							$("#edit-modal-email").val(userData.email);
							$("#edit-modal-email").removeClass("error");
							$("label[for='edit-modal-email']").remove();
							
							$("#editInformationModal").modal();
							editUserValidate();
						}
					}
				}
			},
			erorr : function(e){
				ajaxError("edit-information",e);
			}
		});
		
	
	}
	
	//保存用户资料
	$("#saveUserInformation").click(function(){
		if( !$("#edit-modal-userForm").valid()){
			return false;
		}
		$.ajax({
			url : "/useradmin/updateUser",
			async : true,
			cache : false,
			type : "POST",
			data : $("#edit-modal-userForm").serialize(),
			datatype : "json",
			success : function(ret){
				if(ret.code == 0){
					layer.msg("操作成功",{time:2000,icon:1});
					$("#userName").text($("#edit-modal-nickName").val());
					$("#userPhone").text($("#edit-modal-phone").val());
					$("#editInformationModal").modal("hide");

					updateCurrJspTreeNode();
					
				}else{
					layer.msg("操作失败",{time:2000,icon:2});
				}
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			},
			erorr : function(e){
				ajaxError("edit-information",e);
			}
		});
	});

	function updateCurrJspTreeNode(){
		//当前编辑的用户帐号(登陆用户的账号)
		var editmodalaccount = $("#edit-modal-account").val();
		
		var jspTreeObj = $.fn.zTree.getZTreeObj("treeDemo");
		if(jspTreeObj){
			//当前页面客户树选中的节点
			var jspSelectNode = jspTreeObj.getSelectedNodes()[0];
			//登陆用户的树节点
			var currUserNode = jspTreeObj.getNodes()[0];
			if(jspSelectNode && currUserNode){
				var noedSuffix = currUserNode.name.substring(currUserNode.name.indexOf("("));
				if(noedSuffix){
					currUserNode.name = $("#edit-modal-nickName").val()+noedSuffix;
				}else{
					currUserNode.name = $("#edit-modal-nickName").val();
				}
				currUserNode.phone = $("#edit-modal-phone").val();
				jspTreeObj.updateNode(currUserNode);
				
				//当前页面选中的节点即为当前登陆用户节点(根节点)
				if(jspSelectNode.account == currUserNode.account){
					jspTreeObj.setting.callback.onClick(null,"treeDemo",currUserNode);
				}else{
					
				}	
			}
		}
	}
	
	$.validator.addMethod("phone",function(value,element){
		var result=false;
		if (!value || /^0{0,1}(13[0-9]|15[3-9]|15[0-2]|18[0-9]|17[0-9])[0-9]{8}$/.test(value) 
				|| "TUQIANG" != 'TUQIANG') {
			result = true;
		}
		return result;
	},"请填写正确的手机号码");
	$.validator.addMethod("nickNameValid",function(value,element){
		var result=false;
		if(value){
			//首尾空格去除,中间空格占位
	  		var temp1 = value.replace(/(^\s*)|(\s*$)/g,''); 
	  		if (temp1.length >= 3 && temp1.length <= 50) {
				result = true;
			}
	  		var temp2 = value.replace(/\s/g, "");
	  	  	if (/^[\u4e00-\u9fa5_a-zA-Z0-9_@]{3,50}$/.test(temp2)) {
				result = true;
		  	}
	  	}
		return result;
	},"用户名不能为空"); 
	$.validator.addMethod("accountValid", function(value, element) {
		var result = false;
		if (/^[\u4e00-\u9fa5_a-zA-Z0-9_@]{3,30}$/.test(value)) {
			result = true;
		}
		return result;
	});
	//修改资料表单验证
	function editUserValidate(){
		
		$("#edit-modal-userForm").validate({
			rules : {
				nickName:{
					required: true,
					minlength: 3,
					maxlength:50,
					nickNameValid : true
				},
				phone:{
					required: false/* ,
					phone : true, */
				},
				email:{
					required: false,
					email:true
				}
			},
			messages:{
				nickName : {
					required: "用户名不能为空",
					minlength: "用户名称至少3位",
					maxlength: "用户名称不超过50位",
					nickNameValid:$.i18n.prop("cust.nickNameValid")
				},
				/* phone:{
					required :"请输入电话号码"
				}, */
				email:{
					required: "请输入邮箱",
					email:"邮箱格式不正确"
				}
			},
			errorPlacement: function(error, element){
				error.appendTo(element.parent());
			}
		});
	}
	
	/************************修改资料-end**************************/
	
	/************************当前时间-start**************************/ 
	setInterval("document.getElementById('curr_time').innerHTML=new Date().Format('yyyy-MM-dd hh:mm:ss')",1000);
	/************************当前时间-end**************************/ 
	
	/************************退出系统-start**************************/ 
	$(".js-exit-system").click(function() {
		layer.confirm('您确定要退出系统吗?', {
			title:'信息',
			btn : [ '确定', '取消' ] 
		}, function() {
			delCookie("selectHistory");
			exitSys();
			
		//	window.location.href=_ctx+"/j_spring_cas_security_logout";
		//	window.location.href=_ctx+"/logout?domain=lbs.tuyouonline.com";
		});
	});
	
	function exitSys()
	{
		
		window.location.href='loginController.do?logout';
		/**$.ajax({
			url : _ctx+"/logout",
			async : true,
			cache : false,
			type : "POST",
			data : $("#edit-modal-userForm").serialize(),
			datatype : "json",
			success : function(ret){
				window.parent.location.href="http://lbs.tuyouonline.com";
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});**/
	}
	/************************退出系统-end**************************/ 
	
	function stock_ajaxDataFilter(treeId, parentNode, responseData) {
		$.each(responseData.data, function(i, v) {
			if (v.type == 0) {
				v.typeName = $.i18n.prop('cust.Manager');
			} else if (v.type == 8 || v.type == 10) {
				v.typeName = $.i18n.prop('cust.Distributor');
			} else if (v.type == 9) {
				v.typeName = $.i18n.prop('cust.User');
			} else if (v.type == 11) {
				v.typeName = $.i18n.prop('cust.Sale');
			} else {
				v.typeName = "";
			}
			//拼接成 (库存/进货)
			v.countStr = "(" + v.deviceCount.repertory + ")";
			if(typeof(v.countStr) != 'undefined'){
				v.name = v.name + v.countStr;
			}
		});
		return responseData.data;
	}
	function active_ajaxDataFilter(treeId, parentNode, responseData) {
		$.each(responseData.data, function(i, v) {
			if (v.type == 0) {
				v.typeName = $.i18n.prop('cust.Manager');
			} else if (v.type == 8 || v.type == 10) {
				v.typeName = $.i18n.prop('cust.Distributor');
			} else if (v.type == 9) {
				v.typeName = $.i18n.prop('cust.User');
			} else if (v.type == 11) {
				v.typeName = $.i18n.prop('cust.Sale');
			} else {
				v.typeName = "";
			}
			//拼接成( 激活/进货)
			v.countStr = "(" + v.deviceCount.active + "/" + v.deviceCount.repertory + ")";
			if(typeof(v.countStr) != 'undefined'){
				v.name = v.name + v.countStr;
			}
		});
		return responseData.data;
	}
	
	function repertory_ajaxDataFilter(treeId, parentNode, responseData) {
		$.each(responseData.data, function(i, v) {
			if (v.type == 0) {
				v.typeName = $.i18n.prop('cust.Manager');
			} else if (v.type == 8 || v.type == 10) {
				v.typeName = $.i18n.prop('cust.Distributor');
			} else if (v.type == 9) {
				v.typeName = $.i18n.prop('cust.User');
			} else if (v.type == 11) {
				v.typeName = $.i18n.prop('cust.Sale');
			} else {
				v.typeName = "";
			}
			//拼接成(进货)
			v.countStr = "(" + v.deviceCount.repertory + ")";
			if(typeof(v.countStr) != 'undefined'){
				v.name = v.name + v.countStr;
			}
		});
		return responseData.data;
	}
	
	function simple_ajaxDataFilter(treeId, parentNode, responseData) {
		$.each(responseData.data, function(i, v) {
			if (v.type == 0) {
				v.typeName = $.i18n.prop('cust.Manager');
			} else if (v.type == 8 || v.type == 10) {
				v.typeName = $.i18n.prop('cust.Distributor');
			} else if (v.type == 9) {
				v.typeName = $.i18n.prop('cust.User');
			} else if (v.type == 11) {
				v.typeName = $.i18n.prop('cust.Sale');
			} else {
				v.typeName = "";
			}
		});
		return responseData.data;
	}
	
	//加载初始化
	$(function(){
		document.getElementById('curr_time').innerHTML=new Date().Format("yyyy-MM-dd hh:mm:ss"); 
		if(header_type=="ADMIN"){
		$(".js-update").show();
		}else{
		$(".js-update").hide();
		}
	});

	function passwordStrength(obj){
		var value = obj.value;
		if(/^[A-Za-z].*[0-9].*[A-Za-z]|[A-Za-z].*[0-9]|[0-9].*[A-Za-z]|[0-9].*[A-Za-z].*[0-9]+$/.test(value)){
			if(/^(?=^.{6,}$)(|(?=.*\W+))(?=.*[A-Z])(?=.*[a-z]).*$/.test(value)&&(!containSpecial(value))){
				$("#password-strength").hide();
				$("#password-strength-weak").hide();
				$("#password-strength-medium").show();
				$("#password-strength-strong").hide();
			}else if(/^(?=^.{6,}$)(|(?=.*\W+))(?=.*[A-Z])(?=.*[a-z]).*$/.test(value)&&(containSpecial(value))){
				$("#password-strength").hide();
				$("#password-strength-weak").hide();
				$("#password-strength-medium").hide();
				$("#password-strength-strong").show();
			}else if(!(/^(?=^.{6,}$)(|(?=.*\W+))(?=.*[A-Z])(?=.*[a-z]).*$/.test(value))&&(containSpecial(value))){
				$("#password-strength").hide();
				$("#password-strength-weak").hide();
				$("#password-strength-medium").show();
				$("#password-strength-strong").hide();
			}else{
				$("#password-strength").hide();
				$("#password-strength-weak").show();
				$("#password-strength-medium").hide();
				$("#password-strength-strong").hide();
			}
		}else{
			$("#password-strength").show();
			$("#password-strength-weak").hide();
			$("#password-strength-medium").hide();
			$("#password-strength-strong").hide();
		}
	}
	function passwordStrengthAdvise(obj){
		var value = obj.value;
		if(/^[A-Za-z].*[0-9].*[A-Za-z]|[A-Za-z].*[0-9]|[0-9].*[A-Za-z]|[0-9].*[A-Za-z].*[0-9]+$/.test(value)){
			if(/^(?=^.{6,}$)(|(?=.*\W+))(?=.*[A-Z])(?=.*[a-z]).*$/.test(value)&&(!containSpecial(value))){
				$("#password-strength-advise").hide();
				$("#password-strength-weak-advise").hide();
				$("#password-strength-medium-advise").show();
				$("#password-strength-strong-advise").hide();
			}else if(/^(?=^.{6,}$)(|(?=.*\W+))(?=.*[A-Z])(?=.*[a-z]).*$/.test(value)&&(containSpecial(value))){
				$("#password-strength-advise").hide();
				$("#password-strength-weak-advise").hide();
				$("#password-strength-medium-advise").hide();
				$("#password-strength-strong-advise").show();
			}else if(!(/^(?=^.{6,}$)(|(?=.*\W+))(?=.*[A-Z])(?=.*[a-z]).*$/.test(value))&&(containSpecial(value))){
				$("#password-strength-advise").hide();
				$("#password-strength-weak-advise").hide();
				$("#password-strength-medium-advise").show();
				$("#password-strength-strong-advise").hide();
			}else{
				$("#password-strength-advise").hide();
				$("#password-strength-weak-advise").show();
				$("#password-strength-medium-advise").hide();
				$("#password-strength-strong-advise").hide();
			}
		}else{
			$("#password-strength-advise").show();
			$("#password-strength-weak-advise").hide();
			$("#password-strength-medium-advise").hide();
			$("#password-strength-strong-advise").hide();
		}
	}
	
	function containSpecial(s) { var containSpecial = RegExp(/[(\ )(\~)(\!)(\@)(\#) (\$)(\%)(\^)(\&)(\*)(\()(\))(\-)(\_)(\+)(\=) (\[)(\])(\{)(\})(\|)(\\)(\;)(\:)(\')(\")(\,)(\.)(\/) (\<)(\>)(\ )(\)]+/); return ( containSpecial.test(s) ); }
	
</script>

  <!-- header end --> 
  <div class="modal fade modal_command" id="modal1"></div>
  <!-- main start -->
  <div class="main oh">
    <div class="container-fluid">
      <div class="row">
        <div class="customer-leftsidebar p-lr15 p-t15">
          <div class="row bc-fff  side-left">
            <div class="side-subtitle" title="新增客户">
            	
	            	<a class="btn btn-primary btn-xs fr js-add-role" ><i class="fa fa-plus"></i>&nbsp;<span>新增客户</span></a>
            	
            	<b>客户列表</b>
            </div>
            <div id="cusType" class="side-tab-navbar tab-navbar">
				<ul class="all-customer-list clearfix tab-nav-customer tab-nav">
					<li onclick="initDevTable('1')" id="allUser" class="cp" title="全部客户"><a>全部客户</a></li>
				</ul>
			</div>
			<div class="tab-customer-con">
	            <div class="col-md-12 all-customers-box">
	              <div class="p-tb15 side-tree-box" >
	                <div class="tree-search"> <i class="tree-search-icon" id="treeDemo_cusTreeSearchBtn"></i>
	                  <input type="text" placeholder="请输入客户名称或帐号"  id="treeDemo_cusTreeKey" value="" class="empty fs-12"/>
	                  <input type="radio" id="name" name="keyType" class="hide" checked  />
	                  <input type="radio" checked="" style="margin-left:36px;" class="hide" name="funType" id="getNodesByParamFuzzy">
	                </div>
	                <div class="tree-scroll default-scrollbar">
	                  <div class="ta-c m-tb15" id="TreeLogindata"><i class="fa fa-bell-o"></i>暂无数据</div>
	                  <ul id="treeDemo" class="ztree">
	                  </ul>
	                </div>
	              </div>
	            </div>
            	<div class="col-md-12 dn expired-customers-box">
            		<div id="overdueType" class="p-t15 drop-list left-drop-list">
            			<div class="easydropdown-group">
            				<span class="easydropdown easydropdown-xs">
								<select id="dueType" onchange="loadExpirationTree()" class="due-type">
									<option>用户到期</option>
									<option>平台到期</option>
								</select>
							</span>
							<script type="text/javascript">
								$(function(){
									if(""=="2"){ //即将到期
										$("#expirationUser").click();
									}else if(""=="3"){ //已过期
										$("#expirationUser").click();
										
										$("#dueTimeType option").eq(1).attr("selected",true);
										$("#dueTimeType").parent().parent().children().eq(1).text('已过期');
										
										$("#dueTime_expired option").eq(1).attr("selected",true);
										$("#dueTime_expired").parent().parent().children().eq(1).text('30天内');
										loadExpirationTree();
									}else if(""=="4"){ 
										$("#markUser").click();
									}
								});
						   </script>
							<span class="easydropdown easydropdown-xs">
								<select id="dueTimeType" onchange="loadExpirationTree()" class="due-timetype">
									<option>即将到期</option>
									<option>已过期</option>
								</select>
							</span>
							<span class="easydropdown easydropdown-xs">
								<select id="dueTime" onchange="loadExpirationTree()" class="due-time dn">
									<option>7天内</option>
									<option>30天内</option>
									<option>60天内</option>
									<option>7-30天内</option>
									<option>30-60天内</option>
								</select>
								<select id="dueTime_expired" onchange="loadExpirationTree()" class="due-time dn">
									<option>7天内</option>
									<option>30天内</option>
									<option>60天内</option>
									<option>7-30天内</option>
									<option>30-60天内</option>
									<option>60天以上</option>
								</select>
							</span>
            			</div>	
					</div>
	            	<div class="p-b10 side-tree-box" >
	                <div class="tree-scroll default-scrollbar">
	                  <div id="noData" ><div class="ta-c c-666 p-tb10"><span class="p-5 d-ib">&nbsp;<i class="fa fa-bell-o"></i> 暂无数据&nbsp;</span></div></div>
	                  <div class="ta-c m-tb15" style="display: none;" id="ExpirationTreeLogindata"><i class="fa fa-spinner fa-pulse fa-fw"></i>正在加载数据...</div>
	                  <ul id="treeDemo7" class="ztree">
	                  </ul>
	                </div>
	              </div>
            	</div>
            </div>
          </div>
        </div>
        <div class="customer-rightsidebar p-15">
	        <div class="customer-con-box b1-ccc">
	          <div class="basic-info pr bc-fff b-b1-ccc clearfix">
	          	  <div class="assets-info account-statistics fl b-r1-ddd p-r10">
		            <ul class="list-fl">
	            		<li>
		            		<span><b>库存</b>(<span id="stock">0</span>)</span>
		            		<span><b>总数</b>(<span id="receiving" >0</span>)</span>
	            		</li>
	            		<li>
	            			<span><b>未激活</b>(<span id="noActive" >0</span>)</span>
	            			<span><b>已激活</b>(<span id="active">0</span>)</span>
	            		</li>
	            		<li>
							<span><b>已过期</b>(<span id="devExpired">0</span>)</span>
							<span><b>即将到期</b>(<span id="devExpiring">0</span>)</span>
						</li>
						<li>
							<span><b>在线</b>(<span id="onLine">0</span>)</span>
							<span><b>离线</b>(<span id="noOnLine">0</span>)</span>
						</li>										
					</ul>
					
          		  </div>
		          <div class="role-info fl p-l25 p-t5">
		          	<div class="media m-0">
		          		<div id="user_type" class="media-left fs-40 mark-agents"><i class="fa fa-user va-t"></i></div>
			             
						  <div class="media-body">
							  <div class="media-heading clearfix">
							  	<h4 class="fl m-0 fs-16" ><span class="user-name text-ellipsis " id="user_account" title="yanshi"></span> </h4>
							  	<div class="fl p-l10">
									<button type="button" class="btn btn-xs btn-primary js-edit-info text-ellipsis maw-100" onclick="toIndexFast()" title="监控用户">监控用户</button>&nbsp;
					                
				                	<span class="dn" id="editUserFast"><button type="button" class="btn btn-xs btn-primary js-edit-info text-ellipsis maw-100" onclick="openUpdateModalFast()" title="编辑用户">编辑用户</button></span>
									
								</div>
							  </div>

								<ul class="list-fl p-r25 lh-2 c-666">
									<li>
										<span><b title="账号">账号</b>：<span id="userAccount" class="user-account text-ellipsis va-t"></span></span>&emsp;
									</li>
									<li>
										<span><b title="客户类型">客户类型</b>：<span id="userType"></span></span>&emsp;
									</li>	
									<li class="last">
										<span><b title="手机">手机</b>：<span id="user_phone"></span></span>
									</li>
								</ul>
						  </div>
	   					</div>
	          	</div>
	          </div>
	          <div class="right-tab-con bc-fff">
		        <div class="main-tab" id="allDev">
		            <div class="tab-navbar">
		              <ul class="js-equipment-tab-nav tab-nav tab-auto-nav clearfix">
		                <li id="markDev" class="active" title="我的车辆"><a class="cp" onclick="initDevTableAndPage();">我的车辆</a></li>
		                <li id="searchAgency"  title="下级客户"><a class="cp" >下级经销商</a></li>
		              </ul>
		             
		            </div>
		            <div class="tab-con">
			        	<div class="device-con-box">
			                <div class="func clearfix p-tb10 p-lr15">
			                  <div class="fl">                  
			                    <button type="button" class="btn btn-default btn-sm js-update" title="批量导入">批量导入</button>&nbsp;
			                    <button class="btn btn-default btn-sm js-allocate-device-btn" style="display: none" type="button" onclick="showSaleModel('');" title="批量销售">批量销售</button>&nbsp;
			                    <span class="dn" id="extensionuponexpire" style="display: none"><button  class="btn btn-default btn-sm js-allocate-prolong-btn" type="button" onclick="openExpirationModal('set');" title="批量设置用户到期">批量设置用户到期</button>&nbsp;</span>
								
			                    <form action="" style="display: none;" id="exportdevice">
			                    	<input type="hidden" name="dayNum" id="dayNumHidden" value="">
			                    	<input type="hidden" name="userId" id="userIdHidden" value="">
			                    	<input type="hidden" name="devName" id="devNameHidden" value="">
			                    	<input type="hidden" name="dateType" id="dateTypeHidden" value="">
			                    	<input type="hidden" name="startDate" id="startDateHidden" value="">
			                    	<input type="hidden" name="endDate" id="endDateHidden" value="">
			                    	<input type="hidden" name="sn" id="snHidden" value="">
			                    	<input type="hidden" name="orgId" id="orgIdHidden" value="">
			                    	<input type="hidden" name="isActivation" id="isActivationHidden" value="">
			                    	<input type="hidden" name="parentId" id="parentIdHidden" value="">
			                    	<input type="hidden" name="isBind" id="isBindHidden" value="" >
			                    </form>
			                  </div>
							  	
			                  <div class="fr">
									<div class="fr search-input-group w300">
										<div class="input-group">
											<input type="text" value="" class="form-control form-control-sm form-search" placeholder='请输入IMEI或者SIM搜索' id="searchSnImeiVal" onkeydown="keyDown(event)"><span class="input-group-btn"><button class="btn btn-primary btn-sm" type="button" onclick="initDevTableAndPage();" ><i class="fa fa-search"></i>&nbsp;搜索</button></span>
										</div>
									</div>
									<div class="fr b1-ccc  b-r0 p-lr10 p-tb5 lh-1-5 bc-fafafa ws-n">
											<label class="icheck-min"><input type="radio" name="searchSnImei" value="imei" checked="checked">&nbsp;IMEI</label>&nbsp;&nbsp;
											 <label class="icheck-min"><input type="radio"  name="searchSnImei" value="sim">&nbsp;SIM</label>
										</div>
				                    <div class="m-lr15 mark-group">
				                    	<span id="markGroup" class="easydropdown easydropdown-sm group-easydropdown">
					                    	<script type="text/html" id="group-info">
	   		 					<select class="userGroup">
	   		 						<option value="">全部</option>
										{{each data as row i}}
											{{if row.organizeName=='默认组'}}
												<option value="{{row.id}}">默认组</option>
										{{else}}
											<option value="{{row.id}}">{{row.organizeName}}</option>
										{{/if}}
									{{/each}}
 								</select>
							</script>
									
				                    </span>
				                    <span class="easydropdown easydropdown-sm group-easydropdown hide">
				                    	<select class="userGroup isActivation" >
										<option value="" title="激活状态">激活状态</option>
										<option value="1" title="已激活">已激活</option>
									 </select>
									<!-- 	<select class="userGroup isBind">
										<option value="" title="绑定状态	">绑定状态	</option>
										<option value="1" title="已绑定">已绑定</option>
										<option value="2" title="未绑定	">未绑定	</option>
									</select>-->
									</span>
				                    </div>
			                    </div>
			                    
			                </div>
			                <div class="table-header">
				                <table class="table table-hover table-ellipsis m-b0" id="deviceTableHeader">
				                	<thead>
				                    <tr>
				                      <th title="序号"><span class="icheck-min"><input id="devAllCheck" type="checkbox"></span>&nbsp;序号</th>
				                      <th title="设备名称">车辆名称</th>
				                      <th title="IMEI">IMEI</th>
				                      <th title="设备类型">设备类型</th>
				                      <th title="激活时间">激活时间</th>
				                      <th title="SIM" >SIM</th>
				                      <th title="用户到期">用户到期</th>
				                      <th title="所属分组">所属分组</th>
				                      <th title="绑定用户">绑定用户</th>
				                      <th title="操作">操作</th>
				                    </tr>
				                  </thead>
				                </table>
			                </div>
			                <div class="table-scrollbar oy-a">
			                	<table class="table table-hover table-ellipsis" id="deviceTableContent">
				                  <colgroup>
						              <col width="80" />
						              <col width="120" />
						              <col width="100" />
						              <col/>
						              <col width="150"/>
						              <col />
						              <col width="120" />
						              <col/>
						              <col/>
						              <col width="210" />
					              </colgroup>
				                  <tbody id="markDevTable">
				                  	
				                  </tbody>
			                </table>
			                <div id="paging-dev" class="simple-pagination-custom ta-c p-b10"></div>
			                <div id="dev-noData" style="display: none;"><div class="ta-c c-666 p-tb10"><span class="p-5 d-ib">&nbsp;<i class="fa fa-bell-o"></i> 暂无数据&nbsp;</span></div></div>
			                <div id="devloading"  class="ta-c p-tb25"><i class="fa fa-spinner fa-pulse fa-2x"></i></div>
			                </div>
			              </div>
			            <div class="client-con-box">
			                <div class="func clearfix p-10">
			                  <div class="fl" style="padding-top: 5px;padding-left: 10px;">
			                    <button class="btn btn-primary btn-sm js-add-agency" type="button" title="新增经销商"><i class="fa fa-plus"></i>&nbsp;新增经销商</button>
			                   </div>
			                  <div class="fr" style="top: 2px;position: relative;">
									<div class="fr search-input-group w300">
										<div class="input-group">
											<input type="text" value="" class="form-control form-control-sm form-search" placeholder='请输入代理商名称' id="searchAgentVal" onkeydown="keyDown(event)"><span class="input-group-btn"><button class="btn btn-primary btn-sm" type="button" onclick="searchAgencyFunc();" ><i class="fa fa-search"></i>&nbsp;搜索</button></span>
										</div>
									</div>
									<div class="fr b1-ccc  b-r0 p-lr10 p-tb5 lh-1-5 bc-fafafa ws-n">
											<label class="searchagencyName">&nbsp;代理商名称</label>&nbsp;&nbsp;
										</div>
			                    </div>
			                </div>
			                 
			                <div class="table-header">
			                	<table class="table table-hover table-ellipsis m-b0" id="clientTableHeader">
				                  <thead>
				                    <tr>
				                      <th style="display: none;" title="序号"><</th> 
				                      <th title="经销商名称">经销商名称</th>
				                      <th title="经销商代码">经销商代码</th>
				                      <th title="经销商地址">经销商地址</th>
				                      <th title="经销商邮编">经销商邮编</th>
				                      <th title="经销商电话">经销商电话</th>
				                      <th title="经销商传真">经销商传真</th>
				                      <th title="经销商联系人">经销商联系人</th>
				                      <th title="经销商联系人称谓">经销商联系人称谓</th>
				                      <th title="经销商纬度">经销商纬度</th>
				                      <th title="经销商经度">经销商经度</th>
				                      <th title="操作">操作</th>
				                    </tr>
				                  </thead>
				            </table>
			                </div>
			                <div class="table-scrollbar oy-a">       
				                <table class="table table-hover table-ellipsis" id="clientTableContent">
				                  <colgroup>
						              <!-- <col width="50" /> -->
						              <col width="15%"/>
						              <col  width="10%"/>
						              <col width="10%"/>
						              <col width="10%"/>
						              <col width="10%"/>
						              <col width="10%"/>
						              <col width="10%"/>
						              <col width="9%"/>
						              <col width="8%"/>
						              <col width="8%"/>
						              <col width="10%"/>
					              </colgroup>
				                  <tbody id="markAgencyTable">
				                  	<script type="text/html" id="agency-info">

				                  	{{each result as row i}}
				                    <tr>
				                      <td  style="display: none;">{{row.id}}</td>
				                      <td title="{{row.agencyName}}">{{row.agencyName}}</td>
				                      <td title="{{row.agencyCode}}">{{row.agencyCode}}</td>
				                      <td title="{{row.agencyAddress}}">{{row.agencyAddress}}</td>
				                      <td title="{{row.agencyMailCode}}">{{row.agencyMailCode}}</td>
				                      <td title="{{row.agencyPhone}}">{{row.agencyPhone}}</td>
								      <td title="{{row.agencyFax}}">{{row.agencyFax}}</td>
                                      <td title="{{row.agencyContacts}}">{{row.agencyContacts}}</td>
                                      <td title="{{row.agencyContactsName}}">{{row.agencyContactsName}}</td>
                                      <td title="{{row.agencyLat}}">{{row.agencyLat}}</td>
                                      <td title="{{row.agencyLon}}">{{row.agencyLon}}</td>
				                      <td>
											<a title="编辑" class="cp js-editor-users-btn" onclick="agencyUpdateModal('{{row.id}}');">编辑</a>
											<a title="删除" class="cp js-delete-users-btn" onclick="deleteAgency('{{row.id}}')">删除</a>
                                            <a title="围栏设置" class="cp js-set-rail-btn" onclick="agencyRail('{{row.id}}')">围栏设置</a>
									</td>
				                    </tr>
				                    {{/each}}
				                    </script>
					                  </tbody>
									   
				                </table>
				                <div id="paging-agency" class="simple-pagination-custom ta-c p-b10"></div>
				              </div>
				              
				           </div>
			            </div>
		          </div>
		        <div class="expired-con-box dn" id="expireDev">
					<div class="drop-list bg-gradient-title">
						<div class="easydropdown-group">
							<span class="easydropdown easydropdown-sm">
								<select id="devDueType" onchange="initExpirationDevTable()" class="due-type">
									<option>用户到期</option>
									<option>平台到期</option>
								</select>
							</span>
							<span class="easydropdown easydropdown-sm">
								<select id="devDueTimeType" onchange="initExpirationDevTable()" class="due-timetype">
									<option>即将到期</option>
									<option>已过期</option>
								</select>
							</span>
							<span class="easydropdown easydropdown-sm">
								<select id="devDueTime" onchange="initExpirationDevTable()" class="due-time dn">
									<option>7天内</option>
									<option>30天内</option>
									<option>60天内</option>
									<option>7-30天内</option>
									<option>30-60天内</option>
								</select>
								<select id="devDueTime_expired" onchange="initExpirationDevTable()" class="due-time dn">
									<option>7天内</option>
									<option>30天内</option>
									<option>60天内</option>
									<option>7-30天内</option>
									<option>30-60天内</option>
									<option>60天以上</option>
								</select>
							</span>
						</div>
					  </div>
					  <div class="func clearfix p-tb10 p-lr15 b-b1-ddd">
						<div class="fl">
							
							<span id="ProlongUserExpiration"><button class="btn btn-default btn-sm extended-time-btn" onclick="openExpirationModal('update')" type="button" title="批量延长用户到期">&nbsp;批量延长用户到期</button>&nbsp;</span>
							<span class="dn"><button class="btn btn-default btn-sm extended-platform-due-btn" onclick="openAllotDevProlongModal('')" type="button" title="批量延长平台到期">&nbsp;批量延长平台到期</button>&nbsp;</span>
							<%--<button class="btn btn-default btn-sm" onclick="listExport()" type="button" title="导出"><i class="fa fa-file-excel-o"></i>&nbsp;导出</button>
						--%></div>
					  </div>
					  <div class="table-header">
					  	 <table class="table table-hover table-ellipsis m-b0" id="expiraTableHeader">
							  <thead>
			                    <tr>
			                      <th title="序号"><span class="icheck-min"><input id="expirationDevAllCheck" type="checkbox"></span>&nbsp;序号</th>
			                      <th title="设备名称">设备名称</th>
			                      <th title="IMEI">IMEI</th>
			                      <th title="设备类型">设备类型</th>
			                      <th title="激活时间">激活时间</th>
			                      <th title="Sim">SIM</th>
			                      <th title="userexpiration">用户到期</th>
			                      <th title="所属分组">所属分组</th>
			                      <th title="绑定用户">绑定用户</th>
			                      <th title="操作">操作</th>
			                    </tr>
			                  </thead>
			                </table>
					  </div>
					  <div class="table-scrollbar oy-a">
						 <table class="table table-hover table-ellipsis" id="expiraTableContent">
						 	  <colgroup>
					              <col width="70"/>
					              <col width="120"/>
					              <col width="130"//>
					              <col/>
					              <col/>
					              <col/>
					              <col/>
					              <col/>
					              <col/>
					              <col width="210"/>
				              </colgroup>
			                  <tbody id="markExpirationDevTable">
			                  </tbody>
						  </table>
						  <div id="paging-expiration-dev" class="simple-pagination-custom ta-c"></div>
		                  <div id="expiration-dev-noData"><div class="ta-c c-666 p-b10"><span class="p-5 d-ib">&nbsp;<i class="fa fa-bell-o"></i> 暂无数据&nbsp;</span></div></div>
						  <div class="ta-c m-tb15 dn" id="logindata-expiration-dev"><i class="fa fa-spinner fa-pulse fa-fw"></i>正在加载数据...</div>
				 	  </div>
			 	  </div>
	       	  </div>
	       	  <input type="text"  value=""  id="isDueCustomer"  class="dn"/>
	       	</div>  
        </div>
      </div>
    </div>
  </div>
  <style>
  @media print{
  width: 3cm;height:3cm;margin: -10px auto;
  }
  </style>
  	<form id="replayrecord_form" method="post" target="_blank">
		<input type="hidden" name="userId" id="replayrecord_userId" />
		<input type="hidden" name="account" id="replayrecord_account" />
		<input type="hidden" name="start_time" id="start_time" />
		<input type="hidden" name="end_time" id="end_time" />
	</form>
  
  <!-- main end -->
   <!-- footer start -->
  	
<!-- <footer class="footer ta-c">Copyright © jimi 2014-<span class="js-year"></span>. All rights are reserved.</footer> -->
<div style="position: fixed; left:-9999em; top:0; ">
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1260225997'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/z_stat.php%3Fid%3D1260225997%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</div>

 
  <!-- footer end --> 
</div>

<div id="alarmSidebar" class="alarm-sidebar-box">
  <div class="alarm-sidebar sidebar">
  	<a href="javascript:;" class="js-side-close side-close"></a>
    <h4 class="side-title p-lr15 p-tb10"><i class="fa fa-volume-up va-m"></i>&nbsp;告警消息</h4>
    <div class="js-sidebar-scroll oy-a " id="mark_prompt">
        <div class="ta-c c-666 p-tb10" id="logindata"><i class="fa fa-spinner fa-pulse fa-fw"></i>正在加载数据......</div>
    	<div id="isNull"  style="display: none;"><div class="ta-c c-666 p-tb10"><span class="p-5 d-ib">&nbsp;<i class="fa fa-bell-o"></i>暂无数据&nbsp;</span></div></div>
      <ul id="markAlarmInfo" class="fs-14 alarm-side-list">
        <script type="text/html" id="unReadInfo">
			{{each data as row i}}
				<li><a>
          			<dl>
            			<dt class="m-tb5 m-b10">
              			<span class="badge">{{row.typeName}}</span></dt>
            			<dd class="m-tb5 fs-12"><b>设备名称：</b>{{row.devName}}</dd>
            			<dd class="m-tb5 fs-12"><b>告警类型： </b>{{row.statusName}}</dd>
            			<dd class="m-tb5 fs-12"><b>告警时间：</b>{{row.pushTime}}</dd>
          			</dl>
          		</a></li>
			{{/each}}
		</script>
      </ul>
    </div>

  </div>
  <form id="logoutFrom" name="logoutFrom" action="/logout?service=" method="post">
  	<input type="submit">
  </form>
</div>

<input type="hidden" id="alarmIds" value="" />
<a class="alarm-toggle-btn pf ta-c oh cp js-alarm-toggle-btn hidden" id="gaojing" title="报警"> <i class="fa fa-bell-o"></i></a>
<div class="alarm-info" id="alarmMessage">
  <div class="alarm-header clearfix">
    <h5 class="fl m-0"><span class="fs-18 c-df7312"><i class="fa fa-bell-o"></i></span>&nbsp;报警管理</h5>
    <a  class="alarm-close fr fs-18 cp" title="缩小"><i class="fa fa-compress" ></i></a>
    <div class="alarm-tools fr ws-n">
      <span>
      	告警时间：
      <input type="text" id="alarm_startTime" readonly="readonly" class="form-control form-control-xs form-control-inline" size="12" placeholder="开始时间">
      <input type="text" id="alarm_endTime" readonly="readonly" class="form-control form-control-xs  form-control-inline" size="12" placeholder="结束时间">
      &emsp;
      </span>
      <!-- <a class="cp" onclick="javascript:readAlarm('');">全部标为已读</a>
      <a class="cp js-type-filter-btn" onclick="javascript:alarmFilter();">报警内容筛选</a> -->
      <span id="lowerLevelSpan" class="icheck-min"><label class="m-b0"><input type="checkbox" id="lowerLevel" onchange="getAlarmInfoList(true,1)">&nbsp;下级设备告警&nbsp;&nbsp;&nbsp;&nbsp;</label></span>
      <span class="icheck-min"><label class="m-b0"><input type="checkbox" id="alarmSound">&nbsp;开启报警声音</label></span>
    </div>
  </div>
  <div class="alarm-body">
    <div class="table-header">
      <table class="table table-condensed table-hover table-ellipsis m-b0" id="alarmMessageTableHeader">
        <thead>
        <tr>
          <th title="IMEI">IMEI</th>
          <th title="IMEI">账号</th>
          <th title="告警类型">告警类型</th>
          <th title="告警时间">告警时间</th>
          <th title="定位时间">定位时间</th>
          <th title="定位状态">定位状态</th>
          <th title="操作">操作</th>
        </tr>
        </thead>
      </table>
    </div>
    <div class="table-scrollbar oy-a h200">
      <table class="table table-condensed table-normal-a table-hover table-ellipsis m-b0" id="alarmMessageTableContent">
        <colgroup>
          <col width="130">
          <col width="80">
          <col width="100">
          <col width="130">
          <col width="130">
          <col>
          <col width="100">
        </colgroup>
        <tbody id="alarmInfoTable">
        	<script type="text/html" id="alarmInfoList">
				{{each data as row i}}
					<tr onclick="bindAlarmInfo('{{row.bdlat}}','{{row.bdlng}}','{{row.gglat}}','{{row.gglng}}','{{i}}')" {{if row.readStatus == -1}}{{else}} class="read" {{/if}}>
          				<td title="{{row.imei}}"><a onclick="openDeviceInfoModal('{{row.imei}}')">{{row.imei}}</a></td>
          				<td id="" title="{{row.account}}">
							{{if row.account == null || row.account == ''}}
								未查询
							{{else}}
								{{row.account}}
							{{/if}}
						</td>
          				<td id="alertType{{i}}" title="{{row.statusName}}">{{row.statusName}}</td>
          				<td id="alertTime{{i}}" title="{{row.createTime}}">{{row.pushTime}}</td>
          				<td id="positionTime{{i}}" title="{{row.pushTime}}">{{row.pushTime}}</td>
          				<td title="已定位">已定位</td>
						<td>
						</td>
        			</tr>
				{{/each}}
        	</script>
        </tbody>
      </table>
      <div id="alarm_logindata" class="ta-c m-tb15">
		<i class="fa fa-spinner fa-pulse fa-fw fa-2x"></i>
		正在加载数据...
	  </div>
      <div id="alarm_nodata" class="dn"><div class="ta-c c-666 p-tb10"><span class="p-5 d-ib">&nbsp;<i class="fa fa-bell-o"></i> 暂无数据&nbsp;</span></div></div>
    </div>
  </div>

</div>
<div id="alarmDeviceInfo" class="modal fade in"  aria-hidden="false">
  <div class="modal-dialog" >
    <div class="modal-content w900">
      <div class="modal-header">
        <button aria-label="Close" data-dismiss="modal" class="close" type="button">
          <span aria-hidden="true">×</span>
        </button>
        <h4 class="modal-title">
     		设备编辑
        </h4>
      </div>
      <div class="modal-body">
        <div class="h450 oy-a" id="edit_device_info_alarm">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-sm btn-primary mw-100" type="button" id="btn-submit-vehilebund" onclick="complex_device_info_submit('alarm','alarmDeviceInfo')">保存</button>&nbsp;
        <button data-dismiss="modal" class="btn btn-sm btn-default mw-100" type="button">取消</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="alarmFilterModal">
  <div class="modal-dialog">
    <div class="modal-content  w600">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">报警类型筛选</h4>
      </div>
      <div class="modal-body">
        <div class="h280 oy-a">
          <div class="p-lr15 p-t10"><label class="icheck-min"><input type="checkbox" id="alarmAllSelect">&nbsp;全选</label></div>
          <ul class="list-fl alarm-item  clearfix c-666 b-0 p-b0" id="alarmTypeTable">
          	<script type="text/html" id="alarmTypeList">
          		{{each data as row i}}
          			<li><label class="icheck-min" title="{{row.value}}"><input type="checkbox" value="{{row.id}}" name="alarm_item">&nbsp;{{row.value}}</label></li>
          		{{/each}}
			</script>
          </ul>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary mw-100" onclick="AlarmInfofilter()">保存</button>
      </div>
    </div>
  </div>
</div>

<script id="alarmInfoTpl" type="text/html">
    <div id="alarmInfo" class="map-popover" style="top:60px; left: 84px;width:350px">
      <div class="popover-header">
      <b>报警信息</b>
      <span class="popover-close" title="关闭">&times;</span></div>
      <div class="popover-body">
        <table style="table-layout: fixed;width: 100%;height:156px">
          <tbody>
			<tr>
              <th  width="70"   title="设备名称" >设备名称：</th>
              <td title="{{devName}}" style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">{{devName}}</td>
            </tr>
			<tr>
              <th title="告警类型">告警类型：</th>
              <td title="{{alertType}}" style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">{{alertType}}</td>
            </tr>
			<tr>
              <th title="告警时间">告警时间：</th>
              <td title="{{alertTime}}">{{alertTime}}</td>
            </tr>
            <tr>
              <th title="定位时间">定位时间：</th>
              <td title="{{alertTime}}">{{alertTime}}</td>
            </tr>
			 <tr>
              <th title="报警地址">报警地址：</th>
              <td id="addr{{alarmInfoIndex}}" title="获取地址中">获取地址中</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
</script>

<!-- 告警处理modal -->
	<div class="modal fade" id="alarmDealModal_deal">
		<div class="modal-dialog">
			<div class="modal-content w600">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">告警处理</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal form-preset form-ellipsis p-tb25" id="alarmDealForm" action="">
						
						<div class="form-group">
							<label class="col-md-3 control-label" title="处理人" >处理人：</label>
							<div class="col-md-6">
								<input type="text" name="inputDealUserName" value="yanshi" placeholder="请输入处理人姓名"
									class="form-control" id="alarmDealModal_deal_inputDealUserName">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" title="处理内容">处理内容：</label>
							<div class="col-md-6">
								<textarea class="form-control" rows="5" cols="40" name="dealContent" placeholder="请输入处理内容"
									 id="alarmDealModal_deal_dealContent"></textarea>
							</div>
						</div>
						<input type="hidden" name="alarmId" id="alarmDealModal_deal_alarmId" value="">
						<input type="hidden" name="id" id="alarmDealModal_deal_alarmDealId" value="">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary mw-100" id="saveAlarmDealBtn">处理</button>
					<button type="button" class="btn btn-default mw-100"
						data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

<!-- 查看告警处理 -->
	<div class="modal fade" id="alarmDealModal_show">
		<div class="modal-dialog w600">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">查看处理</h4>
				</div>
				<div class="modal-body">
					<div class="oy-a mah-300">
						<form class="form-horizontal form-preset p-tb25" action="">
							<div class="form-group">
								<label class="col-md-4 control-label" title="处理人" >处理人：</label>
								<div class="col-md-6">
									<label id="alarmDealModal_show_dealUserName" class="control-label" title="" ></label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label" title="处理账号">处理账号：</label>
								<div class="col-md-6">
									<label id="alarmDealModal_show_dealAccount" class="control-label" title="" ></label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label" title="处理时间">处理时间：</label>
								<div class="col-md-6">
									<label id="alarmDealModal_show_dealTime" class="control-label" title="" ></label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label" title="处理内容">处理内容：</label>
								<div class="col-md-6">
									<label id="alarmDealModal_show_dealContent" class="p-t7" title="" ></label>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


<!-- custom --> 
<script src="webpage/resource/js/custom.js"></script> 
<script style="text/javascript">
	//定时查询未读告警时间（单位：毫秒）
	var searchTime = 20000;
	var intervalUnRead_id;
	
	var alarmFilterHistory = [];
	
	var filterModalFlag = true;
	
	var lowerLevel= 0; //是否查询下级设备
	
	var alarm_startTime_history = laydate.now(-30,'YYYY-MM-DD');
	var alarm_endTime_history = laydate.now(new Date().getTime(),'YYYY-MM-DD');
	
	$(document).ready(function(){
		
		var locale='zh';
		
		setJsLanguage(locale);
        
		//报警声音控制
		$("#alarmSound").iCheck().on("ifClicked",function(){
			if(!$("#alarmSound").attr("checked")){
				SetCookie("alarmSoundFlag", 1);
				if($("input[name='markAlarmId']").length>0){
					audioPlay("webpage/resource/media/alarm.wav");//播放
				}
			}else{
			    audioPlay("");//暂停
				SetCookie("alarmSoundFlag", 0);
			}
		});
		
		$("#lowerLevel").iCheck().on("ifChecked",function(event){
			lowerLevel=1;
			getAlarmInfoList(true,1);
		}).on("ifUnchecked",function(even){
			lowerLevel=0;
			getAlarmInfoList(true,1);
		});
		
		$("#alarm_startTime").focus(function(){
			laydate({
				  elem: '#alarm_startTime',
				  format: 'YYYY-MM-DD', //日期格式
				  min:laydate.now(-90,'YYYY-MM-DD'),
				  max:laydate.now(new Date().getTime(),'YYYY-MM-DD'),
				  event: 'focus', //响应事件。
				  choose: function(dates){
					  var time =  new Date(dates.replace('-',"/").replace('-',"/")).getTime();
					  if($("#alarm_endTime").val() && new Date($("#alarm_endTime").val().replace('-',"/").replace('-',"/")).getTime() < time){
						  layer.msg($.i18n.prop("comm.StarttimegtEndtime"));
						  $('#alarm_startTime').val(alarm_startTime_history);
						  return;
					  }
					  getAlarmInfoList(true,1);
				  }
				});
		});
		$("#alarm_endTime").focus(function(){
			laydate({
				  elem: '#alarm_endTime',
				  format: 'YYYY-MM-DD', //日期格式
				  min:laydate.now(-90,'YYYY-MM-DD'),
				  max:laydate.now(new Date().getTime(),'YYYY-MM-DD'),
				  event: 'focus', //响应事件。
				  choose: function(dates){
					  var time =  new Date(dates.replace('-',"/").replace('-',"/")).getTime();
					  if($("#alarm_startTime").val() && new Date($("#alarm_startTime").val().replace('-',"/").replace('-',"/")).getTime() > time){
						  layer.msg($.i18n.prop("comm.StarttimegtEndtime"));
						  $('#alarm_endTime').val(alarm_endTime_history);
						  return;
					  }
					  getAlarmInfoList(true,1);
				  }
				});
		});
		
		$("#alarm_startTime").val(alarm_startTime_history);
		$("#alarm_endTime").val(alarm_endTime_history);
		
		var alarmSoundFlag = getCookie("alarmSoundFlag");
		if(alarmSoundFlag && alarmSoundFlag == 0){
			$("#alarmSound").iCheck('uncheck');
		}else{
			$("#alarmSound").iCheck("check");
		}
		//alarmFilter();
		
		//getAlarmInfoList(true,1);
		
		// setInterval(function(){
			// getAlarmInfoList(false,2);
		// },5000);
		
		$('#alarmFilterModal').on('hidden.bs.modal', function (e) {
			if(filterModalFlag){
				cancleSelect();
			}
		});
		//app用户隐藏下级告警选项
		if("8"=="3"){
			$("#lowerLevelSpan").remove();
		}
	});
	
	var header='customerManagement';
	$("#"+header).addClass("active");
	
	$('.js-select').easyDropDown(); //easydropdown
	
	
	function setLanguage(locale){
		$.post("/setLanguage?locale="+locale,function(Ret){
			window.location.reload();
		});
	}
	
	//退出登录
	$("#logout").click(function(){
		window.location.href=_ctx+"/j_spring_cas_security_logout";
	});
	
	function getCookie (cookieName) {
		var cookieValue = '';
		var posName = document.cookie.indexOf(escape(cookieName) + '=');
		if (posName != -1) {
			var posValue = posName + (escape(cookieName) + '=').length;
			var endPos = document.cookie.indexOf(';', posValue);
			if (endPos != -1) cookieValue = unescape(document.cookie.substring(posValue, endPos));
			else cookieValue = unescape(document.cookie.substring(posValue));
		}
		if(cookieValue=='')return null;
		return (cookieValue);
	}

	//设置Cookie
	function SetCookie (cookieName, cookieValue) {
		var Days = 14;
		var exp = new Date();
		exp.setTime(exp.getTime() + Days*24*60*60*1000);
		document.cookie = cookieName + "="+ escape (cookieValue) + ";expires=" + exp.toGMTString()+";path=/";
	}
	//删除cookie
	function delCookie(name)
	{
	    var exp = new Date();
	    exp.setTime(exp.getTime() - 1);
	    var cval=getCookie(name);
	    if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString()+";path=/";
	}
	
	
	function AlarmInfofilter(){
		var check = $("input[name='alarm_item']");
		var flag = false;
		var statusStr = "";
		$.each(check,function(i,v){
			if($(v).attr("checked")){
				flag = true;
				statusStr += $(v).val()+",";
			}
		});
		if(flag){
			if(statusStr){  //处理记忆
				statusStr = statusStr.substring(0, statusStr.length-1);
				$.ajax({
					url:"/alarmInfo/saveAlarmType",
					data: {"statusStr":statusStr},
				    dataType: 'json',
				    success: function(ret){
				    	filterModalFlag = false;
						getAlarmInfoList(true,1);
						$("#alarmFilterModal").modal('hide');
				    },
				    complete:function(XMLHttpRequest, textStatus){
// 						authorityValide(XMLHttpRequest);
						if(XMLHttpRequest.responseText){
							var data = eval('('+XMLHttpRequest.responseText+')');
							if(data.code == -1000){
								layer.msg($.i18n.prop('cust.VirtualAccountPermissionDenied'),{icon:2});
								cancleSelect();
							}
						}
						
					}
				});
			}
		}else{
			layer.msg($.i18n.prop('Business.Pleaseselectthetypeofalarm'));
		}
	}
	
	
	//点击个人资料跳转到用户信息页面
	$("#personalData").click(function(){
		window.location.href="/useradmin/userDetail";
	});
	
	//点击修改密码跳转到修改密码页面
	$("#changePwd").click(function(){
		window.location.href="/useradmin/changePwd";
	});
	
	//当前告警覆盖物
	var currentAlarmMaker;
	function bindAlarmInfo(bdlat,bdlng,gglat,gglng,alarmInfoIndex){
		if($("#index").hasClass("active")){
			if($("#selectMap").val()=="baiduMap"){
				var stopFlagIcon=_ctx+"webpage/resource/images/36x43/alarm.png";
				var stopFlagLable = new BMap.Label("", {
					offset : new BMap.Size(-27, -27)
				});
				var stopFlagPoint =new BMap.Point(bdlng, bdlat);
				var stopFlagMaker = new BMap.Marker(stopFlagPoint, {
					icon : new BMap.Icon(stopFlagIcon, new BMap.Size(23, 27)),
					offset : new BMap.Size(6,-12),
					imageOffset : new BMap.Size(0,0)
				});
				if(currentAlarmMaker&&currentAlarmMaker.position==null){
					allMap.removeOverlay(currentAlarmMaker);
				}
				allMap.addOverlay(stopFlagMaker);
				currentAlarmMaker=stopFlagMaker;
				(function(stopFlagMaker,alarmInfoIndex){
					stopFlagMaker.addEventListener("click",function(e){
						showBaiduStopAlarmInfo(stopFlagMaker,alarmInfoIndex);
					});
				})(stopFlagMaker,alarmInfoIndex);
				showBaiduStopAlarmInfo(stopFlagMaker,alarmInfoIndex);
			}else{
				var stopFlagIcon = {url:_ctx+"webpage/resource/images/36x43/alarm.png" ,size:new google.maps.Size(23, 27),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(3,26)};
				googleMarker=new google.maps.Marker({
					position :new google.maps.LatLng(gglat,gglng),
					icon : stopFlagIcon,
					map : allMap
				});
				if(currentAlarmMaker&&currentAlarmMaker.position!=null){
					currentAlarmMaker.setMap(null);
				}
				currentAlarmMaker=googleMarker;
				(function(googleMarker,alarmInfoIndex){
					google.maps.event.addListener(googleMarker, 'click', function() {
						showGoogleStopFlag(googleMarker,alarmInfoIndex);
					});
				})(googleMarker,alarmInfoIndex);
				showGoogleStopFlag(googleMarker,alarmInfoIndex);
			};
		}
	}
	
	var prev_infowindow = null;
	var prev_maker = null;//告警信息图标
	//百度地图点击告警信息事件
	function showBaiduStopAlarmInfo(stopFlagMaker,alarmInfoIndex){
// 		if($("#addr"+alarmInfoIndex).text()==""||$("#addr"+alarmInfoIndex).text()==null){
// 			getPointBaiDuLocation(stopFlagMaker.point,"addr"+alarmInfoIndex);
// 			if($("#addr"+alarmInfoIndex).text()==""||$("#addr"+alarmInfoIndex).text()==null){
// 				$("#addr"+alarmInfoIndex).text("获取地址失败！");
// 			}
// 		}
		var datas={devName:$('#devName'+alarmInfoIndex).html(),alertType:$('#alertType'+alarmInfoIndex).html(),speed:$('#speed'+alarmInfoIndex).html(),alertTime:$('#alertTime'+alarmInfoIndex).html(),positionTime:$('#positionTime'+alarmInfoIndex).html(),alarmInfoIndex:alarmInfoIndex};
		getPointBaiDuLocation(stopFlagMaker.point,"addr"+alarmInfoIndex);

		var tpl = template('alarmInfoTpl',datas);
		
		var portrait=276;//加上减下
		
		var _gDialog = new BMapLib.InfoBox(allMap, tpl, {
			boxStyle : {
				width : "508px",
				height : "0px"
			},
			offset : new BMap.Size(0 ,portrait),
			// 直接隐藏官方关闭按钮
			closeIconMargin : "2px;display:none;",
			closeIconUrl : _ctx + "webpage/resource/images/close.png",
			enableAutoPan : true,
			align : INFOBOX_AT_TOP
		});
		
		allMap.addOverlay(_gDialog);
		_gDialog.open(stopFlagMaker);
		$(_gDialog._div).find(".popover-close").click(function() {
			_gDialog.hide();
		});
		
		if (prev_infowindow) {
			prev_infowindow.close();
		}
		prev_infowindow=_gDialog;
		prev_maker=stopFlagMaker;
		prev_maker.setZIndex(10000);
	}
	
	//谷歌地图点击告警信息事件
	function showGoogleStopFlag(googleMarker,alarmInfoIndex){
// 		$("#addr"+alarmInfoIndex).text("");
// 		getGoogleLocation(googleMarker.position,"addr"+alarmInfoIndex);
// 		if($("#addr"+alarmInfoIndex).text()==""||$("#addr"+alarmInfoIndex).text()==null){
// 			$("#addr"+alarmInfoIndex).text("获取地址失败！");
// 		}
		var datas={devName:$('#devName'+alarmInfoIndex).html(),alertType:$('#alertType'+alarmInfoIndex).html(),speed:$('#speed'+alarmInfoIndex).html(),alertTime:$('#alertTime'+alarmInfoIndex).html(),positionTime:$('#positionTime'+alarmInfoIndex).html(),alarmInfoIndex:alarmInfoIndex};
		window.setTimeout(function (){
			getGoogleLocation(googleMarker.position,"addr"+alarmInfoIndex);
		},500);
		
		var tpl = template('alarmInfoTpl',datas);
		var content = $(tpl);
		var portrait=-291;//减上加下
		
		var infowindow = new InfoBox({
			content : content.get(0),
			disableAutoPan : false,
			maxWidth : 0,
			pixelOffset : new google.maps.Size(-246, portrait),//加右减左
			zIndex : null,
			closeBoxURL : "",
			isHidden : false,
			pane : "floatPane",
			enableEventPropagation : false
		});
		
		content.find(".popover-close").click(function() {
			InfoWindow_falg = false;
			infowindow.close();
		});
		
		if (prev_infowindow) {
			prev_infowindow.close();
		}
		infowindow.open(allMap,googleMarker);
		prev_infowindow=infowindow;
		prev_maker.setZIndex(10000);
	}
	
	
	var requestThread = 0 ;
	//告警管理
	function getAlarmInfoList(flag,updateListFlag){
		var statusStr = "";
		if($("#alarmTypeTable li").length > 0){
			var check = $("input[name='alarm_item']");
			$.each(check,function(i,v){
				if($(v).attr("checked")){
					statusStr += $(v).val()+",";
				}
			});
		}
		if(statusStr){
			statusStr = statusStr.substring(0, statusStr.length-1);
		}
		
		//从客户树选择时，根据选择的客户刷新告警信息列表
		var treeObject = $.fn.zTree.getZTreeObj("treeDemo");
		var searchUserId=0;
		if(treeObject!=null){
		   var node = treeObject.getSelectedNodes()[0];
		   if(node!=null){
				if(lowerLevel==1){  
					searchUserId =  node.fullParentId+node.id;
				}else{
					searchUserId = node.id;
				}
			}
		}
		//异步请求，最后一次请求参数，保证响应回来的数据是正确
		requestThread++;  
		
 		$.ajax({
			url:"rest/customControl/alertInfo",
			data: {"pageNo":1,"pageSize":50,"statusStr":statusStr,"updateListFlag":updateListFlag,"lowerLevel":lowerLevel,"searchUserId":searchUserId,"requestThread":requestThread,"startTime":$("#alarm_startTime").val(),"endTime":$("#alarm_endTime").val()},
			async: true,
		    cache: false,
		    type:"post",
		    dataType: 'json',
		    beforeSend:function(XHR){
				if(flag){
					$("#alarm_nodata").hide();
			    	$('#alarmInfoTable').hide();
					$("#alarm_logindata").show();
				}
			},
		    complete: function(){
				$("#alarm_logindata").hide();
		    	$('#alarmInfoTable').show();
		    	if($("#alarmMessage").is(":visible")){
		    		tableHeaderAutoWidth("#alarmMessageTableHeader","#alarmMessageTableContent");
		    	}
		    },
		    success: function(ret){
		    	//定时刷新 和 多次请求没有及时响应的，保持最后一次响应的结果
		    	if( (ret && ret.code == -2)|| (parseInt(ret.totalDistiance)<requestThread) ){
		    		return;
		    	}
		    	// 去闪灯和提示音
		    	$(".js-alarm-toggle-btn").removeClass("active");
    			audioPlay("");
    			
		    	if(ret && ret.code==0  && ret.data.length>0 ){
		    		//有数据返回并且是同一请求
	    			$('#alarmInfoTable').html(template('alarmInfoList',{"data" : ret.data}));//装填数据
	    			var unread = false;
	    			var imeiMap = new Map();
	    			$.each(ret.data,function(i,v){
	    				if(v.readStatus == -1){
	    					unread = true;
	    				}
	    				if(v.readStatus == -1 && !imeiMap.get(v.imei)){
	    					imeiMap.put(v.imei);
	    				}
	    			});
	    			$("#carAlarm").text(imeiMap.arr.length);
	    			if(unread){
	    				$(".js-alarm-toggle-btn").addClass("active");
	    				if($("#alarmSound").attr("checked")){//播放
		    				audioPlay("/resource/media/alarm.wav");
    					}
	    			}
	    			$("#alarmMessage").show();
		    	}else{//清空列表,ret.code=-1加载列表没有数据返回,updateListFlag非法操作不等于1、2
		    		$("#alarmMessage").show();
		    		$('#alarmInfoTable').html(template('alarmInfoList',null));
		    		$("#alarm_nodata").show();
		    		return;
		    	}
		    }
		    
		});		
	}
	
	//告警内容筛选
	function alarmFilter(){
		if($("#alarmTypeTable li").length == 0){
			$.ajax({
				url:"/alarmInfo/getAllAlarmType",
				async: false,
			    cache: false,
			    dataType: 'json',
			    complete: function(){
			    	if($("#alarmMessage").is(":visible")){
			    		tableHeaderAutoWidth("#alarmMessageTableHeader","#alarmMessageTableContent");
			    	}
			    },
			    success: function(ret){
			    	if(ret && ret.code==0){
			    		if(ret.data && ret.data.length>0){
			    			$('#alarmTypeTable').html(template('alarmTypeList',{"data" : ret.data}));//装填数据
			    			checkboxSelectLine("#alarmAllSelect","input[name='alarm_item']");
			    			//告警类型回选处理
			    			if(ret.msg){
			    				$.each(ret.msg.split(","),function(index,value){
				    			     $("input[name='alarm_item'][value='"+value+"']").iCheck('check')
				    			});
			    			}else{//默认选择
			    				$("#alarmAllSelect").iCheck('check');
				    			$("input[name='alarm_item']").iCheck('check');
				    			$("input[name='alarm_item'][value='ACC_ON']").iCheck('uncheck');
				    			$("input[name='alarm_item'][value='ACC_OFF']").iCheck('uncheck');
			    			}
			    		}
			    	}
			    }
			});
		}
		alarmFilterHistory = [];
		filterModalFlag = true;
		$.each($("input[name='alarm_item']"),function(i,v){
			if($(v).attr("checked")){
				alarmFilterHistory.push($(v).val());
			}
		});
	}
	
	function cancleSelect(){
		$("#alarmAllSelect").iCheck("uncheck");
		$("input[name='alarm_item']").iCheck("uncheck");
		$.each(alarmFilterHistory,function(i,v){
			$("input[name='alarm_item'][value='"+v+"']").iCheck("check");
		});
		if(alarmFilterHistory.length == $("input[name='alarm_item']").length){
			$("#alarmAllSelect").iCheck("check");
		}
	}
	
	
	//标为已读、全部标为已读
	function readAlarm(alarmId){
		if(!alarmId){
			$.each($("input[name='markAlarmId']"),function(i,v){
				if($(v).val()){
					alarmId += $(v).val()+",";
				}
			});
			if(!alarmId){
				layer.msg($.i18n.prop('Business.Notunreadmessage'));
				return ;
			}
		}
		$.ajax({
			url:"/alarmInfo/saveAlarmInfoHasRead",
			data: {"alarmId":alarmId},
			async: true,
		    cache: true,
		    dataType: 'json',
		    success: function(ret){
	    		if(ret && ret.code == 0){
					layer.msg($.i18n.prop("comm.Operationdone"),{icon:1});    			
			    	getAlarmInfoList(true,1);//刷新列表
	    		}else{
	    			layer.msg($.i18n.prop("comm.Failed"),{icon:2});    
	    		}
		    },
		    complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});
	}
	
	//处理告警
	function dealAlarm(alarmId){
		if(alarmId){
			$("#alarmDealModal_deal").modal();
			$("#alarmDealModal_deal_alarmId").val(alarmId);
			
			$("#alarmDealModal_deal_alarmDealId").val("");
			$("#alarmDealModal_deal_alarmDealId").removeClass("error");
			$("label[for='alarmDealModal_deal_inputDealUserName']").remove();
			
			$("#alarmDealModal_deal_inputDealUserName").val("");
			$("#alarmDealModal_deal_inputDealUserName").removeClass("error");
			$("label[for='alarmDealModal_deal_inputDealUserName']").remove();
			
			$("#alarmDealModal_deal_dealContent").val("");
			$("#alarmDealModal_deal_dealContent").removeClass("error");
			$("label[for='alarmDealModal_deal_dealContent']").remove();
			
			validateAlarmDealForm();
		}
	}
	
	//查看处理
	function showAlarm(dealUserAccount,inputDealUserName,creationDate,dealContent){
		$("#alarmDealModal_show").modal();
		$("#alarmDealModal_show_dealAccount").text(dealUserAccount);
		$("#alarmDealModal_show_dealAccount").attr("title",dealUserAccount);
		
		$("#alarmDealModal_show_dealUserName").text(inputDealUserName);
		$("#alarmDealModal_show_dealUserName").attr("title",inputDealUserName);
		
		$("#alarmDealModal_show_dealTime").text(creationDate);
		$("#alarmDealModal_show_dealTime").attr("title",creationDate);

		$("#alarmDealModal_show_dealContent").text(dealContent);
		$("#alarmDealModal_show_dealContent").attr("title",dealContent);
	}
	
	$("#saveAlarmDealBtn").click(function(){
		saveAlarmDeal();
	});
	
	function saveAlarmDeal(){
		if($("#alarmDealForm").valid()){
			$.ajax({
				url:"/alarmInfo/saveAlarmDeal",
				data: $("#alarmDealForm").serialize(),
				async: true,
			    cache: true,
			    dataType: 'json',
			    type:"post",
			    success: function(ret){
		    		if(ret && ret.code == 0){
				    	$("#alarmDealModal_deal").modal('hide');
						layer.msg($.i18n.prop("comm.Operationdone"),{icon:1}); 
				    	getAlarmInfoList(true,1);//刷新列表
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
	function validateAlarmDealForm(){
		$("#alarmDealForm").validate({
			rules:{
				inputDealUserName:{
					required: false ,
					maxlength:50
				},
				dealContent:{
					required: false,
					maxlength : 500
				}
			},
			messages:{
				inputDealUserName:{
					maxlength: $.i18n.prop("Alert.Processing.ProcessingHanderNameLengthValid")
				},
				dealContent:{
					maxlength : $.i18n.prop('Alert.Processing.ProcessingContentLengthValid')
				}
			},
			errorPlacement: function(error, element){
				error.appendTo(element.parent());
			}
		});
	}
	
	function openDeviceInfoModal(imei){
		var ev = window.event || arguments.callee.caller.arguments[0];
		if (window.event) {
			ev.cancelBubble = true;
		} else {
			ev.stopPropagation();
		}
		complex_buildDeviceInfoForm("alarm",imei,"alarmDeviceInfo");
	}
	
	
</script> 
<!-- 添加用户 -->
<div class="modal fade" id="addRole">
  <div class="modal-dialog">
    <div class="modal-content w800">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="customerTitle">客户信息</h4>
      </div>
      <div class="modal-body">
        <div class="p-tb15 mah-400 oy-a">
          <form id="userForm" class="form-horizontal form-preset form-sm mh-300">
            <input type="hidden" id="parentId"/>
          	<input type="hidden" id="fullParentId">
          	<input type="hidden" id="userId">
          	<div class="form-group" style="display: none;">
              <label  class="col-md-3 control-label" title="上级用户"><span class="c-red">*</span>上级用户：</label>
              <div class="col-md-4">
                <fieldset id="selectRole">
                  <!-- <div class="input-group"> -->
                    <input id="topUser" name="topUser" type="text" class="form-control form-control-sm " value="" readonly>
                   <!--  <span class="input-group-btn">
                    <button type="button" class="btn btn-default btn-sm direction-btn"></button>
                    </span> </div> -->
                </fieldset>
              </div>
              <div class="col-md-5 pr">
                <div class="pa p-10 tree-role-box" id="treeRoleBox">
				  <div class="tree-search"> 
				  	  <i class="tree-search-icon" id="treeDemo2_cusTreeSearchBtn"></i>
	                  <input type="text" placeholder="请输入客户名称或帐号"  id="treeDemo2_cusTreeKey" value="" class="empty fs-12"/>
	               </div>
                  <div class="tree-scroll-role auto-scrollbar h350">
                    <ul id="treeDemo2" class="ztree">
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label  class="col-md-2 control-label" title="客户类型"><span class="c-red">*</span>客户类型：</label>
              <div class="col-md-3">
                <div class="p-tb8">
                  
                   <label class="icheck-min" id="labelGroup">
                    <input type="radio" name="roleRadio" value="1">&nbsp;集团账号</label>&emsp;
                  
                  <label class="icheck-min" id="labelCompany">
                    <input type="radio" name="roleRadio"  value="3">&nbsp;分公司</label>&emsp;
                    
                  <label class="icheck-min" id="labelDistributor">
                    <input type="radio" name="roleRadio" value="8">&nbsp;经销商</label>&emsp;
                  
                  <label class="icheck-min" id="labelUser">
                    <input type="radio" name="roleRadio"  value="9">&nbsp;车辆账号</label>
                </div>
              </div>
              <label  class="col-md-2 control-label" title="客户名称"><span class="c-red">*</span>客户名称：</label>
              <div class="col-md-3">
                <input id="nickName" name="nickName" maxlength="50" type="text" class="form-control form-control-sm" placeholder="请输入用户名称"/>
              </div>
            </div>   
            <div class="form-group">
              <label  class="col-md-2 control-label" title="登录账号"><span class="c-red">*</span>登录账号：</label>
              <div class="col-md-3">
                <input id="account" name="account"  maxlength="30" type="text" class="form-control form-control-sm" placeholder="请输入账号"/>
              </div>
            <div id="markPassword">
              <label  class="col-md-2 control-label" title="密码"><span class="c-red">*</span>密码：</label>
              <div class="col-md-3">
                <input id="password" name="password" type="password" class="form-control form-control-sm" placeholder="请输入密码" " />
              </div>
            </div>
            </div>
            <div class="form-group">
              <label  class="col-md-2 control-label" title="电话" ><span class="c-red"></span>电话：</label>
              <div class="col-md-3">
                <input id="phone" name="phone" maxlength="20" type="text" class="form-control form-control-sm" placeholder="请输入电话号码"/>
              </div>
              <label  class="col-md-2 control-label" title="邮箱" ><span class="c-red"></span>邮箱：</label>
              <div class="col-md-3">
                <input id="email" name="email" type="text" class="form-control form-control-sm" placeholder="请输入邮箱" maxlength="50" />
              </div>
            </div>
            <div class="form-group">
				<label class="col-md-2 control-label" title="联系人">
					出货点：
				</label>
				<div class="col-md-3">
					<input id="address" name="address" type="text"
						class="form-control form-control-sm"
						placeholder="请输入地址" maxlength="50"  />
				</div>
			<label class="col-md-2 control-label" title="联系人">
					经度：
				</label>
				<div class="col-md-3">
					<input id="address_lon" name="address" type="text"
						class="form-control form-control-sm"
						placeholder="请输入经度地址" maxlength="50"  />
				</div>
				</div>
				<div class="form-group">
				<label class="col-md-2 control-label" title="联系人">
					纬度：
				</label>
				<div class="col-md-3">
					<input id="address_lat" name="address" type="text"
						class="form-control form-control-sm"
						placeholder="请输入纬度地址" maxlength="50"  />
				</div>
				<label class="col-md-2 control-label" title="区域">
					区域：
				</label>
				<div class="col-md-3" >
					<span class="easydropdown easydropdown-sm easydropdown-full va-m">
					<select id="area" name="area" class="complex-area-select-add"> 
						<option value="省内基地" title="默认"  class="selected">省内基地</option>
						<option value="广东区域" title="默认"  >广东区域</option>
						<option value="广西区域" title="默认"  >广西区域</option>
						<option value="江西区域" title="默认"  >江西区域</option>
						<option value="湖南区域" title="默认"  >湖南区域</option>
						<option value="江苏区域" title="默认"  >江苏区域</option>
						<option value="浙江区域" title="默认"  >浙江区域</option>
						<option value="上海区域" title="默认"  >上海区域</option>
						<option value="皖北区域" title="默认"  >皖北区域</option>
						<option value="陕甘区域" title="默认"  >陕甘区域</option>
						<option value="川渝区域" title="默认"  >川渝区域</option>
						<option value="云南区域" title="默认"  >云南区域</option>
						<option value="贵州区域" title="默认"  >贵州区域</option>
					</select>
				</span>
				</div>
				</div>
	             <!-- <div class="form-group discount dn">
	              <label  class="col-md-3 control-label text-ellipsis" title="充值权限">充值权限：</label>
	              <div class="col-md-4">
	                <label class="icheck-min text-ellipsis p-tb5" title="授权"><input id="recharge" name="recharge" type="checkbox" />&nbsp;授权</label>
	              	<div class="show-discount-inp dn">
	               	 <input id="discount" name="discount"  maxlength="4"  title="请输入折扣(0.01~1)" type="text" class="form-control form-control-sm" placeholder="请输入折扣(0.01~1)"/>
	             	 </div>
	              </div>
	              
	            </div>
	            <div class="form-group recharge">
	              <label  class="col-md-3 control-label" title="登录权限">登录权限：</label>
	              <div class="col-md-2 p-tb5 p-r0">
	                <label class="icheck-min text-ellipsis" title="Web登录权限"><input id="webLogin" name="webLogin" type="checkbox" checked="checked"/>&nbsp;Web登录权限</label>
	              </div>
	              <div class="col-md-2 p-tb5">
	              	<label class="icheck-min text-ellipsis" title="APP登录权限"><input id="appLogin" name="appLogin" type="checkbox" checked="checked"/>&nbsp;APP登录权限</label>
	              </div>
	            </div>
	            <div class="form-group recharge">
	              <label  class="col-md-3 control-label" title="指令权限">指令权限：</label>
	              <div class="col-md-2 p-tb5 p-r0">
	                <label class="icheck-min text-ellipsis" title="批量下发指令">
	                <input id="isBatchSendIns" name="isBatchSendIns" type="checkbox" />&nbsp;批量下发指令
	               	</label>
	              </div>
	              <div class="col-md-2 p-tb5">
	              	<label class="icheck-min text-ellipsis" title="批量下发工作模式">
	              	<input id="isBatchSendFM" name="isBatchSendFM" type="checkbox" />&nbsp;批量下发工作模式</label>
	              </div>
	            </div>
	            
            <div class="form-group" style="display: none;">
              <label  class="col-md-3 control-label" title="语言" >语言：</label>
              <div class="col-md-4 easydropdown easydropdown-large">
               	 <select class="language" name="language">
					<option value="zh" >中文</option>
					<option value="en" selected="selected">英文</option>
				 </select>
              </div>
            </div>-->
          </form>
        </div>
      </div>
      <div class="modal-footer">
        <button id="addUserBtn" type="button" class="btn btn-primary mw-100" onclick="saveUser();">保存</button>&nbsp;
        <button id="updateUserBtn" type="button" class="btn btn-primary mw-100" onclick="updateUser();">保存</button>
        <button type="button" class="btn btn-default mw-100" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>


<!-- 批量转移到 -->


<div class="modal fade" id="trans-cust">
	<div class="modal-dialog">
    <div class="modal-content w800">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="trans-cust-title">转移客户</h4>
      </div>
      <div class="modal-body">
        <div class="p-tb15 mah-450 oy-a transfer-customer-box" id="appendAfrom">
        </div>
      </div>
      <div class="modal-footer">
        <a id="transCustBtn_id" onclick="pl_transCustBtnSave('transCustom_tree_transCust2','transCust2')" class="btn btn-primary mw-100" >保存</button>
        <a class="btn btn-default mw-100" data-dismiss="modal">取消</a>
      </div>
    </div>
  </div>
</div>

<!--设备详情-->
<div id="editDevice" class="modal fade in"  aria-hidden="false">
  <div class="modal-dialog" >
    <div class="modal-content w900">
      <div class="modal-header">
        <button aria-label="Close" data-dismiss="modal" class="close" type="button">
          <span aria-hidden="true">×</span>
        </button>
        <h4 class="modal-title">
     		设备编辑
        </h4>
      </div>
      <div class="modal-body">
        <div class="h450 oy-a" id="edit_device_info_customer">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-sm btn-primary mw-100" type="button" id="btn-submit-vehilebund" onclick="complex_device_info_submit('customer','editDevice')">保存</button>&nbsp;
        <button data-dismiss="modal" class="btn btn-sm btn-default mw-100" type="button">取消</button>
      </div>
    </div>
  </div>
</div>

<!-- IMEI添加状态 -->
<div class="modal fade" id="addResultsModal">
  <div class="modal-dialog">
    <div class="modal-content w600">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
        <h4 class="modal-title">
          添加状态
        </h4>
      </div>
      <div class="modal-body">
        <div class="">
          <div>
            <p>
              当前添加成功&nbsp;&nbsp;<b class="c-72af2d"><span id="succCount"></span></b>
              , 失败 &nbsp;&nbsp;<b class="c-red"><span id="failCount"></span></b> 
            </p>
          </div>
          <div class="oy-a mah-300">
            <table class="table table-condensed table-ellipsis">
              <thead class="bc-eee">
                <th width="50%" title="IMEI">IMEI</th>
                <th width="20%" title="状态">状态</th>
                <th title="原因">原因</th>
              </thead>
              <tbody id="failedList">
              </tbody>
              <script type="text/html" id="failed-info">
				{{if failedArr}}
					{{each failedArr as failObj index}}
						<tr>
							<td title="{{failObj.imei}}">{{failObj.imei}}</td>
							<td title="{{failObj.failed}}"><span class="c-red">{{failObj.failed}}</span></td>
							<td title="{{failObj.failReason}}">{{failObj.failReason}}</td>
						</tr>
					{{/each}}
				{{/if}}
				</script>
            </table>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary mw-100" data-dismiss="modal" id="addResultsModal-close">确定</button>
      </div>
    </div>
  </div>
</div>

<!--批量设置用户到期  开始-->
<div class="modal fade" id="expiration_modal">
	<div class="modal-dialog" id="expiration_modal_mark">
	</div>
</div>
		<script type="text/html" id="expiration_modal_tmp">
		<div class="modal-content w600">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" onclick="javascript:$("#expiration_modal").modal('hide');">&times;</span></button>
				<h4 class="modal-title">
					{{if target=='set'}}
						批量设置用户到期
					{{/if}}
					{{if target=='update'}}
						批量延长用户到期
					{{/if}}
					{{if target=='prolongLife'}}
						批量延长设备至终生
					{{/if}}
				</h4>
			</div>
			<div class="modal-body">
				<div class="p-lr15 row equipment-sales">
					<div class="col-md-12 select-device">
						<label>已添加个数：<span class="c-red" id="addDeviceCount">0</span></label>
						<div class="b1-ccc bc-fafafa p-10">
							<div class="form-control form-control-sm pr imei-textarea-box z-i2">
								<textarea type="text" id="imeiUserexpiration" onkeyup="javascirpt:if($(this).val()){$(this).removeClass('form-control-error')}else{$(this).addClass('form-control-error')}" class="imei-textarea" placeholder="请输入设备IMEI号(多个回车换行)"></textarea>
								<div class="func-btnbar clearfix">
									<div class="fl p-t5">IMEI计数：<span class="dev-num">0</span></div>
									<div id="validImei_loading" class="fl p-t5 p-l15 dn">
										<i class="fa fa-spinner fa-pulse fa-fw fa-1x"></i>
										正在加载数据...
									</div>
									<div class="fr">
										<button class="btn btn-success btn-sm mw-80 js-add-results-btn" type="button" onclick="validImei();">添加</button>&nbsp;&nbsp;
										<button class="btn btn-default btn-sm mw-80 js-close" type="button" >取消</button>
									</div>
								</div>
							</div>
							
							 <div class="table-list-head bc-eee m-t10">
		                        <table id="userExpirationTable_thead" class="table table-condensed table-ellipsis table-td-normal table-noborder m-b0" >
		                          <thead>
		                            <th class="first" title="IMEI">IMEI</th>
		                            <th title="型号">型号</th>
		                            <th title="所属用户">所属用户</th>
		                            <th title="操作">操作</th>
		                          </thead>
		                        </table>
		                      </div>
							<div class="table-list-con oy-a">
								<table id="userExpirationTable_content" class="table table-condensed table-ellipsis table-td-normal table-noborder m-b0">
									<colgroup>
							              <col width="50%">
							              <col>
							              <col>
							              <col>
						              </colgroup>
									<tbody id="userExpirationTable">
									</tbody>
								</table>
							</div>
						</div>
					</div>
					{{if target == "set"}}
					<div class="col-md-12 p-t15 select-validity">
						<lable class="fs-14">用户到期：</lable>
						<span class="d-ib va-m">
			               <input type="text" value="" name="userExpiration" id="aLLUserExpiration" class="form-control form-control-sm" >
	                  	</span>
					</div>
					{{/if}}
					{{if target == "update"}}
					<div class="col-md-12 m-t10 select-validity">
						<lable class="fs-14"><span class="c-red">*</span>用户到期：</lable>
						<span class="easydropdown easydropdown-sm d-ib va-m">
							<select id="extendedTime" class="js-select">
								  <option value="0">请选择</option>
								  <option value="1">一个月</option>
								  <option value="2">两个月</option>
								  <option value="3">三个月</option>
								  <option value="6">半年</option>
								  <option value="12">一年</option>
							</select>
							<input type="hidden" name="extendedExpirationTime" id="extendedExpirationTime">
						</span>
					</div>
					{{/if}}
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mw-100" onclick="updateUserExpiration('{{target}}')">保存</button>&nbsp;
		        <button type="button" class="btn btn-default mw-100" data-dismiss="modal" onclick="javascript:$("#expiration_modal").modal('hide');">取消</button>
		    </div>
		</div>
		</script>
<!--批量设置用户到期 结束-->

<!--批量销售 开始-->
<div class="modal fade  " id="batchSales">
  <div class="modal-dialog">
    <div class="modal-content w970">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">批量销售</h4>
      </div>
      <div class="modal-body">
         <div class="p-15 mh-400 row equipment-sales">
         	 <div class="col-md-12 mh-200" id="complex_user_sale_batchSaleid">
       	  </div>
         </div>
         
      </div>
    </div>
  </div>
</div>
<!--批量销售 结束-->

<!-- 上传模板更新 -->
<div class="modal fade" id="updateTemplate">
  <div class="modal-dialog">
    <div class="modal-content w600">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">更新数据</h4>
      </div>
      <div class="modal-body">
        <div class="p-tb50">
          <ul class="p-lr15 js-update-file-list dn" >
            <li><!-- <span class="fr c-999">75KB</span><i class="fa fa-file-text-o"></i> -->&nbsp;<span id="fileName"></span></li>
          </ul>
          <div class="ta-c js-select-file-box">
            <a href="webpage/resource/deviceInfoTmp_zh.xls" class="btn btn-success btn-lg"><i class="fa fa-arrow-circle-o-down"></i>&nbsp;下载导入模板</a>&emsp;
            <form id="batchUpdateDevForm" class="d-ib pr"  action="rest/deviceControl/batchUpdate" method="post" enctype="multipart/form-data">
            	<a class="oh"><input type="file" class="hide-upload-file" accept=".xls" name="updateTemplateFile" id="updateTemplateFile"></a>
            	<button type="button" class="btn btn-success btn-lg js-select-file-btn"><i class="fa fa-file-text-o"></i>&nbsp;导入更新文件</button>   
            </form>
          </div>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary mw-100" onclick="batchUpdateDev();">确定</button>&nbsp;
        <button type="button" class="btn btn-default mw-100" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>

<div style="display: none;">
	<form id="playBackForm" action="/trackreplay/replay" method="post" target="_blank">
		<input type="hidden" name="start_time" id="start_time"/>
		<input type="hidden" name="end_time" id="end_time"/>
		<input type="hidden" name="userId" id="playBack_userId"/>
		<input type="hidden" name="imei" id="playBack_imei"/>
	</form>
</div>

<!-- 批量用户到期提示 -->
<div class="dn p-15" id="batchSetExpiration">
  <div>
    	当前添加成功	<b class="c-72af2d" id="addImeiSuccess">0</b>失败<b class="c-red" id="addImeiFail">0</b>
  </div>
  <div class="oy-a mah-200">
    <table width="100%" class="table table-condensed table-ellipsis table-td-normal">
      <thead>
	      <tr title="IMEI">
	      	<th width="50%">IMEI</th>
	        <th title="状态" width="20%">状态</th>

	      </tr>
      </thead>
      <tbody id="notExistImeis">
      </tbody>
    </table>
  </div>
</div>

<!-- 批量更新设备提示 -->
<div class="dn p-15" id="batchUpdate">
  <div>
    	当前更新成功<b class="c-72af2d" id="batchUpdateDevSuccess">0</b>失败<b class="c-red" id="batchUpdateDevFail">0</b>
  </div>
  <div class="oy-a mah-200">
    <table width="100%" class="table table-condensed table-ellipsis table-td-normal">
      <thead>
	      <tr title="IMEI">
	      	<th width="50%">IMEI</th>
	        <th title="状态" width="20%">状态</th>
	        <th title="原因">原因</th>
	        <th title="位置">位置</th>
	      </tr>
      </thead>
      <tbody id="batchUpdateDevFailImei">
      </tbody>
    </table>
  </div>
</div>

<script type="text/html" id="addFail_tmp">
	{{each data as row i}}
	<tr>
		<td title="{{row.imei}}">{{row.imei}}</td>
		<td title="失败"><span class="c-red">失败</span></td>
		{{if row.type == "NOTDIGIT"}}<td title="包含非数字">包含非数字</td>{{/if}}
		{{if row.type == "LENGTHERROR"}}<td title="非15位">非15位</td>{{/if}}
		{{if row.type == "ISADD"}}<td title="已添加">已添加</td>{{/if}}
		{{if row.type == "REPEAT"}}<td title="重复">重复</td>{{/if}}
		{{if row.type == "NOTCHILD"}}<td title="非下级用户设备">非下级用户设备</td>{{/if}}
		{{if row.type == "NOACTIV"}}<td title="未激活">未激活</td>{{/if}}
		{{if row.type == "NOTEXIST"}}<td title="不存在">不存在</td>{{/if}}
	</tr>
	{{/each}}
</script>

<script type="text/html" id="addSuccess_tmp">
	{{each data as row i}}
		<tr>
			<td title="{{row.imei}}">{{row.imei}}</td>
			<td title="{{row.mcType}}">{{row.mcType}}</td>
			<td title="{{row.userName}}">{{row.userName}}</td>
			<td><a onclick="deleteCurrentTr(this,'{{row.imei}}')">删除</a></td>
		</tr>
	{{/each}}
</script>

<script type="text/html" id="batchImportFailed_tmp">
	{{each data as row i}}
		<tr>
			{{if row.imei != ""}}<td title="{{row.imei}}">{{row.imei}}</td>{{else}}<td title="无">无{{/if}}
			<td title="失败">失败</td>
			{{if row.failReason == "-2"}}<td title="该设备图标类型不存在">该设备图标类型不存在</td>{{/if}}
			{{if row.failReason == "-1"}}<td title="安装时间不是时间格式">安装时间不是时间格式</td>{{/if}}
			{{if row.failReason == "-3"}}<td title="手机号码长度不正确">手机号码长度不正确</td>{{/if}}
			{{if row.failReason == "0"}}<td title="设备不存在">设备不存在</td>{{/if}}
			{{if row.failReason == "1"}}<td title="设备名称长度超过极限">设备名称长度超过极限</td>{{/if}}
			{{if row.failReason == "3"}}<td title="SIM卡号长度超过极限">SIM卡号长度超过极限</td>{{/if}}
			{{if row.failReason == "4"}}<td title="SN号长度超过极限">SN号长度超过极限</td>{{/if}}
			{{if row.failReason == "5"}}<td title="车牌号长度超过极限">车牌号长度超过极限</td>{{/if}}
			{{if row.failReason == "6"}}<td title="车架号长度超过极限">车架号长度超过极限</td>{{/if}}
			{{if row.failReason == "7"}}<td title="司机名称长度超过极限">司机名称长度超过极限</td>{{/if}}
			{{if row.failReason == "8"}}<td title="电话号码长度超过极限">电话号码长度超过极限</td>{{/if}}
			{{if row.failReason == "9"}}<td title="身份证号长度超过极限">身份证号长度超过极限</td>{{/if}}
			{{if row.failReason == "10"}}<td title="电机/发动机号长度超过极限">电机/发动机号长度超过极限</td>{{/if}}
			{{if row.failReason == "11"}}<td title="备注长度超过极限">备注长度超过极限</td>{{/if}}
			{{if row.failReason == "12"}}<td title="安装时间长度超过极限">安装时间长度超过极限</td>{{/if}}
			{{if row.failReason == "13"}}<td title="安装地址长度超过极限">安装地址长度超过极限</td>{{/if}}
			{{if row.failReason == "14"}}<td title="安装公司长度超过极限">安装公司长度超过极限</td>{{/if}}
			{{if row.failReason == "15"}}<td title="安装位置长度超过极限">安装位置长度超过极限</td>{{/if}}
			{{if row.failReason == "16"}}<td title="安装人员长度超过极限">安装人员长度超过极限</td>{{/if}}
			<td title="{{row.rowNumber}} 行 {{row.columnNumber}} 列">{{row.rowNumber}} 行 {{row.columnNumber}} 列</td>
		</tr>
	{{/each}}
</script>


<div class="dn p-15" id="deviceEWM"></div>

<!-- 设置到期时间未激活 -->
<div class="dn p-15" id="notactiveDiv">
	<div>
    	当前添加成功	<b class="c-72af2d" id="addImeiSuccessInActive">0</b>失败<b class="c-red" id="addImeiFailInActive">0</b>
  </div>
  <div class="oy-a mah-200">
    <table width="100%" class="table table-condensed table-ellipsis table-td-normal">
      <thead>
	      <tr title="IMEI"><th width="50%">IMEI</th>
	        <th title="原因">原因</th>
	        <th title="状态" width="20%">状态</th>
	      </tr>
      </thead>
      <tbody id="notactive">
      </tbody>
    </table>
  </div>
</div>

<!-- 设备指令 -->
<div class="modal fade in" id="command-modal">
<div class="modal-content w800">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 id="myModalLabel" class="modal-title">设备指令</h4>
	</div>
	<div class="modal-body h400 oy-a" id="custom_search_command">
		<!-- 设备指令Form -->
           <jsp page="/WEB-INF/jsp/assets/sendInstructionForm.jsp" >
	</div>
	</div>
</div>
		<!-- 查看围栏 -->
		<div class="modal fade" id="show-fence-table">
			<div class="modal-dialog">
				<div class="modal-content w800">
					<div class="modal-header">
						<button type="button" class="close closeGeo" data-dismiss="modal" aria-hidden="true">×</button>
						<div>查看围栏</div>
					</div>
					<div class="modal-body">
						<div class="p-b10">已设围栏：</div>
			            <div class="b1-ccc bc-fafafa mah-300 oy-a">
			                <table class="table table-condensed table-ellipsis table-td-normal m-b0">
			                  <thead>
			                  	<th width="270" class="first" title="名称">名称</th>
			                  	<th title="进出设置">进出设置</th>
			                  	<th width="180" title="操作" >操作</th>
			                  </thead>
			                  <tbody id="seeGeo_tbody">
								<script type="html/text" id="seeGeo_tmp">
								{{each data as row i}}
		                        <tr id="option{{i}}">
		                            <td>{{row.geoName}}</td>
		                            <td>
										{{if row.status == 'in'}}
										<label class="icheck-min" title="进&nbsp;是否开启"><input type="checkbox" name="icheckGao" class="icheckGao" checked="checked" value="in" />&nbsp;进&nbsp;是否开启</label>&#12288;
										<label class="icheck-min" title="出&nbsp;是否开启"><input type="checkbox" name="icheckGao" class="icheckGao" value="out" />&nbsp;出&nbsp;是否开启</label>
										<input type="hidden" class="statuAndEmailsAndGeoId" value="{{row.emails}},{{row.geoId}},{{row.imei}}">
										{{/if}}
										{{if row.status == 'out'}}
										<label class="icheck-min" title="进&nbsp;是否开启"><input type="checkbox" name="icheckGao"  class="icheckGao" value="in" />&nbsp;进&nbsp;是否开启</label>&#12288;
										<label class="icheck-min" title="出&nbsp;是否开启"><input type="checkbox" name="icheckGao"  class="icheckGao" checked="checked" value="out" />&nbsp;出&nbsp;是否开启</label>
										<input type="hidden" class="statuAndEmailsAndGeoId" value="{{row.emails}},{{row.geoId}},{{row.imei}}">
										{{/if}}
										{{if row.status == 'all'}}
										<label class="icheck-min" title="进&nbsp;是否开启"><input type="checkbox" name="icheckGao"  class="icheckGao" checked="checked" value="in" />&nbsp;进&nbsp;是否开启</label>&#12288;
										<label class="icheck-min" title="出&nbsp;是否开启"><input type="checkbox" name="icheckGao"  class="icheckGao" checked="checked" value="out" />&nbsp;出&nbsp;是否开启</label>
										<input type="hidden" class="statuAndEmailsAndGeoId" value="{{row.emails}},{{row.geoId}},{{row.imei}}">
										{{/if}}
									</td>
		                            <td>
									<a href="javascript:void(0);" onclick="seeGeozone('{{row.geoId}}','{{row.geoName}}','0')" title="查看">
														查看</a>
									&nbsp;<a href="javascript:;" onclick="deleteFen('{{i}}','{{row.imei}}','{{row.alarmType}}','{{row.geoId}}');">移除</a>
									</td>
		                        </tr>
							{{/each}}
							</script>
			                  </tbody>
			                </table>
			                <div id="Geo_nodata"><div class="ta-c c-666 p-tb10"><span class="p-5 d-ib">&nbsp;<i class="fa fa-bell-o"></i> 暂无数据&nbsp;</span></div></div>
			            </div>
					</div>
					<div class="modal-footer geoSaveAndCancel">
						<button type="button" onclick="setFen();" class="btn btn-sm btn-primary mw-100">保存</button>&nbsp;
						<button type="button" class="btn btn-sm btn-default mw-100 cancelGeo">取消</button>
					</div>
				</div>
			</div>
		</div>
<!--查看围栏-->
<div id="viewFenceModal" class="modal fade in" aria-hidden="false">
  <div class="modal-dialog w1000">
    <div class="modal-content" >
      <div class="modal-header">
        <button aria-label="Close viewFenceModalClose" data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title text-ellipsis" id="checkGeo"></h4>
      </div>
      <div class="modal-body p-0">
        <div class="modal-map h500">
          <div id="allmap" >
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/html" id="dev-info">
	{{each result as row i}}
		<tr class="{{row.rowClass}}">
			<td><span class="icheck-min"><input name="devCheck" type="checkbox" value="{{row.imei}}"></span>&nbsp;{{(pageNo-1)*pageSize+(i+1)}}</td>
			<td title="{{row.deviceName}}">{{ if row.bindUserId != null && row.bindUserId != "" }}<i class="fa fa-mobile"></i>&nbsp;&nbsp;{{/if}} {{row.deviceName}} </td>
			<td title="{{row.imei}}">{{row.imei}}</td>
            <td title="{{row.mcType}}">{{row.mcType}}</td>
			<td title="{{if row.activationTime == "" || row.activationTime == null}}未激活{{else}}{{row.activationTime}}{{/if}}">{{if row.activationTime == "" || row.activationTime == null}}未激活{{else}}{{row.activationTime | activeDateFormat}}{{/if}}</td>
			<td title="{{row.sim}}">{{row.sim}}</td>
			<td title="{{if row.userExpirationStr != '' && row.userExpirationStr != null }}{{row.userExpirationStr}}{{else}}未设置{{/if}}"><span class="{{row.tdClass}}">{{if row.userExpirationStr !='' &&row.userExpirationStr != null }}{{row.userExpirationStr}}{{else}}未设置<span name="show-question" class="fa fa-question-circle cp p-l5" rel="popover"></span>{{/if}}</span>&nbsp;</td>
			<td>{{if row.orgName == '默认组' }}默认组{{else}}{{row.orgName}}{{/if}}</td>
			<td title="{{row.bindUserAccount}}">{{row.bindUserAccount}}</td>
			<td class="ov">
				<a title="分配" class="js-editor-users-btn cp" onclick="showSaleModel('{{row.imei}}');">分配</a>
				<a title="更多" class="cp js-user-more-func" onclick="morefunction(this,'{{row.imei}}','{{row.userExpirationStr}}','{{row.bindUserId}}');" data-id="device_{{row.imei}}">更多</a>
			</td>
		</tr>
	{{/each}}
</script>
<script src="webpage/resource/plugins/icheck/icheck.min.js"></script>
<script src="webpage/resource/js/print/jquery.jqprint-0.3.js"></script>
<script type="text/javascript" src="webpage/resource/js/customer/customTree.js"></script>

 <div class="modal fade" id="searchUserEquipment">
    <div class="modal-dialog w970">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="complex_modal_title">设备/用户搜索</h4>
            </div>
            <div class="modal-body mh-500 oy-a">
                <div class="p-15 bc-gray row  modal-user-device-search b-b1-ccc">
		          <div class="js-normal-search-box normal-search">
		            <div class="input-group">
		              <div class="input-group-btn">
		                <div class="easydropdown easydropdown-sm d-ib va-b">
		                  <select class="js-select js-toggle-user-device">
		                    <option value="user">用户</option>
		                    <option value="device">设备</option>
		                  </select>
		                </div>
		              </div>
		              <input type="text" placeholder="IMEI/司机/车牌/设备名称" class="form-control form-control-sm js-modal-user-device-search" onkeypress="javascript:if(event.keyCode==13){complex_basicQuery();return false;}"><span class="input-group-btn"><button type="button" onclick="complex_basicQuery();" class="btn btn-sm btn-primary"><i class="fa fa-search"></i>&nbsp;搜索</button><button type="button" class="btn btn-primary btn-sm js-advanced-search-btn o_8" title="高级 搜索">高级&nbsp;<i class="fa fa-caret-down"></i></button></span>
		            </div>
		          </div>
		          <div class="js-advanced-search-box advanced-search dn">
		            <form id="complex_advanced_search_form" action="" class="form-inline">
		              <input type="hidden" name="queryType" value="device">
		              <div class="form-group fr"><button class="btn btn-default btn-sm js-back-normal-search" type="button"><i class="fa fa-reply"></i>&nbsp;返回</button></div>
		              <div class="form-group  p-b10 ws-n">
		                <label class="label-first" title="选择用户">选择用户：</label>
		                <div class="select-user d-ib  pr z-i3">
		                  <div class="input-group input-group-sm">
		                    <input type="text" id="complex_search_userName" class="form-control js-advanced-search-select-user" placeholder="请选择用户" size="25" readonly>
		                    <input type="hidden" name="userId">
		                    <span class="input-group-btn"><button title="" class="btn btn-default js-advanced-search-select-btn" type="button"><i class="fa fa-caret-down"></i></button></span>
		                  </div>
		                  <div class="js-advanced-select-user-tree-box select-user-tree-box b1-ccc p-10  pa bc-fff">
		                    <div class="oa h300">
	                    	  <div class="tree-search m-t10"> <i class="tree-search-icon" id="complex_globalSearch_btn"></i>
                                <input type="text" id="complex_globalSearch_input" class="empty fs-12" value="" placeholder="请输入客户名称或帐号">
                              </div>
		                      <div id="complex_search_tree_logindata" class="ta-c m-tb15" style="display: none;">
								<i class="fa fa-spinner fa-pulse fa-fw"></i>
								<srping:message code='comm.loadingData'/>
							  </div>
		                      <ul id="complex_search_tree" class="ztree">
		                      </ul>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              &emsp;
		              <div class="form-group  p-b10 ws-n">
		                <label class="label-first" title="基本信息">基本信息：</label>
		                <div class="easydropdown easydropdown-sm d-ib va-t">
		                  <select name="basicType" class="js-select-number-type">
		                    <option selected value="IMEI">IMEI</option>
		                    <option value="VEHICLENUMBER">车牌号</option>
		                    <option value="MCTYPE">设备类型</option>
		                    <option value="SN">SN</option>
		                    <option value="CARFRAME">车架号</option>
		                    <option value="SIM">设备SIM卡号</option>
		                    <option value="DEVICENAME">设备名称</option>
		                  </select>
		                </div>
		                <input type="text" name="keyword" placeholder="请输入IMEI" class="form-control form-control-sm js-search-number-text" size="44"/>
		                <span class="easydropdown easydropdown-sm va-m js-select-mcType-div" id="mcType_dev" style="display: none;"></span>
		              </div>
		              <br/>
		              <div class="form-group ws-n">
		                <label class="label-first" title="日期类型">日期类型：</label>
		                <div class="easydropdown easydropdown-sm va-t">
		                  <select name="dateType" class="js-select-time-type">
		                    <option selected value="ACTIVATION">激活时间</option>
		                    <option value="USEREXPIRATION">用户到期时间</option>
		                    <option value="EXPIRATION">平台到期时间</option>
		                  </select>
		                </div>
		                <span class="js-select-date-stage">
		                  <input type="text" name="startTime" size="12" placeholder="选择日期" class="form-control form-control-sm" id="advancedSearchSelectStartTime"/>
		                  <input type="text" name="endTime" size="12" placeholder="结束时间" class="form-control dn form-control-sm" id="advancedSearchSelectEndTime"/>
		                </span>
		                <label class="icheck-min"><input type="checkbox" name="timeLimit"/>&nbsp;时间段</label>
		              </div>
		              &emsp;
		              <div class="form-group ws-n p-t5">
		                <label>设备状态：</label>
		                <label class="icheck-min"><input type="checkbox" name="statusStr" value="ISEXPIRATION" onclick=""/>&nbsp;欠费</label>&emsp;<label  class="icheck-min"><input type="checkbox" name="statusStr" value="NOACTIVATION"/>&nbsp;未激活</label>
		              </div>
		              &emsp;
		              <div class="form-group">
		                  <button type="button" onclick="complex_advancedSearch('1')" class="btn btn-sm btn-primary js-advanced-search-button"><i class="fa fa-search"></i>&nbsp;搜索&nbsp;</button>&nbsp;
		                  <button type="button" class="btn btn-sm btn-default js-clear-advanced-search">&nbsp;重置&nbsp;</button>&nbsp;
		              </div>
		            </form>
		          </div>
		        </div>
		        <div class="p-15 bc-gray row  modal-mobileUser-search b-b1-ccc">
		          <div class="js-normal-search-box normal-search">
		            <div class="input-group">
		              <input type="text" placeholder="请输入客户名称或帐号" class="form-control form-control-sm js-modal-mobileUser-search" onkeypress="javascript:if(event.keyCode==13){complex_basicQuery('mobileUser');return false;}">
		              <span class="input-group-btn">
		              	<button type="button" onclick="complex_basicQuery('mobileUser');" class="btn btn-sm btn-primary">
		              		<i class="fa fa-search"></i>&nbsp;
		              		搜索
		              	</button>
		              </span>
		            </div>
		          </div>
		        </div>
                <div class="modal-tab js-user-search-con  row ">
                    <div class="oy-a h400 js-user-search-table markLoading">
                    	
                        <table class="table table-condensed table-ellipsis table-td-normal m-b0 c-666">
                            <thead>
	                            <th width="60" title="序号">序号</th>
	                            <th title="客户名称">客户名称</th>
	                            <th title="客户类型">客户类型</th>
	                            <th title="账号">账号</th>
	                            <th title="电话">电话</th>
	                            <th title="设备数量">设备数量</th>
	                            <th width="300" title="操作">操作</th>
                            </thead>
                            <tbody id="complex_user_tbody"></tbody>
                        </table>
                        <div class="p-r15">
	                        <button title="导出" type="button" onclick="complex_export('user')" class="btn btn-default btn-sm user-export-btn js-allocate-prolong-btn fr">导出</button>
	                        <div id="complex_user_table_nodata"><div class="ta-c c-666 m-tb10"><span class="p-5 d-ib">&nbsp;<i class="fa fa-bell-o"></i> 暂无数据&nbsp;</span></div></div>
	                        <div id="complex_paging_user" class="simple-pagination-custom ta-c"></div>
                        </div>
                    </div>

                    <div class="js-user-related-table dn">
                        <div class="modal-tab-nav clearfix">
                            <button class="btn btn-default btn-xs fr js-back-user-search m-t10 m-lr10" type="button"><i class="fa fa-reply"></i>&nbsp;返回列表</button>
                            <ul class="list-fl fl tab tab-auto cp complex_user_tab">
                                <li class="active" title="用户关系"><a>用户关系</a></li>
                                <li title="用户信息"><a onclick="complex_buildUserInfoForm('complexUpdate','complex_user_info');">用户信息</a></li>
                                <li title="销售设备"><a onclick="complex_buildUserSale('complexSale','false','true');">销售设备</a></li>
                                <li title="新增下级用户"><a onclick="complex_buildAddUserForm('complex_addUser_form','complex_addUser_info');">新增下级用户</a></li>
                            	<li title="转移客户"><a onclick="complex_buildTransCustForm('transCust1','complex_trans_cust');">转移客户</a></li>
                            </ul>
                        </div>
                        <div class="modal-tab-con p-t15  oy-a h400">
                            <div class="con markLoading" >
                                <table class="table table-condensed table-ellipsis table-td-normal table m-b0 c-666">
                                    <thead>
	                                    <th width="60"  title="序号">序号</th>
	                                    <th title="客户名称">客户名称</th>
	                                    <th title="客户类型">客户类型</th>
	                                    <th title="账号">账号</th>
	                                    <th title="电话">电话</th>
	                                    <th width="80" title="设备数量">设备数量</th>
	                                    <th width="240" title="操作">操作</th>
                                    </thead>
                                    <tbody id="complex_user_relation_tbody"></tbody>
                                </table>
                            </div>
                            <div class="con markLoading">
                                <div class="p-t15 p-lr15" id="complex_user_info">
                                </div>
                            </div>
                            <div class="con equipment-sales" >
                                <div id="complex_user_sale_complexSale">
                                </div>
                            </div>
                            <div class="con markLoading">
                                <div class="p-t15 p-lr15" id="complex_addUser_info">
                                </div>
                            </div>
                             <div class="con markLoading">
                            	<div id="complex_trans_cust" class="p-lr15 transfer-customer-box">
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-tab js-device-search-con dn  row p-lr15">
		          <div class="js-device-search-table  oy-a mah-400">
		          	
		            <div class="device-search-list-table markLoading">
		              <table class="table table-condensed table-td-normal table-ellipsis m-t15 m-b0 c-666 table-bordered bc-f5f5f5 ">
		                <thead>
		                <th width="60" title="序号">序号</th>
		                <th title="设备名称">设备名称</th>
		                <th width="130" title="IMEI">IMEI</th>
		                <th width="100" title="设备类型">设备类型</th>
		                <th title="激活时间">激活时间</th>
		                <th title="平台到期时间">平台到期时间</th>
		                <th title="用户到期时间">用户到期时间</th>
		                <th title="绑定用户">绑定用户</th>
		                <th width="190" title="操作">操作</th>
		                </thead>
		                <tbody id="complex_device_tbody">
		                </tbody>
		              </table>
		              <div class="pr">
		              	<button title="导出" type="button" onclick="complex_export('device')" class="btn device-export-btn btn-default btn-sm js-allocate-prolong-btn fr">导出</button>
		              	<div id="complex_paging_device" class="simple-pagination-custom ta-c"></div>
		              	<div id="complex_device_table_nodata"><div class="ta-c c-666 m-tb10"><span class="p-5 d-ib">&nbsp;<i class="fa fa-bell-o"></i> 暂无数据&nbsp;</span></div></div>
		              </div>
		            </div>
		          </div>
          <div class="js-device-related-table dn" >
            <div class="modal-tab-nav row clearfix">
              <button class="btn btn-default btn-xs fr js-back-device-search" type="button"><i class="fa fa-reply"></i>&nbsp;返回列表</button>
              <ul class="list-fl fl tab tab-auto cp complex_device_tab">
                <li class="active" title="用户关系"><a >用户关系</a></li>
                <li title="设备信息"><a onclick="complex_buildDeviceInfoForm('compelx');">设备信息</a></li>
                <li title="设备转移"><a onclick="complex_buildUserSale('complexAllot','true','false');">设备转移</a></li>
                <li title="设备指令"><a onclick="complex_showInstruction();">设备指令</a></li>
              </ul>
            </div><!---->
            <div class="modal-tab-con p-t15 oy-a h400">
              <div class="con markLoading" >
                <div class="device-search-list-table">
                  <table class="table table-condensed table-td-normal table-ellipsis table-bordered bc-f5f5f5 ">
                    <thead>
                    <th width="60" title="序号">序号</th>
                    <th title="设备名称">设备名称</th>
                    <th title="IMEI">IMEI</th>
                    <th title="设备类型">设备类型</th>
                    <th title="激活时间">激活时间</th>
                    <th title="平台到期时间">平台到期时间</th>
                    <th title="用户到期时间">用户到期时间</th>
                    <th title="绑定用户">绑定用户</th>
                    <th width="150" title="操作">操作</th>
                    </thead>
                    <tbody id="complex_device_detail_tbody">
                    </tbody>
                  </table>
                </div>
                <div class="user-search-list-table">
                  <div class="b-b1-ddd p-b5">用户关系：</div>
                  <div>
                    <table class="table table-condensed table-td-normal table-ellipsis m-b0 c-666">
                      <thead>
                      <th width="60" title="序号">序号</th>
                      <th title="客户名称">客户名称</th>
                      <th title="客户类型">客户类型</th>
                      <th title="账号">账号</th>
                      <th title="电话">电话</th>
                      <th width="60" title="设备数量">设备数量</th>
                      <th width="200" title="操作">操作</th>
                      </thead>
                      <tbody id="complex_device_user_realtion_tbody">
                      
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              <div class="con markLoading">
                <div class="p-t10" id="edit_device_info_compelx">
                  
                </div>
              </div>
              <div class="con markLoading equipment-sales">
                <div class="row" id="complex_user_sale_complexAllot">
                </div>
              </div>
              
               <!-- 设备指令 -->
               <div class="con markLoading">
                <div class="p-tb15" id="complex_command">
                  <!-- 设备指令Form -->
                  
<script type="text/html" id="sendInstruction-form">
<form action="" class="form-horizontal form-sm" id="instruction-form">
	{{if !hideFlag}}
	<div class="form-group">
		<label class="col-md-2 control-label">设备名称：</label>
		<div class="col-md-4">
			<span id="instruction_deviceName" class="p-t7 db"></span>
		</div>
		<label class="col-md-2 control-label">设备IMEI：</label>
		<div class="col-md-3">
			<span id="instruction_IMEI" class="p-t7 db"></span>
		</div>
	</div>
	{{/if}}
	<!-- 指令类型 -->
	<div class="form-group">
		<div class="ta-c m-tb15"  id="ins_div_loading" style="display:none;">
			<i class="fa fa-spinner fa-pulse fa-fw fa-2x">	</i>				
		</div>
		<div id="ins_div" >
			<label class="col-sm-2 control-label">指令类型：</label>
			<div class="col-sm-8">
				<div id="type-div" class="w200">
					<div class="easydropdown easydropdown-sm easydropdown-full va-t" >
						<select id="typeId" onchange="typeChange({{callback}});">
							<option value="">请选择</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="b1-ccc m-t10 m-lr15 mh-200" id="temp-div">
						<div class="ta-c m-tb15"  id="loading_ins" style="display:none;">
							<i class="fa fa-spinner fa-pulse fa-fw fa-2x">	</i>				
						</div>
						<div id="instructions-div">
							<!-- 指令列表 -->
						</div>
						<div class="instruction-list p-t15">
							<!-- 参数列表 -->
						<div class="js-instruction-tab" id="params-div"></div>
					</div>
				</div>
			</div>
			{{if !hideFlag}}
			<div class="p-tb10">
				<button id="instruction-send-btn" class="btn btn-primary btn-sm mw-100" type="button"
				onclick="sendInstruction()">发送指令</button>
				<button id="instruction-sending" class="btn btn-primary btn-sm mw-100" type="button" disabled="disabled" style="display:none;">
					<i class="fa fa-spinner fa-pulse"></i>&nbsp;发送中...
				</button>
			</div>
			{{/if}}
		</div>
	</div>
	</div>
	<input type="hidden" id="orderContent" /> <input type="hidden"
		id="isUsePwd" /> <input type="hidden" id="isOffLine" />
</form>
</script>


<script>
	var command_imei = "";
	var command_mcType = "";
	
	//获取指令类型 
	function getInstructionType(imei,mcTypes,callback) {
		command_imei = imei;
		$.ajax({
			type : "post",
			async : true,
			cache : false,
			timeout:15000,
			data : {
				"imei" : command_imei,
				"mcTypes":mcTypes
			},
			url : _ctx + "/device/getDevInstructionType",
			success : function(ret) {
				if (ret.code == 0) {
					$("#ins_div").show();
					$("#ins_div_loading").hide();
					var type_html = '<div class="easydropdown easydropdown-sm easydropdown-full va-t" ><select name="typeId">';
					if (typeof(ret.data.data) != "undefined" && ret.data.data.length > 0) {
						$.each(ret.data.data,function(i, v) {
							type_html+= '<option value="'+v.id+'" title="'+v.typeName+'">'
									+ v.typeName
									+ '</option>';
						});
					} else {
						type_html+= '<option value="">请选择</option>';
						layer.msg('该机型未配置指令', {
							time:2000,icon : 8
						}); 
					}
					type_html+= '</select></div>';
					command_mcType = ret.data.mcType;
					if(typeof(ret.data.deviceName) == "undefined"){
						$("#instruction_deviceName").text(imei);
					}else{
						$("#instruction_deviceName").text(ret.data.deviceName);
					}
					$("#instruction_IMEI").text(command_imei);
					
					$("#type-div").html(type_html);
					$("select[name='typeId']").easyDropDown().change(function(){
						typeChange(callback);
					});
					typeChange(callback);
				} else {
					$("select[name='typeId']").easyDropDown();
					layer.msg("获取指令类型失败", {
						time:2000,icon : 8
					});
				}
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			},
			error : function(e) {
				layer.msg("获取指令类型失败", {
					time:2000,icon : 8
				});
				$("#ins_div_loading").hide();
			}
		});
	}

	//指令类型改变
	var instructionsAndParams = new Array();
	var commandRecords = new Array();
	
	function typeChange(callback) {
		var typeId = $("select[name='typeId']").val();
		if (typeId) {
			startLoadInstructions();
			$.ajax({
				type : "post",
				async : true,
				cache : true,
				timeout:15000,
				data : {
					"imei":command_imei,
					"mcType" : command_mcType,
					"typeId" : typeId
				}, 
				url : _ctx + "/device/getInstructionAndParams",
				success : function(ret) {
					if (ret.code == 0) {
						endLoadInstructions();
						if (ret.data) {
							instructionsAndParams = ret.data.instructionAndParams;
							if(instructionsAndParams.length > 0){
								commandRecords = [];
								commandRecords = ret.data.commandRecordList;
								var radio_html = '<div class="instruction-tab-navbar">'
												+'<ul class="all-customer-list clearfix tab-nav-customer tab-nav" id="instruction_ul">';
								$.each(ret.data.instructionAndParams,function(i, v) {
									if (i == 0) {
										radio_html+= '<li onclick="selectTab(this);" class="cp active" title="'+v.orderName+'"><a name="'+v.id+'">'+v.orderName+'</a>'
													+'</li>';
									} else {
										radio_html+= '<li onclick="selectTab(this);" class="cp" title="'+v.orderName+'"><a name="'+v.id+'">'+v.orderName+'</a>'
													+'</li>';
									}
								});
								radio_html+= '</ul></div>';
								$("#instructions-div").html(radio_html);
								$("input[name='instructionId']").iCheck();
								showInstructionParams();
								$("input[name='instructionId']").on("ifChecked", function() {
									showInstructionParams();
								});
								$("#instruction_ul li").click(function(){
									selectTab(this);
									if(callback && typeof(callback) == "function"){
										callback();
									}
								});
							}
						}
						if(callback && typeof(callback) == "function"){
							callback();
						}
					}
				},
				complete:function(XMLHttpRequest, textStatus){
					authorityValide(XMLHttpRequest);
				},
				error : function(e) {
					$("#loading_ins").hide();
					layer.msg("获取指令失败", {
						time:2000,icon : 8
					});
				}
			});
		}
	}
	
	function selectTab(obj){
		$(obj).addClass("active").siblings().removeClass('active');
		showInstructionParams();
	}
	
	function startLoadInstructions(){
		$("#instructions-div").hide();
		$(".instruction-list").hide();
		$("#loading_ins").show();
	}

	function endLoadInstructions(){
		$("#loading_ins").hide();
		$("#instructions-div").show();
		$(".instruction-list").show();
	}
	
	//指令参数展示
	function showInstructionParams() {
		var instructinId = $("#instruction_ul .active a").attr("name");
		if (instructinId) {
			var param_val_name_index = 1;
			$("#params-div").empty();
			$("#instructionPwd-div").remove();
			$("#orderExplain-div").remove();
			$.each(instructionsAndParams,function(i, v) {
				if (v.id == instructinId) {
					$("#orderContent").val(v.orderContent);
					$("#isUsePwd").val(v.isUsePwd);
					if(v.isOffLine){
						$("#isOffLine").val(v.isOffLine);
					}else{
						$("#isOffLine").val(0);
					}
					var date_index = 1;
					$.each(v.paramList,function(m, n) {
						var param_html = '<div class="form-group"><input type="hidden" name="paramVal_id_'+param_val_name_index+'" value="'+n.id+'" />';
						param_html += '<label class="col-md-3 control-label" title="'+n.paramName+'">';
						param_html += n.paramName
								   +'：</label>';
						if (typeof (n.defaultVal) == "undefine") {
							n.defaultVal = "";
						}
						var commandRecord = getSingleCommandRecord(n.id, n.updationDate);
						if (n.paramType == "text"
								|| n.paramType == "phone"
								|| n.paramType == "number"
								|| n.paramType == "email") {
							param_html += '<div class="col-sm-6">';
							param_html += '<input style="display:none;">';
							if(typeof(commandRecord) != "undefined" && commandRecord){
								param_html += '<input type="text" autocomplete="off" id="text_'+ m +'" name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'" value="'+ commandRecord +'" class="form-control form-control-sm" />';
							}else{
								param_html += '<input type="text" autocomplete="off" id="text_'+ m +'" name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'" value="'+ n.defaultVal +'" class="form-control form-control-sm" />';
							}
							param_html += '</div>';
							if(n.paramMsg){
								param_html += '<div class="col-sm-2"><span id="show-question-'+n.id+'" class="fa fa-question-circle cp p-t7" rel="popover"></span></div>';							
							}
							param_html += '</div>';
						} else if (n.paramType == "textarea") {
							param_html += '<div class="col-sm-6">';
							param_html += '<input style="display:none;">';
							param_html += '<input type="text" autocomplete="off" id="text_'+ m +'" name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'" readonly="readonly" value="'+ n.defaultVal +'" class="form-control form-control-sm" />';
							param_html += '</div>';
							param_html += '<div class="col-sm-2"><span id="show-question-'+n.id+'" class="fa fa-question-circle cp p-t7" rel="popover"></span></div>';							
							param_html += '</div>';
						} else if (n.paramType == "password") {
							param_html += '<div class="col-sm-6">';
							if(typeof(commandRecord) != "undefined" && commandRecord){
								param_html += '<input type="password" id="text_'+ m +'" name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'" value="'+ commandRecord +'" class="form-control form-control-sm" />';
							}else{
								param_html += '<input type="password" id="text_'+ m +'" name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'" value="'+ n.defaultVal +'" class="form-control form-control-sm" />';
							}
							param_html += '</div>';
							if(n.paramMsg){
								param_html += '<div class="col-sm-2"><span id="show-question-'+n.id+'" class="fa fa-question-circle cp p-t7" rel="popover"></span></div>';							
							}
							param_html += '</div>';
						} else if (n.paramType == "radio") {
							param_html += '<div class="d-ib clearfix col-md-6">';
							makeParamValsArry(n.paramVals);
							if (paramValsArr.length > 0) {
								$.each(paramValsArr,function(x,y) {
									if(typeof(commandRecord) == "undefined" || !commandRecord){
										commandRecord = n.defaultVal;
									}
									if(x > 0){
										param_html += '&emsp;';
									}
									param_html += '<label class="icheck-min p-t7">'
									if (commandRecord == y.pval) {
										param_html +='<input type="radio" value="'+ y.pval +'" checked name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'"/>&nbsp;'
													+ y.pkey;
									} else {
										param_html +='<input type="radio" value="'+ y.pval +'" name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'"/></label>&nbsp;'
													+ y.pkey;
									}
									param_html += '</label>';
								})
							}
							param_html += '</div>';
							if(n.paramMsg){
								param_html += '<div class="col-sm-2"><span id="show-question-'+n.id+'" class="fa fa-question-circle cp p-t7" rel="popover"></span></div>';							
							}
							param_html += '</div>';
						} else if (n.paramType == "checkbox") {
							param_html += '<div class="d-ib clearfix col-md-6">';
							makeParamValsArry(n.paramVals);
							if (paramValsArr.length > 0) {
								$.each(paramValsArr,function(x,y) {
									var checkVal = "";
									if(typeof(commandRecord) == "undefined" || !commandRecord){
										checkVal = n.defaultVal;
									}else{
										if($.inArray(y.pval,commandRecord.split(",")) > -1){
											checkVal = y.pval;
										}
									}
									if(x > 0){
										param_html += '&emsp;';
									}
									param_html += '<label class="icheck-min p-t7">';
									if (checkVal == y.pval) {
										param_html += '<input type="checkbox" value="'+ y.pval +'" checked name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'"/>&nbsp;&nbsp;'
													+ y.pkey;
									} else {
										param_html += '<input type="checkbox" value="'+ y.pval +'" name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'"/>&nbsp;&nbsp;'
													+ y.pkey;
									}
									param_html += '</label>';
									param_val_name_index++;
								})
							}
							param_html += '</div>'; 
							if(n.paramMsg){
								param_html += '<div class="col-sm-2"><span id="show-question-'+n.id+'" class="fa fa-question-circle cp p-t7" rel="popover"></span></div>';							
							}
							param_html += '</div>';
						} else if (n.paramType == "select") {
							param_html += '<div class="col-sm-4">';
							param_html += '<div class="easydropdown easydropdown-sm easydropdown-full d-ib va-t">';
							param_html += '<select  name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'">';
							makeParamValsArry(n.paramVals);
							if (paramValsArr.length > 0) {
								$.each(paramValsArr,function(x,y) {
									if(typeof(commandRecord) == "undefined" || !commandRecord){
										commandRecord = n.defaultVal;
									}
									if (commandRecord == y.pval) {
										param_html += '<option value="'+ y.pval +'" selected>'
												+ y.pkey
									} else {
										param_html += '<option value="'+ y.pval +'">'
												+ y.pkey
									}
									param_html += '</option>';
								})
							} else {
								param_html += '<option value="" selected>请选择</option>';
							}
							param_html += '</select>';
							param_html += '</div>';
							param_html += '</div>';
							param_html += '<div class="col-sm-2"></div>';
							if(n.paramMsg){
								param_html += '<div class="col-sm-2"><span id="show-question-'+n.id+'" class="fa fa-question-circle cp p-t7" rel="popover"></span></div>';							
							}
							param_html += '</div>';
						} else if (n.paramType == "dates"
								|| n.paramType == "times") {
							param_html += '<div class="col-sm-3 p-r0">';
							if(typeof(commandRecord) != "undefined" && commandRecord){
								var timeArr = commandRecord.split(",");
								if(null != timeArr && timeArr.length >= 2){
									param_html += '<input type="text" name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'" value="'+timeArr[0]+'" class="form-control form-control-sm" />';
									param_html += '</div>'
									date_index++;
									param_html += '<div class="col-sm-3 p-r0">';
									param_html += '<input type="text" name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'" value="'+timeArr[1]+'" class="form-control form-control-sm" />';
								}
							}else{
								param_html += '<input type="text" name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'" value="" class="form-control form-control-sm" />';
								param_html += '</div>'
								date_index++;
								param_html += '<div class="col-sm-3 p-r0">';
								param_html += '<input type="text" name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'" value="" class="form-control form-control-sm" />';
							}
							param_html += '</div>';
							if(n.paramMsg){
								param_html += '<div class="col-sm-2"><span id="show-question-'+n.id+'" class="fa fa-question-circle cp p-t7" rel="popover"></span></div>';							
							}
						} else if (n.paramType == "date"
								|| n.paramType == "time") {
							param_html += '<div class="col-sm-6">';
							if(typeof(commandRecord) == "undefined" || !commandRecord){
								commandRecord = n.defaultVal;
							}
							param_html += '<input type="text" name="paramVal_'+ n.paramType +'_'+ param_val_name_index +'" value="'+commandRecord+'" class="form-control form-control-sm" />';
							date_index++;
							param_html += '</div>';
							if(n.paramMsg){
								param_html += '<div class="col-sm-2"><span id="show-question-'+n.id+'" class="fa fa-question-circle cp p-t7" rel="popover"></span></div>';							
							}
						}
						
						$("#params-div").append(param_html);
						param_html = "";
						param_val_name_index++;

						$("input[name^='paramVal_radio_'][type='radio']").iCheck();
						$("input[name^='paramVal_checkbox_'][type='checkbox']").iCheck();
						$("select[name^='paramVal_select_']").easyDropDown();
						$("input[name^='paramVal_date']").datetimepicker({
							lang : "ch",
							format : 'Y-m-d',
							timepicker : false
						});
						$("input[name^='paramVal_time']").datetimepicker({
							lang : "ch",
							step:5,
							format : 'H:i',
							timepicker : true,
							datepicker:false
						});
						$("#show-question-"+n.id).popover({
							placement: "top",
							trigger: 'hover',
							content: n.paramMsg
						});
					})
					var pwd_html = "";
					if (v.isUsePwd == "1") {
						pwd_html = '<div class="form-group" id="instructionPwd-div"><label id="instructionPwd-label" title="密码" class="col-md-3 control-label text-ellipsis">密码：</label>';
						pwd_html += '<div class="col-sm-5"><input type="text" onfocus="this.type='+"'"+'password'+"'"+'" id="instructionPwd" class="form-control form-control-sm" /></div>';
						pwd_html += '</div>';
					} else {
						pwd_html = '<div class="form-group" id="instructionPwd-div" style="display:none;"><label id="instructionPwd-label" title="密码" class="col-md-3 control-label text-ellipsis">密码：</label>';
						pwd_html += '<div class="col-sm-5"><input type="password" id="instructionPwd" class="form-control form-control-sm" /></div>';
						pwd_html += '</div>';
					}
					$("#params-div").after(pwd_html);
					$("#instructionPwd").val("");
					if(v.orderExplain){
						var orderExplain_html = '<div class="form-group" id="orderExplain-div"><label id="instructionPwd-label" title="指令说明" class="col-md-3 control-label text-ellipsis">指令说明：</label>';
						orderExplain_html += '<div class="col-sm-8 p-t7">'
								+ v.orderExplain + '</div>';
						orderExplain_html += '</div>';
						$("#instructionPwd-div").after(orderExplain_html);
					}
				}
			});
		}
	}

	function getSingleCommandRecord(paramId,paramUpdationDate){
		var cr = null;
		if(commandRecords && commandRecords.length > 0){
			$.each(commandRecords,function(i,v){
				if(v.paramId == paramId){
					if(typeof(paramUpdationDate) == "undefined" || !paramUpdationDate){
						cr = v.paramRecord;
						return;				
					}else{
						var d1 = new Date(paramUpdationDate.replace(/\-/g, "\/")); 
						var d2 = new Date(v.updateTime.replace(/\-/g, "\/")); 
						if(d1 <= d2) {
							cr = v.paramRecord;
							return;
						}
					}
				}
			});
		}
		return cr;
	}
	
	//设置参数值
	var paramValsArr = new Array();
	function makeParamValsArry(paramVals) {
		if (paramVals) {
			paramValsArr = [];
			var paramGroupArr = paramVals.split(";");
			if (paramGroupArr && paramGroupArr.length > 0) {
				$.each(paramGroupArr, function(i, v) {
					var singParamArr = v.split(":");
					var pv = "";
					if (singParamArr.length == 2) {
						pv = {
							"pkey" : singParamArr[0],
							"pval" : singParamArr[1]
						};
					} else if (singParamArr.length > 2) {
						//时间段参数
						pv = {
							"pkey" : singParamArr[0],
							"pval" : singParamArr[1] + ":" + singParamArr[2]
									+ ":" + singParamArr[3]
						};
					}
					if (pv) {
						paramValsArr.push(pv);
					}
				})
			}
		}
	}
	
	function getCommandRecord(){
		$.ajax({
			type : "post",
			async : true,
			cache : false,
			data : {"userId":"","imei":command_imei},
			url : _ctx + "/device/getCommandRecord",
			dataType : "json",
			success : function(ret) {
				if(ret.code == 0){
					commandRecords = ret.data;
				}
			},
			error : function(e) {
				ajaxError("getCommandRecord()", e);
			}
		});
	}

	//发送指令
	function sendInstruction() {
		if(!$("select[name='typeId']").val()){
			layer.msg("请选择指令类型",{time:2000,icon:8});
			return false;
		}
		if(!$("#instruction_ul li.active a").attr("name")){
			layer.msg("请选择指令",{time:2000,icon:8});
			return false;
		}
		var paramArray = $("#instruction-form").serializeArray();
		if (validateParams(paramArray)) {
			var param = "";
			var scopeFlag = 1;
			$("[name^=paramVal_]").each(function(i, v) {
				var valType = this.name.split("_")[1];
				var thisVal = v.value;
				if(valType == "id"){
					if(param){
						param+= ";";
					}
				}
				if(valType == "radio"){
					if(this.checked){
						param+= thisVal + ",";
					}
				}else{
					if(valType == "checkbox"){
						if(!this.checked){
							thisVal = ""; 
						}
					}else if(valType == "dates" || valType == "times"){
						if(thisVal){
							param+= thisVal + "-";
							scopeFlag++;
							return true;
						}
					}
					param+= thisVal + ",";
				} 
			});
			var data = {
				"imei" : command_imei,
				"orderContent" : $("#orderContent").val(),
				"instructionId" : $("#instruction_ul .active a").attr("name"),
				"instructionName":$("#instruction_ul .active a").text(), 
				"param" : maintenceParam(param),
				"instructionPwd" : $("#instructionPwd").val(),
				"isUsePwd" : $("#isUsePwd").val(),
				"isOffLine" : $("#isOffLine").val()
			};
			if (!data.imei) {
				layer.msg("imei为空",{time:2000,icon:8});
				return false;
			}
			if (!data.instructionId) {
				layer.msg("指令ID为空",{time:2000,icon:8});
				return false;
			}
			$("#instruction-sending").show();
			$("#instruction-send-btn").hide();
			$.ajax({
				type : "post",
				async : true,
				cache : false,
				data : data,
				url : _ctx + "/device/sendIns",
				dataType : "json",
				success : function(ret) {
					$("#instruction-sending").hide();
					$("#instruction-send-btn").show();
					var command_imei = "";
					var command_mcType = "";
					if(ret.code == 255){
						getCommandRecord();
						$("#instruction-_excute_result").text(ret.data);
						layerIndex = layer.open({
					      type: 1,
					      shade: false,
					      title: false, //不显示标题
					      content: $("#instruction_excute_result_div"), //捕获的元素
					    });
					}else if(ret.code == 10008){
						//指令提示已设置
						layer.msg(ret.msg, {
							time:2000,icon : 8
						});
					}else if(ret.code == 10006){
						layer.confirm('该设备有待发送的离线指令，确定是否替换？(每个设备只能有一条待发送的离线指令)', {
							title:"信息",
							btn: ["确定","取消"],
							shade: false 
						}, function(){
							coverOffLineComamnd(ret.data);
						});
					}else if(ret.code == 10005){
						//指令转为离线指令提示时间延长
						layer.msg($.i18n.prop(ret.msg), {
							time:5000,icon : 8
						});
					}else{ 
						layer.msg($.i18n.prop(ret.msg), {
							time:2000,icon : 8
						});
					}
				},
				error : function(e) {
					layer.msg("操作失败", {time:2000,icon : 2});
				},
				complete:function(XMLHttpRequest, textStatus){
					authorityValide(XMLHttpRequest);
					$("#instruction-sending").hide();
					$("#instruction-send-btn").show();
				}
			});
		}
	}
	
	function coverOffLineComamnd(logJson){
		if(logJson){
			$.ajax({
				type : 'post',
				url : _ctx + "/device/coverOffLineComamnd",
				async : false,
				cache : false,
				dataType : 'json',
				data : {
					"logJson" : JSON.stringify(logJson.log),"mapTemp":JSON.stringify(logJson.mapTemp)
				},
				success : function(returnData) {
					if (returnData.code == 0) {
						getCommandRecord();
						layer.msg("操作成功", {time:2000,icon: 1});
					}else{
						layer.msg("操作失败", {time:2000,icon: 2});
					}
				}
			});
		}
	}
	
	function maintenceParam(param){
		var resultParam = "";
		var arr = param.split(";");
		$.each(arr,function(i,v){
			if(i == arr.length -1){
				resultParam+= v.substring(0,v.length-1);
			}else{
				resultParam+= v.substring(0,v.length-1) + ";";
			}
		});	
		return resultParam;
	}
	
	function validateParams(paramArray) {
		var flag = true;
		$.each(paramArray,function(i, v) {
			if (v.name.indexOf("paramVal") > -1) {
				if (v.name.split("_")[1] == "date"
						|| v.name.split("_")[1] == "dates"
						|| v.name.split("_")[1] == "time"
						|| v.name.split("_")[1] == "times") {
					/* if (v.value) {
						flag = false;
						if ($("#" + v.name).length < 1) {
							$("[name=" + v.name + "]").after('<font color="red" id="'+ v.name +'">请输入时间</font>');
						}else {
							$("#" + v.name).remove();
						}
					}  */
				} else if (v.name.split("_")[1] == "phone") {
					if (v.value && !/^0{0,1}(13[0-9]|15[3-9]|15[0-2]|18[0-9]|17[0-9])[0-9]{8}$/.test(v.value)) {
						flag = false;
						if ($("#" + v.name).length < 1) {
							$("[name=" + v.name + "]").after('<font color="red" id="'+ v.name +'">请填写正确的手机号码</font>');
						}
					} else {
						$("#" + v.name).remove();
					}
				} else if (v.name.split("_")[1] == "number") {
					if (v.value && !/^[0-9]*$/.test(v.value)) {
						flag = false;
						if ($("#" + v.name).length < 1) {
							$("[name=" + v.name + "]").after('<font color="red" id="'+ v.name +'">输入的不是数字</font>');
						}
					} else {
						$("#" + v.name).remove();
					}
				} else if (v.name.split("_")[1] == "email") {
					if (v.value && !/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/.test(v.value)) {
						flag = false;
						if ($("#" + v.name).length < 1) {
							$("[name=" + v.name + "]").after('<font color="red" id="'+ v.name +'">邮箱格式不正确</font>');
						}
					} else {
						$("#" + v.name).remove();
					}
				}else if(v.name.split("_")[1] == "text") {
					if ($("#orderContent").val() == "{0}") {
						if(!v.value){
							flag = false;
							if ($("#" + v.name).length < 1) {
								$("[name=" + v.name + "]").after('<font color="red" id="'+ v.name +'">请输入指令内容</font>');
							}
						}else{
							$("#" + v.name).remove();
						}
					}
				}
			}
		});
		if(!$("#instructionPwd-div").is(":hidden")){
			if(!$("#instructionPwd").val()){
				if($("#instructionPwd-valid").length == 0){
					$("#instructionPwd").after('<font color="red" id="instructionPwd-valid">请输入密码</font>');
				}
				flag = false;
			}else{
				$("#instructionPwd-valid").remove();
			}
		}
		return flag;
	}
</script>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 手机用户  -->
        		<div class="modal-tab js-mobilUser-search-con  row">
                    <div class="oy-a h400 js-mobileUser-search-table markLoading">
                    	
                    	<div class="mark_mobileUser_list">
	                        <table class="table table-condensed table-ellipsis table-td-normal m-b0 c-666">
	                            <thead>
		                            <th width="60" title="序号">序号</th>
		                            <th title="客户名称">客户名称</th>
		                            <th title="客户类型">客户类型</th>
		                            <th title="账号">账号</th>
		                            <th title="电话">电话</th>
		                            <th title="设备数量">设备数量</th>
		                            <th width="300" title="操作">操作</th>
	                            </thead>
	                            <tbody id="complex_mobileUser_tbody"></tbody>
	                        </table>
	                        <div class="p-r15">
		                        <button title="导出" type="button" onclick="complex_export('mobileUser')" class="btn btn-default btn-sm mobileUser-export-btn js-allocate-prolong-btn fr ">导出</button>
		                        <div id="complex_mobileUser_table_nodata"><div class="ta-c c-666 m-tb10"><span class="p-5 d-ib">&nbsp;<i class="fa fa-bell-o"></i> 暂无数据&nbsp;</span></div></div>
		                        <div id="complex_paging_mobileUser" class="simple-pagination-custom ta-c"></div>
	                        </div>
                    	</div>
                    	<div class="mark_mobileUser_detail dn">
                    		<div class="modal-tab-nav clearfix">
				              <button class="btn btn-default btn-xs fr js-back-mobileUser-search" type="button" onclick="complex_backMobileUserList();"><i class="fa fa-reply"></i>&nbsp;返回列表</button>
				              <ul class="list-fl fl tab tab-auto cp complex_device_tab">
				                <li class="active" title="用户详情"><a>用户详情</a></li>
				              </ul>
				            </div>
				            <div class="modal-tab-con p-t15 p-lr15 oy-a h400">
				            	<div style="display: block;">
		                    		<div class="device-search-list-table">
					                  <table class="table table-condensed table-td-normal table-ellipsis table-bordered bc-f5f5f5 ">
					                    <thead>
					                      	<th width="60" title="序号">序号</th>
				                            <th title="客户名称">客户名称</th>
				                            <th title="客户类型">客户类型</th>
				                            <th title="账号">账号</th>
				                            <th title="电话">电话</th>
				                            <th title="设备数量">设备数量</th>
				                            <th width="300" title="操作">操作</th>
					                    </thead>
					                    <tbody id="complex_mobileUser_detail_tbody">
					                    </tbody>
					                  </table>
					                </div>
					                <div class="user-search-list-table">
			                  <div class="b-b1-ddd p-b5">设备列表</div>
			                  <div>
			                    <table class="table table-condensed table-td-normal table-ellipsis m-b0 c-666">
			                      <thead>
			                      	<th width="60" title="序号">序号</th>
				                    <th title="设备名称">设备名称</th>
				                    <th title="IMEI">IMEI</th>
				                    <th title="设备类型">设备类型</th>
				                    <th title="激活时间">激活时间</th>
				                    <th title="平台到期时间">平台到期时间</th>
				                    <th title="用户到期时间">用户到期时间</th>
				                    <th title="绑定用户">绑定用户</th>
				                    <th width="150" title="操作">操作</th>
			                      </thead>
			                      <tbody id="complex_mobileUser_device_tbody">
			                      </tbody>
			                    </table>
			                    <div class="p-r15">
			                        <div id="complex_mobileDevice_table_nodata"><div class="ta-c c-666 m-tb10"><span class="p-5 d-ib">&nbsp;<i class="fa fa-bell-o"></i> 暂无数据&nbsp;</span></div></div>
			                        <div id="complex_paging_mobileUser" class="simple-pagination-custom ta-c"></div>
		                        </div>
			                  </div>
			                </div>
                    			</div>
                    		</div>
                    	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="js-device-add-result dn p-15" id="device_add_result_div">
</div>
<!-- 指令执行成功,结果内容展示 -->
<div class="js-device-add-result dn p-15"
	id="instruction_excute_result_div">
	<div>
		指令执行结果/内容:
	</div>
	<div class="oy-a mah-200" id="instruction-_excute_result">
		
	</div>
</div>
<div style="display: none;">
	<form id="toIndexForm" action="meunController.do?index" method="post" target="_blank">
		<input type="hidden" name="userId" id="index_userId"/>
		<input type="hidden" name="account" id="index_account"/>
		<input type="hidden" name="parentId" id="index_parentId"/>
		<input type="hidden" name="keyword" id="index_keyword"/>
	</form>
</div>
<div style="display: none;">
	<form id="toCustomerForm" action="/anhui/customer/customer.html" method="post" target="_blank">
		<input type="hidden" name="userId">
		<input type="hidden" name="parentId">
		<input type="hidden" name="keyword"/>
	</form>
</div>

<!-- 搜索输入框模板 -->
<script type="text/html" id="complex_search_tmp1">
    <div class="form-inline device-user-search">
      <input type="text" class="form-control form-control-sm" size="40" id="basicKeyword" placeholder="请输入设备名称、IMEI\帐号搜索" title="请输入设备名称、IMEI\帐号搜索">&nbsp;
      <div class="input-group">
        <button type="button" class="btn btn-sm btn-primary js-search-device" title="设备"><i class="fa fa-search"></i>&nbsp;设备</button>
        <div class="input-group-btn">
          <button type="button" class="btn btn-sm btn-primary js-advanced-search-device o_8" title="高级 搜索">高级&nbsp;<i class="fa fa-caret-down"></i></button>
        </div>
      </div>&nbsp;
      <button type="button" class="btn btn-sm btn-success  js-search-user" title="用户"><i class="fa fa-search"></i>&nbsp;用户</button>
      <button type="button" class="btn btn-sm btn-success  js-search-mobileUser" title="APP 用户"><i class="fa fa-search"></i>&nbsp;APP 用户</button>   </div>
</script>
<script type="text/html" id="complex_search_tmp">
</script>
<!-- 用户信息列表模板 -->
<script type="text/html" id="complex_user_tbody_tmp">
	{{each data as row i}}
	    <tr>
	        <td>{{(pageNo-1)*pageSize+(i+1)}}</td>
	        <td title="{{row.nickName}}">{{if row.levelName != '' && row.levelName != null}}{{row.levelName}}{{else}}{{row.nickName}}{{/if}}</td>
	        <td>
				{{if row.type == 8 || row.type == 10}}
					<div title="代理商">
						<span class="mark-agents" ><i class="fa fa-user"></i></span>&nbsp;代理商
					</div>
		  		{{/if}}
		  		{{if row.type != 8 && row.type != 10 && row.type != 0 && row.type !=11 && row.type !=3 }}
					<div title="用户">
						<span class="mark-client"><i class="fa fa-user"></i></span>&nbsp;用户
					</div>
		  		{{/if}}
		  		{{if row.type == 11}}
					<div title="销售">
						<span class="mark-sales"><i class="fa fa-user"></i></span>&nbsp;销售
					</div>                      		
		  		{{/if}}
		  		{{if row.type == 0}}
					<div title="管理员">
						<span class="mark-admin"><i class="fa fa-user"></i></span>&nbsp;销售管理员
					</div>                      					 		
		  		{{/if}}
		  		{{if row.type == 3}}
					<div title="APP用户">
						<span class="mark-client"><i class="fa fa-user"></i></span>&nbsp;APP用户
					</div>                      					 		
		  		{{/if}}
			</td>
	        <td title="{{row.account}}">{{row.account}}</td>
        	<td title="{{row.phone}}">{{row.phone}}</td>
        	<td title="{{row.devTotal}}">{{row.devTotal}}</td>
	        <td>
				<a title="控制台" onclick="toIndex('{{row.userId}}','{{row.account}}','{{row.createdBy}}','');" class="cp">控制台</a>
				{{if row.userId != loginUserId}}
					{{if type && type == "mobileUser"}}
		            	<a class="cp js-view-user-related" id="{{row.userId}}_detail" title="详情" onclick="complex_showMobileUserDevice('{{row.userId}}',this,{{if data.length > 0}}true{{else}}false{{/if}})">详情</a>
					{{else}}
		            	<a class="cp js-view-user-related" title="详情" onclick="complex_showRelation('{{row.userId}}','{{row.createdBy}}',{{if data.length > 0}}true{{else}}false{{/if}})">详情</a>
					{{/if}}
	            	<a title="重置密码" class="cp js-resetPwd-btn" onclick="resetPwd('{{row.userId}}','{{row.account}}');">重置密码</a>
				{{else}}
				{{/if}}
	            {{if locationTree != null && locationTree != ''}}
					<a class="cp js-focus-tree" title="查看" onclick="complex_locationUser_Click('{{row.userId}}','{{row.fullParentId}}','{{locationTree}}','')">查看</a>
				{{else}}
					{{if !type || type != 'mobileUser' }}
	            		<a title="查看" class="cp js-editor-users-btn" onclick="toCustomer('{{row.userId}}','{{row.createdBy}}','')">查看</a>
					{{/if}}
				{{/if}}
	        </td>
	    </tr>
	{{/each}}
</script>

<!-- 用户详细信息模板 -->
<script type="text/html" id="complex_user_info_tmp">
	<form id="complex_userInfo_Form_{{fromId}}" class="form-horizontal form-sm form-preset form-ellipsis">
		<input type="hidden" value="{{info.id}}" name="userId">
		<input type="hidden" name="createdBy"/>
        <input type="hidden" name="fullParentId">
        <input type="hidden" name="old_parentId" value="{{info.createdBy}}">
        <input type="hidden" name="old_fullParentId" value="{{info.fullParentId}}">
		<div class="form-group">
		    <label class="col-md-3 control-label {{if info.id == loginUserId}}dn{{/if}}" title="上级用户"><span class="c-red">*</span>上级用户：</label>
            <div class="col-md-4 {{if info.id == loginUserId}}dn{{/if}}">
                <fieldset id="editorSelectRole">
                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control " name="parentName" readonly>
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default direction-btn"><i class="fa fa-caret-right"></i></button>
                        </span></div>
                </fieldset>
            </div>
            <div class="col-md-5 pr">
                <div class="pa p-l10 tree-role-box" {{if info.id!=loginUserId}}style="display:block;"{{/if}} id="editorTreeRoleBox">
                    <div class="editor-tree-scroll-role oy-a">
						{{if fromId == 'complexUpdate'}}
							<div class="tree-search m-t10"> <i class="tree-search-icon" id="complexUpdate_globalSearch_btn"></i>
              					<input type="text" id="complexUpdate_globalSearch_input" class="empty fs-12" value="" placeholder="请输入客户名称或帐号">
           					</div>                        
						{{/if}}
						<ul id="complex_userInfo_tree_{{fromId}}" class="ztree">
                        </ul>
                    </div>
                </div>
            </div>
		</div>
		
		<div class="form-group {{if info.id == loginUserId}}dn{{/if}}">
		    <label class="col-md-3 control-label" title="客户类型"><span class="c-red">*</span>客户类型：</label>
		    <div class="col-md-4">
		        <div class="p-tb5">
		            {{if loginUserType == '0' || loginUserType == '11'}}
		            	<label class="icheck-min" title="销售"><input type="radio" name="type" {{if info.type==11}}checked{{/if}} value="11">&nbsp;销售</label>&emsp;
					{{/if}}
		            {{if loginUserType == '0' || loginUserType == '11' || loginUserType == '8' || loginUserType == '10'}}
						<label class="icheck-min" title="代理商"><input type="radio" name="type" {{if info.type==8}}checked{{/if}} value="8">&nbsp;代理商</label>&emsp;
					{{/if}}
		            <label class="icheck-min" title="用户"><input type="radio" name="type" {{if info.type!=11 && info.type!=8 && info.type!=0}}checked{{/if}} value="9">&nbsp;用户</label>
		        </div>
		    </div>
		</div>
		<div class="form-group">
		    <label class="col-md-3 control-label" title="客户名称"><span class="c-red">*</span>客户名称：</label>
		    <div class="col-md-4">
		        <input type="text" class="form-control form-control-sm" placeholder="请输入用户名称" name="nickName" value="{{info.name}}" maxlength="50"/>
		    </div>
		</div>
		<div class="form-group">
		    <label class="col-md-3 control-label" title="登录账号"><span class="c-red">*</span>登录账号：</label>
		    <div class="col-md-4">
		        <input type="text" class="form-control form-control-sm" placeholder="请输入账号" name="account" value="{{info.account}}" disabled/>
		    </div>
		</div>
		<div class="form-group">
		    <label class="col-md-3 control-label" title="电话">电话：</label>
		    <div class="col-md-4">
		        <input type="text" class="form-control form-control-sm" placeholder="请输入电话号码" name="phone" value="{{info.phone}}" maxlength="20"/>
		    </div>
		</div>
		<div class="form-group">
		    <label class="col-md-3 control-label" title="邮件">邮件：</label>
		    <div class="col-md-4">
		        <input type="text" class="form-control form-control-sm" placeholder="请输入邮箱" name="email" value="{{info.email}}" maxlength="50"/>
		    </div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label"
				title="联系人">
				联系人：
			</label>
			<div class="col-md-4">
				<input id="contact" name="contact" type="text" value="{{info.contact}}"
					class="form-control form-control-sm"
					placeholder="请输入联系人" maxlength="50"  />
			</div>
		</div>
		<div class="form-group dn">
	        <label  class="col-md-3 control-label" title="充值权限">充值权限：</label>
	        <div class="col-md-4">
	            <label class="icheck-min text-ellipsis p-tb5" title="授权"><input type="checkbox" name="rechargeCheck" {{if info.recharge == 1}}checked{{/if}}/>&nbsp;授权</label>
	        	<input type="hidden" name="recharge" value="{{info.recharge}}"/>
				<div class="show-discount-inp {{if info.recharge != 1}}dn{{/if}}">
	           		<input name="discount" type="text" title="请输入折扣(0.01~1)" class="form-control form-control-sm" value="{{info.discount}}" placeholder="请输入折扣(0.01~1)"/>
	       		</div>	
			</div>
	    </div>
		 <div class="form-group {{if info.id == loginUserId}}dn{{/if}}">
	        <label  class="col-md-3 control-label" title="Web登录权限">Web登录权限：</label>
	        <div class="col-md-2">
	            <label class="icheck-min text-ellipsis p-tb5" title="Web登录权限"><input type="checkbox" name="webLoginCheck" {{if info.webLogin == 1}}checked{{/if}}/>&nbsp;Web登录权限</label>
	        	<input type="hidden" name="webLogin" value="{{info.webLogin}}"/>
			</div>
			<div class="col-md-2">
				<label class="icheck-min text-ellipsis p-tb5" title="APP登录权限"><input type="checkbox" name="appLoginCheck" {{if info.appLogin == 1}}checked{{/if}}/>&nbsp;APP登录权限</label>
	        	<input type="hidden" name="appLogin" value="{{info.appLogin}}"/>
			</div>
	     </div>
		<div class="form-group {{if info.id == loginUserId}}dn{{/if}}">
	        <label  class="col-md-3 control-label" title="指令权限">指令权限：</label>
	        <div class="col-md-2">
	            <label class="icheck-min text-ellipsis p-tb5" title="批量下发指令">
					<input type="checkbox" name="isBatchSendInsCheck" {{if info.isBatchSendIns == 1}}checked{{/if}}/>&nbsp;批量下发指令</label>
	        	<input type="hidden" name="isBatchSendIns" value="{{info.isBatchSendIns}}"/>
			</div>
			<div class="col-md-2">
				<label class="icheck-min text-ellipsis p-tb5" title="批量下发工作模式">
					<input type="checkbox" name="isBatchSendFMCheck" {{if info.isBatchSendFM == 1}}checked{{/if}}/>&nbsp;批量下发工作模式</label>
	        	<input type="hidden" name="isBatchSendFM" value="{{info.isBatchSendFM}}"/>
			</div>
	     </div>
		
		<div class="form-group">
		    <label class="col-md-3 control-label"></label>
		    <div class="col-md-4">
		        <button type="button" id="complex_updateUserBtn" class="btn btn-primary w100">保存</button>
		    </div>
		</div>
	</form>
</script>

	    
<script type="text/html" id="transCustom_tmp">
	<form id="transCustom_form_{{fromId}}" class="form-horizontal form-sm form-preset form-ellipsis">
		 <div class="b1-ddd p-lr10 bc-fafafa">
		 	<div class="tree-search m-t10"> <i class="tree-search-icon" id="complexTrans_globalSearch_btn_{{fromId}}"></i>
              	<input type="text" id="complexTrans_globalSearch_input_{{fromId}}" class="empty fs-12" value="" placeholder="请输入客户名称或帐号">
          		<input type="text" class="dn" />
			</div>
         <div class="tree-scroll oy-a">                      
			<ul id="transCustom_tree_{{fromId}}" class="ztree">
            </ul>
         </div>
       </div>
		
		{{if genBut == 'true'}}
		<div class="m-t15"> 
		   <a onclick="transCustBtnSave('transCustom_tree_transCust1','{{fromId}}')" class="btn btn-primary w100">转移</a> 
		</div>
		{{/if}}

		<input type="hidden" name="userId" value="{{info.id}}">
		<input type="hidden" name="createdBy"/>
        <input type="hidden" name="fullParentId">
		<input type="hidden" name="parentName">
        <input type="hidden" name="old_parentId" value="{{info.createdBy}}">
        <input type="hidden" name="old_fullParentId" value="{{info.fullParentId}}">
		<input type="hidden" name="type" value="{{info.type}}">
		<input type="hidden" name="nickName" value="{{info.name}}"/>
		<input type="hidden" name="account" value="{{info.account}}"/>
		<input type="hidden" name="phone" value="{{info.phone}}"/>
		<input type="hidden" name="email" value="{{info.email}}"/>
		<input type="hidden" name="contact" value="{{info.contact}}"/>
		<input type="hidden" name="discount" value="{{info.discount}}"/>
		<input type="hidden" name="webLogin" value="{{info.webLogin}}"/>
		<input type="hidden" name="appLogin" value="{{info.appLogin}}"/>
	</form>
</script>

<!-- 设备信息列表模板 -->
<script type="text/html" id="complex_device_tbody_tmp">
{{each data as row i}}
	<tr>
	   <td title="{{(pageNo-1)*pageSize+(i+1)}}">{{(pageNo-1)*pageSize+(i+1)}}</td>
       <td title="{{row.deviceName}}">{{ if row.bindUserId != null && row.bindUserId != "" }}<i class="fa fa-mobile">&nbsp;&nbsp;</i>{{/if}}<span>{{row.deviceName}} </span></td>
       <td title="{{row.imei}}">{{row.imei}}</td>
	   <td title="{{if row.deviceAlias == null || row.deviceAlias == "" }}{{row.mcType}}{{else}}{{row.deviceAlias}}{{/if}}">
			{{if row.deviceAlias == null || row.deviceAlias == "" }}{{row.mcType}}{{else}}{{row.deviceAlias}}{{/if}}
	   </td>
       <td title="{{if !row.activationTime}}未激活{{else}}{{row.activationTime | dateFormat}}{{/if}}">{{if !row.activationTime}}未激活{{else}}{{row.activationTime | dateFormat}}{{/if}}</td>
	   <td title="{{if row.expiration}}{{row.expiration | dateFormat}}{{else}}未设置{{/if}}"><span class="{{row.tdClass}}">{{if row.expiration}}{{row.expiration | dateFormat}}{{else}}未设置{{/if}}</span></td>
	   <td title="{{if row.userExpirationStr}}{{row.userExpirationStr}}{{else}}未设置{{/if}}"><span class="{{row.tdClass}}">{{if row.userExpirationStr}}{{row.userExpirationStr}}{{else}}未设置{{/if}}</span></td>
       <td title="{{row.bindUserAccount}}">{{row.bindUserAccount}}</td>
	   <td>
	     <a class="cp js-view-device-related" title="详情" onclick="complex_showDeviceRelation('{{row.imei}}',{{if data.length > 0}}true{{else}}false{{/if}},'{{viewType}}')">详情</a>
         <a class="cp" href="/trackreplay/locus?imei={{row.imei}}" target="_blank" title="轨迹回放">轨迹回放</a>
		 <a class="cp" href="/trackpreset/tracking/{{row.imei}}?isTracking=0" target="_blank" title="实时跟踪">实时跟踪</a>
		 
		 {{ if viewType =='mobileUser' }}
			<a class="cp" onclick="javascript:relieveBinding('{{row.imei}}','{{userId}}');" title="解绑">解绑</a>	
		 {{else}}	
		  		{{if row.bindUserId != null && row.bindUserId != "" }}
		 			<a class="cp" onclick="javascript:deviceRelieveBind(this,'{{row.imei}}','{{row.bindUserId}}');" title="解绑">解绑</a>
         		{{/if}}
		  {{/if}}	
       </td>
    </tr>
{{/each}}
</script>

<!-- 设备详细信息模板 -->
<script type="text/html" id="complex_device_info_tmp">
	<div class="tab-navbar">
			<ul class="js-equipment-tab-nav tab-nav clearfix">
				<li class="active" onclick="device_info_basic('{{id}}')"><a class="cp">基本信息</a></li>
				<li onclick="device_info_customer('{{id}}')"><a class="cp">客户信息</a></li>
			</ul>
		</div>

	<form id="device_info_form_{{id}}" class="form-horizontal form-sm form-preset form-ellipsis">
		<div id="device_info_a">
		<fieldset>
		<legend>基本信息</legend>
	   <input type="hidden" name="userId" value="{{info.bund.userId}}">
	   <input type="hidden" name="id" value="{{info.bund.id}}">
	   
       <div class="form-group">
         <label class="col-md-2 control-label" title="设备 IMEI">设备 IMEI：</label>
         <div class="col-md-3">
			<input type="hidden" value="{{info.bund.imei}}" name="imei">
           <input type="text" value="{{info.bund.imei}}"  disabled="disabled" class="form-control form-control-sm">
         </div>
         <label class="col-md-2 control-label" title="设备类型">设备类型：</label>
         <div class="col-md-3">
           <input type="text" value="{{if info.bund.deviceAlias == null || info.bund.deviceAlias == "" }}{{info.bund.mcType}}{{else}}{{info.bund.deviceAlias}}{{/if}}" name="mcType" disabled="disabled" class="form-control form-control-sm" >
         </div>
       </div>
	   <div class="form-group">
		 	<label class="col-md-2 control-label" title="设备名称">设备名称：</label>
          	<div class="col-md-3">
           		<input type="text" value="{{info.bund.deviceName}}" name="deviceName" class="form-control form-control-sm" maxlength="50">
         	</div>			
			<label class="col-md-2 control-label" title="设备SIM卡号">设备SIM卡号：</label>
         	<div class="col-md-3">
         		  <input type="text" value="{{info.bund.sim}}" name="sim" class="form-control form-control-sm" maxlength="20">
        	</div>
 	   </div>
	   <div class="form-group">
			<label class="col-md-2 control-label" title="设备分组">设备分组：</label>
  			<div class="col-md-3">
				<span class="easydropdown easydropdown-sm easydropdown-full va-m">
					<select name="orgId" class="complex-group-select-{{id}}"> 
						{{each info.vglist as row i}}
							<option value="{{row.id}}" {{if row.id == info.bund.orgId}}selected="selected"{{/if}}>{{if row.organizeName == '默认组'}}默认组{{else}}{{row.organizeName}}{{/if}}</option>
						{{/each}}
					</select>
				</span>
  			</div>
			<label class="col-md-2 control-label" title="激活时间">激活时间：</label>
         	<div class="col-md-3">
          		<input type="text" value="{{info.bund.activationTime | dateFormat}}" disabled="disabled" class="form-control form-control-sm">
         	</div>
	   </div>
	   <div class="form-group">
			<label class="col-md-2 control-label" title="使用范围">使用范围：</label>
         	<div class="col-md-3">
          		 <ul  class="list-fl p-t7 c-666">
             		<li onclick="complex_selectCarIoc('automobile','{{id}}',this) " title="轿车" class="p-lr5 cp automobile {{if info.bund.vehicleIcon == 'automobile'}}c-primary{{/if}}"><i id="car-ioc-automobile" class="fa fa-automobile"> </i>
             		</li>
             		<li onclick="complex_selectCarIoc('truck','{{id}}',this)" title="货车" class="p-lr5 cp truck {{if info.bund.vehicleIcon == 'truck'}}c-primary{{/if}}"><i class="fa fa-truck"> </i>
             		</li>
            		<li onclick="complex_selectCarIoc('bus','{{id}}',this)" title="客车" class="p-lr5 cp bus {{if info.bund.vehicleIcon == 'bus'}}c-primary{{/if}}"><i class="fa fa-bus"> </i>
             		</li>
             		<li onclick="complex_selectCarIoc('taxi','{{id}}',this)" title="出租车" class="p-lr5 cp taxi {{if info.bund.vehicleIcon == 'taxi'}}c-primary{{/if}}"><i class="fa fa-taxi"> </i>
             		</li>
             		<li onclick="complex_selectCarIoc('mtc','{{id}}',this)" title="摩托车" class="p-lr5 cp mtc {{if info.bund.vehicleIcon == 'mtc'}}c-primary{{/if}}"><i class="fa fa-motorcycle"> </i>
             		</li>
             		<li onclick="complex_selectCarIoc('per','{{id}}',this)" title="人" class="p-lr5 cp per {{if info.bund.vehicleIcon == 'per'}}c-primary{{/if}}"><i class="fa fa-user"> </i>
             		</li>
             		<li onclick="complex_selectCarIoc('cow','{{id}}',this)" title="牛" class="p-lr5 cp cow {{if info.bund.vehicleIcon == 'cow'}}c-primary{{/if}}"><i class="iconfont icon-qianniu"> </i>
             		</li>
             		<li onclick="complex_selectCarIoc('plane','{{id}}',this)" title="无人机" class="p-lr5 cp plane {{if info.bund.vehicleIcon == 'plane'}}c-primary{{/if}}"><i class="iconfont icon-wurenji"> </i>
             		</li>
             		<li onclick="complex_selectCarIoc('other','{{id}}',this)" title="其他" class="p-lr5 cp other {{if info.bund.vehicleIcon == 'other' || info.bund.vehicleIcon == null || info.bund.vehicleIcon == ''}}c-primary{{/if}}"><i class="fa fa-bullseye"> </i>
             		</li>
           		</ul>
           	 <input type="hidden" name="vehicleIcon" value="{{info.bund.vehicleIcon}}">
           </div>
			<label class="col-md-2 control-label" title="平台到期时间">平台到期时间：</label>
         	<div class="col-md-3">
           		<input type="text" value="{{info.bund.expiration | dateFormat}}" disabled="disabled" class="form-control form-control-sm" >
         	</div>
	   </div>
	  
	   <div class="form-group">
		  <label class="col-md-2 control-label" title="备注">备注：</label>
		  <div class="col-md-8">
			<textarea class="form-control form-control-sm" id="reMark" name="reMark"  rows="2"  maxlength="500">{{info.bund.reMark}}</textarea>
		  </div>
		</div>
		</fieldset>
	    </div>
		<div id="device_info_b" class="dn">


		<fieldset>
		<legend>客户信息</legend>
		<div class="form-group">
			<label class="col-md-2 control-label" title="司机名称">司机名称：</label>
         	<div class="col-md-3">
           		<input type="text" value="{{info.bund.driverName}}" name="driverName" class="form-control form-control-sm" maxlength="20">
         	</div>
			<label class="col-md-2 control-label" title="用户到期时间">用户到期时间：</label>
			
         	<div class="col-md-3">
		   		{{if info.bund.activationTime}}
          	 		<input type="text" value="{{info.bund.userExpiration | dateFormat}}"   {{if info.bund.userId==info.loginUserId || info.bund.bindUserId==info.loginUserId }}  disabled="disabled" {{else}} readonly="readonly" {{/if}} name="userExpiration"  id="userExpiration_{{id}}" class="form-control form-control-sm">
           		{{else}}
			 		<span class="easydropdown easydropdown-sm easydropdown-full va-m">
		   	 			<select class="complex-userexpirtion-select-{{id}}" name="month" {{if info.bund.userId==info.loginUserId  || info.bund.bindUserId==info.loginUserId}}disabled{{/if}}>
	          				<option value="">请选择</option>
							<option value="1" {{if !info.bund.userExpiration && info.bund.month && info.bund.month == 1}}selected = "selected"{{/if}}>一个月</option>
							<option value="2" {{if !info.bund.userExpiration && info.bund.month && info.bund.month == 2}}selected = "selected"{{/if}}>两个月</option>
							<option value="3" {{if !info.bund.userExpiration && info.bund.month && info.bund.month == 3}}selected = "selected"{{/if}}>三个月</option>
							<option value="6" {{if !info.bund.userExpiration && info.bund.month && info.bund.month == 6}}selected = "selected"{{/if}}>半年</option>
							<option value="12" {{if !info.bund.userExpiration && info.bund.month && info.bund.month == 12}}selected = "selected"{{/if}}>一年</option>
							<option value="1000" {{if !info.bund.userExpiration && info.bund.month && info.bund.month == 1000}}selected = "selected"{{/if}}>不限制</option>
	         			</select> 
			 		</span>
		   		{{/if}}

		   </div>
	  </div>
	  <div class="form-group">
			<label class="col-md-2 control-label" title="电话">电话：</label>
         	<div class="col-md-3">
          		 <input type="text" value="{{info.bund.driverPhone}}" name="driverPhone" class="form-control form-control-sm" maxlength="20">
         	</div>
			<label class="col-md-2 control-label" title="车牌号">车牌号：</label>
         	<div class="col-md-3">
          		 <input type="text" value="{{info.bund.vehicleNumber}}" name="vehicleNumber" class="form-control form-control-sm" maxlength="50">
         	</div>
	  </div>
	  <div class="form-group">
		  <label class="col-md-2 control-label" title="身份证号码">身份证号码：</label>
          <div class="col-md-3">
           		<input type="text" value="{{info.bund.idCard}}" name="idCard" class="form-control form-control-sm" maxlength="18">
          </div>
	      <label class="col-md-2 control-label" title="SN">SN：</label>
          <div class="col-md-3">
           		<input type="text" value="{{info.bund.sn}}" name="sn" class="form-control form-control-sm" maxlength="50">
          </div>
	  </div>
	  <div class="form-group">
			<label class="col-md-2 control-label" title="车架号">车架号：</label>
         	<div class="col-md-3">
           		<input type="text" value="{{info.bund.carFrame}}" name="carFrame" class="form-control form-control-sm" maxlength="50">
         	</div>
			<label class="col-md-2 control-label" title="电机/发动机号">电机/发动机号：</label>
         	<div class="col-md-3">
            	<input type="text" value="{{info.bund.engineNumber}}" name="engineNumber" id="engineNumber" class="form-control form-control-sm" maxlength="100">
         	</div>
	  </div>
	  <fieldset>

		<fieldset>
		<legend>安装信息</legend>
			<div class="form-group">
		 	<label class="col-md-2 control-label" title="安装时间">安装时间：</label>
          	<div class="col-md-3">
				<input type="text" value="{{info.bund.installTime}}" name="installTime" class="form-control form-control-sm" id="installTime_{{id}}" />
         	</div>			
			<label class="col-md-2 control-label" title="安装地址">安装地址：</label>
         	<div class="col-md-3">
         		  <input type="text" value="{{info.bund.installAddress}}" name="installAddress" class="form-control form-control-sm" maxlength="200">
        	</div>
 	   </div>
       <div class="form-group">
		 	<label class="col-md-2 control-label" title="安装公司">安装公司：</label>
          	<div class="col-md-3">
           		<input type="text" value="{{info.bund.installCompany}}" name="installCompany" class="form-control form-control-sm" maxlength="100">
         	</div>			
			<label class="col-md-2 control-label" title="安装位置">安装位置：</label>
         	<div class="col-md-3">
         		  <input type="text" value="{{info.bund.installPosition}}" name="installPosition" class="form-control form-control-sm" maxlength="200">
        	</div>
 	   </div>
       <div class="form-group">
		 	<label class="col-md-2 control-label" title="安装人员">安装人员：</label>
          	<div class="col-md-3">
           		<input type="text" value="{{info.bund.installPersonnel}}" name="installPersonnel" class="form-control form-control-sm" maxlength="50">
         	</div>			
 	   </div>
       <div class="form-group">
		 	<label class="col-md-2 control-label" title="安装图片">安装图片：</label>
            <div class="col-md-9">
                <div class="batch-pic oh">
					<div class="pr fileButton_{{id}}">
						<div class="pa l0 t0">	
						<button id="fileButton_{{id}}" type="button" class="btn btn-success btn-sm mw-100"><i class="fa fa-image"></i>&nbsp;上传</button>
							
						</div>
						<div class="pr transparent z-i1">
	    					<input id="fileBtn_{{id}}" name="file" type="file" value="{{info.bund.installImage}}" onchange="other_upload('{{id}}')" ></input>
							<input id="installImage_{{id}}" type="hidden" value="{{info.bund.installImage}}" name="installImage" />
							
						</div>
					</div>
					<br>
					<ul class="clearfix pic-list" style="margin-right:-15px;" id="uploadInstall_ul_{{id}}">
                        {{each info.bund.installImageList as image}}
						{{if image}}
							<li>
								<div class="delete-pic" onclick="deleteInstallImage(this,'{{image}}','{{id}}')"></div>
								<div class="p-pic"><a href="{{info.qiniudomain}}{{image}}"><img src="{{info.qiniudomain}}{{image}}" /></a></div>
							</li>
							{{/if}}		
						{{/each}}
                    </ul>
                </div>
            </div>				
 	   </div>
		</fieldset>
        </div>
		{{if !modal}}
       	<div class="form-group">
         <label class="col-md-2 control-label"></label>
         <div class="col-md-3 p-l0">
           <button class="btn btn-primary mw-100" type="button" onclick="complex_device_info_submit('{{id}}','{{modal}}')">保存</button>
         </div>
		{{/if}}
       </div>
     </form>
</script>

<!-- 新增用户表单 -->
<script type="text/html" id="complex_addUser_tmp">
	<form id="{{formId}}" class="form-horizontal form-sm form-preset form-ellipsis">
	  <input type="hidden" value="{{parentId}}" name="parentId">
	  <input type="hidden" value="{{fullPid}}" name="fullPid">

      <div class="form-group">
        <label class="col-md-2 control-label" title="上级用户">
          <span class="c-red">*</span>
          上级用户：
        </label>
        <div class="col-md-3">
          <input type="text" value="{{parentName}}" name="parentName" class="form-control form-control-sm" disabled>
        </div>
		<label class="col-md-2 control-label"
				title="联系人">
			联系人：
		</label>
		<div class="col-md-3">
			<input id="contact" name="contact" type="text"
				class="form-control form-control-sm"
				placeholder="请输入联系人" maxlength="50"  />
		</div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label" title="客户类型"><span class="c-red">*</span>客户类型：</label>
        <div class="col-md-3">
          <div class="p-tb5">
            {{if loginUserType == '0' || loginUserType == '11'}}
				<label class="icheck-min" title="销售"><input type="radio" name="type" checked value="11">&nbsp;销售</label>&emsp;
			{{/if}}
            {{if loginUserType == '0' || loginUserType == '11' || loginUserType == '8' || loginUserType == '10'}}
            	<label class="icheck-min" title="代理商"><input type="radio" name="type" value="8">&nbsp;代理商</label>&emsp;
			{{/if}}
            <label class="icheck-min" title="用户"><input type="radio" name="type" value="9">&nbsp;用户</label>
          </div>
        </div>
        <label class="col-md-2 control-label" title="电话">电话：</label>
        <div class="col-md-3">
          <input type="text" name="phone" class="form-control form-control-sm" placeholder="请输入电话号码" maxlength="20"/>
        </div>
      </div>
      <div class="form-group">
      	<label class="col-md-2 control-label" title="登录账号"><span class="c-red">*</span>登录账号：</label>
        <div class="col-md-3">
          <input type="text" name="account" class="form-control form-control-sm" placeholder="请输入账号" maxlength="30"/>
        </div>
        <label class="col-md-2 control-label" title="邮件">邮件：</label>
        <div class="col-md-3">
          <input type="text" name="email" class="form-control form-control-sm" placeholder="请输入邮箱" maxlength="50"/>
        </div>
      </div>
      <div class="form-group">
      	<label class="col-md-2 control-label" title="客户名称"><span class="c-red">*</span>客户名称：</label>
        <div class="col-md-3">
          <input type="text" name="nickName" class="form-control form-control-sm" placeholder="请输入用户名称" maxlength="50"/>
        </div>
		<label class="col-md-2 control-label" title="登录权限">登录权限：</label>
        <div class="col-md-3 p-tb5 p-r0">
          <label class="icheck-min text-ellipsis w100" title="APP登录权限"><input type="checkbox" name="appLoginCheck" checked="checked"/>&nbsp;APP登录权限</label>
		  <input type="hidden" name="appLogin" value="1"/>
       	  <label class="icheck-min text-ellipsis w100" title="Web登录权限"><input type="checkbox" name="webLoginCheck" checked="checked"/>&nbsp;Web登录权限</label>
		  <input type="hidden" name="webLogin" value="1"/>
		</div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label" title="密码"><span class="c-red">*</span>密码：</label>
        <div class="col-md-3">
          <input type="password" value="888888" id="password" name="passWord" class="form-control form-control-sm" onkeyup="javascript:if($(this).val()!='888888'){$('#markPswAgain_{{formId}}').show()}else{$('#markPswAgain_{{formId}}').hide()}" placeholder="密码"/>
		  <div class="c-666 p-t5">默认密码:888888</div>        
        </div>
		<label class="col-md-2 control-label" title="指令权限">指令权限：</label>
        <div class="col-md-3 p-tb5 p-r0">
          <label class="icheck-min text-ellipsis w100" title="批量下发指令">
				<input type="checkbox" name="isBatchSendInsCheck" />&nbsp;批量下发指令
		  </label>
		  <input type="hidden" name="isBatchSendIns" value="0"/>
       	  <label class="icheck-min text-ellipsis w100" title="批量下发工作模式">
				<input type="checkbox" name="isBatchSendFMCheck" />&nbsp;批量下发工作模式
		  </label>
		  <input type="hidden" name="isBatchSendFM" value="0"/>
		</div>


      </div>

      <div class="form-group">
		<div id="markPswAgain_{{formId}}" class="dn">
      		<label class="col-md-2 control-label" title="确认密码"><span class="c-red">*</span>确认密码：</label>
        	<div class="col-md-3">
          		<input type="password" name="pswAgain" class="form-control form-control-sm" placeholder="请确认您输入的密码"/>
        	</div>
		</div>
	 </div>

      <div class="form-group">
        <label class="col-md-2 control-label"></label>
        <div class="col-md-3">
          <button type="button" onclick="complex_addUserClick();" class="btn btn-primary w100">保存</button>
        </div>
      </div>
    </form>
</script>

<!-- 快速销售、设备转移 -->
<script type="text/html" id="complex_user_sale_tmp">
	<div class="col-md-{{if treeFlag == 'true'}}6{{else}}12{{/if}} select-device">
	<label>已选设备：<span class="c-red" id="sale_count_{{id}}">0</span>{{if treeFlag == 'false'}}，销售给：<b id="sale_to_{{id}}">{{saleTo}}</b>{{/if}}</label>
	<div class="b1-ccc bc-fafafa p-10">
	  <div class="form-control form-control-sm imei-textarea-box pr" >
	      <textarea title="请输入IMEI号(回车换行)" id="sale_imei_{{id}}" placeholder="请输入设备IMEI号(多个回车换行)" class="imei-textarea" type="text"></textarea>
	  	  <div class="func-btnbar ta-r">
			<div class="fl p-t5">IMEI计数：<span class="dev-num">0</span></div>
            <div id="complex_putdevice_loading" class="fl p-t5 p-l15 dn">
				<i class="fa fa-spinner fa-pulse fa-fw fa-1x"></i>
				正在加载数据...
			</div>
            <div class="fr">
	           <button class="btn btn-success btn-sm mw-80 js-add-results-btn" type="button" onclick="complex_slae_validate('{{id}}',null)">添加</button>&nbsp;&nbsp;
	           <button class="btn btn-default btn-sm mw-80 js-close" type="button" >取消</button>
            </div>
          </div>
	  </div>
	  <div class="table-list-head bc-eee m-t10">
		<table class="table table-condensed table-ellipsis table-td-normal table-noborder m-b0" >
		  <thead>
			<th class="first" title="IMEI">IMEI</th>
			<th title="设备类型">设备类型</th>
			<th title="所属用户">所属用户</th>
			<th title="操作">操作</th>
		  </thead>
		</table>
	  </div>
	  <div class="table-list-con oy-a">
	    <table class="table table-condensed table-ellipsis table-td-normal table-noborder m-b0">
	      <tbody id="sale_tbody_{{id}}">
		  
	      </tbody>
		</table>
	  </div>
	</div>
	</div>
	{{if treeFlag == 'true'}}
	<div class="col-md-6 p-l0 select-user">
       <label>
			{{if treeFlag == 'true'}} 
    				{{if  modalId =='batchSales'}}  
						销售给
					{{else}}
						转移给
					{{/if}}
			{{else}}
						销售给   
			{{/if}}
		：<span class="c-red" id="allot_to_{{id}}"></span></label>
       <div class="b1-ddd p-lr10 bc-fafafa">
         <div class="tree-scroll oy-a">
         	{{if id == 'complexAllot'}}
		   		<div class="tree-search m-t10"> <i class="tree-search-icon" id="complexAllot_globalSearch_btn"></i>
              		<input type="text" id="complexAllot_globalSearch_input" class="empty fs-12" value="" placeholder="请输入客户名称或帐号">
           		</div>
         	{{/if}}
         	{{if id == 'batchSaleid'}}
		   		<div class="tree-search m-t10"> <i class="tree-search-icon" id="batchSaleid_globalSearch_btn"></i>
              		<input type="text" id="batchSaleid_globalSearch_input" class="empty fs-12" value="" placeholder="请输入客户名称或帐号">
           		</div>
         	{{/if}}
           <ul id="complex_allotDev_tree_{{id}}" class="ztree">
           </ul>
         </div>
       </div>
    </div>
	{{/if}}
	
	<div class="col-md-12 row p-r0 p-t10 select-validity">
		<div class="col-md-6">
			{{if expirationFlag == 'true'}}
      		<lable>用户到期时间：</lable>
      		<span class="easydropdown easydropdown-up easydropdown-sm va-m">
        		<select class="complex-js-select-{{id}}">
					<option value="">请选择</option>
					<option value="one_month">一个月</option>
					<option value="two_month">两个月</option>
					<option value="three_month">三个月</option>
					<option value="half_year">半年</option>
					<option value="one_year">一年</option>
					<option value="noLimit">不限制</option>
        		</select>
      		</span>
			&emsp;
			{{/if}}
			<button onclick="complex_resetAllotDev('{{id}}','{{treeFlag}}','{{expirationFlag}}')" class="btn btn-sm btn-default mw-100">重置</button>
		</div>
		<div class="col-md-6 p-r0">
			<button type="button" class="btn btn-sm btn-default fr mw-100 dev-cancel" data-dismiss="modal">取消</button>
			<button class="btn btn-sm btn-primary fr mw-100 dev-handling" style="display: none;" disabled="disabled">
    			<i class="fa fa-spinner  fa-spin"></i>&nbsp;
  				处理中...
  			</button>
			<button onclick="complex_allotDev('{{id}}','{{treeFlag}}','{{expirationFlag}}','{{modalId}}')" class="btn btn-sm btn-primary mw-100 fr m-lr15 dev-tohandle">
			{{if treeFlag == 'true'}} 
    				{{if  modalId =='batchSales'}}  
						销售
					{{else}}
						转移
					{{/if}}
			{{else}}
					销售
			{{/if}}
		    </button>
		</div>
    </div>

</script>

<!-- 验证失败 -->
<script type="text/html" id="complex_sale_faild_tr">
	  <div>当前添加成功&nbsp;&nbsp;<b class="c-72af2d">{{successNum}}</b>&nbsp;, 失败 &nbsp;&nbsp;<b class="c-red">{{faildNum}}</b>
	  </div>
	  <div class="oy-a mah-200">
	    <table width="100%" class="table table-condensed table-ellipsis table-td-normal">
	      <thead>
	      <tr title="IMEI"><th width="50%">IMEI</th>
	        <th title="状态" width="20%">状态</th>
	        <th title="原因">原因</th>
	      </tr></thead>
	      <tbody>
			{{each data as row i}}
	      	<tr>
	        	<td title="{{row.imei}}">{{row.imei}}</td>
	        	<td title="失败"><span class="c-red">失败</span></td>
				<td title="{{if row.reason == 1}}不存在{{/if}}{{if row.reason == 2}}已绑定{{/if}}{{if row.reason == 3}}重复{{/if}}">
					{{if row.reason == 1}}不存在{{/if}}
					{{if row.reason == 2}}已绑定{{/if}}
					{{if row.reason == 3}}重复{{/if}}
				</td>
	      	</tr>
			{{/each}}
	      </tbody>
	    </table>
	  </div>
</script>

<!-- 验证成功 -->
<script type="text/html" id="complex_sale_success_tr">
	{{each data as row i}}
		<tr>
      		<td title="{{row.imei}}" class="first">{{row.imei}}</td>
      		<td title="{{if row.deviceAlias == null || row.deviceAlias == "" }}{{row.mcType}}{{else}}{{row.deviceAlias}}{{/if}}">{{if row.deviceAlias == null || row.deviceAlias == "" }}{{row.mcType}}{{else}}{{row.deviceAlias}}{{/if}}</td>
      		<td title="{{row.userName}}">{{row.userName}}</td>
      		<td title="删除"><a onclick="complex_drop_sale_imei(this,'{{id}}')">删除</a></td>
    	</tr>
	{{/each}}
</script>

<!-- 设备型号 -->
<script type="text/html" id="complex_dev_mcType_options">
	<select name="mcType" class="js-select-mcType">
		{{each data as row index}}
			<option selected value="{{row.key}}">{{row.title}}</option>
		{{/each}}
	</select>
</script>


<script type="text/html" id="complex_package_tmp">	
           {{each data as row i}}
           <li data="{{row.code}}">
             <dl class="item">
               <dt>{{row.name}}</dt>
               <dd>价格: {{(row.limit*(row.discount*100))/100}}米币{{if row.discount != 1}}({{row.discount*100/10}}折){{/if}}</dd>
             </dl>
           </li>
           {{/each}}
</script>	
<script type="text/html" id="allotProlong_table_tmp">
{{each data as row i}}
	<tr>
 		<td><i class="fa fa-hdd-o"></i>&nbsp;<span>{{row.devName}}</span></td>
 		<td>{{row.imei}}<input type="hidden" name='allotProlong_imei_{{id}}' value="{{row.imei}}"/></td>
 		<td>{{row.userName}}</td>
	</tr>
{{/each}}
 </script>
<script type="text/html" id="complex_loading_tmp">
	<div id="complex_logindata" class="ta-c m-tb15">
		<i class="fa fa-spinner fa-pulse fa-fw fa-2x"></i>
		正在加载数据...
	</div>
</script>
<script>
//保存当前登录用户ID
var complex_loginUserId  = '<%=request.getAttribute("userId")%>';
var complex_loginUserType = '8';
//重置密码
function resetPwd(userId,account){
	 l = layer.confirm('您确定要重置密码？<br/>重置后密码为:888888', {
	    btn: ['确定','取消'], //按钮
	   /*  shade: false, //不显示遮罩 */
	    title:"操作提示",
	}, function(){
		$.ajax({
			type:'POST',
			url:'/useradmin/resetPwd',
			dataType:'json',
			data:{'userId':userId,'account':account},
			success:function(ret){
				if(ret.code==0){
					
					layer.close(l);
					layer.msg("操作成功",{icon:1});
				}else{
					layer.close(l);
					layer.msg("操作失败",{icon:2});
				}
				
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
				layer.close(l);
			}
		});
		
	});
}

function toIndex(userId,account,parentId,imei){
	$("#index_userId").val(userId);
	$("#index_account").val(account);
	$("#index_parentId").val(parentId);
	$("#index_keyword").val(imei);
	$("#toIndexForm").submit();
}

</script>
<script type="text/javascript" src="webpage/resource/js/complexQuery/complexQuery.js"></script>
<script src="webpage/resource/plugins/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
<script type="text/javascript" src="webpage/resource/plugins/fileUpLoad/ajaxfileupload.js"></script>



 <link rel="stylesheet" type="text/css" href="webpage/resource/js/webuploader/webuploader.css">



<script type="text/javascript" src="webpage/resource/plugins/ciTy/js/city.min.js"></script>
<!-- photobox --> 
<link rel="stylesheet" href="webpage/resource/plugins/photobox/photobox.css">
<!--[if lt IE 9]><link rel="stylesheet" href="webpage/resource/plugins/photobox/photobox.ie.css"><![endif]-->
<script src="webpage/resource/plugins/photobox/jquery.photobox.js"></script> 

<script type="text/javascript" src="webpage/resource/js/dateUtil.js"></script>
<script type="text/javascript" src="webpage/resource/js/customer/dropBoxTime.js"></script>

<script>
var account="yanshi";
var userId="<%=request.getAttribute("userId")%>";
var SESSION_LOGIN_USER_type='8';
var location_User = '';
var batchUpdate = '';
var batchUpdateFailInfo = '';
var batchUpdateSuccNumber = '';
var currUserId = '<%=request.getAttribute("userId")%>';
</script>


<script  type="text/html" id="erweima">
		<span class="qrcode-pic">
		<div id="printArea_{{imei}}" style="width: 3cm;height:3cm;margin: -20px auto 0;">
			<img  style="width: 3cm;height:3cm;" src={{imgsrc}}/>
		 </div>
		 <button type="button" onclick="print('{{imei}}');" class="btn btn-default btn-block m-t10"><i class="fa fa-print"></i>&nbsp;打印</button>
		 </span>
</script>

<!-- Google 相关 -->
<!-- jingxiaoshang -->
<script type="text/javascript"  src="webpage/resource/js/customer/agency.js"></script>
<script type="text/javascript" src="webpage/resource/js/customer/custom_search.js"></script>	

<!-- baidu 相关 -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=S7gxefmASouTllUyjE71hWV3"></script>
<script type="text/javascript" src="webpage/resource/js/geozone/geozoneEcho.js"></script>
</body>
</html>
<%@ include file="agencyDto.html" %> 
