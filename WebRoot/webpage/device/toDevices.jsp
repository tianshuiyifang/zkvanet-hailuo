<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>









<%@ include file="deviceCheck.html" %> 


<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta charset="UTF-8">
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
		if(sessionid!=_sessionid){
		//	window.location.href=window.location.href;
		}
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
<title>设备管理 -Tracker</title>
<!-- icheck -->
<link rel="stylesheet" href="webpage/resource/plugins/icheck/icheck.css" >
<script src="webpage/resource/plugins/icheck/icheck.min.js"></script>
<script type="text/javascript" src="webpage/resource/js/customer/customTree.js"></script>
<script type="text/javascript" src="webpage/resource/js/assets/device.js"></script>
<script type="text/javascript" src="webpage/resource/js/assets/devicecheck.js"></script>
<script src="webpage/resource/js/tooltip.js"></script>
<script src="webpage/resource/js/popover.js"></script>
</head>

<body class="body bc-gray">
<div style="display: none;">
	<form id="toIndexFormRow" action="/index" method="post" target="_blank">
		<input type="hidden" name="userId" id="index_userIdRow"/>
		<input type="hidden" name="account" id="index_accountRow"/>
	</form>
</div>
<input type="hidden" name="clickUserId" id="clickUserId">
<input type="hidden" name="clickPId" id="clickPId">
<input type="hidden" name="clickFullParentId" id="clickFullParentId">


 
	   
		<body class="body bc-gray ">
	 
	
 
<div class="wrapper">
  <!-- header start -->
  	 

<header class="header navbar  navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<div class="navbar-brand">
				<a href="meunController.do?main">
				<img src="webpage/resource/images/timg.jpg"
					height="34" alt="Tracker" /></a>

			</div>
		</div>
		<div class="navbar-collapse collapse">
			
			<div class="navbar-right p-15 p-b0 ta-r">
				<div class="user-time">
					
						<a  href="/business/ConmmandLogs/toBusinessLog">业务日志</a>&emsp;
					
					<!-- <span class="pr theme-switch"><a class="js-theme-switch-btn theme-switch-btn cp c-fff ">切换主题&nbsp;<i class="fa fa-caret-down"></i></a> 
		            <div class="theme-box pa c-666 p-lr10 p-tb5 ta-l lh-2 b1-ccc bc-fff">
		              <ul id="themeList">
		                <li class="theme-default active"  title="默认"><a>默认</a></li>
		                <li data-theme="theme-green" class="theme-green" title="绿色"><a>绿色</a></li>
		                <li data-theme="theme-orange" class="theme-orange"  title="橙色"><a>橙色</a></li>
		                <li data-theme="theme-red" class="theme-red" title="红色"><a>红色</a></li>
		              </ul>
		            </div>
		            </span>&emsp;-->
		            
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
		<div id="complexQuery" class="navbar-right  p-10" data-option="{'renderingFlag':false}"></div>
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
					<form class="form-horizontal form-preset p-tb25" id="edit-modal-userForm" action="">
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
								<input type="text" name="phone" value="" maxlength="20" placeholder="请输入电话号码"
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
					<form class="form-horizontal form-preset p-tb25" id="editpwd-form" action="">
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
								<input type="password" value="" id="newPwd_advise" name="newPwd" autocomplete="off" onkeyup="passwordStrengthAdvise(this);" placeholder="请输入新密码" class="form-control">
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
								<input type="password" value="" id="renewPwd" name="renewPwd" placeholder="请输入确认新密码"
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
	var projectName="TUQIANG";
</script>

<script type="text/javascript">

var header='devicesManagement';
$("#"+header).addClass("active");

switch (header) {
case "index":
	$("#complexQuery").attr("data-option","{'treeId':'treeDemo','updateTreeId':'treeDemo','renderingFlag':true}");
	break;
default:
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

/************************修改密码-start**************************/ 
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
	if (/^[0-9a-zA-Z]{6,16}$/.test(value)) {
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
			equalTo:"#newPwd_advise",
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
								//window.location.href=_ctx+"/logout";
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
					nickNameValid:true
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
				phone:{
					required :"请输入电话号码"
				},
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
	
	
function exitSys()
	{
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
	window.location.href='loginController.do?logout';
	}
	
	$(".js-exit-system").click(function() {
		layer.confirm('您确定要退出系统吗?', {
			title:'信息',
			btn : [ '确定', '取消' ] 
		}, function() {
			delCookie("selectHistory");
			exitSys();

		});
	});
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
			v.countStr = "(" + v.deviceCount.stock + "/"
			+ v.deviceCount.repertory + ")";
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
			//拼接成 (库存/进货)
			v.countStr = "(" + v.deviceCount.active + "/"
			+ v.deviceCount.repertory + ")";
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
			//拼接成 (库存/进货)
			v.countStr = "(" + v.deviceCount.active + "/"
			+ v.deviceCount.repertory + ")";
			if(typeof(v.countStr) != 'undefined'){
				v.name = v.name + v.countStr;
			}
		});
		return responseData.data;
	}
	
	$(function(){
		document.getElementById('curr_time').innerHTML=new Date().Format("yyyy-MM-dd hh:mm:ss"); 
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
  <div class="main">
			<div class="container-fluid">
				<div class="row">
					<div class="customer-leftsidebar p-t15">
						<div class="p-lr15 bc-fff  side-left">
							<div class="user-list">
								<div class="side-subtitle side-full-subtitle row" title="yanshi">
								<a class="btn btn-default btn-xs fr js-add-device" onclick="complex_buildDeviceInfoForm('add')" ><i class="fa fa-plus"></i>&nbsp;<span>新增设备</span></a>
								<b id="account">${userName}</b>
							</div>
							<div class="p-tb10 js-side-tree-box show-userlist" style=""> 
								<%--<div class="tree-search"><i class="tree-search-icon" id="cusTreeSearchBtn" title="搜索"></i>
									<input type="text" id="cusTreeKey" value="" placeholder="请输入客户名称或帐号" class="empty fs-12"/>
									<input type="radio" id="name" name="keyType" class="hide" checked  />
									<input type="radio" checked="" style="margin-left:36px;" class="hide" name="funType" id="getNodesByParamFuzzy">
								</div>
								--%><div class="tree-scroll default-scrollbar h600">
									<div class="ta-c m-tb15" id="TreeLogindata"><i class="fa fa-spinner fa-pulse fa-fw"></i>正在加载数据...</div>
									<ul id="treeDemo" class="ztree"></ul>
								</div>
							</div>
							</div>
							<!-- 
							<div class="device-tab row">
								<div class="side-subtitle side-full-subtitle" title="设备管理"><b>设备管理</b></div>
								<div class="side-busines account-side-busines p-tb10">
									<ul id="device-tab-ul">
										<li class="active"><a style="outline-style: none;">全部设备(<span id="devCount">0</span>)</a></li>
										<li><a>已过期(<span id="expire">0</span>)</a></li>
										<li><a>7天内到期(<span id="expire7">0</span>)</a></li>
										<li><a>60天内到期(<span id="expire60">0</span>)</a></li>
									</ul>
								</div>
							</div>
							 -->
						</div>
					</div>
					<div class="customer-rightsidebar p-15">
						<form action="/device/listExport" method="post" id="DevForm"> 
						  <input type="hidden"  id="userId" 	name="userId"/>
						  <input type="hidden"  id="dateType"	name="dateType"/>
						  <input type="hidden"  id="startDate"	name="startDate"/> 
						  <input type="hidden"  id="endDate"	name="endDate"/>
						   <input type="hidden" id="exportType"	name="exportType"  value="exportType"/> 
						   
						   
						   <input type="hidden"  id="mcType2_exp"	name="mcType2"/>
						   <input type="hidden"  id="imeis_exp"	name="imeis"/>
						  <input type="hidden"  id="deviceName_exp"	name="deviceName"/> 
						  <input type="hidden"  id="vehicleNumber_exp"	name="vehicleNumber"/>
						  <input type="hidden"  id="carFrame_exp"	name="carFrame"/>
						  <input type="hidden"  id="sim_exp"	name="sim"/>
						  <input type="hidden"  id="isActivation_exp"	name="isActivation"/> 
						  <input type="hidden"  id="vehicleIcon_exp"	name="vehicleIcon"/>
						  
						  <input type="hidden"  id="expireStartTime_exp"	name="expireStartTime"/>
						  <input type="hidden"  id="expireEndTime_exp"	name="expireEndTime"/>
						  <input type="hidden"  id="subSearchId_exp"	name="subSearchId"/>
						   
						</form>
						<div class="device-con-box b1-ccc bc-fff">
							<div class="rightside-header clearfix">
								<div class="p-tb5"><b>全部设备</b></div>
							</div>
							<div class="right-tab-con">
								<div class="funcbar">
									<div class="form-inline search-criteria clearfix p-tb10">
									
										<div class="form-group">
	                                		<div class="imei-textarea-box d-ib pr">
                                                <textarea type="text" id="searchIMEI" class="imei-textarea " placeholder="请输入IMEI号(回车换行)" title="请输入IMEI号(回车换行)"></textarea>
                                                <div class="func-btnbar clearfix">
                                                    <div class="fl p-t5">
                                                        IMEI计数：
                                                        <span class="dev-num" id="ac_dev_num">0</span>
                                                    </div>
                                                    <div class="fr">
                                                        <button class="btn btn-success btn-sm mw-80 js-add-results-btn" type="button">确定</button>
                                                        &nbsp;&nbsp;
                                                        <button class="btn btn-default btn-sm mw-80 js-close" type="button">清空</button>
                                                    </div>
                                                </div>
                                            </div>
										</div>
										&nbsp;
										<div class="form-group">
											<input id="deviceName" type="text" name="deviceName" class="form-control form-control-sm" size="20" placeholder="请输入设备名称" title="请输入设备名称">
										</div>
										&nbsp;
										
									<%--	<div class="form-group p-r15">
											<div class="d-ib w120 va-m">
												<div class="easydropdown easydropdown-sm easydropdown-full" >
													<select id="mcTypeSel" class="js-select" >
													    <option value="" title="过期状态" >全部型号</option>
													    <option value="1" title="即将过期">A50</option>
													    <option value="2" title="已过期">T70</option>
													</select>
												</div>
											</div>
											
											&nbsp;
											<div class="d-ib w100 va-m">
												<div class="easydropdown easydropdown-sm easydropdown-full">
													<select class="js-select" id="expire_soon">
													    <option value="" title="过期状态" >过期状态</option>
													    <option value="1" title="即将过期">即将过期</option>
													    <option value="2" title="已过期">已过期</option>
													</select>
												</div>
											</div>
											
										</div>
										&nbsp;
										<div class="form-group p-r15"><label class="icheck-min" title="包含下级设备"><input type="checkbox" value="1" id="contain_sub">&nbsp;包含下级设备</label></div>
										&nbsp;--%>
										<div class="form-group">
											<div class="input-group">
										        <button type="button" class="btn btn-sm btn-primary" title="搜索" onclick="searchList();"><i class="fa fa-search"></i>&nbsp;搜索</button>
										        <%--<div class="input-group-btn">
										          <button type="button" class="btn btn-sm btn-primary o_8 js-more-condition-btn" title="更多">更多筛选条件&nbsp;<i class="fa fa-caret-down"></i></button>
										        </div>
										      --%>
										       </div>
										</div>
										<button type="button" style="padding-left:20px" class="btn btn-sm btn-primary checkGpsWeight" title="校准" onclick="checkGpsWeight();">校准</button>
										    
										<div class="js-more-condition-box m-t10 dn">
											<div class="form-group">
												<input  type="text" id="vehicleNumber" name="vehicleNumber" class="form-control form-control-sm w157" size="20" placeholder="请输入车牌号" title="请输入车牌号">
											</div>
											&nbsp;
											<div class="form-group">
												<input  type="text" id="carFrame" name="carFrame" class="form-control form-control-sm w157" size="20" placeholder="请输入车架号" title="请输入车架号">
											</div>
											&nbsp;
											<div class="form-group">
												<input  type="text" id="sim" name="sim" class="form-control form-control-sm" size="20" placeholder="请输入SIM卡号" title="请输入SIM卡号">
											</div>
											&nbsp;
											<div class="d-ib w100 va-m">
												<div class="easydropdown easydropdown-sm easydropdown-full">
													<select class="js-select" id="isActivation">
													    <option value="" title="激活状态">激活状态</option>
													    <option value="1" title="已激活">已激活</option>
													    <option value="2" title="未激活">未激活</option>
													</select>
												</div>
											</div>
											<div class="m-t10">
												<div class="d-ib va-m" style="width:157px;">
													<div class="easydropdown easydropdown-sm easydropdown-full">
														<select class="js-select" id="dateTypeExpiration">
														    <option value="activationExpiration" title="激活时间">激活时间</option>
														    <option value="expiration" title="平台到期时间">平台到期时间</option>
														    <option value="userExpiration" title="用户到期时间">用户到期时间</option>
														</select>
													</div>
												</div>
												&nbsp;
												<div class="form-group">
													<input type="text" value="" name="startTime" class="form-control form-control-sm w157" id="startTime_sport" placeholder="开始时间" title="开始时间"/>
												</div>
												&nbsp;
												<div class="form-group">
													<input type="text" value="" name="endTime" class="form-control form-control-sm" id="endTime_sport" placeholder="结束时间" title="结束时间"/>
												</div>
												&nbsp;
												<div class="form-group">
													使用范围:
													<ul class="list-fl c-666 d-ib va-m js-device-icon-list">
							                            <li title="轿车" onclick="cust_complex_selectCarIoc('automobile',this)" class="p-lr5 cp automobile " ><i id="car-ioc-automobile" class="fa fa-automobile"> </i> </li>
							                            <li title="货车" onclick="cust_complex_selectCarIoc('truck',this)" class="p-lr5 cp truck "><i class="fa fa-truck"> </i> </li>
							                            <li title="客车" onclick="cust_complex_selectCarIoc('bus',this)" class="p-lr5 cp bus "><i class="fa fa-bus"> </i> </li>
							                            <li title="出租车" onclick="cust_complex_selectCarIoc('taxi',this)" class="p-lr5 cp taxi "><i class="fa fa-taxi"> </i> </li>
							                            <li title="摩托车" onclick="cust_complex_selectCarIoc('mtc',this)" class="p-lr5 cp mtc"><i class="fa fa-motorcycle"> </i> </li>
							                            <li title="人" onclick="cust_complex_selectCarIoc('per',this)" class="p-lr5 cp"><i class="fa fa-user"> </i> </li>
							                            
							                            <li title="牛" onclick="cust_complex_selectCarIoc('cow',this)" class="p-lr5 cp cow"><i class="iconfont icon-qianniu"> </i>
							                            <li title="无人机" onclick="cust_complex_selectCarIoc('plane',this)" class="p-lr5 cp plane"><i class="iconfont icon-wurenji"> </i> </li>
							                            <li title="其他" onclick="cust_complex_selectCarIoc('other',this)" class="p-lr5 cp other "><i class="fa fa-bullseye"> </i> </li>
							                          </ul>
							                          <input type="hidden" name="vehicleIcon" id="vehicleIcon_cust" value=""/>
 												</div>
											</div>
										</div>
									</div>
									
								</div>
								
							<div class="table-header">
								<div class="p-tb5 p-lr15 b-b1-ccc">
									
										
										
									
									
								</div>
								<table id="tableHeader" class="table table-hover table-ellipsis m-b0" >
									<thead>
									<tr>
										<th title="序号"><label class="icheck-min check-all"><input type="checkbox">&nbsp;序号</label></th>
										<th title="id" style="display:none">设备ID</th>
										<th title="设备名称">设备名称</th>
										<th title="设备IMEI">设备IMEI</th>
										<th title="型号">型号</th>
										<th title="激活时间">激活时间</th>
										<th title="用户到期时间">用户到期时间</th>
										<th title="状态">状态</th>
										<th title="绑定用户">绑定用户</th>
										
										<th title="操作">操作</th>
										
									</tr>
									</thead>
								</table>
							</div>
							<div class="table-scrollbar oy-a">
								<table id="tableContent" class="table table-hover table-ellipsis">
									<colgroup>
										<col width="70">
										<col>
										<col>
										<col width="90">
										<col>
										<col>
										<col>
										<col>
										<col width="100" />
									</colgroup>
									<tbody id="markDevTable"><!--  -->
					                  	<script type="text/html" id="dev-info">
		                  				{{each result as row i}}
			                  				<tr class="{{row.rowClass}}">
			                       			    <td><label class="icheck-min"><input type="checkbox" class="check-row" value="{{row.imei}}">&nbsp;{{(pageNo-1)*pageSize+(i+1)}}</label></td>
                                                <td title="{{row.id}}" style="display:none">{{row.id}}</td>
			                       				<td title="{{row.deviceName}}">{{ if row.bindUserId != null && row.bindUserId != "" }}<i class="fa fa-mobile"></i>&nbsp;&nbsp;{{/if}}{{row.deviceName}} </td>
			                       				<td title="{{row.imei}}">{{row.imei}}</td>
                                                <td title="{{row.mcType}}">{{row.mcType}}</td>
			                       				<td title="{{if row.activationTime == "" || row.activationTime == null}}未激活{{else}}{{row.activationTime}}{{/if}}">{{if row.activationTime == "" || row.activationTime == null}}未激活{{else}}{{row.activationTime | dateFormat}}{{/if}}</td>
												<td title="{{if row.userExpiration == ""|| row.userExpiration     == null}}未设置{{else}}{{row.userExpiration}}{{/if}}">{{if row.userExpiration == ""         || row.userExpiration == null}}未设置&nbsp;<span name="show-question" class="fa fa-question-circle cp" rel="popover"></span>{{else}}{{row.userExpiration | dateFormat}}{{/if}}</td>
								   				<td title="{{if row.userExpirationStr !='' &&row.userExpirationStr != null }}{{row.userExpirationStr}}{{else}}未激活{{/if}}"><span class="{{row.tdClass}}">{{if row.userExpirationStr !='' &&row.userExpirationStr != null }}{{row.userExpirationStr}}{{else}}未激活{{/if}}</span></td>
								   				<td title="{{row.account}}">{{row.account}}</td>
												{{if  userType!='12' }}
												<td class="ov">
													<a title="编辑" class="js-editor-users-btn"  href="javascript:toUpdateDevice_report('{{row.id}}')">编辑</a>
                                                    <a title="删除" class="js-delete-users-btn"  href="javascript:toDeleteDevice_report('{{row.id}}')">删除</a>
								  				</td>
												{{/if}}
											</tr>
										{{/each}}
										</script>

					               </tbody>
				                </table>
				                <div id="paging-dev" class="simple-pagination-custom ta-c p-b10"></div>
				                <div id="dev-noData" hidden="true"><div class="ta-c c-666 p-tb10"><span class="p-5 d-ib">&nbsp;<i class="fa fa-bell-o"></i> 暂无数据&nbsp;</span></div></div>
								<div id="dev-loading" class="ta-c p-tb25"><i class="fa fa-spinner fa-pulse fa-2x"></i></div>
							</div>
						</div>
						</div> 
					</div>
				</div>
			</div>
	
		<!-- 搜索用户设备 -->
		
<!-- <footer class="footer ta-c">Copyright © jimi 2014-<span class="js-year"></span>. All rights are reserved.</footer> -->
<div style="position: fixed; left:-9999em; top:0; ">
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1260225997'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/z_stat.php%3Fid%3D1260225997%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</div>


	</div>
	 <!--main 页的结束-->
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
<div class="alarm-info hidden" id="alarmMessage">
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
      <a class="cp" onclick="javascript:readAlarm('');">全部标为已读</a>
      <a class="cp js-type-filter-btn" onclick="javascript:alarmFilter();">报警内容筛选</a>
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
		alarmFilter();
		
		getAlarmInfoList(true,1);
		
	
		
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
	
	var header='devicesManagement';
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
  
  <!-- 批量发送指令modal -->
  <div class="modal fade" id="sendCommandModal">
		<div class="modal-dialog">
			<div class="modal-content w800">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">发送指令</h4>
				</div>
				<div class="modal-body h480 oy-a">
				<input type="hidden" name="sendTypeFlag"/>
	                  <div class="form-horizontal form-preset">
	                  	  <fieldset>
	                  	  	<legend>选择指令：</legend> 
	                      	<div class="markInsForm"></div>
	                      </fieldset>
                      	  <div >
                      	  <div class="form-group">
	                        <label class="col-md-2 control-label">开始/结束时间：</label>
	                         <div class="col-md-6">
	                            <input type="text" class="form-control form-control-sm form-control-inline" readonly="readonly" id="ins_startTime" title="开始时间" placeholder="开始时间">&nbsp;&nbsp;
	                            <input type="text" class="form-control form-control-sm  form-control-inline" readonly="readonly" id="ins_endTime" title="结束时间" placeholder="结束时间">
	                         </div>                        
	                       </div>
                      	  </div>
						   <fieldset>
		                  	  	<legend><span class="c-red fr fw-n">不支持当前选中的指令的设备将不会发送指令；已存在指令的设备重新发送将会覆盖之前的指令。</span> 已选设备：<span class="c-blue" id="check-total">100</span></legend> 
		                      	<div class="table-box b1-ddd">
	                            <div class="table-scrollbar oy-a mah-200">
		                            <table class="table table-condensed table-hover table-ellipsis table-normal-a">
		                                <thead>
		                                    <tr class="table-header">
		                                        <th width="150">IMEI</th>
		                                        <th>型号</th>
		                                        <th>所属用户</th>
		                                        <th>是否支持</th>
		                                        <th>是否存在指令</th>
		                                        <th>操作</th>
		                                    </tr>
		                                </thead>
		                                <tbody id="check-row-tbody">
		                                </tbody>
		                            </table>
		                            <div id="valid-loading" class="ta-c p-tb25"><i class="fa fa-spinner fa-pulse fa-2x"></i></div>
	                         </div>
	                      </div>
		                  </fieldset>
	                  </div>
                      </div>
				<div class="modal-footer">
					<button class="btn btn-primary btn-sm mw-100" onclick="batchSendIns();">发送指令</button>
					<button class="btn btn-default btn-sm mw-100" onclick="javascript:$('#sendCommandModal').modal('hide')">取消</button>
				</div>
                  </div>
              </div>
			</div>
  <script type="text/html" id="check-row-tmp">
		{{each data as row i}}
		<tr data="{{row.flag}}">
            <td>{{row.imei}}</td>
            <td>{{row.mcType}}</td>
            <td>{{row.account}}</td>
            <td><span {{if row.flag == 0}}class="c-red"{{/if}}>{{if row.flag == 0}}否{{else}}是{{/if}}</span></td>
            <td><span {{if row.cmdFlag == 1}}class="c-red"{{/if}}>{{if row.cmdFlag == 0}}否{{else}}是{{/if}}</span></td>
            <td><a onclick="javascript:$(this).parent().parent().remove();$('#check-total').html(Number($('#check-total').text())-1);">删除</a></td>
        </tr>
		{{/each}}
  </script>
<!--设备详情     START-->
<div id="editDevice_report" class="modal fade in"  aria-hidden="false">
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
        <div class="mah-500 oy-a" id="edit_device_info_customer">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-sm btn-primary mw-100" type="button" id="btn-submit-vehilebund" onclick="complex_device_info_submit('customer','editDevice_report')">保存</button>&nbsp;
        <button data-dismiss="modal" class="btn btn-sm btn-default mw-100" type="button">取消</button>
      </div>
    </div>
  </div>
</div>
<!--设备详情     END-->
<!--设备新增     START-->
<div id="addDevice" class="modal fade in"  aria-hidden="false">
  <div class="modal-dialog" >
    <div class="modal-content w900">
      <div class="modal-header">
        <button aria-label="Close" data-dismiss="modal" class="close" type="button">
          <span aria-hidden="true">×</span>
        </button>
        <h4 class="modal-title">
     		设备新增
        </h4>
      </div>
      <div class="modal-body">
        <div class="mah-500 oy-a" id="edit_device_info_add">
        
        <div class="tab-navbar">
			<ul class="js-equipment-tab-nav tab-nav clearfix">
				<li class="active" ><a class="cp">基本信息</a></li>
			</ul>
		</div>

	<form id="device_info_form_add" class="form-horizontal form-sm form-preset form-ellipsis">
		<div id="device_info_a">
		<fieldset>
		<legend></legend>
	   <input type="hidden" name="devuserId" value="" />
	   
       <div class="form-group">
         <label class="col-md-2 control-label" title="设备 IMEI">设备 IMEI：</label>
         <div class="col-md-3">
           <input type="text"  name="imei"  class="form-control form-control-sm">
         </div>
         <label class="col-md-2 control-label" title="设备类型">设备类型：</label>
         <div class="col-md-3">
          <!--  <span class="easydropdown easydropdown-sm easydropdown-full va-m">
					<select name="mcType" class="complex-mcType"> 
						<option value="1" title="默认"  class="selected">GT710</option>
						<option value="2" title="默认"  >T20</option>
					</select>
			</span>-->
			<span class="easydropdown easydropdown-sm easydropdown-full va-m js-select-mcType-div" id="mcType_dev" ></span>
			</div>
       </div>
	   <div class="form-group">
		 	<label class="col-md-2 control-label" title="设备名称">设备名称：</label>
          	<div class="col-md-3">
           		<input type="text"  name="deviceName" class="form-control form-control-sm" maxlength="50">
         	</div>			
			<label class="col-md-2 control-label" title="设备SIM卡号">设备SIM卡号：</label>
         	<div class="col-md-3">
         		  <input type="text" name="sim" class="form-control form-control-sm" maxlength="20">
        	</div>
 	   </div>
	   <div class="form-group">
			<label class="col-md-2 control-label" title="设备分组">设备分组：</label>
  			<div class="col-md-3">
				<span class="easydropdown easydropdown-sm easydropdown-full va-m">
					<select name="orgId" class="complex-group-select-add"> 
						<option value="default" title="默认"  class="selected">默认组</option>
					</select>
				</span>
  			</div>
			<label class="col-md-2 control-label" title="激活时间">激活时间：</label>
         	<div class="col-md-3">
          		<input type="date" disabled="true" name="activTime" class="form-control form-control-sm">
         	</div>
	   </div>
	   <div class="form-group">
			<label class="col-md-2 control-label" title="所属用户">所属用户：</label>
         	<div class="col-md-3">
           	 <input type="text" disabled="true" class="form-control form-control-sm" name="belonguser" >
           </div>
			<label class="col-md-2 control-label" title="平台到期时间">平台到期时间：</label>
         	<div class="col-md-3">
           		<input type="date" disabled="true" name="platformEndDate" class="form-control form-control-sm" >
         	</div>
	   </div>
	  
	   <div class="form-group">
		  <label class="col-md-2 control-label" title="备注">备注：</label>
		  <div class="col-md-8">
			<textarea class="form-control form-control-sm" id="reMark" name="reMark"  rows="2"  maxlength="500"></textarea>
		  </div>
		</div>
		</fieldset>
	    </div>
		</form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-sm btn-primary mw-100" type="button" id="btn-submit-vehilebund" onclick="complex_device_info_submit('add','addDevice')">保存</button>&nbsp;
        <button data-dismiss="modal" class="btn btn-sm btn-default mw-100" type="button">取消</button>
      </div>
    </div>
  </div>
</div>
<!--设备详情     END-->
<!-- 批量设置工作模式 -->
<div class="modal fade" id="sendModeCommandModel">
	<div class="modal-dialog">
		<div class="modal-content w800">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">批量设置工作模式</h4>
				<div class="modal-body h400 oy-a">
					<form action="" class="form-horizontal form-preset">

		                <div class="p-lr15 p-t10"><label>工作模式</label><a id="create-instructionRules" style="float: right;cursor: pointer;">新建工作模板</a></div>

		                	<div>
					        	<ul class="list-fl alarm-item  clearfix c-666 b-0 p-b0" id="workModeView">
					          	</ul>
						  	</div>

						  	<div class="p-lr15 p-t10"><a href="/custom/toTemplate" style="float: right;cursor: pointer;">工作模式模板管理</a></div>

		                <div class=" border-box p-lr15 clearfix p-t10">
		                	<p class="bold">已选设备：<span class="c-blue" id="check-workMode-total">100</span></p>
		                	<div class="table-box oa b-t1-ddd p-lr0 p-t10">
		                		<div class="table-scrollbar">
		                			<table class="table table-hover table-ellipsis table-normal-a">
		                				<thead>
		                					<tr class="table-header">
		                						<th>IMEI</th>
		                						<th>型号</th>
		                						<th>所属用户</th>
		                						<th>是否支持</th>
		                						<th>操作</th>
		                					</tr>
		                				</thead>
		                				<tbody id="checkTbody">
		                					
		                				</tbody>
		                			</table>
		                		</div>
		                	</div>
		                </div>
	                </form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary btn-sm mw-100" onclick="sendWorkModelIns();">发送指令</button>
					<button class="btn btn-default btn-sm mw-100" onclick="javascript:$('#sendModeCommandModel').modal('hide')">取消</button>
				</div>
			</div>
		</div>
	</div>
</div>


<!--新建指令模态框-->
<div class="modal fade in" id="customInstructionsModal">
	<div class="modal-dialog">
		<div class="modal-content w900">
			<div class="modal-header">
				<button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span></button>
       			<h4 class="modal-title">新建自定义指令</h4>
			</div>
			<div class="modal-body h450">
				 <iframe name="tmplateEdit" src="" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="100%"></iframe>
			</div>
			<div class="modal-footer">
				<button type="button" onclick="saveTempData()" class="btn btn-primary btn-sm">&nbsp;&nbsp;保存规则&nbsp;&nbsp;</button>
				<button data-dismiss="modal" class="btn btn-default btn-sm" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</div>
</div>

<script type="text/html" id="workModeViewTmp">
	{{each data as row}}
		<label class="icheck-min" style="width:30%;"><input type="radio" value="{{row.id}}" name="modelName"/>&emsp;{{row.name}}</label>
	{{/each}}
</script>


  <script type="text/html" id="checkTbodyTmp">
		{{each data as row i}}
		<tr data="{{row.isSupport}}">
            <td>{{row.imei}}</td>
            <td>{{row.mcType}}</td>
            <td>{{row.account}}</td>
            <td><span {{if row.isSupport != 1}}class="c-red"{{/if}}>{{if row.isSupport == 1}}是{{else}}否{{/if}}</span></td>
            <td><a onclick="javascript:$(this).parent().parent().remove();$('#check-workMode-total').html(Number($('#check-workMode-total').text())-1);">删除</a></td>
        </tr>
		{{/each}}
  </script>

	<!--[if lte IE 9]>
		<script src="js/jquery.placeholder.min.js"></script>
		<script>$(function (){$('input[type="text"],input[type="password"], textarea').placeholder();});</script>
	<![endif]-->
	
	<script type="text/javascript" src="webpage/resource/js/print/jquery.jqprint-0.3.js"></script>
    <script type="text/javascript" src="webpage/resource/js/customer/customTree.js"></script>
    <script type="text/javascript" src="webpage/resource/js/dateUtil.js"></script>
    
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
	<form id="toIndexForm" action="/index" method="post" target="_blank">
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
<script type="text/html" id="complex_search_tmp">
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
	   <input type="hidden" name="userId" value="{{info.userId}}">
	   <input type="hidden" name="id" value="{{info.id}}">
	   
       <div class="form-group">
         <label class="col-md-2 control-label" title="设备 IMEI">设备 IMEI：</label>
         <div class="col-md-3">
			<input type="hidden" value="{{info.imei}}" name="imei">
           <input type="text" value="{{info.imei}}"  disabled="disabled" class="form-control form-control-sm">
         </div>
         <label class="col-md-2 control-label" title="设备类型">设备类型：</label>
         <div class="col-md-3">
           <input type="hidden" value="{{info.mcType}}" name="mcType">
           <input type="text" value="{{if info.deviceAlias == null || info.deviceAlias == "" }}{{info.mcType}}{{else}}{{info.deviceAlias}}{{/if}}" name="mcType" disabled="disabled" class="form-control form-control-sm" >
         </div>
       </div>
	   <div class="form-group">
		 	<label class="col-md-2 control-label" title="设备名称">设备名称：</label>
          	<div class="col-md-3">
           		<input type="text" value="{{info.deviceName}}" name="deviceName" class="form-control form-control-sm" maxlength="50">
         	</div>			
			<label class="col-md-2 control-label" title="设备SIM卡号">设备SIM卡号：</label>
         	<div class="col-md-3">
         		  <input type="text" value="{{info.sim}}" name="sim" class="form-control form-control-sm" maxlength="20">
        	</div>
 	   </div>
	   <div class="form-group">
			<label class="col-md-2 control-label" title="设备分组">设备分组：</label>
  			<div class="col-md-3">
				<span class="easydropdown easydropdown-sm easydropdown-full va-m">
					<select name="orgId" class="complex-group-select"> 
						<option value="default" title="默认"  class="selected">默认组</option>
					</select>
				</span>
  			</div>
			<label class="col-md-2 control-label" title="激活时间">激活时间：</label>
         	<div class="col-md-3">
          		<input type="date" value="{{info.activationTime}}" name="activTime"  class="form-control form-control-sm">
         	</div>
	   </div>
	   <div class="form-group">
			<label class="col-md-2 control-label" title="所属用户">所属用户：</label>
         	<div class="col-md-3">
           	 <input type="text" disabled="true" name="belonguser"  class="form-control form-control-sm"  value="{{info.account}}" >
           </div>
			<label class="col-md-2 control-label" title="平台到期时间">平台到期时间：</label>
         	<div class="col-md-3">
           		<input type="date" name="platformEndDate" value="{{info.userExpiration}}"  class="form-control form-control-sm" >
         	</div>
	   </div>
	  
	   <div class="form-group">
		  <label class="col-md-2 control-label" title="备注">备注：</label>
		  <div class="col-md-8">
			<textarea class="form-control form-control-sm" id="reMark" name="reMark"  rows="2"  maxlength="500">{{info.reMark}}</textarea>
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
           		<input type="text" value="{{info.driverName}}" name="driverName" class="form-control form-control-sm" maxlength="20">
         	</div>
			<label class="col-md-2 control-label" title="用户到期时间">用户到期时间：</label>
			
         	<div class="col-md-3">
		   		{{if info.activationTime}}
          	 		<input type="date" value="{{info.userExpiration | dateFormat}}"   {{if info.userId==info.loginUserId || info.bindUserId==info.loginUserId }}  disabled="disabled" {{else}} readonly="readonly" {{/if}} name="userExpiration"  id="userExpiration_{{id}}" class="form-control form-control-sm">
           		{{else}}
			 		<input type="date" value="{{info.userExpiration | dateFormat}}"    name="userExpiration"  id="userExpiration_{{id}}" class="form-control form-control-sm">
		   		{{/if}}

		   </div>
	  </div>
	  <div class="form-group">
			<label class="col-md-2 control-label" title="电话">电话：</label>
         	<div class="col-md-3">
          		 <input type="text" value="{{info.driverPhone}}" name="driverPhone" class="form-control form-control-sm" maxlength="20">
         	</div>
			<label class="col-md-2 control-label" title="车牌号">车牌号：</label>
         	<div class="col-md-3">
          		 <input type="text" value="{{info.vehicleNumber}}" name="vehicleNumber" class="form-control form-control-sm" maxlength="50">
         	</div>
	  </div>
	  <div class="form-group">
		  <label class="col-md-2 control-label" title="身份证号码">身份证号码：</label>
          <div class="col-md-3">
           		<input type="text" value="{{info.idCard}}" name="idCard" class="form-control form-control-sm" maxlength="18">
          </div>
	      <label class="col-md-2 control-label" title="SN">SN：</label>
          <div class="col-md-3">
           		<input type="text" value="{{info.sn}}" name="sn" class="form-control form-control-sm" maxlength="50">
          </div>
	  </div>
	  <div class="form-group">
			<label class="col-md-2 control-label" title="车架号">车架号：</label>
         	<div class="col-md-3">
           		<input type="text" value="{{info.carFrame}}" name="carFrame" class="form-control form-control-sm" maxlength="50">
         	</div>
			<label class="col-md-2 control-label" title="电机/发动机号">电机/发动机号：</label>
         	<div class="col-md-3">
            	<input type="text" value="{{info.engineNumber}}" name="engineNumber" id="engineNumber" class="form-control form-control-sm" maxlength="100">
         	</div>
	  </div>
	  </fieldset>

		<fieldset>
		<legend>安装信息</legend>
			<div class="form-group">
		 	<label class="col-md-2 control-label" title="安装时间">安装时间：</label>
          	<div class="col-md-3">
				<input type="date" value="{{info.installTime}}" name="installTime" class="form-control form-control-sm" id="installTime_{{id}}" />
         	</div>			
			<label class="col-md-2 control-label" title="安装地址">安装地址：</label>
         	<div class="col-md-3">
         		  <input type="text" value="{{info.installAddress}}" name="installAddress" class="form-control form-control-sm" maxlength="200">
        	</div>
 	   </div>
       <div class="form-group">
		 	<label class="col-md-2 control-label" title="安装公司">安装公司：</label>
          	<div class="col-md-3">
           		<input type="text" value="{{info.installCompany}}" name="installCompany" class="form-control form-control-sm" maxlength="100">
         	</div>			
			<label class="col-md-2 control-label" title="安装位置">安装位置：</label>
         	<div class="col-md-3">
         		  <input type="text" value="{{info.installPosition}}" name="installPosition" class="form-control form-control-sm" maxlength="200">
        	</div>
 	   </div>
       <div class="form-group">
		 	<label class="col-md-2 control-label" title="安装人员">安装人员：</label>
          	<div class="col-md-3">
           		<input type="text" value="{{info.installPersonnel}}" name="installPersonnel" class="form-control form-control-sm" maxlength="50">
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
	    					<input id="fileBtn_{{id}}" name="file" type="file" value="{{info.installImage}}" onchange="other_upload('{{id}}')" ></input>
							<input id="installImage_{{id}}" type="hidden" value="{{info.installImage}}" name="installImage" />
							
						</div>
					</div>
					<br>
					<ul class="clearfix pic-list" style="margin-right:-15px;" id="uploadInstall_ul_{{id}}">
                        {{each info.installImageList as image}}
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
           <button class="btn btn-primary mw-100" type="button" onclick="complex_device_info_submit('add','addDevice')')">保存</button>
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

<!-- 设备 -->
<script type="text/html" id="complex_dev_check_options">
	<select name="devcheck" class="js-select-mcType">
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
var complex_loginUserId  = '16341';
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

	<script>
	
	var parentFlag = 'true';
	if(parentFlag && parentFlag != 'false'){
		$(".js-side-tree-box").show();
	}else{
		$(".js-side-tree-box").hide();
	}
	
	$(function(){
		$("#dvStauts").easyDropDown();
 		$("#timeNum").easyDropDown();
		$("#dvStauts").change(function(){
			  $('#timeNumDiv').hide();
			  $('#morethan60days').remove();
			  var dvStauts=$(this).val();
			  if(dvStauts == 3){
 			  	  $('#timeNum option:eq(0)').attr('selected','selected');
				  $("#timeNum").easyDropDown('destroy')
				  $("#timeNum").easyDropDown();
				  $('#timeNumDiv').show();
			  }
			  if(dvStauts == 4){
				  $("#timeNum").append("<option value='61' id='morethan60days'>60天以上</option>");
				  $('#timeNum option:eq(0)').attr('selected','selected');
				  $("#timeNum").easyDropDown('destroy')
				  $("#timeNum").easyDropDown();
				  $('#timeNumDiv').show();
// 				  $('#morethan60days').show();
			  }
		});
	});
	var ins_startTime_history = "";
	var ins_endTime_history = "";
	$('#ins_startTime').focus(function(){
		laydate({
			  elem: '#ins_startTime',
			  format: 'YYYY-MM-DD hh:mm:00', //日期格式
			  istime: true, //是否开启时间选择
			  min:laydate.now(new Date().getTime(),'YYYY-MM-DD hh:mm:00'),
			  event: 'focus', //响应事件。
			  choose: function(dates){
				  var time =  new Date(dates.replace('-',"/").replace('-',"/")).getTime();
				  if($("#ins_endTime").val() && new Date($("#ins_endTime").val().replace('-',"/").replace('-',"/")).getTime() <= time){
					  layer.msg($.i18n.prop("comm.Starttimenobigorequalendtime"));
					  $('#ins_startTime').val(ins_startTime_history);
					  return;
				  }
				  ins_startTime_history = dates;
				  $("#ins_endTime").unbind().focus(function(){
						laydate({
							  elem: '#ins_endTime',
							  format: 'YYYY-MM-DD hh:mm:ss', //日期格式
							  istime: true, //是否开启时间选择
							  min:laydate.now(time,'YYYY-MM-DD hh:mm:00'),
							  max:laydate.now(time + (30*24*60*60*1000),'YYYY-MM-DD hh:mm:00'),
							  event: 'focus', //响应事件。
							  choose: function(dates){
								  var time =  new Date(dates.replace('-',"/").replace('-',"/")).getTime();
								  if($("#ins_startTime").val() && new Date($("#ins_startTime").val().replace('-',"/").replace('-',"/")).getTime() >= time){
									  layer.msg($.i18n.prop("comm.Starttimenobigorequalendtime"));
									  $('#ins_endTime').val(ins_endTime_history);
									  return;
								  }
								  ins_endTime_history = dates;
							  }
							});
					});
			  }
			});
	});
	
	$("#ins_endTime").focus(function(){
		laydate({
			  elem: '#ins_endTime',
			  format: 'YYYY-MM-DD hh:mm:ss', //日期格式
			  istime: true, //是否开启时间选择
			  min:laydate.now(new Date().getTime(),'YYYY-MM-DD hh:mm:00'),
			  max:laydate.now(30,'YYYY-MM-DD hh:mm:00'),
			  event: 'focus', //响应事件。
			  choose: function(dates){
				  var time =  new Date(dates.replace('-',"/").replace('-',"/")).getTime();
				  if($("#ins_startTime").val() && new Date($("#ins_startTime").val().replace('-',"/").replace('-',"/")).getTime() >= time){
					  layer.msg($.i18n.prop("comm.Starttimenobigorequalendtime"));
					  $('#ins_endTime').val(ins_endTime_history);
					  return;
				  }
				  ins_endTime_history = dates;
			  }
			});
	});
	
	
	
	$('#startTime_sport').focus(function(){
		laydate({
			  elem: '#startTime_sport',
			  event: 'focus' //响应事件。
			});
	});
	
	$('#endTime_sport').focus(function(){
		laydate({
			  elem: '#endTime_sport',
			  event: 'focus' //响应事件。
			});
	});
	
	function searchMcType(){
		$.ajax({
			type:"post",
			async: false,
		    cache: false,
		    data: {userId:userId} ,
			url : _ctx + "/device/searchMcType",
			success : function(ret) {
				if (ret.code == 0) {
					$("#mcTypeSel").empty();
					$("#mcTypeSel").append("<option value=''>全部型号</option>");
					if(ret.data){
						 $.each(ret.data, function (n, value) {  
							$("#mcTypeSel").append("<option value='"+value.key+"'>"+value.title+"</option>"); 
				         });  
						 $("#mcTypeSel").easyDropDown();
						 $("#mcTypeSel").easyDropDown('destroy')
						 $("#mcTypeSel").easyDropDown();
					}
				} else {
					layer.msg($.i18n.prop("comm.Failed"), {icon : 2});
				}
			},
			error : function(e) {
				ajaxError("complex_initDevMcType()", e);
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});
	}
	
	
	//搜索处理
	function searchList(){
		var searchIMEI =  $("#searchIMEI").val().replace(/\r\n/ig,",").replace(/\n/ig,",").replace(/(^\s+)|(\s+$)/g,"").replace(/\s/g,"");
		var imeis = "";
		if(searchIMEI){
			$.each(searchIMEI.split(","),function(i,v){
				if(v){
					if(imeis){
						imeis+= "," + v;
					}else{
						imeis = v;
					}
				}
			});
		}
		var startDate = $('#startTime_sport').val();
		if(startDate){
			startDate += " 00:00:00";
		}
		var endDate = $('#endTime_sport').val();
		if(endDate){
			endDate += " 23:59:59";
		}
		var soonExpire = $("#expire_soon").val();
		var expireStartTime = "";
		var expireEndTime = "";
		var date = new Date();
		if(soonExpire == '1'){
			expireStartTime = formatDates(date);
			date.setDate(date.getDate()+30);
			expireEndTime = formatDates(date);
		}else if(soonExpire == '2'){
			expireEndTime = formatDates(date);
		}
		
		var contain_sub = $("input[id='contain_sub']:checked").val();
		var subSearchId = "";
		var paramt = {"userId":$.parseJSON(getCookie("selectHistory")).userId , "dateType":$('#dateTypeExpiration').val() , "startDate":startDate,
				"endDate":endDate,"mcType2" : $('#mcTypeSel').val(),"imeis":searchIMEI,
				"timeNum":$('#timeNum').val(),"parentId":$.parseJSON(getCookie("selectHistory")).pId,"dvStauts":$('#dvStauts').val(),
				"deviceName":$('#deviceName').val(),"vehicleNumber":$('#vehicleNumber').val(),"carFrame":$('#carFrame').val(),
				"sim":$('#sim').val(),"isActivation":$('#isActivation').val(),"vehicleIcon":$('#vehicleIcon_cust').val(),
				"expireStartTime":expireStartTime,"expireEndTime":expireEndTime
		};
		if(contain_sub){
			paramt.subSearchId = userId;
			paramt.userId = "";
		}
		initDeviceList(paramt,1);
	}
	
	//页面高度自适应
	(function($){
		var a, b, c, d, e, f, g, h, i, j, k, z, table_h;

        //左侧菜单高度
        function sideTreeHeight() {
            a = $(window).height();
            b = $(".header").outerHeight();
            c = $(".menu-seach").outerHeight();
            z = $(".footer").outerHeight();
            d = $(".customer-leftsidebar").outerHeight() - $(".customer-leftsidebar").height();
            e = $(".user-list .side-subtitle").outerHeight();
            f = $(".user-list .js-side-tree-box").outerHeight() - $(".user-list .js-side-tree-box").height();
            f1 = $(".user-list .tree-search").outerHeight(true);


            var tree_h = a - b - c - z - d - e - f - f1;
            $(".user-list .default-scrollbar").css("height", tree_h);
        }
        sideTreeHeight();

        //表格高度
        function tableHeight() {
            g = $(".customer-rightsidebar").outerHeight() - $(".customer-rightsidebar").height();
            h = $(".device-con-box").outerHeight() - $(".device-con-box").height();
            i = $(".rightside-header").outerHeight(true);
            j = $(".funcbar").outerHeight(true);
            k = $(".table-header").outerHeight();

            table_h = a - b - c - z - g - h - i - j -k;
            $(".device-con-box .table-scrollbar").css("height", table_h);
        }
        tableHeight();


        //浏览器窗口大小变化尺寸自适应
        $(window).resize(function() {
            if ($(window).height() > 500) {
                sideTreeHeight();
                tableHeight();
            }
            tableHeaderAutoWidth("#tableHeader", "#tableContent"); //表格头部自动宽度
        });
        
      //更多筛选条件
	    $('.js-more-condition-btn').click(function(){
	    	var arrow_icon = $(this).find('.fa');
	    	if(arrow_icon.hasClass('fa-caret-down')){
	    		arrow_icon.attr('class','fa fa-caret-up');
	    	}else{
	    		arrow_icon.attr('class','fa fa-caret-down');
	    	}
	    	$(".js-more-condition-box").toggle();
	
	    	 tableHeight();
	    });

	})(jQuery);

	
	</script>

	<script type="text/javascript">
	    var userId="<%=request.getAttribute("userId")%>";
	    var global_userId="<%=request.getAttribute("userId")%>";
	    var login_userId="<%=request.getAttribute("userId")%>";
		var account="<%=request.getAttribute("userName")%>";
		var imeis='';
		var keyword='';
		var organizes = [];
		var searchParentId="";
		
		var devTotalRecord=0;
		var devPageNo = 1;
		var devPageSize = 10;
		var $tab_index  =0;
	
		var dateType  ="userExpiration";
		var startDate ="";
		var endDate   ="";
		
		$(".check-all").iCheck();
		$("#contain_sub").iCheck();
		
		//TODO 树加载
		$(document).ready(function(){
			$("#complexQuery").hide();
			$("#treeDemo").initCustomTree({
				treeType : "stock_repertory",
				head_userId : global_userId, 
				loadingSelector : "TreeLogindata",
				onClick :ztreeOnClick,
				onClickFlag : false,
				searchAlert : true,
				ajaxDataFilter : stock_ajaxDataFilter
			});
			if(complex_loginUserType != 3 && complex_loginUserType != 12){
				//控制台选中某个用户，需要记忆，即刷新界面，还是默认选中之前的用户
				var selectHistory= getCookie("selectHistory");
				if(selectHistory){
					selectHistory = eval('('+selectHistory+')');
					if(selectHistory.userId && selectHistory.fullParentId.indexOf(userId+",") >= 0){
						complex_locationUser(selectHistory.userId, selectHistory.fullParentId, "treeDemo", null);
						return;
					}
				}
			}
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			ztreeOnClick(null,"treeDemo",treeObj.getNodes()[0]);
		});
		
		//客户树-全局搜索 (ul id="treeDemo")
		$("#cusTreeSearchBtn").click(function(){
			globalSearchCustomerTree($("#cusTreeKey"),global_userId,true,"treeDemo",null);
		}); 
		$("#cusTreeKey").keydown(function(e){
			if(e.keyCode == 13){
				globalSearchCustomerTree($("#cusTreeKey"),global_userId,true,"treeDemo",null);
			}
		});
		
		var Grloba_Tindex=0;
		//Tabs切换加载
		$(".side-busines>ul>li").click(function(){
			Grloba_Tindex=$(this).index();
			devPageNo = 1;
			initTabData(Grloba_Tindex);
		});
		
		
		//添加设备文本框显示
	    function addDeviceBoxToggle(input) {
	        $(input).on("focus", function() {
	            $(this).parent().addClass("focus");
	            $(document).bind("click", function(e) {
	                var target = $(e.target);
	                if (!target.closest(".imei-textarea-box").length > 0) {
	                    $(input).parent().removeClass("focus");
	                }
	            });
	            //--------------------------------------------
	            var v = $(this).val();
	            arr = v.split(/\n/);

	            imeis = [];
	            for (var len = arr.length, i = 0; i < len; i++) {
	                var item = arr[i].replace(/\s|,|;|\|/g, '');
	                if (item) {
	                    imeis.push(item);
	                }
	            }
	            $(this).parent().find(".dev-num").text(imeis.length);
	          //--------------------------------------------
	        }).on('input propertychange', function() {
	            var v = $(this).val();
	            arr = v.split(/\n/);

	            imeis = [];
	            for (var len = arr.length, i = 0; i < len; i++) {
	                var item = arr[i].replace(/\s|,|;|\|/g, '');
	                if (item) {
	                    imeis.push(item);
	                }
	            }
	            $(this).parent().find(".dev-num").text(imeis.length);

	        });
	        $(input).parent().find(".js-close").click(function() {
	            $(input).removeClass("form-control-error").val("");
	            $(input).parent().removeClass("focus").find(".dev-num").text(0);
	        });
	        
	        $(input).parent().find(".js-add-results-btn").click(function() {
	            $(input).parent().removeClass("focus").find(".dev-num").text(0);
	        });
	    }

	    addDeviceBoxToggle("#searchIMEI");
	  	
	  
		function initTabData(params){
			switch (params) {
			case 0:
				devPageSize = 10;
				startDate="";
				endDate  ="";
				break;
			case 1:
				devPageSize = 10;
				startDate="";
				var dateCur   = new Date();
				dateCur.setDate(dateCur.getDate());
				endDate = formatDates(dateCur);
				break;
			case 2:
				devPageSize = 10;
				var dateCur   = new Date();
				startDate =formatDates(dateCur);
				dateCur.setDate(dateCur.getDate()+7);
				endDate = formatDates(dateCur);
				break;
			case 3:
				devPageSize = 10;
				var dateCur   = new Date();
				startDate =formatDates(dateCur);
				dateCur.setDate(dateCur.getDate()+60);
				endDate = formatDates(dateCur);
				break;
			default:
				startDate="";
				endDate  ="";
				break;
			}
			//initDeviceList({"dateType":dateType,"startDate":startDate,"endDate":endDate});
		}
		
		
		//加载设备列表
		var isExport = false;
		var flagss=""
		function initDeviceList(params,pageNo,param){
			$("#dev-noData").hide();
			$("#paging-dev").hide();
			$('#markDevTable').hide();
			
			$("#dev-loading").show();
			
			isExport = false;

			if(pageNo){
				devPageNo = pageNo;
			}
// 			alert("");  //activated  inactive
			if(flagss=="activated"){
				params.isActivation=1
				flagss="";
			}
			if(flagss=="inactive"){
				params.isActivation=2
				flagss="";
			}
			
			if(!param){
				param = {"pageCurrent":devPageNo,"pageSize":devPageSize,"belongUserId":params.userId,"parentId":params.parentId,"imei":params.imeis,"mcType2":params.mcType2,
						"dateType":params.dateType,"startDate":params.startDate,"endDate":params.endDate,"type":"ManageDevice","timeNum":params.timeNum,"dvStauts":params.dvStauts,
						"name":params.deviceName,"vehicleNumber":params.vehicleNumber,"carFrame":params.carFrame,
						"sim":params.sim,"isActivation":params.isActivation,"vehicleIcon":params.vehicleIcon,"expireStartTime":params.expireStartTime,"expireEndTime":params.expireEndTime,
						"subSearchId":params.subSearchId
				};
				
			}
			param.pageCurrent = devPageNo;
			param.pageSize = devPageSize;
			$(".check-all").find("input").attr("checked",false);
			$.ajax({
				type:'post',
				url:_ctx+"rest/deviceControl/list",  
				async:true, 
				cache:false,
				data:param,
				error:function(e){
					ajaxError("deviceManage.jsp initDeviceList()",e);
				},  
				success:function(returnData){
					if(returnData.code==0 && returnData.data && returnData.data.result){
						if(returnData.data.result.length>0){
							isExport = true;
						}
						var expiratedDaysNum = "";
						$.each(returnData.data.result,function(i,v){
							if(v.expirationStr){
							}
							if(v.userExpirationStr){
							}
							
							if(v.expirationStr){
								expiratedDaysNum = getExpirateDaysNum(v.expirationStr);
								if(expiratedDaysNum){
									v.expirationStr = v.expirationStr.substring(0,v.expirationStr.indexOf('('))+'('+$.i18n.prop('cust.dayExpired').replace('()',expiratedDaysNum)+')';
								}else{
									v.expirationStr = v.expirationStr.replace('已过期',$.i18n.prop('cust.Expired')).replace('正常使用',$.i18n.prop('cust.NormalUse')).replace('未设置',$.i18n.prop('cust.Notset')).replace('未激活',$.i18n.prop('cust.Inactive')).replace('已过期',$.i18n.prop('cust.Expired'));
								}
							}
							if(v.userExpirationStr){
								expiratedDaysNum = getExpirateDaysNum(v.userExpirationStr);
								if(expiratedDaysNum){
									v.userExpirationStr = v.userExpirationStr.substring(0,v.userExpirationStr.indexOf('('))+'('+$.i18n.prop('cust.dayExpired').replace('()',expiratedDaysNum)+')';
								}else{
									v.userExpirationStr = v.userExpirationStr.replace('已过期',$.i18n.prop('cust.Expired')).replace('正常使用',$.i18n.prop('cust.NormalUse')).replace('未设置',$.i18n.prop('cust.Notset')).replace('未激活',$.i18n.prop('cust.Inactive')).replace('已过期',$.i18n.prop('cust.Expired'));
								}
								
							}
							
						}); 
						var data = {"result":returnData.data.result,"userType":'8',"pageNo":devPageNo,"pageSize":devPageSize};
						$('#markDevTable').html(template('dev-info',data));
						
						checkboxSelectLine($('.check-all'),$('.check-row'));
						
						$("[name=show-question]").popover({
							placement: "top",
							trigger: 'hover',
							content: $.i18n.prop("Alert.Reminder")
						});
						$('#markDevTable').show();
						tableHeaderAutoWidth("#tableHeader","#tableContent");//表格头部自动宽度
						devTotalRecord = returnData.data.totalRecord;
						
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
					$("#dev-loading").hide();
				},
				complete:function(XMLHttpRequest, textStatus){
					authorityValide(XMLHttpRequest);
				}
			});
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
		
		//设备统计
		function initStatistics(params){
			$.ajax({
				type:'POST',
				url:_ctx+"/device/getDevceStatistics",  
				async:true, 
				cache:false,
				data:{"userId":params.userId,"parentId":params.parentId}, 
				error:function(e){
					ajaxError("deviceManage.jsp initStatistics",e);
				},  
				success:function(returnData){
					if(returnData.code==0){
						var obj = returnData.data;
						$("#devCount").html(obj.aCount==null||obj.aCount==""?0:obj.aCount);
						$("#expire7").html(obj.aCountWeek==null||obj.aCountWeek==""?0:obj.aCountWeek);
						highlightColor(!(obj.aCountWeek==null||obj.aCountWeek==""||obj.aCountWeek=="0"),"#expire7","c-ff8d00 fw-b");
						$("#expire60").html(obj.aCountMonth==null||obj.aCountMonth==""?0:obj.aCountMonth);
						highlightColor(!(obj.aCountMonth==null||obj.aCountMonth==""||obj.aCountMonth=="0"),"#expire60","c-ff8d00 fw-b");
						$("#expire").html(obj.aCountLife==null||obj.aCountLife==""?0:obj.aCountLife);
						highlightColor(!(obj.aCountLife==null||obj.aCountLife==""||obj.aCountLife=="0"),"#expire","c-red fw-b");
					}
				},
				complete:function(XMLHttpRequest, textStatus){
					authorityValide(XMLHttpRequest);
				}
			});
		}
		
		//高亮颜色
		function highlightColor(flag,ele,cla){
			flag ? $(ele).addClass(cla) : $(ele).removeClass(cla);
		}
		/**
		 * 设备列表分页插件初始化
		 */
		function initDevPage(param){
			$("#paging-dev").pagination({
				prevText:"上一页",
				nextText:"下一页",
				items: devTotalRecord,
		     	itemsOnPage: devPageSize,
		     	param:param,
		     	onPageClick: function(pageNumber,pageSize, param,event){//点击查询指定页数数据
		     		if(event && (event.type=="click" || event.type=="change")){
		     			devPageNo = pageNumber;
		     			devPageSize=pageSize;
		     			initDeviceList({"dateType":dateType,"startDate":startDate,"endDate":endDate},devPageNo,param);
		     		}
		     	},
		     	onInit : function (){//初始化的时候选择页码
		     		$("#paging-dev").pagination("selectPage",devPageNo);
		     	}
			});
		}
		
		
		function ztreeOnClick(event,treeId, treeNode){
		
			var treeObj = $.fn.zTree.getZTreeObj(treeId); 
			treeObj.selectNode(treeNode);
			userId=treeNode.id;
			account=treeNode.name;
			if(treeNode.type==0){  //集团 用户 不能新增设备
		      $(".js-add-device").hide();
			}else{
			  $(".js-add-device").show();
			}
			if(treeNode.isParent){
				$("#contain_sub").parent().parent().show();
			}else{
				$("#contain_sub").parent().parent().hide();
			}
			
			//searchMcType(); //重新加载搜索设备型号选项
			/* if(parentFlag && parentFlag == 'false'){
				account =treeNode.nickName + "(" + account.substring(account.indexOf("(")+1, account.indexOf(")")).split("/")[1] +")";
			} */
			$("#account").text(account).attr("title",account);
			initStatistics({"userId":userId,"parentId":treeNode.pId});
			
			initDeviceList({"userId":userId,"dateType":dateType,"startDate":startDate,"endDate":endDate,"parentId":treeNode.pId},1);
			//searchList();
			
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
		
		

		//验证编辑设备的数据
		function validateFromDevice(){
				var driverName=$("#driverName").val().replace(/\s+/g,"");
				var vehicleNumber=$("#vehicleNumber").val().replace(/\s+/g,"");
				var sim=$("#sim").val().replace(/\s+/g,"");
				var sn=$("#sn").val().replace(/\s+/g,"");
				var carframe=$("#carframe").val().replace(/\s+/g,"");
				var idCard=$("#idCard").val().replace(/\s+/g,"");
				var userExpiration=$("#userExpiration").val();
				var expirationmonthSelect=$("#expirationmonthSelect").val();
				var expiration=$("#expiration").val();
				
				if(expiration!=null&&expiration!=""){
					if(userExpiration>expiration){
						layer.msg($.i18n.prop('cust.userExpirationGreaterThanPlatForm'), {icon: 7});  
						return false;
					}	
				}
				
			 if(!/^\w*$/.test(sim)){
					layer.msg($.i18n.prop('Asset.DeviceSIMcardNoOnlyNumberOrLetters'), {icon: 7});
					$("#sim").select();
					return false;
				}else if(sim.length>20){
					layer.msg($.i18n.prop('Asset.DeviceSIMcardNoLength'), {icon: 7});  
					$("#sim").select();
					return false;
				}else if(sn.length>17){
					layer.msg($.i18n.prop('Asset.SNLength'), {icon: 7});   
					$("#sn").select();
					return false;
				}else if(carframe.length>17){
					layer.msg($.i18n.prop('Asset.CarFrameLength'), {icon: 7}); 
					$("#carframe").select();
					return false;
				}else if(vehicleNumber.length>10){
					layer.msg($.i18n.prop('Asset.LicenceplateNumLength'), {icon: 7}); 
					$("#vehicleNumber").select();
					return false;
				}else if(driverName.length>=20){
					layer.msg($.i18n.prop('Asset.DriverNameLength'), {icon: 7});  
					$("#driverName").select();
					return false;
				}else if($("#driverPhone").val()!="" && !/^0{0,1}(13[0-9]|15[3-9]|15[0-2]|18[0-9]|17[0-9])[0-9]{8}$/.test($("#driverPhone").val())){
					layer.msg($.i18n.prop('user.phoneFormat'), {icon: 7});
					$("#driverPhone").select();
					return false;
				}else if(idCard){
					if(!/^(\d{15}$|^\d{17}(\d|X|x))$/.test(idCard)){
						//1、15位或18位，如果是15位，必需全是数字。2、如果是18位，最后一位可以是数字0-9或字母Xx，其余必需是数字。
						layer.msg($.i18n.prop('Asset.IdCardNoFormat'), {icon: 7});
						$("#idCard").select();
						return false;
					}else{
						return true;
					}
				}else{
					return true;
				}
			}
		//首页弹出设备更新窗口
		function toUpdateDevice_report(devId){	
			complex_buildDeviceInfoForm("customer",devId,"editDevice_report");
		}
		
		/**
		 * 查询条件设备图标切换  再次点击取消
		 */
		function cust_complex_selectCarIoc(carIocStyle,obj){
			$("#vehicleIcon_cust").val(carIocStyle);
			$(obj).siblings().removeClass("c-primary");
			if($(obj).hasClass("c-primary")){
				$("#vehicleIcon").val("");
				$(obj).removeClass("c-primary");
			}else{
				$(obj).addClass("c-primary");
			}
		}
		
	</script>
	
	
	<script type="text/javascript">
		function openBatchSenInsModal(flag){
			var mcTypes = $("#mcTypeSel option").map(function(){return $(this).val();}).get().join(",");
			if(mcTypes && mcTypes.length > 0){
				$("input[name='sendTypeFlag']").val(flag);
				$(".markInsForm").html(template("sendInstruction-form",{"hideFlag":true}));
				$("#check-row-tbody").empty();
				ins_startTime_history = laydate.now(new Date().getTime(),'YYYY-MM-DD hh:mm:00');
				ins_endTime_history = laydate.now(new Date().getTime() + (30*24*60*60*1000),'YYYY-MM-DD hh:mm:00');
				$("#ins_startTime").val(ins_startTime_history);
				$("#ins_endTime").val(ins_endTime_history);
				getInstructionType(null,mcTypes,validDeviceIns_callback);
			}else{
				layer.msg("没有可发送指令的设备",{icon:2});
			}
		}
		
		function validDeviceIns_callback(){
			var insTypeId = $("#instruction_ul li.active").find("a").attr("name");
			var imeis = "";
			var flag = $("input[name='sendTypeFlag']").val();
			if($("#sendCommandModal").attr("aria-hidden") == "false"){
				if($("#check-row-tbody tr") && $("#check-row-tbody tr").length > 0){
					$.each($("#check-row-tbody tr"),function(i,v){
						imeis += $(v).find("td").eq(0).html()+',';
					});
					if(imeis){
						imeis = imeis.substring(0, imeis.length-1);
					}
				}else{
					layer.msg("请选择设备");
					return;
				}
			}else{
				if(flag && flag == "check" ){
					$.each($(".check-row"),function(i,v){
						if($(v).attr("checked")){
							imeis += $(v).val()+',';
						}
					});
					if(imeis){
						imeis = imeis.substring(0, imeis.length-1);
					}else{
						layer.msg("请选择设备");
						return;
					}
				}
			}
			$("#sendCommandModal").modal();
			$("#valid-loading").show();
			validDeviceIns(imeis,insTypeId);
		}
		
		
		function validDeviceIns(imeis,insTypeId){
			var params = {"checkImei":imeis,"insTypeId":insTypeId};
			params.userId = userId;
			params.dateType = $('#dateTypeExpiration').val();
			if($('#startTime_sport').val()){
				params.startDate = $('#startTime_sport').val() + " 00:00:00";
			}
			if($('#endTime_sport').val()){
				params.endDate = $('#endTime_sport').val() + " 23:59:59";
			}
			var searchIMEI =  $("#searchIMEI").val().replace(/\r\n/ig,",").replace(/\n/ig,",").replace(/(^\s+)|(\s+$)/g,"").replace(/\s/g,"");
 			if(searchIMEI){
 				$.each(searchIMEI.split(","),function(i,v){
 					if(v){
 						if(imeis){
 							imeis+= "," + v;
 						}else{
 							imeis = v;
 						}
 					}
 				});
 			}
 			params.imeis = imeis;
			params.deviceName = $('#deviceName').val();
			params.vehicleNumber = $('#vehicleNumber').val();
			params.carFrame = $('#carFrame').val();
			params.sim = $('#sim').val();
			params.isActivation = $('#isActivation').val();
			params.vehicleIcon = $('#vehicleIcon_cust').val();
			params.mcType2 = $('#mcTypeSel').val();
			
			var soonExpire = $("#expire_soon").val();
			var expireStartTime = "";
			var expireEndTime = "";
			var date = new Date();
			if(soonExpire == '1'){
				expireStartTime = formatDates(date);
				date.setDate(date.getDate()+30);
				expireEndTime = formatDates(date);
			}else if(soonExpire == '2'){
				expireEndTime = formatDates(date);
			}
			params.expireStartTime = expireStartTime;
			params.expireEndTime = expireEndTime;
			
			var contain_sub = $("input[id='contain_sub']:checked").val();
			if(contain_sub){
				params.subSearchId = userId;
				params.userId = "";
			}
			
			if(insTypeId){
				$.ajax({
					type:"post",
					async: false,
					cache: false,
					data:params,
					url:_ctx+"/device/validDeviceIns",
					success:function(ret){
						if(ret && ret.code == 0){
							$("#valid-loading").hide();
							$("#check-row-tbody").html(template("check-row-tmp",ret));
							$("#check-total").html(ret.data?ret.data.length:0);
						}
					},
					complete:function(XMLHttpRequest, textStatus){
						authorityValide(XMLHttpRequest);
					}
				});
			}
		}
		
		function batchSendIns(){
			var checkRow = $("#check-row-tbody tr[data='1']");
			if(checkRow && checkRow.length > 0){
				var paramArray = $("#instruction-form").serializeArray();
				if (validateParams(paramArray)) {
					var param = "";
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
							}
							param+= thisVal + ",";
						} 
					});
					var data = {
						"orderContent" : $("#orderContent").val(),
						"instructionId" : $("#instruction_ul .active a").attr("name"),
						"instructionName":$("#instruction_ul .active a").text(), 
						"param" : maintenceParam(param),
						"instructionPwd" : $("#instructionPwd").val(),
						"isUsePwd" : $("#isUsePwd").val(),
						"isOffLine" : $("#isOffLine").val()
					};
					var imeis = "";
					$.each(checkRow,function(i,v){
						imeis += $(v).find("td").eq(0).html()+",";
					});
					if(imeis){
						imeis = imeis.substring(0, imeis.length - 1);
						data.imeis = imeis;
					}
					data.startTime = $("#ins_startTime").val();
					data.endTime = $("#ins_endTime").val();
					$.ajax({
						type:"post",
						async: false,
						cache: false,
						data: data,
						url:_ctx+"/device/batchSendIns",
						success:function(ret){
							if(ret && ret.code == 0){
								layer.msg("操作成功",{icon:1});
							}else{
								layer.msg($.i18n.prop(ret.msg),{icon:2});
							}
						},
						complete:function(XMLHttpRequest, textStatus){
							authorityValide(XMLHttpRequest);
						}
					});
				}
			}else{
				layer.msg("没有可发送指令的设备",{icon:2});
			}
			
		}
		
	</script>
	
	<script>
	var workModeFlag = "";
	function openSetWorkMode(flag){
		var mcTypes = $("#mcTypeSel option").map(function(){return $(this).val();}).get().join(",");
		if(mcTypes && mcTypes.length > 0){
			workModeFlag = flag;
			var imeis=getDeviceImeis(flag);
			if(imeis== "" && flag != "all"){
				layer.msg("请选择设备");
				return;
			}
			getModeTemplate();
			getDeviceByWorkMode(imeis);
		}else{
			layer.msg("没有可发送指令的设备",{icon:2});
		}
	}
	
	var index;
	function getDeviceByWorkMode(imeis){
		
		var params = {"checkImei":imeis};
		params.userId = userId;
		params.dateType = $('#dateTypeExpiration').val();
		if($('#startTime_sport').val()){
			params.startDate = $('#startTime_sport').val() + " 00:00:00";
		}
		if($('#endTime_sport').val()){
			params.endDate = $('#endTime_sport').val() + " 23:59:59";
		}
		var searchIMEI =  $("#searchIMEI").val().replace(/\r\n/ig,",").replace(/\n/ig,",").replace(/(^\s+)|(\s+$)/g,"").replace(/\s/g,"");
		if(searchIMEI){
			$.each(searchIMEI.split(","),function(i,v){
				if(v){
					if(imeis){
						imeis+= "," + v;
					}else{
						imeis = v;
					}
				}
			});
		}
		params.imeis = imeis;
		params.deviceName = $('#deviceName').val();
		params.vehicleNumber = $('#vehicleNumber').val();
		params.carFrame = $('#carFrame').val();
		params.sim = $('#sim').val();
		params.isActivation = $('#isActivation').val();
		params.vehicleIcon = $('#vehicleIcon_cust').val();
		params.mcType2 = $('#mcTypeSel').val();
		
		var soonExpire = $("#expire_soon").val();
		var expireStartTime = "";
		var expireEndTime = "";
		var date = new Date();
		if(soonExpire == '1'){
			expireStartTime = formatDates(date);
			date.setDate(date.getDate()+30);
			expireEndTime = formatDates(date);
		}else if(soonExpire == '2'){
			expireEndTime = formatDates(date);
		}
		params.expireStartTime = expireStartTime;
		params.expireEndTime = expireEndTime;
		
		var contain_sub = $("input[id='contain_sub']:checked").val();
		if(contain_sub){
			params.subSearchId = userId;
			params.userId = "";
		}
		
		$.ajax({
			type : "post",
			async : true,
			cache : false,
			url : _ctx + "/custom/getDeviceByWorkMode",
			data : params,
			beforeSend : function(XHR) {
				index = layer.msg($.i18n.prop("Commands.PleaseWait"), {icon: 16, time: -1, shade: [0.1,'#fff']});
			},
			success : function(ret) {
				if (ret.code == 0) {
					$("#checkTbody").html(template("checkTbodyTmp",ret));
					$("#check-workMode-total").html(ret.data?ret.data.length:0);
					$('#sendModeCommandModel').modal();
				}
			},
			complete: function(XMLHttpRequest, textStatus){
				layer.close(index);
			}
		});
	}
	
	function getDeviceImeis(flag){
		var insTypeId = $("#instruction_ul li.active").find("a").attr("name");
		var imeis = "",total = 0;
		if(flag && flag == "check" ){
			$.each($(".check-row"),function(i,v){
				if($(v).attr("checked")){
					imeis += $(v).val()+',';
					total++;
				}
			});
			if(imeis){
				imeis = imeis.substring(0, imeis.length-1);
			}
		}
		return imeis;
	}
	
	function getModeTemplate(){
		$.ajax({
			type : "post",
			async : true,
			cache : false,
			url : _ctx + "/custom/getTemplateList",
			success : function(ret) {
				if(ret && ret.code == 0){
					if(ret.data && ret.data.length > 0){
						$("#workModeView").html(template("workModeViewTmp", {data: ret.data}));
						$("#workModeView input[type='radio']").iCheck();
					}else{
						$('#ModeViewNoData').show();
					}
				}
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});
	}
	
	
	function sendWorkModelIns(){
		var checkRow = $("#checkTbody tr[data='1']");
		var tmpId=$("#workModeView").find("[name='modelName']:checked").eq(0).val();
		if(tmpId && tmpId != ''){
			if((checkRow && checkRow.length > 0)){
				var imeis = "";
				$.each(checkRow,function(i,v){
					imeis += $(v).find("td").eq(0).html()+",";
				});
				
				if(imeis){
					imeis = imeis.substring(0, imeis.length - 1);
				}
				$.ajax({
					type:"post",
					async: false,
					cache: false,
					data: {"imeis" : imeis, "tmpId": tmpId},
					url : _ctx + "/custom/issuedInstruct",
					success:function(ret){
						if(ret && ret.code == 0){
							layer.msg($.i18n.prop("comm.Operationdone"), {time: 2000, icon: 1});
							$("#sendModeCommandModel").modal('hide');
						}else{
							layer.msg($.i18n.prop(ret.msg),{icon:2});
						}
					},
					complete:function(XMLHttpRequest, textStatus){
						authorityValide(XMLHttpRequest);
					}
				});
			}else{
				layer.msg("没有可发送指令的设备",{icon:2});
			}
		}else{
			layer.msg($.i18n.prop("Commands.NoChoiceWorkMode"),{icon:2});
		}
	}
	
	</script>
	
	<script>
		function saveTempData(){
			$("[name='tmplateEdit']")[0].contentWindow.saveTempData();
		}
		/*新建工作模板*/
		$("#create-instructionRules").click(function(){
			$("#sendModeCommandModel").modal('hide');
			$("[name=tmplateEdit]").attr('src',"/custom/commandTemplateEdit");
			$("#customInstructionsModal").modal().on('hidden.bs.modal', function (e) {
				$("#sendModeCommandModel").modal("show");
			});
		})
		
		function saveTempData(){
		$("[name='tmplateEdit']")[0].contentWindow.saveTempData();
	}
		
		function saveCustComandSucess()
		{
			getModeTemplate();
			$("#customInstructionsModal").modal("hide")
		}
	</script>
	</body>
</html>
