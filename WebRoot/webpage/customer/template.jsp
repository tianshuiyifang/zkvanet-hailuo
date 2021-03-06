<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>












<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta charset="utf-8">
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
	/* var sessionid="218C6DB19FF233CB8532F893414D17C0";
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
		var sessionid="218C6DB19FF233CB8532F893414D17C0";
		var _sessionid=$.cookie("sessionid");
		if(sessionid!=_sessionid){
			//window.location.href=window.location.href;
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
	
	//获取Cookie
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
		synUserConfig();
	});
	
</script>
<title>指令管理-
	Tracker</title>
</head>

 
	   
		<body class="body bc-gray">
	
	 
	
	 
	
 

<body class="body  bc-gray">
	<div class="wrapper">
	 

<header class="header navbar  navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<div class="navbar-brand">
				<a href="meunController.do?main">
				<img src="http://statics.jimicloud.com/tracker/domain/274a91e969054bd9b154ba432a50d1a4.png"
					height="34" alt="Tracker" /></a>
			</div>
		</div>
		<div class="company-name fl p-l25">
            <div class=" p-l25 p-t15 c-fff fs-20">
                
            </div>
        </div>
		<div class="navbar-collapse collapse">
			
			<div class="navbar-right p-15 p-b0 ta-r">
				<div class="user-time">
					<a href="/userFeedback/toHelp"><i class="fa fa-question-circle"></i>&nbsp;帮助</a>&emsp;
					
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
					<span>您好，<b class="user-name" title="yanshi">${userName}</b></span>&emsp;
					
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
				
				<li id="index"><a href="meunController.do?index"><i class="fa fa-map-o" aria-hidden="true"></i>&nbsp;控制台</a></li>
				<li id="reportsManagement"><a href="meunController.do?report"><i class="fa fa-table" aria-hidden="true"></i>&nbsp;统计报表</a></li>
				<li id="devicesManagement"><a href="meunController.do?device"><i class="fa fa-hdd-o" aria-hidden="true"></i>&nbsp;设备管理</a></li>
				<!-- 如果是体验用户，则不显示设置、业务日志 Tab项 -->
				
				<li id="toSetUp"><a href="meunController.do?setUp"><i class="fa fa-gears" aria-hidden="true"></i>&nbsp;设置</a></li>
				<li id="toLog"><a  href="meunController.do?businessLog"><i class="fa fa-file-text-o" aria-hidden="true"></i>&nbsp;业务日志</a></li>
				<li id="commandManagement"><a  href="meunController.do?template"><i class="fa fa-paper-plane-o" aria-hidden="true"></i>&nbsp;指令管理</a></li>
			
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

var header='commandManagement';
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
	<div class="main oh">
  		<div class="container-fluid">
   			<div class="row">
		    	<div class="customer-leftsidebar p-lr15 p-t15">
        			<div class="auto-high row bc-fff  side-left">
          				<div class="side-subtitle bc-f2f2f2 p-lr15 p-tb5 lh-2 b-t1-ddd"><b>指令类型</b></div>
          				<div class="side-busines account-side-busines p-tb10">
				            <ul class="tab-nav" id="insManage_ul">
							
							
							  	<li id="batchInsList_li"><a style="outline-style: none;" id="batchInsList_a" onclick="getBatchInsList();">下发指令管理</a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="customer-rightsidebar p-15 mih-400">
					
					
						
					
					
					<!-- 下发指令管理 -->	
					<div class="tab-con-batchinslogs b1-ccc bc-fff dn">
							<div class="tab-navbar">
								<div class="p-tb5">
									<b>下发指令管理</b>
								</div>
							</div>
							<div class="funcbar clearfix">
								<form class="form-inline search-criteria clearfix p-tb10" id="batchInsLogs-form">
									<div class="form-group">
										<label>IMEI：</label>
										<div class="w280 d-ib imei-textarea-box pr">
											<textarea type="text" name="searchImeis" class="imei-textarea"
												placeholder="请输入设备IMEI号(多个回车换行)" title="请输入设备IMEI号(多个回车换行)"></textarea>
											<div class="func-btnbar clearfix">
												<div class="fl p-t5">
													IMEI计数：<span class="dev-num" id="ac_dev_num">0</span>
												</div>
											</div>
										</div>
									</div>

									<div class="form-group p-lr15">
										<label>批次号：</label> <input type="text" name="taskId"
											class="form-control form-control-sm" />
									</div>
									<div class="form-group p-lr15">
										<label>状态：</label>
										<div class="d-ib w120 va-m">
											<span class="easydropdown easydropdown-sm easydropdown-full va-m">
												<select class="js-select" name="logStatus">
													<option value="">请选择</option>
													<option value="isOffLine_0">在线发送</option>
													<option value="isOffLine_1">离线发送</option>
													<option value="isExecute_1">发送成功</option>
													<option value="isExecute_0">发送失败</option>
													<option value="isExecute_4">已取消</option>
													<option value="isExecute_3">待发送</option>
												</select>
											</span>
										</div>
									</div>
									<div class="form-group">
										<button type="button" class="btn btn-primary btn-sm" onclick="searchBatchInsLogs();">
											<i class="fa fa-search"></i>&nbsp;搜索
										</button>
									</div>
									<!-- 主账号登陆 -->
									
										<!-- -->
										<div class="clearfix p-t10">
											<button class="btn btn-sm btn-default" type="button" onclick="selectCancelIns();">选中取消指令</button>
											<button class="btn btn-sm btn-default" type="button" onclick="searchAllCancelIns();">本次查询全部取消指令</button>
										</div>
									 	
									 <!-- 虚拟账号登陆 -->
									 
								</form>
							</div>
							<div class="table-header">
								<table class="table table-hover table-ellipsis m-b0" id="batchInsLogsTableHeader">
									<thead>
										<tr>
											<th width="6%"><span class="icheck-min"><input
													type="checkbox" /></span> 序号</th>
											<th width="11%" title="批次号">批次号</th>
											<th title="指令名称">指令名称</th>
											<th title="发送类型">发送类型</th>
											<th title="指令">指令</th>
											<th width="12%" title="发送时间">发送时间</th>
											<th width="12%" title="IMEI">IMEI</th>
											<th title="状态">状态</th>
											<th title="内容/结果">内容/结果</th>
											<th title="平台">平台</th>
											<th title="下发人">下发人</th>
											<th title="创建时间">创建时间</th>
										</tr>
									</thead>
								</table>
							</div>
							<div class="table-scrollbar oy-a">
								<table class="table table-hover table-ellipsis" id="batchInsLogsTableContent">
									<colgroup>
										<col width="6%" /><col width="11%" />
										<col /><col /><col /><col width="12%" />
										<col width="12%" /><col /><col /><col /><col />
									</colgroup>
									<tbody id="batchIns-tbody">
									</tbody>
								</table>
								<script type="text/html" id="batchIns-logs">
									{{each result as tm i }}
										<tr>
						                	<td title="{{(pageNo-1)*pageSize+(i+1)}}">
						                		<span class="icheck-min">
						                			<input {{if tm.isExecute != "待发送"}}disabled="disabled" data="0"{{else}}data="1"{{/if}} type="checkbox" value="{{tm.id}}">
						                		</span>
						                		&nbsp;{{(pageNo-1)*pageSize+(i+1)}}
						                	</td>
						                	<td title="{{tm.taskId}}">{{tm.taskId}}</td>
						                	<td title="{{tm.codeName}}">{{tm.codeName}}</td>
											<td title="{{if tm.isOffLine == '0'}}在线{{else}}离线{{/if}}">{{if tm.isOffLine == '0'}}在线{{else}}离线{{/if}}</td>
						                	<td title="{{tm.code}}">{{tm.code}}</td>
						                	<td title="{{tm.sendTime}}">{{tm.sendTime}}</td>
						                	<td title="{{tm.receiveDevice}}">{{tm.receiveDevice}}</td>
						                	<td title="{{tm.isExecute}}">{{tm.isExecute}}</td>
						                	<td title="{{if tm.content != ""}}{{tm.content | in18}}{{/if}}">{{if tm.content != ""}}{{tm.content | in18}}{{/if}}</td>
						                	<td title="{{tm.platform}}">{{tm.platform}}</td>
						                	<td title="{{tm.sender}}">{{tm.sender}}</td>
						                	<td title="{{tm.creationDate}}">{{tm.creationDate}}</td>
					              		</tr>
									{{/each}}
								</script>
								<div id="paging-batchInsLogs" class="simple-pagination-custom ta-c"></div>
					            <div id="markNull-batchInsLogs" style="display: none;">
									<div class="ta-c c-666 p-tb10">
										<span class="p-5 d-ib">&nbsp;<i class="fa fa-bell-o"></i> 暂无数据&nbsp;
									</span>
									</div>
								</div>
								<div id="batchIns-loading" class="ta-c p-tb25" style="display: none;"><i class="fa fa-spinner fa-pulse fa-2x"></i></div>
								</div>
						</div>
					
				</div>

				<div class="new-custom-instruction b1-ccc bc-fff clearfix dn oy-a">
					<div class="tab-navbar">
						<div class="p-tb5">
							<b>新建自定义指令</b>
						</div>
					</div>
					<div class="new-instruction-box p-10">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="control-label col-sm-2">模板名称：</label>
								<div class="col-sm-3">
									<input type="text" placeholder="模板名称"
										class="form-control form-control-sm" />
								</div>
							</div>
							<div class="form-group m-b0">
								<label class="control-label col-sm-2">上报周期：</label>
								<div class="col-sm-8">

									<div class="tab-con-reportingperiod b1-ccc bc-fff m-b10">
										<div class="main-tab">
											<div class="tab-navbar">
												<ul class="tab-nav clearfix">
													<li class="active"><a class="cp">定时模式</a></li>
													<li><a class="cp">星期模式</a></li>
													<li><a class="cp">普通模式</a></li>
												</ul>
											</div>
											<div class="tab-con p-lr15 p-tb10">

												<div class="timemode-con-box">

													<div class="form-horizontal">
														<div class="form-group">
															<label class="col-sm-2 control-label">上报次数：</label>
															<div class="col-sm-10">
																<div class="d-ib w80 va-m">
																	<span
																		class="easydropdown easydropdown-sm easydropdown-full va-m">
																		<select class="js-select">
																			<option value="">1</option>
																			<option value="">2</option>
																			<option value="">3</option>
																	</select>
																	</span>
																</div>
																&nbsp;&nbsp;天&#12288;
																<div class="d-ib w80 va-m">
																	<span
																		class="easydropdown easydropdown-sm easydropdown-full va-m">
																		<select class="js-select">
																			<option value="">1</option>
																			<option value="">2</option>
																			<option value="">3</option>
																	</select>
																	</span>
																</div>
																&nbsp;&nbsp;次 <span class="red d-ib">（多天一次，一天多次，天数最多不大于15天，次数最多不大于12次）</span>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label">上报时间：</label>
															<div class="col-sm-10">
																<ul class="directive-reporttime-list clearfix">
																	<li>第First次上报时间&#12288;<input type="text"
																		class="form-control form-control-sm form-control-inline"
																		name="dateTimePicker" size="8" /></li>
																	<li>第Second次上报时间&#12288;<input type="text"
																		class="form-control form-control-sm form-control-inline"
																		name="dateTimePicker" size="8" /></li>
																	<li>第Third次上报时间&#12288;<input type="text"
																		class="form-control form-control-sm form-control-inline"
																		name="dateTimePicker" size="8" /></li>
																	<li>第Fourth次上报时间&#12288;<input type="text"
																		class="form-control form-control-sm form-control-inline"
																		name="dateTimePicker" size="8" /></li>
																</ul>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label">循环上报时间：</label>
															<div class="col-sm-10">
																<label class="icheck-min"><input
																	type="checkbox">&nbsp;限时周期</label>&nbsp; <input
																	type="text"
																	class="form-control form-control-inline form-control-sm"
																	size="8"> 天&#12288;&#12288;
															</div>
														</div>
													</div>
												</div>

												<div class="weekpattern-con-box">
													<div class="form-horizontal">
														<div class="form-group">
															<label class="col-sm-2 control-label">上报时间：</label>
															<div class="col-sm-10">
																<ul class="tab-con-week clearfix">
																	<li><a><label class="icheck-min cp fw-b"><input
																				type="checkbox" name="icheck">&nbsp;星期日</label></a></li>
																	<li><a><label class="icheck-min cp fw-b"><input
																				type="checkbox" name="icheck">&nbsp;星期一</label></a></li>
																	<li><a><label class="icheck-min cp fw-b"><input
																				type="checkbox" name="icheck">&nbsp;星期二</label></a></li>
																	<li><a><label class="icheck-min cp fw-b"><input
																				type="checkbox" name="icheck">&nbsp;星期三</label></a></li>
																	<li><a><label class="icheck-min cp fw-b"><input
																				type="checkbox" name="icheck">&nbsp;星期四</label></a></li>
																	<li><a><label class="icheck-min cp fw-b"><input
																				type="checkbox" name="icheck">&nbsp;星期五</label></a></li>
																	<li><a><label class="icheck-min cp fw-b"><input
																				type="checkbox" name="icheck">&nbsp;星期六</label></a></li>
																</ul>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label">上报时间：</label>
															<div class="col-sm-4">
																<input type="text" name="datetimepicker1"
																	class="form-control form-control-sm" />
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label">持续上报：</label>
															<div class="col-sm-4">
																<div class="select-time">
																	<div class="easydropdown easydropdown-sm d-ib va-m">
																		<select class="js-select">
																			<option value="10">4</option>
																			<option selected="selected" value="5">5</option>
																			<option value="6">6</option>
																		</select>
																	</div>
																	&nbsp;（周）
																</div>
															</div>
														</div>
													</div>
												</div>

												<div class="clockmode-con-box">

													<div class="form-horizontal form-sm">
														<div class="form-group">
															<label class="col-sm-2 control-label">唤醒时间：</label>
															<div class="col-sm-4 p-l0">
																<input type="text"
																	class="form-control form-control-sm"
																	name="datetimepicker1" />
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label">上传间隔：</label>
															<div class="col-sm-4 p-l0">
																<div class="easydropdown d-ib va-m">
																	<select class="js-select">
																		<option value="10">4</option>
																		<option selected="selected" value="5">5</option>
																		<option value="6">6</option>
																	</select>
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
							<div class="form-group">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="button" class="btn btn-success btn-sm">添加自定义</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="button" class="btn btn-primary btn-sm">&nbsp;&nbsp;保存规则&nbsp;&nbsp;</button>
								</div>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<!--查看指令-->
<div class="modal fade in" id="view-SendWorkMode">
	<div class="modal-dialog">
		<div class="modal-content w700">
			<div class="modal-header">
				<button aria-label="Close" data-dismiss="modal" class="close"
					type="button">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">下发工作模式查看</h4>
			</div>
			<div class="modal-body" id="modelBody">

				<script type="text/html" id="modelBodyTmp">
						<form class="form-horizontal">
						<h5 class="fw-b">指令名称：{{data.name}}</h5>
						{{each data.list as item}}
							{{if item.type == 1}}
								<fieldset>
									<legend class="fs-12">定时模式{{if data.currentStage == item.currentStage}}(选中阶段){{/if}}</legend>
									<div class="form-group m-b0">
										<label class="col-sm-3 control-label">上报周期：</label>
										<div class="col-sm-6 p-t7">
											<span class="d-ib p-r15">
												{{if item.intervalTime > 24}}{{item.intervalTime/24}}天 1次{{/if}}
												{{if item.intervalTime <= 24}}1天 {{item.times}}次{{/if}}
											</span>
											<ul class="directive-reporttime-list clearfix">
												{{each item.time as t i}}
												<li>第{{i+1}}次上报时间：{{t}}</li>
												{{/each}}
											</ul>
										</div>
										<div class="col-sm-3 p-t7">
											{{if item.stageState == 1}}<span class="">等待执行</span>{{/if}}
											{{if item.stageState == 2}}<span class="c-009934">执行中</span>{{/if}}
											{{if item.stageState == 3}}<span class="">执行完成</span>{{/if}}
											{{if item.stageState == 4}}<span class="">已取消</span>{{/if}}
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">持续上报周期：</label>
										<label class="col-sm-6 p-t7">
											{{if item.limitFlag == 0}}不限周期{{/if}}
											{{if item.limitFlag == 1}}{{item.stageDays}}天{{/if}}
										</label>
									</div>
								</fieldset>
							{{/if}}
							{{if item.type == 2}}
								<fieldset>
									<legend class="fs-12">星期模式{{if data.currentStage == item.currentStage}}(选中阶段){{/if}}</legend>
									<div class="form-group m-b0">
										<label class="col-sm-3 control-label">上报周期：</label>
										<div class="col-sm-6 p-t7">
											<ul class="week-list">
												{{each item.weekDay as week}}
													<li>
														{{if week == 1}}星期一{{/if}}
														{{if week == 2}}星期二{{/if}}
														{{if week == 3}}星期三{{/if}}
														{{if week == 4}}星期四{{/if}}
														{{if week == 5}}星期五{{/if}}
														{{if week == 6}}星期六{{/if}}
														{{if week == 7}}星期日{{/if}}
													</li>
												{{/each}}
											</ul>
										</div>
										<div class="col-sm-3 p-t7">
											{{if item.stageState == 1}}<span class="">等待执行</span>{{/if}}
											{{if item.stageState == 2}}<span class="c-009934">执行中</span>{{/if}}
											{{if item.stageState == 3}}<span class="">执行完成</span>{{/if}}
											{{if item.stageState == 4}}<span class="">已取消</span>{{/if}}
										</div>
									</div>
									<div class="form-group m-b0">
										<label class="col-sm-3 control-label">上报时间：</label> <label class="col-sm-6 p-t7">{{item.time[0]}}</label>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">持续上报周期：</label>
										<label class="col-sm-6 p-t7">
											{{if item.limitFlag == 0}}不限周期{{/if}}
											{{if item.limitFlag == 1}}{{item.stageDays}}天{{/if}}
										</label>
									</div>
								</fieldset>
							{{/if}}
							{{if item.type == 3}}
								<fieldset>
									<legend class="fs-12">普通模式{{if data.currentStage == item.currentStage}}(选中阶段){{/if}}</legend>
									<div class="form-group m-b0">
										<label class="col-sm-3 control-label">唤醒时间：</label> <label class="col-sm-6 p-t7">{{item.time[0]}}</label>
										<div class="col-sm-3 p-t7">
											{{if item.stageState == 1}}<span class="">等待执行</span>{{/if}}
											{{if item.stageState == 2}}<span class="c-009934">执行中</span>{{/if}}
											{{if item.stageState == 3}}<span class="">执行完成</span>{{/if}}
											{{if item.stageState == 4}}<span class="">已取消</span>{{/if}}
										</div>
									</div>
									<div class="form-group m-b0">
										<label class="col-sm-3 control-label">上传间隔：</label> <label class="col-sm-6 p-t7">
											{{if item.intervalTime/24 < 1}}{{item.intervalTime}}小时{{/if}}
											{{if item.intervalTime/24 > 1}}{{item.intervalTime/24}}天{{/if}}
										</label>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">持续上报周期：</label>
										<label class="col-sm-6 p-t7">
											{{if item.limitFlag == 0}}不限周期{{/if}}
											{{if item.limitFlag == 1}}{{item.stageDays}}天{{/if}}
										</label>
									</div>
								</fieldset>
							{{/if}}
						{{/each}}
						</form>
					</script>

			</div>
		</div>
	</div>
</div>

<!--执行指令模态框-->
<div class="modal fade in execution-instruction"
	id="execution-instruction">
	<div class="modal-dialog">
		<div class="modal-content w700">
			<div class="modal-header">
				<button aria-label="Close" data-dismiss="modal" class="close"
					type="button">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">执行指令</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<input type="hidden" id="issuedTemplateIdForDevice" />
					<div class="form-group">
						<label class="col-sm-2 control-label">添加设备：</label>
						<div class="col-sm-9">
							<div class="form-control form-control-sm imei-textarea-box pr">
								<textarea type="text" id="searchTemplateIMEI"
									class="imei-textarea" placeholder="请输入设备IMEI号(多个回车换行)"
									title="请输入设备IMEI号(多个回车换行)"></textarea>
								<div class="func-btnbar clearfix">
									<div class="fl p-t5">
										IMEI计数：<span class="dev-num" id="ac_dev_num">0</span>
									</div>
									<div id="putTemplateDeviceLoading" class="fl p-t5 p-l15 dn">
										<i class="fa fa-spinner fa-pulse fa-fw fa-1x"></i>
										正在加载数据...
									</div>
									<div class="fr">
										<button
											class="btn btn-success btn-sm mw-80 js-add-results-btn"
											type="button" onclick="putTemplateDevice();">添加</button>
										&nbsp;&nbsp;
										<button class="btn btn-default btn-sm mw-80 js-close"
											type="button">取消</button>
									</div>
								</div>
							</div>

							<div class="select-device">
								<div class="b1-ccc bc-fafafa p-10 m-t10">
									<div class="table-list-head bc-eee">
										<table
											class="table table-condensed table-ellipsis table-td-normal table-noborder m-b0">
											<thead>
												<tr>
													<th class="first">IMEI</th>
													<th>型号</th>
													<th>所属用户</th>
													<th>操作</th>
												</tr>
											</thead>
										</table>
									</div>

									<div class="table-list-con oy-a">
										<table id="succList"
											class="table table-condensed table-ellipsis table-td-normal table-noborder m-b0">

										</table>
										<script type="text/html" id="succ-info">
									  	{{if succDeviceList}}
											{{each succDeviceList as device index}}
												<tr id="{{device.imei}}_tr">
													<td class="first" title="{{device.imei}}" name="putedImei">{{device.imei}}</td>
													<td title="{{if device.deviceAlias == null || device.deviceAlias == "" }}{{device.mcType}}{{else}}{{device.deviceAlias}}{{/if}}">{{if device.deviceAlias == null || device.deviceAlias == "" }}{{device.mcType}}{{else}}{{device.deviceAlias}}{{/if}}</td>
													<td title="{{device.userName}}">{{device.userName}}</td>
													<td title="删除"><a href="javascript:void(0);" onclick="dropDevice('{{device.imei}}');">删除</a></td>
												</tr>
											{{/each}}
										{{/if}}
									 </script>
										<script type="text/html" id="succ-info-one">
										<tr id="{{imei}}_tr">
											<td class="first" title="{{imei}}" name="putedImei">{{imei}}</td>
											<td title="{{if deviceAlias == null || deviceAlias == "" }}{{mcType}}{{else}}{{deviceAlias}}{{/if}}">{{if deviceAlias == null || deviceAlias == "" }}{{mcType}}{{else}}{{deviceAlias}}{{/if}}</td>
											<td title="{{userName}}">{{userName}}</td>
											<td title="删除"><a href="javascript:void(0);" onclick="dropDevice('{{imei}}');">删除</a></td>
										</tr>
									</script>
									</div>
								</div>
							</div>
							<div class="p-tb10">
								<button type="button" class="btn btn-primary"
									onclick="downInstruc();">发送指令</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- IMEI添加状态 -->
<div class="modal fade" id="addResultsModal">
	<div class="modal-dialog">
		<div class="modal-content w600">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">
					添加状态
				</h4>
			</div>
			<div class="modal-body">
				<div class="">
					<div>
						<p>
							当前添加成功
							&thinsp;<b class="c-72af2d"><span id="succCount"></span></b>&nbsp;&nbsp;
							, 失败 
							&thinsp;<b class="c-red"><span id="failCount"></span></b>
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
				<button type="button" class="btn btn-primary mw-100"
					data-dismiss="modal" id="addResultsModal-close">
					确定
				</button>
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
<a class="alarm-toggle-btn pf ta-c oh cp js-alarm-toggle-btn" id="gaojing" title="报警"> <i class="fa fa-bell-o"></i></a>
<div class="alarm-info" id="alarmMessage">
  <div class="alarm-header clearfix">
    <h5 class="fl m-0 text-ellipsis maw-100 d-ib" title="报警管理"><span class="fs-18 c-df7312"><i class="fa fa-bell-o"></i></span>&nbsp;报警管理</h5>
    <a  class="alarm-close fr fs-18 cp" title="缩小"><i class="fa fa-compress" ></i></a>
    <div class="alarm-tools fr ws-n">
      <span class="dn">
      	告警时间：
      <input type="text" id="alarm_startTime" readonly="readonly" class="form-control form-control-xs form-control-inline" size="10" placeholder="开始时间">
      <input type="text" id="alarm_endTime" readonly="readonly" class="form-control form-control-xs  form-control-inline" size="10" placeholder="结束时间">
      &emsp;
      </span>
      <a class="cp text-ellipsis maw-80 d-ib" style="vertical-align:middle;" onclick="javascript:readAlarm('');" title="全部标为已读">全部标为已读</a>
      <a class="cp js-type-filter-btn text-ellipsis maw-80 d-ib" style="vertical-align:middle;" onclick="javascript:alarmFilter();" title="报警内容筛选">报警内容筛选</a>
      <span id="lowerLevelSpan" class="icheck-min"><label class="m-b0"><input type="checkbox" id="lowerLevel" >&nbsp;下级设备告警&nbsp;&nbsp;&nbsp;&nbsp;</label></span>
      <span class="icheck-min"><label class="m-b0"><input type="checkbox" id="alarmSound">&nbsp;开启报警声音</label></span>
    </div>
  </div>
  <div class="alarm-body">
    <div class="table-header">
      <table class="table table-condensed table-hover table-ellipsis m-b0" id="alarmMessageTableHeader">
        <thead>
        <tr>
          <th title="设备名称">设备名称</th>
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
          				<td id="devName{{i}}" title="{{row.devName}}">{{row.devName}}</td>
          				<td title="{{row.imei}}"><a onclick="openDeviceInfoModal('{{row.imei}}')">{{row.imei}}</a></td>
          				<td id="" title="{{row.account}}">
							{{if row.account == null || row.account == ''}}
								用户已删除
							{{else}}
								{{row.account}}
							{{/if}}
						</td>
          				<td id="alertType{{i}}" title="{{row.statusName}}">{{row.statusName}}</td>
          				<td id="alertTime{{i}}" title="{{row.pushTime}}">{{row.pushTime}}</td>
          				<td id="positionTime{{i}}" title="{{row.createTime}}">{{row.createTime}}</td>
          				<td title="已定位">已定位</td>
						<td>
							{{if row.readStatus == -1}}
								<a onclick="readAlarm('{{row.id}}')" title="标为已读">标为已读</a>
								{{if row.readStatus == -1}}<input type="hidden" name="markAlarmId" value="{{row.id}}">{{/if}}
							{{else}}
								<span title="已读">已读</span>
							{{/if}}
							{{if row.alarmDeal == null || row.alarmDeal == ''}}
								<a onclick="dealAlarm('{{row.id}}')"
									title="处理">
								处理</a>
							{{else}}
								<a onclick="showAlarm('{{row.alarmDeal.dealUserAccount}}','{{row.alarmDeal.inputDealUserName}}','{{row.alarmDeal.creationDate }}','{{row.alarmDeal.dealContent}}');"
									title="查看处理">查看处理</a>
							{{/if}}
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
              <td title="{{positionTime}}">{{positionTime}}</td>
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
						<input type="hidden" name="alarmIds" id="alarmDealModal_deal_alarmIds" value="">
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
			getAlarmInfoList();
		}).on("ifUnchecked",function(even){
			lowerLevel=0;
			getAlarmInfoList();
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
					  alarm_startTime_history = dates;
					  getAlarmInfoList();
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
					  alarm_endTime_history = dates;
					  getAlarmInfoList();
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
		
		
 		setInterval(function(){
 			getAlarmInfoList(2);
 		},5000);
		
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
	
	var header='commandManagement';
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
	
	
	function AlarmInfofilter(){
		var check = $("input[name='alarm_item']");
		var statusStr = "";
		$.each(check,function(i,v){
			if($(v).attr("checked")){
				statusStr += $(v).val()+",";
			}
		});
		if(statusStr){  
			statusStr = statusStr.substring(0, statusStr.length-1);
		}
		$.ajax({
			url:"/alarmPushSet/saveAlarmType",
			data: {"statusStr":statusStr},
		    dataType: 'json',
		    success: function(ret){
		    	if(ret.code == 0 || ret.code == -1){
		    		filterModalFlag = false;
					getAlarmInfoList();
					$("#alarmFilterModal").modal('hide');
	    		}
		    },
		    complete:function(XMLHttpRequest, textStatus){
				if(XMLHttpRequest.responseText){
					var data = eval('('+XMLHttpRequest.responseText+')');
					if(data.code == 100001){
						layer.msg($.i18n.prop('cust.VirtualAccountPermissionDenied'),{icon:2});
						cancleSelect();
					}
				}
				
			}
			});
// 		}else{
// 			layer.msg($.i18n.prop('Business.Pleaseselectthetypeofalarm'));
// 		}
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
	
	
	function getStatusStr(){
		var statusStr = "";
		var check = $("input[name='alarm_item']");
		$.each(check,function(i,v){
			if($(v).attr("checked")){
				statusStr += $(v).val()+",";
			}
		});
		if(statusStr){
			statusStr = statusStr.substring(0, statusStr.length-1);
		}
		return statusStr;
	}
	function getSearchUserId(){
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
		return searchUserId;
	}
	
	var requestThread = 0 ;
	//告警管理
	function getAlarmInfoList(updateListFlag){
		if(!updateListFlag){//1.默认强制刷新, 2.定时器刷新
			updateListFlag=1;
		}
		//告警列表打开状态才刷新数据
		var getAlarmListFlag=0;
		if($('#alarmMessage').is(':visible')){//开启状态
			getAlarmListFlag=1;
		}

		//异步请求，最后一次请求参数，保证响应回来的数据是正确
		requestThread++;  
		
 		$.ajax({
			url:"/alarmInfo/getAlarmInfoList",
			data: {"pageNo":1,"pageSize":50,"statusStr":getStatusStr(),"updateListFlag":updateListFlag,"getAlarmListFlag":getAlarmListFlag,"lowerLevel":lowerLevel,"searchUserId":getSearchUserId(),
				"requestThread":requestThread,"startTime":$("#alarm_startTime").val(),"endTime":$("#alarm_endTime").val(),},
		    cache: false,
		    dataType: 'json',
		    beforeSend:function(XHR){
		    	//定时器不用显示加载效果
				if(updateListFlag!=2){
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
    			
    			//闪灯处理
		    	if(ret && ret.code==-3 && parseInt(ret.totalDistiance) == requestThread){
    				$(".js-alarm-toggle-btn").addClass("active");
    				if($("#alarmSound").attr("checked")){//播放
	    				audioPlay("webpage/resource/media/alarm.wav");
   					}
		    	}
		    	
		    	if(ret && ret.code==0 && ret.data && ret.data.length>0 && parseInt(ret.totalDistiance) == requestThread){
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
		    				audioPlay("webpage/resource/media/alarm.wav");
    					}
	    			}
		    	}else{//清空列表,ret.code=-1加载列表没有数据返回,updateListFlag非法操作不等于1、2
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
		    				$.each(ret.data,function(index,value){
		    					if(value.alarmConfig==1){
			    			     	$("input[name='alarm_item'][value='"+value.id+"']").iCheck('check');
		    					}
			    			});
			    			getAlarmInfoList();
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
			    	getAlarmInfoList();//刷新列表
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
				//async: true,
			    cache: true,
			    dataType: 'json',
			    type:"post",
			    success: function(ret){
		    		if(ret && ret.code == 0){
				    	$("#alarmDealModal_deal").modal('hide');
						layer.msg($.i18n.prop("comm.Operationdone"),{icon:1}); 
				    	getAlarmInfoList();//刷新列表
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
</body>
</html>

<script>
function saveTempData(){
	$("[name='tmplateEdit']")[0].contentWindow.saveTempData();
}
</script>

<script>
//下拉框
$('.js-select').easyDropDown();
//单选框、复选框
$("input[type = 'checkbox'],input[type = 'radio']").iCheck();

(function($) {
	var a, b, c, d, e, f, g, h, z, table_h;
	//timePicker
	$("[name=dateTimePicker]").timePicker();
	//表格高度
	function tableHeight(obj, box) {
		a = $(window).height();
		b = $(".header").outerHeight();
		c = $(".menu-seach").outerHeight();
		d = $(".customer-rightsidebar").outerHeight() - $(".customer-rightsidebar").height();
		z = $(".footer").outerHeight();
		e = $(obj).outerHeight() - $(obj).height();
		f = $(obj + " .tab-navbar").outerHeight();
		g = $(obj + " " + box + " .funcbar").outerHeight();
		h = $(obj + " " + box + " .table-header").outerHeight();
		table_h = a - b - c - z - d - e - f - g - h;
		$(obj + " " + box + " .table-scrollbar").css("height", table_h);
	}

	//设置表格高度
	function setTableHeight(){
		var arr =[];
		$(".customer-rightsidebar>div").each(function(){
			var cls = $(this).attr("class").match(/tab-con-[^\s]+/);
			arr.push(cls);
		});		
		$.each(arr,function(i,v){
			if($('.'+arr[i]).is(':visible')){
				tableHeight('.'+arr[i], '');
			}
		});
	}
	
	//表格头部宽度设置
	function setTableHeaderWidth(){
		tableHeaderAutoWidth('#templateTableHeader','#templateTableContent');//工作模式模板
		tableHeaderAutoWidth('#issuedTemplateTableHeader','#issuedTemplateTableContent');//下发工作模式任务
		tableHeaderAutoWidth('#issuedStageTableHeader','#issuedStageTableContent');//下发工作模式
		tableHeaderAutoWidth('#taskinstructionsTableHeader','#taskinstructionsTableContent');//下发指令任务
		tableHeaderAutoWidth('#batchInsLogsTableHeader','#batchInsLogsTableContent');//下发指令
	}

	//左侧选项卡
	/* 	tabs(".side-busines .tab-nav", "active", ".customer-rightsidebar",function() {
		setTableHeight();
		setTableHeaderWidth();
	}); */
	$("#insManage_ul li").click(function(){
		setTableHeight();
		setTableHeaderWidth();
	})

	//浏览器窗口大小变化尺寸自适应
	$(window).resize(function() {
		if ($(window).height() > 500) {
			setTableHeight();
		}
		setTableHeaderWidth();
	});
})(jQuery);

checkboxAllSelectToggle("#issuedStageTableHeader input[type = 'checkbox']", "#issuedStageTableContent input[type = 'checkbox']");

/* //下发工作模式任务管理查看设备
$("#js-checkEquipment").click(function() {
	$(".tab-task-management").hide();
	$(".tab-sendworkmode-management").show();
}) */

function checkEquipment(id){
	$("#issuedStageLi").click();
	$("#issuedTemplateBatchId").val(id);
	getIssuedStageList(1,10,{"issuedTemplateId":id});
}

/* //下发工作模式查看
$("#js-view-SendWorkMode").click(function() {
	$("#view-SendWorkMode").modal();
}) */
function viewSendWorkMode(id, currentStage, imei){
	$.ajax({
		type : "post",
		async : false,
		cache : false,
		data : {"id" : id,"currentStage" : currentStage,"imei": imei},
		url : _ctx + "/custom/getIssuedStageInfo",
		success : function(ret) {
			if(ret && ret.code == 0){
				$("#modelBody").html(template("modelBodyTmp", {data : ret.data}));
			}
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
	$("#view-SendWorkMode").modal();
}

//下发指令任务管理查看
$("#js-view-issuedinstruction").click(function() {
	$(".tab-con-taskinstructions").hide();
	$(".tab-con-batchinslogs").show();
})

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
	$(input).parent().find(".js-close").click(
		function() {
			$(input).removeClass("form-control-error").val("");
			$(input).parent().removeClass("focus").find(".dev-num").text(0);
		});
	$(input).parent().find(".js-add-results-btn").click(
		function() {
			$(input).parent().removeClass("focus").find(".dev-num").text(0);
	});
}

addDeviceBoxToggle("#searchIssuedTemplateIMEI");
addDeviceBoxToggle("#batchInsLogs-form textarea[name='searchImeis']");

addDeviceBoxToggle("#searchTemplateIMEI")


//创建工作模式模板
/* $("#create-instructionRules").click(function(){
	window.location.href=_ctx+"/custom/commandTemplateEdit";
}) */
</script>

<script>
function newCustomInstructionHeight(){
	$(".new-custom-instruction").height($(window).height() - $(".header").outerHeight() - $(".menu-seach").outerHeight() - ($(".customer-rightsidebar").outerHeight() - $(".customer-rightsidebar").height()) - $(".footer").outerHeight())
}

//执行指令模态框
/* $("#js-issued-instruction").click(function(){
 $("#execution-instruction").modal();
 })
 */
function issuedInstruction(id) {
	var fictitiousSendFMAuth = $("input[name='fictitiousSendFMAuth']").val();
	if(typeof(fictitiousSendFMAuth) != "undefine" && fictitiousSendFMAuth != null && fictitiousSendFMAuth != '' && fictitiousSendFMAuth == '1'){
		$("#succList").empty();
		$("#searchTemplateIMEI").val("");
		$("#execution-instruction").modal();
		$("#issuedTemplateIdForDevice").val(id);
	}else{
		layer.msg($.i18n.prop('cust.VirtualAccountPermissionDenied'),{icon:2});
	}
}
</script>
	
<script>
function newCustomInstructionHeight() {
	$(".new-custom-instruction").height(
		$(window).height() - $(".header").outerHeight() - $(".menu-seach").outerHeight() - ($(".customer-rightsidebar").outerHeight() 
				- $(".customer-rightsidebar").height()) - $(".footer").outerHeight());
}

newCustomInstructionHeight();
</script>
	
<script>
tabs(".tab-con-reportingperiod .tab-nav", "active", ".tab-con-reportingperiod .tab-con");
var catalogsId="";
</script>

<script>
	$(document).ready(function() {
		var mainSendFMAuth = $("input[name='mainSendFMAuth']").val();
		var mainSendFMAuthFlag = "0";
		if(typeof(mainSendFMAuth) != 'undefine' && null != mainSendFMAuth && mainSendFMAuth != '' && mainSendFMAuth == '1'){
			mainSendFMAuthFlag = "1";
		}
		var mainSendInsAuth = $("input[name='mainSendInsAuth']").val();
		var mainSendInsAuthFlag = "0";
		if(typeof(mainSendInsAuth) != 'undefine' && null != mainSendInsAuth && mainSendInsAuth != '' && mainSendInsAuth == '1'){
			mainSendInsAuthFlag = "1";
		}
		if(mainSendFMAuthFlag == "1"){
			$(".tab-con-template").removeClass("dn").siblings().addClass("dn");
			if(catalogsId==""||catalogsId=="1"){
				$("#templateList_li").click();
				//getTemplateList(1, 10, null);
			}
		}else{
			$(".tab-con-taskinstructions").removeClass("dn").siblings().addClass("dn");
			if(mainSendInsAuthFlag == "1"){
				$("#batchInsTaskList_a").click();
			}else{
				$("#batchInsList_a").click();
			}
			//getBatchInsTaskList();
		} 
		
		var viewFlag='';
	 	if(parseInt(viewFlag)==2){ //围栏设置
	 		  $("#batchInsList_a").click();
	 	}
	});

	/************************************************************************ 模板 ************************************************************************/
	var templatePageNo = 1;
	var templatePageSize = 10;
	var templateTotalRecord = "";

	function initTemplatePaging(param) {
		$("#templatePaging").pagination({
			prevText : $.i18n.prop("page.previous"),
			nextText : $.i18n.prop("page.next"),
			items : templateTotalRecord,
			itemsOnPage : templatePageSize,
			param : param,
			onPageClick : function(pageNumber, pageSize, param, event) {
				if (event && (event.type == "click" || event.type == "change")) {
					templatePageNo = pageNumber;
					templatePageSize = pageSize;
					getTemplateList(templatePageNo, templatePageSize, param);
				}
			},
			onInit : function() {
				$("#templatePaging").pagination("selectPage", templatePageNo);
			}
		});
	}

	function getTemplateList(pageNo, pageSize, param) {
		$(".tab-con-template").removeClass("dn").siblings().addClass("dn");
		$("#templateList_li").addClass("active").siblings().removeClass("active");
		if (pageNo) {
			templatePageNo = pageNo;
			templatePageSize = pageSize;
		}
		if (!param) {
			param = {
				currentPage : templatePageNo,
				pageSize : templatePageSize
			};
		}
		param.currentPage = templatePageNo;
		param.pageSize = templatePageSize;

		$.ajax({
				type : "post",
				async : false,
				cache : false,
				data : param,
				url : _ctx + "/custom/getTemplatePage",
				beforeSend : function(XHR) {
					//showLoading("templateContent");
				},
				complete : function(XHR, TS) {
					//hideLoading("templateContent");
					tableHeaderAutoWidth("#templateHeader", "#templateContent");//设备型号设置表头宽度
					authorityValide(XHR);
				},
				success : function(ret) {
					if (ret && ret.code == 0) {
						if (ret.data.result && ret.data.result.length > 0) {
							$("#templateBody").html(template("templateTmp", {data : ret.data.result, pageNo : templatePageNo, pageSize : templatePageSize}));
							templateTotalRecord = ret.data.totalRecord;
							if (templatePageNo == 1) {
								initTemplatePaging(param);
							}

							$("#templatePaging").show();
							$("#templateNoData").hide();
						} else {
							$("#templateBody").html(template("templateTmp", null));
							$("#templatePaging").hide();
							$("#templateNoData").show();
						}
					} else {
						$("#templateBody").html(template("templateTmp", null));
						$("#templatePaging").hide();
						$("#templateNoData").show();
					}
				},
				error : function(e) {
					ajaxError("getTemplateList()", e);
				}
			});
	}

	/************************************************************************ 下发模板 ************************************************************************/
	var issuedTemplatePageNo = 1;
	var issuedTemplatePageSize = 10;
	var issuedTemplateTotalRecord = "";

	function initIssuedTemplatePaging(param) {
		$("#issuedTemplatePaging").pagination({
			prevText : $.i18n.prop("page.previous"),
			nextText : $.i18n.prop("page.next"),
			items : issuedTemplateTotalRecord,
			itemsOnPage : issuedTemplatePageSize,
			param : param,
			onPageClick : function(pageNumber, pageSize, param, event) {
				if (event && (event.type == "click" || event.type == "change")) {
					issuedTemplatePageNo = pageNumber;
					issuedTemplatePageSize = pageSize;
					getIssuedTemplateList(issuedTemplatePageNo, issuedTemplatePageSize, param);
				}
			},
			onInit : function() {
				$("#issuedTemplatePaging").pagination("selectPage", issuedTemplatePageNo);
			}
		});
	}

	function getIssuedTemplateList(pageNo, pageSize, param) {
		$(".tab-con-task").removeClass("dn").siblings().addClass("dn");
		$("#issuedTemplateList_li").addClass("active").siblings().removeClass("active");
		if (pageNo) {
			issuedTemplatePageNo = pageNo;
			issuedTemplatePageSize = pageSize;
		}
		if (!param) {
			param = {
				currentPage : issuedTemplatePageNo,
				pageSize : issuedTemplatePageSize
			};
		}
		param.currentPage = issuedTemplatePageNo;
		param.pageSize = issuedTemplatePageSize;

		$.ajax({
			type : "post",
			async : false,
			cache : false,
			data : param,
			url : _ctx + "/custom/getIssuedTemplatePage",
			beforeSend : function(XHR) {
			},
			complete : function(XHR, TS) {
				tableHeaderAutoWidth("#issuedTemplateHeader","#issuedTemplateContent");//设备型号设置表头宽度
				authorityValide(XHR);
			},
			success : function(ret) {
				if (ret && ret.code == 0) {
					if (ret.data.result && ret.data.result.length > 0) {
						$("#issuedTemplateBody").html(template("issuedTemplateTmp", {data : ret.data.result, pageNo : issuedTemplatePageNo, pageSize : issuedTemplatePageSize}));
						issuedTemplateTotalRecord = ret.data.totalRecord;
						if (issuedTemplatePageNo == 1) {
							initIssuedTemplatePaging(param);
						}
						$("#issuedTemplatePaging").show();
						$("#issuedTemplateNoData").hide();
					} else {
						$("#issuedTemplateBody").html(template("issuedTemplateTmp", null));
						$("#issuedTemplatePaging").hide();
						$("#issuedTemplateNoData").show();
					}
				} else {
					$("#issuedTemplateBody").html(template("issuedTemplateTmp", null));
					$("#issuedTemplatePaging").hide();
					$("#issuedTemplateNoData").show();
				}
			},
			error : function(e) {
				ajaxError("getIssuedTemplateList()", e);
			}
		});
	}

	function searchIssuedTemplate() {
		getIssuedTemplateList(1, 10, {
			"id" : $("#issuedTemplateId").val(),
			"name" : $('#issuedTemplateName').val()
		});
	}

	function putTemplateDevice() {
		var imeis = getInputImeis();
		if (!imeis) {
			$("#searchTemplateIMEI").addClass("form-control-error").focus();
			return false;
		} else {
			$("#putTemplateDeviceLoading").show();
		}
		//重复添加的imei
		var repeatPutedImies = dealImeis(imeis, false);
		//去除已添加imei后的imeis
		imeis = dealImeis(imeis, true);
		if (!imeis) {
			$("#putTemplateDeviceLoading").hide();
			$("#searchTemplateIMEI").removeClass("form-control-error").parent().removeClass("focus");
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
				var retData = {
					"failedArr" : failedArr
				};
				$("#failCount").text(failedArr.length);
				$("#succCount").text(0);
				$("#failedList").html(template("failed-info", retData));
				failedArr = [];
				$("#addResultsModal").modal();
			}
		} else {
			$.ajax({
				url : _ctx + "/custom/putTemplateDevice",
				async : true,
				cache : false,
				type : "POST",
				data : {
					"imeis" : imeis.replace(/(^\s+)|(\s+$)/g, ""),
				},
				datatype : "json",
				success : function(ret) {
					if (ret.code == 0) {
						$("#putTemplateDeviceLoading").hide();
						$("#searchTemplateIMEI").removeClass("form-control-error").parent().removeClass("focus");
						var retData = ret.data;
						if (retData) {
							//IMEI验证成功列表
							if (retData.succDeviceList) {
								if ($("#succList tr").length > 0) {
									$.each(retData.succDeviceList, function(i, v) {
										if ($("#" + v.imei + "_tr").length == 0) {
											$("#succList").append(template("succ-info-one", v));
										}
									});
								} else {
									$("#succList").html(template("succ-info", retData));
								}
							}
							$("#selectedCount").text($("#succList tr").length);

							//IMEI验证失败列表
							var failedArr = new Array();
							$.each(retData.failImeisList, function(i, v) {
								$.each(v,function(key, value) {
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
											"failReason" : $.i18n.prop('Commands.Not_support')
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
									$.each(repeatPutedImies.split(","), function(i, v) {
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
								$("#failedList").html(template("failed-info", retData));
								failedArr = [];
								$("#addResultsModal").modal();
							}
						}
					}
				},
				complete : function(XMLHttpRequest, textStatus) {
					authorityValide(XMLHttpRequest);
				},
				error : function(e) {
					ajaxError("putTemplateDevice", e);
				}
			});
		}

	}

	$("#searchTemplateIMEI").focus(function() {
		var imeis = getInputImeis();
		if (imeis) {
			$("#ac_dev_num").text(imeis.split(",").length);
			$("#searchIMEI").removeClass("form-control-error");
		} else {
			$("#ac_dev_num").text("0");
		}
	});

	function getInputImeis() {
		var inputImeis = $("#searchTemplateIMEI").val();
		inputImeis = inputImeis.replace(/\r\n/ig, ",").replace(/\n/ig, ",").replace(/(^\s+)|(\s+$)/g, "").replace(/\s/g, "");
		var imeis = "";
		if (inputImeis) {
			$.each(inputImeis.split(","), function(i, v) {
				if (v) {
					if (imeis) {
						imeis += "," + v;
					} else {
						imeis = v;
					}
				}
			});
		}
		return imeis;
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

	//设备移除
	function dropDevice(imei) {
		if (imei) {
			$("#" + imei + "_tr").remove();
			$("#selectedCount").text($("#succList tr").length);
		}
	}

	function downInstruc() {
		var imeis = getPutedImeis();
		if (imeis.length == 0) {
			$("#searchTemplateIMEI").addClass("form-control-error");
			return;
		}
		var tmpId = $("#issuedTemplateIdForDevice").val();
		$.ajax({
			type : "post",
			async : false,
			cache : false,
			data : {
				"imeis" : imeis,

				"tmpId" : tmpId

			},
			url : _ctx + "/custom/issuedInstruct",
			beforeSend : function(XHR) {
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			},
			success : function(ret) {
				if (ret && ret.code == 0) {
					layer.msg($.i18n.prop("comm.Operationdone"), {time: 2000, icon: 1});
					$("#execution-instruction").modal('hide');
				} else {
					layer.msg(ret.msg,{icon:2});
				}
			},
			error : function(e) {
				ajaxError("downInstruc()", e);
			}
		});
		
		$("#succList").empty();
		$("#searchTemplateIMEI").val("");
	}

	/************************************************************************ 下发阶段 ************************************************************************/

	var issuedStagePageNo = 1;
	var issuedStagePageSize = 10;
	var issuedStageTotalRecord = "";

	function initIssuedStagePaging(param) {
		$("#issuedStegePaging").pagination({
			prevText : $.i18n.prop("page.previous"),
			nextText : $.i18n.prop("page.next"),
			items : issuedStageTotalRecord,
			itemsOnPage : issuedStagePageSize,
			param : param,
			onPageClick : function(pageNumber, pageSize, param, event) {
				if (event&& (event.type == "click" || event.type == "change")) {
					issuedStagePageNo = pageNumber;
					issuedStagePageSize = pageSize;
					getIssuedStageList(issuedStagePageNo, issuedStagePageSize, param);
				}
			},
			onInit : function() {
				$("#issuedStegePaging").pagination("selectPage", issuedStagePageNo);
			}
		});
	}

	function getIssuedStageList(pageNo, pageSize, param) {
		$("#issuedStageBody input[type='checkbox']").iCheck("uncheck");
		$(".tab-con-sendworkmode").removeClass("dn").siblings().addClass("dn");
		$("#issuedStageLi").addClass("active").siblings().removeClass("active");
		if (pageNo) {
			issuedStagePageNo = pageNo;
			issuedStagePageSize = pageSize;
		}
		if (!param) {
			param = {
				currentPage : issuedStagePageNo,
				pageSize : issuedStagePageSize
			};
		}
		param.currentPage = issuedStagePageNo;
		param.pageSize = issuedStagePageSize;

		$.ajax({
			type : "post",
			async : false,
			cache : false,
			data : param,
			url : _ctx + "/custom/getIssuedStagePage",
			beforeSend : function(XHR) {
				//showLoading("issuedStageTableContent");
			},
			complete : function(XHR, TS) {
				//hideLoading("issuedStageTableContent");
				tableHeaderAutoWidth("#issuedStageTableHeader",
						"#issuedStageTableContent");//设备型号设置表头宽度
				authorityValide(XHR);
			},
			success : function(ret) {
				if (ret && ret.code == 0) {
					if (ret.data.result && ret.data.result.length > 0) {
						//alert(JSON.stringify(ret.data.result[0].id));
						$("#issuedStageBody").html(template("issuedStageTmp", {data : ret.data.result, pageNo : issuedStagePageNo, pageSize : issuedStagePageSize}));
						issuedStageTotalRecord = ret.data.totalRecord;
						if (issuedStagePageNo == 1) {
							initIssuedStagePaging(param);
						}
						$("#issuedStegePaging").show();
						$("#issuedStageNoData").hide();
						
						$("#issuedStageBody input[type='checkbox']").iCheck();
						checkboxSelectLine("#issuedStageTableHeader input[type='checkbox']", "#issuedStageBody input[type='checkbox']");//选中行背景换色
					} else {
						$("#issuedStageBody").html(template("issuedStageTmp", null));
						$("#issuedStegePaging").hide();
						$("#issuedStageNoData").show();
					}
				} else {
					$("#issuedStageBody").html(template("issuedStageTmp", null));
					$("#issuedStegePaging").hide();
					$("#issuedStageNoData").show();
				}
			},
			error : function(e) {
				ajaxError("getIssuedStageList()", e);
			}
		});
	}
	
	function searchIssuedStage() {
		var searchIMEI = $("#searchIssuedTemplateIMEI").val().replace(/\r\n/ig, ",").replace(/\n/ig, ",").replace(/(^\s+)|(\s+$)/g, "").replace(/\s/g, "");
		getIssuedStageList(1, 10, 
			{
				"issuedTemplateId" : $("#issuedTemplateBatchId").val(),
				"exectueState" : $('#exectueState').val(),
				"endState" : $('#endState').val(),
				"imeis" : searchIMEI
			}
		);
	}
	
	function cancelIns(flag){
		var checkIds = "";
		$("#issuedStageBody input[type='checkbox']").each(function(i,v){
			if(this.checked){
				checkIds += $(v).val()+',';
			}
		});
		if(checkIds.length == 0 && flag == 'check'){
			layer.msg("请选择指令记录",{icon:8});
			return false;
		}
		var searchIMEI = $("#searchIssuedTemplateIMEI").val().replace(/\r\n/ig, ",").replace(/\n/ig, ",").replace(/(^\s+)|(\s+$)/g, "").replace(/\s/g, "");
		var params = {"checkIds" : checkIds};
		params.issuedTemplateId =  $("#issuedTemplateBatchId").val();
		params.exectueState = $('#exectueState').val();
		params.imeis = searchIMEI;
		$.ajax({
			type : "post",
			async : false,
			cache : false,
			data : params,
			url : _ctx + "/custom/cancelOfflineInstruct",
			success : function(ret) {
				if (ret && ret.code == 0) {
					layer.msg($.i18n.prop("comm.Operationdone"), {time: 2000, icon: 1});
					getIssuedStageList(1,10,params);
				} else{
					layer.msg($.i18n.prop(ret.msg),{icon:2});
				}
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});
		
	}
	
	
	
	/***************************************下发指令任务管理-start****************************************************/
	var totalRecored_batchInsTask = 0;
	var pageSize_batchInsTask = 10;
	var pageNo_batchInsTask = 1;
	function queryBatchInsTaskList(batchInsTaskParam){
		$("#paging-batchInsTask").pagination({
			prevText : "上一页",
			nextText : "下一页",
			items : totalRecored_batchInsTask,
			itemsOnPage : pageSize_batchInsTask,
			cssStyle: 'light-theme',
			param : batchInsTaskParam,
			onPageClick : function(pageNumber,pageSize,param, event) {
				if(event && (event.type=="click" || event.type=="change")){
					pageNo_batchInsTask = pageNumber;
					pageSize_batchInsTask = pageSize;
					getBatchInsTaskList(param.taskId,param.insName)
				}
			},
			onInit : function() {
				$("#paging-batchInsTask").pagination("selectPage", pageNo_batchInsTask);
			}
		});
	}
	
	function getBatchInsTaskList(taskId,insName){
		$(".tab-con-taskinstructions").removeClass("dn").siblings().addClass("dn");
		$("#batchInsTaskList_li").addClass("active").siblings().removeClass("active");
		$("#batchInsTask-form input[name='taskId']").val(taskId);
		$("#batchInsTask-form input[name='insName']").val(insName);
		var batchInsTaskParam = {
			id:taskId,
			insName:insName,
			currentPage:pageNo_batchInsTask,
			pageSize:pageSize_batchInsTask
		};
		$.ajax({
			type : 'POST',
			url : _ctx + "/business/ConmmandLogs/commandTaskList",
			async : false,
			cache : false,
			data : batchInsTaskParam,
			success : function(returnData) {
				var datas = returnData.data;
				if(datas && datas.result.length > 0){
					$('#paging-batchInsTask').show();
					$('#markNull-batchInsTask').hide(); 
				}else{
					$('#paging-batchInsTask').hide();
					$('#markNull-batchInsTask').show(); 
				}
				if (returnData.code == 0) {
					var templateData = "";
					templateData = {"result":datas.result,"pageNo":pageNo_batchInsTask,"pageSize":pageSize_batchInsTask}
					$('#batchInsTask-tbody').html(template('batchIns-task', templateData));
					totalRecored_batchInsTask = datas.totalRecord; 
					queryBatchInsTaskList(batchInsTaskParam);
				}
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});
	}
	
	function searchBatchInsTask(){
		pageNo_batchInsTask = 1;
		var taskId = $("#batchInsTask-form input[name='taskId']").val();
		var insName = $("#batchInsTask-form input[name='insName']").val();
		getBatchInsTaskList(taskId,insName);
	}
	
	function showTaskInfo(taskId){
		pageNo_batchIns = 1;
		getBatchInsList(taskId,'','');
	}
	
	/***************************************下发指令任务管理-end****************************************************/

	
	/***************************************下发指令管理-start****************************************************/
	
	var totalRecored_batchIns = 0;
	var pageSize_batchIns = 10;
	var pageNo_batchIns = 1;
	function queryBatchInsList(batchInsLogsParam){
		$("#paging-batchInsLogs").pagination({
			prevText : "上一页",
			nextText : "下一页",
			items : totalRecored_batchIns,
			itemsOnPage : pageSize_batchIns,
			cssStyle: 'light-theme',
			param : batchInsLogsParam,
			onPageClick : function(pageNumber,pageSize,param, event) {
				if(event && (event.type=="click" || event.type=="change")){
					pageNo_batchIns = pageNumber;
					pageSize_batchIns = pageSize;
					getBatchInsList(batchInsLogsParam.taskId,batchInsLogsParam.searchImeis,batchInsLogsParam.logStatus);
				}
			},
			onInit : function() {
				$("#paging-batchInsLogs").pagination("selectPage", pageNo_batchIns);
			}
		});
	}
	
	function getBatchInsList(taskId,searchImeis,logStatus){
		$("#batchInsLogsTableHeader input[type='checkbox']").iCheck("uncheck");
		$(".tab-con-batchinslogs").removeClass("dn").siblings().addClass("dn");
		$("#batchInsList_li").addClass("active").siblings().removeClass("active");
		$("#batchInsLogs-form input[name='taskId']").val(taskId);
		$("#batchInsLogs-form textarea[name='searchImeis']").val(searchImeis);
		$("#batchInsLogs-form select[name='logStatus']").val(logStatus);
		var batchInsLogsParam = {
				searchImeis:searchImeis,
				taskId:taskId,
				logStatus:logStatus,
				currentPage:pageNo_batchIns,
				pageSize:pageSize_batchIns
		};
		$('#batchIns-tbody').empty();
		$('#paging-batchInsLogs').hide();
		$('#markNull-batchInsLogs').hide();
		$('#batchIns-loading').show();
		$.ajax({
			type : 'POST',
			url : _ctx + "/business/ConmmandLogs/list",
			async : true,
			cache : false,
			data : batchInsLogsParam,
			success : function(returnData) {
				if (returnData.code == 0) {
					$('#batchIns-loading').hide();
					var datas = returnData.data;
					if (datas.result && datas.result.length > 0) {
						totalRecored_batchIns = datas.totalRecord;
						$.each(datas.result,function(i,v){
							v.isExecute = v.isExecute.replace("1","发送成功")//执行成功
									   .replace("0","发送失败") // 执行失败
									   .replace("3","待发送") // 待发送(转为离线)
									   .replace("4","已取消");//已取消
							
						});
						var templateData = "";
						templateData = {"result":datas.result,"pageNo":pageNo_batchIns,"pageSize":pageSize_batchIns}
						$('#batchIns-tbody').html(template('batchIns-logs', templateData));
						$('#paging-batchInsLogs').show();
						$('#markNull-batchInsLogs').hide();
					}else{
						$('#paging-batchInsLogs').hide();
						$('#markNull-batchInsLogs').show();
						$('#batchIns-tbody').empty();
					}
				}
				$("#batchIns-tbody input[type='checkbox']").iCheck();
				checkboxSelectLine("#batchInsLogsTableHeader input[type='checkbox']", "#batchInsLogsTableContent input[type='checkbox']");//选中行背景换色
				queryBatchInsList(batchInsLogsParam);
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});
	}
	
	function searchBatchInsLogs(){
		pageNo_batchIns = 1;
		var searchImeis = $("#batchInsLogs-form textarea[name='searchImeis']").val();
		var taskId = $("#batchInsLogs-form input[name='taskId']").val();
		var logStatus = $("#batchInsLogs-form select[name='logStatus']").val();
		getBatchInsList(taskId,searchImeis,logStatus);
	}
	
	function selectCancelIns(){
		var logIds = [];
		$("#batchIns-tbody input[type='checkbox']").each(function(i,v){
			if(this.checked){
				logIds.push(this.value);
			}
		});
		if(logIds.length == 0){
			layer.msg("请选择指令记录",{icon:8});
			return false;
		}
		$.ajax({
			type : 'POST',
			url : _ctx + "/business/ConmmandLogs/cancelCommand",
			async : false,
			cache : false,
			data : {
				"ids" : logIds.join(",")
			},
			success : function(ret) {
				if(ret.code == 0){
					layer.msg("操作成功",{icon:1});
					searchBatchInsLogs();
				}
			},
			complete: function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});
	}
	
	function searchAllCancelIns(){
		var batchInsLogsParam = {
				searchImeis:$("#batchInsLogs-form textarea[name='searchImeis']").val(),
				taskId:$("#batchInsLogs-form input[name='taskId']").val(),
				logStatus:$("#batchInsLogs-form select[name='logStatus']").val(),
				logType:"batchLogs"
		};
		$.ajax({
			type : 'POST',
			url : _ctx + "/business/ConmmandLogs/cancelCommandByCondition",
			async : true,
			cache : true,
			data : batchInsLogsParam,
			success : function(ret) {
				if(ret.code == 0){
					layer.msg("操作成功",{icon:1});
					pageNo_batchIns = 1;
					searchBatchInsLogs();
				}
			},
			complete: function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});
	}
	
	/***************************************下发指令管理-end****************************************************/

	
	
function  deleteTmp(tmpId){
	var fictitiousSendFMAuth = $("input[name='fictitiousSendFMAuth']").val();
	if(typeof(fictitiousSendFMAuth) != "undefine" && fictitiousSendFMAuth != null && fictitiousSendFMAuth != '' && fictitiousSendFMAuth == '1'){
		layer.confirm($.i18n.prop('comm.ConfirmDelete'), {
			title:$.i18n.prop("comm.Information"),
	   		btn: [$.i18n.prop("comm.Yes"),$.i18n.prop("comm.Cancel")], //按钮
		}, function(){
			$.ajax({
				type : 'POST',
				url : _ctx + "/custom/deleteTemplate?tempId="+tmpId,
				async : false,
				cache : false,
				dataType: "json",
				success : function(ret) {
					if(ret.ok){
						getTemplateList(1, 10, null);
						layer.closeAll();
					}
				},
				complete:function(XMLHttpRequest, textStatus){
					authorityValide(XMLHttpRequest);
				}
			});
		});
	}else{
		layer.msg($.i18n.prop('cust.VirtualAccountPermissionDenied'),{icon:2});
	}
}

if(catalogsId){
	$(".tab-nav").find("a[catalogsid='"+catalogsId+"']").click();
}

</script>

<script>
$("#create-instructionRules").click(function(){
	$("#customInstructionsModal").modal();
	$("[name=tmplateEdit]").attr('src',"/custom/commandTemplateEdit");
})
function showFrameModal(url){
	var fictitiousSendFMAuth = $("input[name='fictitiousSendFMAuth']").val();
	if(typeof(fictitiousSendFMAuth) != "undefine" && fictitiousSendFMAuth != null && fictitiousSendFMAuth != '' && fictitiousSendFMAuth == '1'){
		$("#customInstructionsModal").modal();
		$("[name=tmplateEdit]").attr('src',url);
	}else{
		layer.msg($.i18n.prop('cust.VirtualAccountPermissionDenied'),{icon:2});
	}
}

function tmpmodelshow(){
	//$("#customInstructionsModal").modal();
}

function saveCustComandSucess(){
	$("#customInstructionsModal").modal('hide');
	getTemplateList(1, 10, null);
}
</script>