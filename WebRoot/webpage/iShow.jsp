<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
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
<script src="webpage/resource/plugins/highchart/highcharts.js"></script>
<script src="webpage/resource/plugins/highchart/exporting.js"></script>
<script src="webpage/resource/plugins/highchart/data.js"></script>
<script src="webpage/resource/plugins/highchart/drilldown.js"></script>
<script src="webpage/resource/plugins/highchart/highcharts-zh_CN.js"></script>
<script src="webpage/resource/plugins/highchart/dark-unica.js"></script> 
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
<script src="webpage/resource/js/ishow.js"></script>
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


<title>控制台 - Tracker</title>
<script type="text/javascript" src="webpage/resource/js/customer/customTree.js"></script>
<script type="text/javascript" src="webpage/resource/js/assets/device.js"></script>
<style type="text/css">
 .container {
   height:100%;
   width:100%
 }
 .container:before {
    content: "";
    position: fixed;
    left: 0;
    top: 0;
    z-index: -1;
    width: 100%;
    height: 100%;
    background-color: rgba(27, 35, 27, 0.7);
 }

 .box {
  height:100%;
  padding-top:20px
  
 }
 .jieshao{
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(255,0,0,0);
    font-family: "微软雅黑";
    color: #0b80fd;
 }
 .panel-body {
    padding:0px
 }
 .panel {
    border:0px
 }
 .panel-default>.panel-heading {
    background-color:#02b2c1
 }
 .intro>img {
    width: 100%;
    height: 100%;
}
</style>
</head>
<body class="body bc-gray ">
<div class="wrapper">
	 

<header class="header navbar  navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<div class="navbar-brand">
				<a href="meunController.do?main">
				<img src="webpage/resource/images/timg1.png"
					height="34" alt="Tracker" /></a>

			</div>
		</div>
		<div class="navbar-collapse collapse">
			
			<div class="navbar-right p-15 p-b0 ta-r">
				<div class="user-time">
					当前时间：<span id="curr_time"></span>
				</div>
				<div class="system-setting">
				
					<span>您好，<b class="user-name" title="${userName}">${userName}</b></span>&emsp;
					<a class="js-exit-system"><i class="fa fa-power-off"></i>&nbsp;退出系统</a>
				</div>
			</div>
		</div>
	</div>
</header>
<nav class="menu-seach bc-fff">
	<div class="container-fluid">
		<ul class="nav navbar-nav fs-14">
				<li id="index"><a id="iShow" href="meunController.do?main"><i class="fa fa-map-o" aria-hidden="true"></i>&nbsp;首页</a></li>
				<li id="index"><a id="index" href="meunController.do?index"><i class="fa fa-map-o" aria-hidden="true"></i>&nbsp;控制台</a></li>
		</ul>
		<div id="complexQuery" class="navbar-right  p-10" data-option="{'renderingFlag':false}"></div>
	</div>
</nav>

<script type="text/javascript">
var header_userId = "<%=request.getAttribute("userId")%>";
var header_account = "<%=request.getAttribute("userName")%>";
var header_type = "<%=request.getAttribute("userTypeKey")%>";
	var projectName="TUQIANG";
</script>

<script type="text/javascript">

var header='iShow';
$("#"+header).addClass("active");

switch (header) {
case "iShow":
	$("#complexQuery").attr("data-option","{'treeId':'treeDemo','updateTreeId':'treeDemo','renderingFlag':true}");
	break;
default:
	break;
}

	
	/************************当前时间-start**************************/ 
	setInterval("document.getElementById('curr_time').innerHTML=new Date().Format('yyyy-MM-dd hh:mm:ss')",1000);
	/************************当前时间-end**************************/ 
	
	
</script>
	<!--main 页的开始-->
	<div class="container" >
	   <div class="box-1 box col-xs-4" >
	   <div class="box-1-1" style="height:50%">
	    <div class="intro" title="公司介绍">
	    		<img src="webpage/resource/images/intro.jpg"/>
		</div>
	    <div class="intro-l-b">
	       
         </div>
         </div>
         <div class="box-1-2" style="height:50%">
         <div class="panel panel-default">
               <div class="panel-heading">
                                   在网设备上线率
               </div>
              <div class="panel-body">
                <div class="zonghetongji" style="min-height:200px"></div>
               </div>
          </div>
           <div class="panel panel-default">
               <div class="panel-heading">
                               在网设备出场率
               </div>
              <div class="panel-body">
                <div class="chuchanglv" style="min-height:200px"></div>
               </div>
          </div>
         </div>
         
	   </div>
	   <div class="box-2 box col-xs-4"  >
        <div class="panel panel-default">
               <div class="panel-heading">
                                  厂商车辆统计
               </div>
              <div class="panel-body">
                <div class="order-1" style="min-height:200px"></div>
               </div>
         </div>
          <div class="panel panel-default">
               <div class="panel-heading">
                                  厂商订单统计
               </div>
              <div class="panel-body">
                <div class="order-2" style="min-height:200px"></div>
               </div>
         </div>
             <div class="panel panel-default">
               <div class="panel-heading">
                                厂商订单趋势统计
               </div>
              <div class="panel-body">
                <div class="order-3" style="min-height:200px"></div>
               </div>
         </div>
       </div>
	   <div class="box-3 box col-xs-4" title="告警统计" >
         <div class="panel panel-default">
               <div class="panel-heading">
                                 实时吨位统计
               </div>
              <div class="panel-body">
                <div class="order-4" style="min-height:200px"></div>
               </div>
         </div>
          <div class="panel panel-default">
               <div class="panel-heading">
                                  厂商报警数量
               </div>
              <div class="panel-body">
                <div class="order-5" style="min-height:200px"></div>
               </div>
         </div>
       </div>
	</div>
	<div class="map-box pr">
		<div class="pa js-full-toggle-btn full-map-toggle-btn ta-c oh cp"><i class="fa fa-arrows-alt"></i></div>
	</div>
  	<!--main 页的结束-->
</div>

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

/**剩余刷新时间*/
var intervaltime = parseInt($("#intervaltime").val());

$(".js-full-toggle-btn").click(function(){
		if(!$("body").hasClass("full-map")){
		  $("body").addClass("full-map");
		  $(".header").hide();
		  $(".menu-seach").hide();
		  //$(this).find(".fa").removeClass("fa-arrows-alt").addClass("fa-compress");
		  $(".container").css("height",$(window).height());
		  $(window).resize(function(){
		    $(".container").css("height",$(window).height());
		  });
		}else{
		  $(".header").show();
		  $(".menu-seach").show();
		  $("body").removeClass("full-map");
		  $(this).find(".fa").removeClass("fa-compress").addClass("fa-arrows-alt");
		}
	});
	
	/************************退出系统-start**************************/ 
	
	
function exitSys()
	{
		/**$.ajax({
			url : "http://127.0.0.1/json/loginout.json",
			async : true,
			cache : false,
			type : "get",
			//data : $("#edit-modal-userForm").serialize(),
			 dataType:'jsonp',
			 jsonp:"jsonpcall",
			 jsonpCallback:"jsonpCallback",
			success : function(ret){
				window.parent.location.href="file://D:/anhui/login.html";
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
			exitSys();

		});
	});
	
	/************************退出系统-end**************************/ 
		
</script>



</body>
</html>
