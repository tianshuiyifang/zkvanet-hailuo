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

<script src="webpage/resource/plugins/echarts/echarts.js"></script>
<script src="webpage/resource/plugins/echarts/chalk.js"></script>
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
<%--<script src="webpage/resource/js/ishow.js"></script>--%>
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
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">

    <!--引入JavaScript-->
    <script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<style type="text/css">
 .container {
   height:100%;
   width:100%
 }
 .panel-default>.panel-heading {
    background-color:#02b2c1
 }
 .intro>img {
    width: 100%;
    height: 100%;
}
    .chart_row{height: 45%}
    .chart_row>div{height: 400px}


 .all{
     width: 100%;
     margin: 0 auto;
     height: 25%;
     text-align: center;
 }
 .all .t_num i { width: 33px;height: 47px;display: inline-block; background: url('webpage/resource/images/number1.png') no-repeat; background-position: 0 0;  }
 .all .t_dw1 i { width: 33px;height: 47px;display: inline-block; background: url('webpage/resource/images/danwei.png') no-repeat; background-position: 0 0;  }
 .all .t_dw2 i { width: 33px;height: 47px;display: inline-block; background: url('webpage/resource/images/danwei.png') no-repeat; background-position: 0 -58px;  }
 .all .t_dw3 i { width: 33px;height: 47px;display: inline-block; background: url('webpage/resource/images/danwei.png') no-repeat; background-position: 0 -116px;  }
 .body{padding-top: 0;background-color: rgb(14, 42, 67)}
 .chart_row h3{color: #fff;font-size: 16px;padding: 5px 0;}
 .showNum{overflow: hidden}
 .showNum h3{color:#fff;font-size: 18px;text-align: center;padding: 8px;}
 .order-header{font-size: 16px;background: none;box-shadow: none}
 .order-header h5{font-size: 16px;color: #fff}
 .wrapper{height: 100%}
 .alarm-body{height: 80%}
 .table-scrollbar{height: 100%}
</style>
</head>
<body class="body bc-gray ">
<div class="wrapper">


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
$(function(){
    $('.chart_row').height(($(window).height()-110)/2)
})

</script>

	<!--main 页的开始-->
	<%--<div class="container" >
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
	</div>--%>
    <div class="container">
        <h2 style="color:#00ffff;height: 110px;line-height: 110px;text-align: center">海螺水泥货物流向监管服务平台<a style="float: right;font-size: 14px"  id="index" href="meunController.do?index"><i class="fa fa-map-o" aria-hidden="true"></i>&nbsp;进入控制台</a></h2>

        <div class="row chart_row" >
            <div class="col-xs-3 showNum">
                    <h3>在网车辆总计</h3>
                    <div class="all" >
                        <span class="t_num t_num1"></span>
                        <span class="t_dw1"><i></i></span>
                    </div>
                    <h3>总计运输吨位</h3>
                    <div class="all"  >
                        <span class="t_num t_num2"></span>
                        <span class="t_dw2"><i></i></span>
                    </div>
                     <h3>订单总数</h3>
                    <div class="all" >
                        <span class="t_num t_num3"></span>
                        <span class="t_dw3"><i></i></span>
                    </div>

            </div>
            <div class="col-xs-4">
                <div id="orderTrend" style="width: 100%;height: 100%">

                </div>
            </div>
            <div class="col-xs-5">
                <div class="order-header clearfix">
                    <h5 class="m-0" style="text-align: center"><span class="fs-18 c-df7312"></span>&nbsp;订单信息</h5>
                </div>
                <div class="alarm-body">
                    <div class="table-header">
                        <table class="table table-condensed table-hover table-ellipsis m-b0" id="alarmMessageTableHeader">
                            <thead>
                            <tr>
                                <th title="运输车号">运输车号</th>
                                <th title="发货单号">发货单号</th>
                                <th title="客户名称">客户名称</th>
                                <th title="包装方式">包装方式</th>
                                <th title="订单状态">订单状态</th>
                                <th title="操作">操作</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="table-scrollbar oy-a ">
                        <table class="table table-condensed table-normal-a table-hover table-ellipsis m-b0" id="alarmMessageTableContent">
                            <colgroup>
                                <col width="16%">
                                <col width="16%">
                                <col width="20%">
                                <col width="16%">
                                <col width="16%">
                                <col width="16%">
                            </colgroup>
                        <%--    <tbody id="orderInfoTable">
                            <script type="text/html" id="orderInfoList">
                                {{each data as row i}}
                                <tr>
                                    <td title="{{row.yunshuchehao}}"><a onclick="showOrderInfoForIndex('{{row.deviceSid}}')">{{row.yunshuchehao}}</a></td>
                                    <td  title="{{row.fahuodanhao}}">{{row.fahuodanhao}}</td>
                                    <td  title="{{row.kehumingcheng}}">{{row.kehumingcheng}}</td>
                                    <td  title="{{row.baozhuangfangshi}}">{{row.baozhuangfangshi}}</td>
                                    <td title="{{row.isWaring}}">
                                        {{if row.isWaring==0}}
                                        订单正常
                                        {{else if row.isWaring==1}}
                                        <span style="color:red">订单异常</span>
                                        {{else if row.isWaring==null}}
                                        <span style="color:red">无订单</span>
                                        {{/if}}
                                    </td>

                                    <td title=caozuo">暂无</td>

                                </tr>
                                {{/each}}
                            </script>
                            </tbody>--%>
                            <tbody id="orderInfoTable">
                            <tr>
                                <td title="皖1012070"><a onclick="showOrderInfoForIndex('23017655')">皖1012070</a></td>
                                <td title="2430583">2430583</td>
                                <td title="上海亚陈建材有限公司">上海亚陈建材有限公司</td>
                                <td title="袋装">袋装</td>
                                <td title="0">

                                    订单正常

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖Q07772"><a onclick="showOrderInfoForIndex('23017661')">皖Q07772</a></td>
                                <td title="2430865">2430865</td>
                                <td title="马钢集团康诚建筑安装有限责任公司">马钢集团康诚建筑安装有限责任公司</td>
                                <td title="散装">散装</td>
                                <td title="0">

                                    订单正常

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖E07570"><a onclick="showOrderInfoForIndex('23017662')">皖E07570</a></td>
                                <td title="2430435">2430435</td>
                                <td title="马鞍山市铁远贸易有限公司">马鞍山市铁远贸易有限公司</td>
                                <td title="散装">散装</td>
                                <td title="0">

                                    订单正常

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖E01752"><a onclick="showOrderInfoForIndex('23024516')">皖E01752</a></td>
                                <td title="2430919">2430919</td>
                                <td title="南京益夫新材料科技有限公司江宁分公司">南京益夫新材料科技有限公司江宁分公司</td>
                                <td title="散装">散装</td>
                                <td title="0">

                                    订单正常

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖E18230"><a onclick="showOrderInfoForIndex('23024624')">皖E18230</a></td>
                                <td title="2430914">2430914</td>
                                <td title="马钢集团康诚建筑安装有限责任公司">马钢集团康诚建筑安装有限责任公司</td>
                                <td title="散装">散装</td>
                                <td title="0">

                                    订单正常

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖0201138"><a onclick="showOrderInfoForIndex('23017656')">皖0201138</a></td>
                                <td title="2266710">2266710</td>
                                <td title="王存兵">王存兵</td>
                                <td title="光塑袋装">光塑袋装</td>
                                <td title="1">

                                    <span style="color:red">订单异常</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖E37465"><a onclick="showOrderInfoForIndex('23017657')">皖E37465</a></td>
                                <td title="2266607">2266607</td>
                                <td title="芜湖润卓贸易有限责任公司">芜湖润卓贸易有限责任公司</td>
                                <td title="汽车散装">汽车散装</td>
                                <td title="1">

                                    <span style="color:red">订单异常</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖B25582"><a onclick="showOrderInfoForIndex('23017667')">皖B25582</a></td>
                                <td title="2266682">2266682</td>
                                <td title="芜湖润卓贸易有限责任公司">芜湖润卓贸易有限责任公司</td>
                                <td title="汽车散装">汽车散装</td>
                                <td title="1">

                                    <span style="color:red">订单异常</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖M74276"><a onclick="showOrderInfoForIndex('23017654')">皖M74276</a></td>
                                <td title="1833711">1833711</td>
                                <td title="安徽岩宇商贸有限公司">安徽岩宇商贸有限公司</td>
                                <td title="袋装">袋装</td>
                                <td title="0">

                                    订单正常

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖M96435"><a onclick="showOrderInfoForIndex('23017658')">皖M96435</a></td>
                                <td title="1834219">1834219</td>
                                <td title="明光市君腾商贸有限公司">明光市君腾商贸有限公司</td>
                                <td title="袋装">袋装</td>
                                <td title="1">

                                    <span style="color:red">订单异常</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖M49748"><a onclick="showOrderInfoForIndex('23017663')">皖M49748</a></td>
                                <td title="1833573">1833573</td>
                                <td title="天长市百生建材商贸有限公司">天长市百生建材商贸有限公司</td>
                                <td title="散装">散装</td>
                                <td title="1">

                                    <span style="color:red">订单异常</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖M94408"><a onclick="showOrderInfoForIndex('23017664')">皖M94408</a></td>
                                <td title="1834161">1834161</td>
                                <td title="安徽璐棠商贸有限公司">安徽璐棠商贸有限公司</td>
                                <td title="散装">散装</td>
                                <td title="1">

                                    <span style="color:red">订单异常</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖AB5658"><a onclick="showOrderInfoForIndex('23017665')">皖AB5658</a></td>
                                <td title="1824425">1824425</td>
                                <td title="安徽江驰建筑材料有限公司">安徽江驰建筑材料有限公司</td>
                                <td title="散装">散装</td>
                                <td title="1">

                                    <span style="color:red">订单异常</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖1238614"><a onclick="showOrderInfoForIndex('')">皖1238614</a></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title="">

                                    <span style="color:red">无订单</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖1253113"><a onclick="showOrderInfoForIndex('')">皖1253113</a></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title="">

                                    <span style="color:red">无订单</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖0472397"><a onclick="showOrderInfoForIndex('23024909')">皖0472397</a></td>
                                <td title="1833834">1833834</td>
                                <td title="安徽泓瑾建材有限公司">安徽泓瑾建材有限公司</td>
                                <td title="袋装">袋装</td>
                                <td title="0">

                                    订单正常

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖1265527"><a onclick="showOrderInfoForIndex('')">皖1265527</a></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title="">

                                    <span style="color:red">无订单</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖1633996"><a onclick="showOrderInfoForIndex('')">皖1633996</a></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title="">

                                    <span style="color:red">无订单</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="桂1027108"><a onclick="showOrderInfoForIndex('')">桂1027108</a></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title="">

                                    <span style="color:red">无订单</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖1253178"><a onclick="showOrderInfoForIndex('')">皖1253178</a></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title="">

                                    <span style="color:red">无订单</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖0156736"><a onclick="showOrderInfoForIndex('')">皖0156736</a></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title="">

                                    <span style="color:red">无订单</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖1213423"><a onclick="showOrderInfoForIndex('')">皖1213423</a></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title="">

                                    <span style="color:red">无订单</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖1252817"><a onclick="showOrderInfoForIndex('')">皖1252817</a></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title="">

                                    <span style="color:red">无订单</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖1253340"><a onclick="showOrderInfoForIndex('')">皖1253340</a></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title=""></td>
                                <td title="">

                                    <span style="color:red">无订单</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖P39049"><a onclick="showOrderInfoForIndex('23017651')">皖P39049</a></td>
                                <td title="2506679">2506679</td>
                                <td title="杭州宏图建材有限公司">杭州宏图建材有限公司</td>
                                <td title="散装">散装</td>
                                <td title="1">

                                    <span style="color:red">订单异常</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖P3D203"><a onclick="showOrderInfoForIndex('23017653')">皖P3D203</a></td>
                                <td title="2507640">2507640</td>
                                <td title="杭州励晖贸易有限公司">杭州励晖贸易有限公司</td>
                                <td title="散装">散装</td>
                                <td title="1">

                                    <span style="color:red">订单异常</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖P3C747"><a onclick="showOrderInfoForIndex('23017659')">皖P3C747</a></td>
                                <td title="2499477">2499477</td>
                                <td title="宁国市文卓商贸有限公司">宁国市文卓商贸有限公司</td>
                                <td title="散装">散装</td>
                                <td title="1">

                                    <span style="color:red">订单异常</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="鄂AZZ315"><a onclick="showOrderInfoForIndex('23017660')">鄂AZZ315</a></td>
                                <td title="2505742">2505742</td>
                                <td title="安徽省交通物资有限责任公司">安徽省交通物资有限责任公司</td>
                                <td title="散装">散装</td>
                                <td title="1">

                                    <span style="color:red">订单异常</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖PA5270"><a onclick="showOrderInfoForIndex('23024517')">皖PA5270</a></td>
                                <td title="2486159">2486159</td>
                                <td title="南京坤泰混凝土有限公司">南京坤泰混凝土有限公司</td>
                                <td title="散装">散装</td>
                                <td title="1">

                                    <span style="color:red">订单异常</span>

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>

                            <tr>
                                <td title="皖B52439"><a onclick="showOrderInfoForIndex('23017650')">皖B52439</a></td>
                                <td title="2266578">2266578</td>
                                <td title="芜湖隆瑞建材销售有限公司">芜湖隆瑞建材销售有限公司</td>
                                <td title="汽车散装">汽车散装</td>
                                <td title="0">

                                    订单正常

                                </td>

                                <td title="caozuo&quot;">暂无</td>

                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
        <div class="row chart_row" >
            <div class="col-xs-7" >
                <div class="row" style="height: 100%">
                    <div class="col-xs-4" style="height: 100%">
                        <div id="deviceState" style="width: 100%;height: 100%">

                        </div>
                    </div>
                    <div class="col-xs-4" style="height: 100%">
                        <div id="onlineNum" style="width: 100%;height: 100%">

                        </div>
                    </div>
                    <div class="col-xs-4" style="height: 100%">
                        <div id="orderNum" style="width: 100%;height: 100%">

                        </div>
                    </div>
                </div>

            </div>

            <div class="col-xs-5">

                    <div class="order-header clearfix">
                        <h5 class="m-0" style="text-align: center"><span class="fs-18 c-df7312"></span>&nbsp;各经销商的订单数量和里程</h5>
                    </div>
                    <div class="alarm-body">
                        <div class="table-header">
                            <table class="table table-condensed table-hover table-ellipsis m-b0" id="alarmMessageTableHeader">
                                <thead>
                                <tr>
                                    <th title="运输车号">运输车号</th>
                                    <th title="发货单号">发货单号</th>
                                    <th title="客户名称">客户名称</th>
                                    <th title="包装方式">包装方式</th>
                                    <th title="订单状态">订单状态</th>
                                    <th title="操作">操作</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-scrollbar oy-a ">
                            <table class="table table-condensed table-normal-a table-hover table-ellipsis m-b0" id="alarmMessageTableContent">
                                <colgroup>
                                    <col width="16%">
                                    <col width="16%">
                                    <col width="20%">
                                    <col width="16%">
                                    <col width="16%">
                                    <col width="16%">
                                </colgroup>
                                <tbody id="orderInfoTable">
                                <tr>
                                    <td title="皖1012070"><a onclick="showOrderInfoForIndex('23017655')">皖1012070</a></td>
                                    <td title="2430583">2430583</td>
                                    <td title="上海亚陈建材有限公司">上海亚陈建材有限公司</td>
                                    <td title="袋装">袋装</td>
                                    <td title="0">

                                        订单正常

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖Q07772"><a onclick="showOrderInfoForIndex('23017661')">皖Q07772</a></td>
                                    <td title="2430865">2430865</td>
                                    <td title="马钢集团康诚建筑安装有限责任公司">马钢集团康诚建筑安装有限责任公司</td>
                                    <td title="散装">散装</td>
                                    <td title="0">

                                        订单正常

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖E07570"><a onclick="showOrderInfoForIndex('23017662')">皖E07570</a></td>
                                    <td title="2430435">2430435</td>
                                    <td title="马鞍山市铁远贸易有限公司">马鞍山市铁远贸易有限公司</td>
                                    <td title="散装">散装</td>
                                    <td title="0">

                                        订单正常

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖E01752"><a onclick="showOrderInfoForIndex('23024516')">皖E01752</a></td>
                                    <td title="2430919">2430919</td>
                                    <td title="南京益夫新材料科技有限公司江宁分公司">南京益夫新材料科技有限公司江宁分公司</td>
                                    <td title="散装">散装</td>
                                    <td title="0">

                                        订单正常

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖E18230"><a onclick="showOrderInfoForIndex('23024624')">皖E18230</a></td>
                                    <td title="2430914">2430914</td>
                                    <td title="马钢集团康诚建筑安装有限责任公司">马钢集团康诚建筑安装有限责任公司</td>
                                    <td title="散装">散装</td>
                                    <td title="0">

                                        订单正常

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖0201138"><a onclick="showOrderInfoForIndex('23017656')">皖0201138</a></td>
                                    <td title="2266710">2266710</td>
                                    <td title="王存兵">王存兵</td>
                                    <td title="光塑袋装">光塑袋装</td>
                                    <td title="1">

                                        <span style="color:red">订单异常</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖E37465"><a onclick="showOrderInfoForIndex('23017657')">皖E37465</a></td>
                                    <td title="2266607">2266607</td>
                                    <td title="芜湖润卓贸易有限责任公司">芜湖润卓贸易有限责任公司</td>
                                    <td title="汽车散装">汽车散装</td>
                                    <td title="1">

                                        <span style="color:red">订单异常</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖B25582"><a onclick="showOrderInfoForIndex('23017667')">皖B25582</a></td>
                                    <td title="2266682">2266682</td>
                                    <td title="芜湖润卓贸易有限责任公司">芜湖润卓贸易有限责任公司</td>
                                    <td title="汽车散装">汽车散装</td>
                                    <td title="1">

                                        <span style="color:red">订单异常</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖M74276"><a onclick="showOrderInfoForIndex('23017654')">皖M74276</a></td>
                                    <td title="1833711">1833711</td>
                                    <td title="安徽岩宇商贸有限公司">安徽岩宇商贸有限公司</td>
                                    <td title="袋装">袋装</td>
                                    <td title="0">

                                        订单正常

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖M96435"><a onclick="showOrderInfoForIndex('23017658')">皖M96435</a></td>
                                    <td title="1834219">1834219</td>
                                    <td title="明光市君腾商贸有限公司">明光市君腾商贸有限公司</td>
                                    <td title="袋装">袋装</td>
                                    <td title="1">

                                        <span style="color:red">订单异常</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖M49748"><a onclick="showOrderInfoForIndex('23017663')">皖M49748</a></td>
                                    <td title="1833573">1833573</td>
                                    <td title="天长市百生建材商贸有限公司">天长市百生建材商贸有限公司</td>
                                    <td title="散装">散装</td>
                                    <td title="1">

                                        <span style="color:red">订单异常</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖M94408"><a onclick="showOrderInfoForIndex('23017664')">皖M94408</a></td>
                                    <td title="1834161">1834161</td>
                                    <td title="安徽璐棠商贸有限公司">安徽璐棠商贸有限公司</td>
                                    <td title="散装">散装</td>
                                    <td title="1">

                                        <span style="color:red">订单异常</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖AB5658"><a onclick="showOrderInfoForIndex('23017665')">皖AB5658</a></td>
                                    <td title="1824425">1824425</td>
                                    <td title="安徽江驰建筑材料有限公司">安徽江驰建筑材料有限公司</td>
                                    <td title="散装">散装</td>
                                    <td title="1">

                                        <span style="color:red">订单异常</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖1238614"><a onclick="showOrderInfoForIndex('')">皖1238614</a></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title="">

                                        <span style="color:red">无订单</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖1253113"><a onclick="showOrderInfoForIndex('')">皖1253113</a></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title="">

                                        <span style="color:red">无订单</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖0472397"><a onclick="showOrderInfoForIndex('23024909')">皖0472397</a></td>
                                    <td title="1833834">1833834</td>
                                    <td title="安徽泓瑾建材有限公司">安徽泓瑾建材有限公司</td>
                                    <td title="袋装">袋装</td>
                                    <td title="0">

                                        订单正常

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖1265527"><a onclick="showOrderInfoForIndex('')">皖1265527</a></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title="">

                                        <span style="color:red">无订单</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖1633996"><a onclick="showOrderInfoForIndex('')">皖1633996</a></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title="">

                                        <span style="color:red">无订单</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="桂1027108"><a onclick="showOrderInfoForIndex('')">桂1027108</a></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title="">

                                        <span style="color:red">无订单</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖1253178"><a onclick="showOrderInfoForIndex('')">皖1253178</a></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title="">

                                        <span style="color:red">无订单</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖0156736"><a onclick="showOrderInfoForIndex('')">皖0156736</a></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title="">

                                        <span style="color:red">无订单</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖1213423"><a onclick="showOrderInfoForIndex('')">皖1213423</a></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title="">

                                        <span style="color:red">无订单</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖1252817"><a onclick="showOrderInfoForIndex('')">皖1252817</a></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title="">

                                        <span style="color:red">无订单</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖1253340"><a onclick="showOrderInfoForIndex('')">皖1253340</a></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td title="">

                                        <span style="color:red">无订单</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖P39049"><a onclick="showOrderInfoForIndex('23017651')">皖P39049</a></td>
                                    <td title="2506679">2506679</td>
                                    <td title="杭州宏图建材有限公司">杭州宏图建材有限公司</td>
                                    <td title="散装">散装</td>
                                    <td title="1">

                                        <span style="color:red">订单异常</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖P3D203"><a onclick="showOrderInfoForIndex('23017653')">皖P3D203</a></td>
                                    <td title="2507640">2507640</td>
                                    <td title="杭州励晖贸易有限公司">杭州励晖贸易有限公司</td>
                                    <td title="散装">散装</td>
                                    <td title="1">

                                        <span style="color:red">订单异常</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖P3C747"><a onclick="showOrderInfoForIndex('23017659')">皖P3C747</a></td>
                                    <td title="2499477">2499477</td>
                                    <td title="宁国市文卓商贸有限公司">宁国市文卓商贸有限公司</td>
                                    <td title="散装">散装</td>
                                    <td title="1">

                                        <span style="color:red">订单异常</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="鄂AZZ315"><a onclick="showOrderInfoForIndex('23017660')">鄂AZZ315</a></td>
                                    <td title="2505742">2505742</td>
                                    <td title="安徽省交通物资有限责任公司">安徽省交通物资有限责任公司</td>
                                    <td title="散装">散装</td>
                                    <td title="1">

                                        <span style="color:red">订单异常</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖PA5270"><a onclick="showOrderInfoForIndex('23024517')">皖PA5270</a></td>
                                    <td title="2486159">2486159</td>
                                    <td title="南京坤泰混凝土有限公司">南京坤泰混凝土有限公司</td>
                                    <td title="散装">散装</td>
                                    <td title="1">

                                        <span style="color:red">订单异常</span>

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>

                                <tr>
                                    <td title="皖B52439"><a onclick="showOrderInfoForIndex('23017650')">皖B52439</a></td>
                                    <td title="2266578">2266578</td>
                                    <td title="芜湖隆瑞建材销售有限公司">芜湖隆瑞建材销售有限公司</td>
                                    <td title="汽车散装">汽车散装</td>
                                    <td title="0">

                                        订单正常

                                    </td>

                                    <td title="caozuo&quot;">暂无</td>

                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>


            </div>




        </div>
    </div>
</div>
<script>
/*订单趋势*/
var orderTrendOpt={
    title : {
        text: '订单趋势',
        textStyle:{
            fontSize:16,
            fontWeight:'normal',
            align:'center'
        },
        x:'center'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            crossStyle: {
                color: '#999'
            }
        }
    },
    /*toolbox: {
        feature: {
            dataView: {show: true, readOnly: false},
            magicType: {show: true, type: ['line', 'bar']},
            restore: {show: true},
            saveAsImage: {show: true}
        }
    },*/
    legend: {
        data:['蒸发量','降水量'],
        left:0,
        itemWidth:20
    },
    xAxis: [
        {
            type: 'category',
            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
            axisPointer: {
                type: 'shadow'
            }
        }
    ],
    yAxis: [
        {
            type: 'value',
            name: '吨位/t',
           /* min: 0,
            max: 250,
            interval: 50,*/
            axisLabel: {
                formatter: '{value} '
            }
        },
        {
            type: 'value',
            name: '订单数/单',
      /*      min: 0,
            max: 25,
            interval: 5,*/
            axisLabel: {
                formatter: '{value} '
            }
        }
    ],
    series: [
        {
            name:'吨位',
            type:'bar',
            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
        },
        {
            name:'订单数',
            type:'line',
            yAxisIndex: 1,
            data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
        }
    ]
};
var orderTrend=echarts.init(document.getElementById('orderTrend'),'chalk');
    orderTrend.setOption(orderTrendOpt);
/*设备状态*/
var deviceStateOpt= {
    title : {
        text: '设备在线情况',
        textStyle:{
            fontSize:16,
            fontWeight:'normal',
            align:'center'
        },
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },


    series : [
        {
            name: '在线情况',
            type: 'pie',
            radius : '88%',
            center: ['50%', '50%'],
            data:[
                {value:335, name:'在线设备'},
                {value:310, name:'离线设备'}
            ],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            },
            label:{
                normal:{
                    show:true,
                    position:'inside'
                }
            }
        }
    ]
};
var deviceState=echarts.init(document.getElementById('deviceState'),'chalk');
    deviceState.setOption(deviceStateOpt);
/*在线数量*/
var onlineNumOpt= {
    title : {
        text: '在线车辆',
        textStyle:{
            fontSize:16,
            fontWeight:'normal',
            align:'center'
        },
        x:'center'
    },
    tooltip : {
        formatter: "{a} <br/>{b} : {c}%"
    },
    series: [
        {
//            name: '业务指标',
            type: 'gauge',
            detail: {formatter:'{value}%'},
            data: [{value: 50, name: ''}],
            center: ['50%', '50%'],
            radius : '95%'
        }
    ]
};
var onlineNum=echarts.init(document.getElementById('onlineNum'),'chalk');
    onlineNum.setOption(onlineNumOpt);
/*订单总数*/
var orderNumOpt= {
    title : {
        text: '订单总数',
        textStyle:{
            fontSize:16,
            fontWeight:'normal'
        },
        x:'center'
    },
    tooltip : {
        formatter: "{a} <br/>{b} : {c}%"
    },
    series: [
        {
//            name: '业务指标',
            type: 'gauge',
            detail: {formatter:'{value}%'},
            data: [{value: 50, name: ''}],
            center: ['50%', '50%'],
            radius : '95%'
        }
    ]
};
var orderNum=echarts.init(document.getElementById('orderNum'),'chalk');
    orderNum.setOption(orderNumOpt);
(function($) {
    if(!document.defaultView || !document.defaultView.getComputedStyle){
        var oldCurCSS = jQuery.curCSS;
        jQuery.curCSS = function(elem, name, force){
            if(name === 'background-position'){
                name = 'backgroundPosition';
            }
            if(name !== 'backgroundPosition' || !elem.currentStyle || elem.currentStyle[ name ]){
                return oldCurCSS.apply(this, arguments);
            }
            var style = elem.style;
            if ( !force && style && style[ name ] ){
                return style[ name ];
            }
            return oldCurCSS(elem, 'backgroundPositionX', force) +' '+ oldCurCSS(elem, 'backgroundPositionY', force);
        };
    }

    var oldAnim = $.fn.animate;
    $.fn.animate = function(prop){
        if('background-position' in prop){
            prop.backgroundPosition = prop['background-position'];
            delete prop['background-position'];
        }
        if('backgroundPosition' in prop){
            prop.backgroundPosition = '('+ prop.backgroundPosition + ')';
        }
        return oldAnim.apply(this, arguments);
    };

    function toArray(strg){
        strg = strg.replace(/left|top/g,'0px');
        strg = strg.replace(/right|bottom/g,'100%');
        strg = strg.replace(/([0-9\.]+)(\s|\)|$)/g,"$1px$2");
        var res = strg.match(/(-?[0-9\.]+)(px|\%|em|pt)\s(-?[0-9\.]+)(px|\%|em|pt)/);
        return [parseFloat(res[1],10),res[2],parseFloat(res[3],10),res[4]];
    }

    $.fx.step.backgroundPosition = function(fx) {
        if (!fx.bgPosReady) {
            var start = $.css(fx.elem,'backgroundPosition');

            if(!start){//FF2 no inline-style fallback
                start = '0px 0px';
            }

            start = toArray(start);

            fx.start = [start[0],start[2]];

            var end = toArray(fx.end);
            fx.end = [end[0],end[2]];

            fx.unit = [end[1],end[3]];
            fx.bgPosReady = true;
        }

        var nowPosX = [];
        nowPosX[0] = ((fx.end[0] - fx.start[0]) * fx.pos) + fx.start[0] + fx.unit[0];
        nowPosX[1] = ((fx.end[1] - fx.start[1]) * fx.pos) + fx.start[1] + fx.unit[1];
        fx.elem.style.backgroundPosition = nowPosX[0]+' '+nowPosX[1];
    };
})(jQuery);

var sum = 1300000;
var sum2 = 1200000;
var sum3 = 1100000;
$(function() {
        show_num1('.t_num1',sum);
        show_num1('.t_num2',sum2);
        show_num1('.t_num3',sum3);

});

function show_num1(ele,n) {
    var it = $(ele).find('i');
    var len = String(n).length;
    for(var i = 0; i < len; i++) {
        if(it.length <= i) {
            $(ele).append("<i></i>");
        }
        var num = String(n).charAt(i);
        //根据数字图片的高度设置相应的值
        var y = -parseInt(num) * 58;
        var obj = $(ele).find('i').eq(i);
        obj.animate({
            backgroundPosition: '(0 ' + String(y) + 'px)'
        }, 'slow', 'swing', function() {});
    }
    $("#cur_num").val(n);
}
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
/**剩余刷新时间*/


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
