
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html >
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" >
<title>海螺在线</title>
<script type="text/javascript">
	//Js 上下文
	_ctx="";
	_language="zh";
	var domain="lbs.tuyouonline.com";
</script>
<link rel="stylesheet" href="webpage/resource/css/normalize.css">
<link rel="stylesheet" href="webpage/resource/css/base.css">
<link rel="stylesheet" href="webpage/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="webpage/resource/css/font-awesome.min.css">
<link rel="stylesheet" href="webpage/resource/css/login.css">

<link rel="stylesheet" href="webpage/resource/plugins/easydropdown/easydropdown.css">
<!-- Compatible with HTML5 tags -->
<script src="webpage/resource/js/modernizr-2.8.3.js"></script>
<script src="webpage/resource/js/jquery-1.8.3.min.js"></script>
<script src="webpage/resource/js/jquery.cookie.js"></script> 
<!-- 国际化 -->
<script src="webpage/resource/plugins/i18n/jquery.i18n.properties.js"></script>
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
<!--CSS3 Media Queries (for IE 6-8)-->
<!--[if lte IE 8]>
<script src="js/respond.min.js"></script>
<![endif]-->
<!-- Compatible with HTML5 tags -->
<script src="webpage/resource/js/modernizr-2.8.3.js"></script>
<script type="text/javascript" src="webpage/resource/js/login2.js"></script>
</head>
<body class="login-bg login-bg-default">
<div class="login">
    <h1 class="logo-login"><img src="webpage/resource/images/timg.jpg"  width="318" height="81"  /></h1>
  
  <div>
	<span class="form-tip pa" id="tipsmsg" style="display:none;">验证不通过</span>
    <div class="form-group form-username">
      <input type="password" style="position:absolute; left:-9999em; top: -9999em" autocomplete="off"/>
      <input type="text" class="form-control username" id="account" onkeyup="onAccountChange();" placeholder="请输入账号"  autocomplete="off" onload="alert(0)">
    </div>
    <div class="form-group form-password">
      <input type="text" style="display: none;" autocomplete="off" />
      <input type="password" id="password" class="form-control password" onpropertychange="onIspassChang();"  placeholder="请输入密码"  autocomplete="off"> 
    </div>
    <div class="form-checkbox" > <span class="fr" style="display:none"><a href="javascript:iExperience();">我要体验&nbsp;<i class="fa fa-angle-double-right"></i></a></span> <span class="checkbox pointer checked">
      <input type="hidden" id="ispassChang" value="0">
      <input type="checkbox" id="checkbox" name="checkbox">
      </span>&nbsp;&nbsp;记住我</div>
    <div class="form-group">
      <button type="button" id="logins" onclick="login()"  class="btn btn-default btn-block">登录</button>
       <button type="button" id="load" disabled="disabled" style="display: none;" class="btn btn-default btn-block" ><i class="fa fa-spinner fa-pulse"></i>&nbsp;登录中</button>
      <!--<button type="submit" class="btn btn-default btn-block "><i class="fa fa-spinner fa-pulse"></i>&nbsp;正在登录</button>-->
    </div>
  </div>
  
  <span><i class="mappin"></i><i class="mappin"></i> <i class="mappin"></i> <i class="mappin"></i> <i class="mappin"></i><i class="mappin"></i></span>
</div>

<div class="side-QRcode" style="display:none;">
	<h1><img src="http://statics.jimicloud.com/tracker/domain/lbs.tuyouonline.com_qrcode.png" width="115" height="115"></h1>
	
	<p><a href="https://itunes.apple.com/us/app/tu-junplus/id1150787254?l=zh&ls=1&mt=8"><img src="webpage/resource/images/Apple-down.jpg" width="115" height="43"></a></p>
	
	<p><a href="http://appdown.jimicloud.com/tujun_android_v1.0.6_201612061656.apk 
"><img src="webpage/resource/images/Android-down.jpg" width="115" height="43"></a></p>
	
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content " style="width:400px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">厂商用户请选择角色及操作码</h4>
            </div>
            <div class="modal-body" style="height:150px">
            <div class="form-group ws-n" style="height:40px">
            <label class="col-md-4 label-first" title="厂商角色" style="top:7px">厂商角色：</label>
               <div class="col-md-8 easydropdown easydropdown-xs va-t">
                  <select name="changshangrole" class="js-select-changshangrole">
                    <option selected value="changshangadmin">厂商管理员</option>
                    <option value="changshangsale">销售</option>
                    <option value="changshangmarket">市场</option>
                    <option value="changshangfinance">财务</option>
                  </select>
              </div>
		     </div>
		     <div class="form-group ws-n" style="height:40px">
              <label  class="col-md-4 control-label" title="密码"><span style="color:red">*</span>操作码：</label>
              <div class="col-md-7">
                <input id="password" name="password" type="password" class="form-control form-control-sm" placeholder="请输入操作码" " />
              </div>
            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onClick="javascript:showLogin()">关闭</button>
                <button type="button" class="btn btn-primary" onClick="javascript:saveLogin()">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

 <footer class="footer">
 	<div class="language"  style="display:none;">
         <ul class="list-line ta-c">
           <li data-language="zh"><a href="/language?locale=zh" title="简体中文"><img alt="简体中文" src="webpage/resource/images/lang/zh.jpg"></a></li><!-- 简体中文 -->
           <li data-language="en"><a href="/language?locale=en"  title="English"><img alt="English" src="webpage/resource/images/lang/en-us.jpg"></a></li><!-- 英国 -->
          	<li data-language="es"><a href="/language?locale=es" title="España"><img alt="España" src="webpage/resource/images/lang/es.jpg"></a></li><!-- 西班牙 -->
           <li data-language="pt"><a href="/language?locale=pt" title="Portugal" ><img alt="Portugal" src="webpage/resource/images/lang/pt.jpg"></a></li><!-- 葡萄牙 -->
           <li data-language="pl"><a href="/language?locale=pl"title="Polska"><img alt="Polska" src="webpage/resource/images/lang/pl.jpg"></a></li><!-- 波兰 -->
	 	   <li data-language="de"><a href="/language?locale=de"title="Deutschland"><img alt="Deutschland" src="webpage/resource/images/lang/de.jpg"></a></li><!-- 德国  -->
         </ul>
	</div>
	<div class="certification ta-c" style="display:none;">
		
		 
           <a href="http://www.cyberpolice.cn/wfjb/" target="blank"><img alt="" src="webpage/resource/images/certification/network_police.jpg" height="37"></a>
           <a href="http://www.500wan.com/pages/info/about/wangan/index.htm" target="blank"><img alt="" src="webpage/resource/images/certification/public_safety.jpg" height="37"></a>
           <a href="http://www.12377.cn/" target="blank"><img alt="" src="webpage/resource/images/certification/12377.jpg" height="37"></a>
       </div>

</footer>
          
          
<!-- 模板渲染 --> 
<script src="webpage/resource/plugins/artTemplate/template.js"></script> 
<script src="webpage/resource/plugins/artTemplate/template-plugin.js"></script>

<script type="text/html" id="browserTpl">
	<div class="browser">
		<p class="browser-instructions">检测到您当前使用的浏览器版本过低，为了能获得更好的用户体验，<br>建议使用以下新版本浏览器。</p>
		<div class="browser-list">
			<a href="http://www.google.cn/chrome/" target="_blank"><img src="webpage/resource/images/browser/chrome.png" width="24" height="24"  alt=""/ class="middle">下载谷歌浏览器</a>
			<a href="http://www.mozilla.com/firefox/" target="_blank"><img src="webpage/resource/images/browser/firefox.png" width="24" height="24"  alt=""/ class="middle">下载火狐浏览器</a>
			<a href="http://www.opera.com/" target="_blank"><img src="webpage/resource/images/browser/opera.png" width="24" height="24"  alt=""/ class="middle">下载欧朋浏览器</a>
			<a href="http://www.apple.com.cn/safari/" target="_blank"><img src="webpage/resource/images/browser/safari.png" width="24" height="24"  alt=""/ class="middle">下载苹果浏览器</a>
			<a href="http://windows.microsoft.com/zh-CN/internet-explorer/products/ie/home" target="_blank"><img src="webpage/resource/images/browser/explorer.png" width="24" height="24"  alt=""/ class="middle">下载IE浏览器</a> 
		</div>
	</div>
</script>
<script>
function showLogin(){
	$('.login').show();
	$("#load").hide();
	$("#logins").show();
}
//浏览器提示
if($.browser.msie&&$.browser.version<9.0) {
	$(function(){
		var html = template('browserTpl');
		$(".login").append(html);
		
	});
}
var lang = $.cookie("locale");
Boolean(lang) ? "" : lang = window._language ;
$(".language li[data-language='"+lang+"']").addClass("active").siblings().removeClass('active');


$(document).ready(function(){
// 	if(window.name==""){ 
// 		window.location.href=_ctx+"/language?locale=zh";
// 		window.name = "0"; 
// 	}
	$(document).keydown(function(event){ 
		if(event.keyCode == 13){ 
			login(); 
		} 
	});
});
$("#password").on('input',function(e){
	$("#ispassChang").val("1");
});
function onIspassChang(){
	$("#ispassChang").val("1");
}

$("#account").on('input',function(e){
	$("#password").val("");
});
var oldAccount="zhao"
function onAccountChange(){
	if($("#account").val() && oldAccount){
		if($("#account").val() != oldAccount){
			$("#password").val("123456");
		}
	}
}


//版权年份
function setCopyrightYear(){
	var year = new Date().getFullYear();
	$("#fullYear").text(year);
}
//setCopyrightYear();


/* var verification = "验证不通过";
var verificationName = "不存在用户名";
var verificationPassword = "密码不正确";
 */

var isNull = "用户名或密码不能为空";
var isError= "用户名或密码错误";
var NoPermissions = "没有权限登录";
var accountisNotExist = "账号不存在";
var passwordIsError = "密码错误";
</script>

</body>
</html>
