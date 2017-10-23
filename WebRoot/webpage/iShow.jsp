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
//	jQuery.i18n.properties(propertiesObj);
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
    <script type="text/javascript" src="webpage/resource/js/jquery.nicescroll.js"></script>
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
 .table-scrollbar{height: 80%;border: none}
 .table > tbody > tr > td {
     height: 30px;
     line-height: 30px;
     border-color: rgba(0,0,0,0);
     color: #53748d;
     text-align: center;
 }
 .order-header, .grid-view-header{border-bottom: none}
 .table-hover>tbody>tr {
     height: 30px;
     line-height: 30px;
 }
 .table tr:last-child td{border-bottom: none}
 .table-hover>tbody>tr:hover {
     background-color: #2c414f;
 }
    .table-header{background-color: #47799d;}
    .table-header th{color: #fff;height: 30px;line-height: 30px !important;text-align: center}
    .alarm-body{border: 1px solid rgb(84, 89, 94);border-top: none}
 .table-normal-a a {  color:rgb(82, 91, 205);  }
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
                            <tbody id="orderInfoTable">
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
                                <colgroup>
                                    <col width="22%">
                                    <col width="10%">
                                    <col width="20%">
                                    <col width="16%">
                                    <col width="16%">
                                    <col width="16%">
                                <thead>
                                <tr>
                                    <th title="经销商名称">经销商名称</th>
                                    <th title="订单总数">订单总数</th>
                                    <th title="订单总里程（公里）">订单总里程（公里）</th>
                                    <th title="运输总时长（小时）">运输总时长（小时）</th>
                                    <th title="平均里程数（公里）">平均里程数（公里）</th>
                                    <th title="操作">操作</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-scrollbar oy-a ">
                            <table class="table table-condensed table-normal-a table-hover table-ellipsis m-b0" id="alarmMessageTableContent1">
                                <colgroup>
                                    <col width="22%">
                                    <col width="10%">
                                    <col width="20%">
                                    <col width="16%">
                                    <col width="16%">
                                    <col width="16%">
                                </colgroup>
                                <tbody id="orderInfoTable1">
                                <script type="text/html" id="orderInfoList1">
                                    {{each data as row i}}
                                    <tr>
                                        <td title="{{row.agencyName}}"><a onclick="">{{row.agencyName}}</a></td>
                                        <td  title="{{row.orderCount}}">{{row.orderCount}}</td>
                                        <td  title="{{row.orderMileage}}">{{row.orderMileage}}</td>
                                        <td  title="{{row.timeoutExcepCount}}">{{row.timeoutExcepCount}}</td>
                                        <td title="{{row.avgMileage}}">
                                            {{row.avgMileage}}
                                        </td>

                                        <td title=caozuo">暂无</td>

                                    </tr>
                                    {{/each}}
                                </script>
                                </tbody>

                            </table>
                        </div>
                    </div>


            </div>




        </div>
    </div>
</div>
<input type="hidden" id="factoryId" value="${userId}">
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
        text: '在线比例',
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
            radius : '95%',
            max:10000
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

function getListData() {
    var userIdd=$('#factoryId').val();
    var dd = new Date();
    var y = dd.getFullYear();
    var m = dd.getMonth()+1;//获取当前月份的日期
    var d = dd.getDate();
    var startTime=y+"-"+m+"-"+d+" 00:00";
    var endTime=y+"-"+m+"-"+d+" 00:53";
    $.ajax({
        url:"rest/reportControl/runReport/getListagency",
        data:{"changshangId":userIdd,"startTime":startTime,"endTime":endTime},
        success:function (ret) {
            if(ret && ret.statusCode==0  && ret.data.list.length>0 ){
                $('#orderInfoTable1').html(template('orderInfoList1',{"data" : ret.data.list}));//装填数据


            }else{//清空列表,ret.code=-1加载列表没有数据返回,updateListFlag非法操作不等于1、2
                return;
            }
        }
    });
}

var sum = '0000000';
var sum2 = '0000000';
var sum3 = '0000000';
$(function() {
    getListData();
    getShowData();
    function pad(num,n) {
        var len = num.toString().length;
        while(len < n) {
            num = "0" + num;
            len++;
        }
        return num;
    };
    function getShowData() {
        $.ajax({
            url:"rest/ishow/show",
            success:function (rsp) {
                var olDevice,offlDevice;
                olDevice=rsp.data.rdto.data.onlineCount;
                offlDevice=rsp.data.rdto.data.offlineCount;
                sum=pad(olDevice+offlDevice,7);
                sum2=pad(rsp.data.resultDto.weight_sum,7);
                sum3=pad(rsp.data.resultDto.order_sum,7);
                show_num1('.t_num1',sum);
                show_num1('.t_num2',sum2);
                show_num1('.t_num3',sum3);
                var orderSum=[];
                var month_sum=[];
                var yunshushuliang_sum=[];
                var onlineWeight=rsp.data.resultDto.online_weight_sum;
                rsp.data.map2.data.forEach(function (resOrderData) {
                    var date=resOrderData.month_sum.toString().slice(4);
                    var dateobj=date.substr(0,2)+'-'+date.slice(2);
                    orderSum.push(resOrderData.order_sum);
                    month_sum.push(dateobj);
                    yunshushuliang_sum.push(resOrderData.yunshushuliang_sum);
                });


                //订单趋势
                orderTrend.setOption({
                    xAxis: [
                        {
                            type: 'category',
                            data: month_sum,
                            axisPointer: {
                                type: 'shadow'
                            }
                        }
                    ],
                    series: [
                        {
                            name:'吨位',
                            type:'bar',
                            data:yunshushuliang_sum
                        },
                        {
                            name:'订单数',
                            type:'line',
                            yAxisIndex: 1,
                            data:orderSum
                        }
                    ]
                })
                //在线设备
                deviceState.setOption({
                    series : [
                        {
                            name: '在线情况',
                            type: 'pie',
                            data:[
                                {value:olDevice, name:'在线设备'},
                                {value:offlDevice, name:'离线设备'}
                            ]
                        }
                    ]
                });
                //在线车辆
                onlineNum.setOption({
                    tooltip : {
                        formatter: "{a} <br/>{b} : {c}%"
                    },
                    series: [
                        {
//            name: '业务指标',
                            type: 'gauge',
                            detail: {formatter:'{value}%'},
                            data: [{value: parseInt(olDevice*100/(olDevice+offlDevice)), name: ''}],
                            center: ['50%', '50%'],
                            radius : '95%'
                        }
                    ]
                });
                //在线总吨位
                orderNum.setOption({
                    title : {
                        text: '在途运输吨位',
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
                            detail: {formatter:'{value}吨'},
                            data: [{value: onlineWeight, name: ''}],
                            center: ['50%', '50%'],
                            radius : '95%'
                        }
                    ]
                });


            }
        });
        getOrderInfoList();
    };
    getShowData();
    var timerX='';
        timerx=setInterval(getShowData(),10000);


});
$('.table-scrollbar').niceScroll({
    cursorcolor: "#ccc",//#CC0071 光标颜色
    cursoropacitymax: 1, //改变不透明度非常光标处于活动状态（scrollabar“可见”状态），范围从1到0
    touchbehavior: false, //使光标拖动滚动像在台式电脑触摸设备
    cursorwidth: "5px", //像素光标的宽度
    cursorborder: "0", // 游标边框css定义
    cursorborderradius: "5px",//以像素为光标边界半径
    autohidemode: false //是否隐藏滚动条
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
    //getAlarmInfoList(true,1);
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
    //getAlarmInfoList(true,1);
    }
    });
    });

    $("#alarm_startTime").val(alarm_startTime_history);
    $("#alarm_endTime").val(alarm_endTime_history);

    var alarmSoundFlag = getCookie("alarmSoundFlag");
    if(alarmSoundFlag && alarmSoundFlag == 0){
    <%--$("#alarmSound").iCheck('uncheck');--%>
    }else{
    <%--$("#alarmSound").iCheck("check");--%>
    }
    //alarmFilter();

    //getAlarmInfoList(true,1);

    // setInterval(function(){
    // getAlarmInfoList(false,2);
    // },5000);
    //
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

    var header='index';
    $("#"+header).addClass("active");

  <%--  $('.js-select').easyDropDown(); //easydropdown--%>


    function setLanguage(locale){
    $.post("/setLanguage?locale="+locale,function(Ret){
    window.location.reload();
    });
    }

    //退出登录


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


    //异步请求，最后一次请求参数，保证响应回来的数据是正确
    requestThread++;

    $.ajax({
    url:"rest/customControl/alertInfo",
    data: {"searchUserId":searchUserId,"startTime":$("#alarm_startTime").val(),"endTime":$("#alarm_endTime").val()},
    async: true,
    cache: false,
    type:"post",
    dataType: 'json',
    beforeSend:function(XHR){
    /* if(flag){
    $("#alarm_nodata").hide();
    $('#alarmInfoTable').hide();
    $("#alarm_logindata").show();
    } */
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

    /**订单管理***/
    function getOrderInfoList(flag,updateListFlag){


    //从客户树选择时，根据选择的客户刷新告警信息列表
    <%--var treeObject = $.fn.zTree.getZTreeObj("treeDemo");--%>

<%------------------------------------------------------------------------------------------------------------------------%>
    var userIdd=$('#factoryId').val();
    $.ajax({
    url:"rest/Gps/getOrderInfoByUserId",
    data: {"userId":userIdd},
    async: true,
    cache: false,
    timeout : 10000,
    type:"post",
    dataType: 'json',
    beforeSend:function(XHR){
    /* if(flag){
    $("#alarm_nodata").hide();
    $('#alarmInfoTable').hide();
    $("#alarm_logindata").show();
    } */
    },
    complete: function(){
    $("#alarmMessage").hide();
    if($("#orderMessage").is(":visible")){
    tableHeaderAutoWidth("#orderMessageTableHeader","#orderMessageTableContent");
    }
    },
    success: function(ret){
    if(ret && ret.statusCode==0  && ret.data.length>0 ){
    //有数据返回并且是同一请求
    $('#orderInfoTable').html(template('orderInfoList',{"data" : ret.data}));//装填数据

    $("#orderMessage").show();
    }else{//清空列表,ret.code=-1加载列表没有数据返回,updateListFlag非法操作不等于1、2
    $("#orderMessage").show();
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
    <%--$("input[name='alarm_item'][value='"+value+"']").iCheck('check')--%>
    });
    }else{//默认选择
    <%--$("#alarmAllSelect").iCheck('check');--%>
    <%--$("input[name='alarm_item']").iCheck('check');--%>
    <%--$("input[name='alarm_item'][value='ACC_ON']").iCheck('uncheck');--%>
    <%--$("input[name='alarm_item'][value='ACC_OFF']").iCheck('uncheck');--%>
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
    <%--$("#alarmAllSelect").iCheck("uncheck");--%>
    <%--$("input[name='alarm_item']").iCheck("uncheck");--%>
    $.each(alarmFilterHistory,function(i,v){
    <%--$("input[name='alarm_item'][value='"+v+"']").iCheck("check");--%>
    });
    if(alarmFilterHistory.length == $("input[name='alarm_item']").length){
    <%--$("#alarmAllSelect").iCheck("check");--%>
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

</body>
</html>
