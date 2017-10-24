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
<link rel="icon" href="../../webpage/resource/images/favicon.ico" type="image/x-icon"/> 
<link rel="tracker icon" href="../../webpage/resource/images/favicon.ico" type="image/x-icon"/> 
<link rel="stylesheet" href="../../webpage/resource/css/normalize.css">
<link rel="stylesheet" href="../../webpage/resource/css/base.css">
<link rel="stylesheet" href="../../webpage/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="../../webpage/resource/css/non-responsive.css">
<link rel="stylesheet" href="../../webpage/resource/css/font-awesome.min.css">
<link rel="stylesheet" href="../../webpage/resource/css/iconfont.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/autocompleter/jquery.autocompleter.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/mCustomScrollbar/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/simplPagination/simplePagination.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/easydropdown/easydropdown.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/zTree/css/zTreeStyle.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/nstSlider/jquery.nstSlider.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/datetimepicker/jquery.datetimepicker.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/timePicker/jquery.timePicker.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/icheck/icheck.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/ciTy/css/city.css">
<link rel="stylesheet" href="../../webpage/resource/css/site.css">


<!--CSS3 Media Queries (for IE 6-8)-->
<!--[if lte IE 8]><script src="../../webpage/resource/js/respond.min.js"></script><![endif]-->

<!-- Compatible with HTML5 tags -->
<script src="../../webpage/resource/js/modernizr-2.8.3.js"></script>
<script src="../../webpage/resource/js/jquery-1.8.3.min.js"></script>
<script src="../../webpage/resource/plugins/highchart/highcharts.js"></script>
<script src="../../webpage/resource/plugins/highchart/exporting.js"></script>
<script src="../../webpage/resource/plugins/highchart/highcharts-zh_CN.js"></script>

<script src="../../webpage/resource/js/jquery.cookie.js"></script> 
<!-- 国际化 -->
<script src="../../webpage/resource/plugins/i18n/jquery.i18n.properties.js"></script>
<!-- 主题切换
<script src="../../webpage/resource/js/themes.js"></script> -->
<script type="text/javascript">

function setJsLanguage(locale){
	var propertiesObj=null;
	if(locale){
		propertiesObj = {
		    name:"messages", 
			path:_ctx+"../../webpage/resource/plugins/i18n/",
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
<script type="text/javascript" src="../../webpage/resource/js/map.js"></script>
<!-- 模板渲染 --> 
<script src="../../webpage/resource/plugins/artTemplate/template.js"></script> 
<script src="../../webpage/resource/plugins/artTemplate/template-plugin.js"></script>
<!-- page --> 
<script src="../../webpage/resource/plugins/simplPagination/jquery.simplePagination.js"></script>
<script src="../../webpage/resource/plugins/layer/layer.js"></script>
<!-- message --> 
<!-- easydropdown --> 
<script src="../../webpage/resource/plugins/easydropdown/jquery.easydropdown.min.js"></script> 
<!-- modal --> 
<script src="../../webpage/resource/js/modal.js"></script>
<script src="../../webpage/resource/plugins/autocompleter/jquery.autocompleter.js"></script>
<script src="../../webpage/resource/js/tooltip.js"></script>
<script src="../../webpage/resource/js/popover.js"></script>
<script src="../../webpage/resource/plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

<!-- datetimepicker --> 
<script src="../../webpage/resource/plugins/datetimepicker/jquery.datetimepicker.js"></script>

<!-- laydate -->
<script type="text/javascript" src="../../webpage/resource/plugins/laydate/laydate.js"></script>

<!-- tab --> 
<script src="../../webpage/resource/js/tab.js"></script>
<!-- icheck -->
<script src="../../webpage/resource/plugins/icheck/icheck.min.js"></script>

<!-- ztree --> 
<script src="../../webpage/resource/plugins/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script src="../../webpage/resource/plugins/zTree/js/jquery.ztree.exhide-3.5.js"></script>
<!-- validate -->
<script src="../../webpage/resource/plugins/validate/jquery.validate.js"></script>
<script src="../../webpage/resource/plugins/validate/additional-methods.js" ></script> 
<!-- nstSlider -->
<script src="../../webpage/resource/plugins/nstSlider/jquery.nstSlider.min.js"></script>

<script src="../../webpage/resource/js/index/devices.js"></script>
<!--timePicker-->
<script src="../../webpage/resource/plugins/timePicker/jquery.timePicker.js"></script>
<script type="text/javascript" src="../../webpage/resource/js/geozone/geozonebaidumap.js"></script>
<script src="../../webpage/resource/plugins/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
<!--[if lte IE 9]>
<script src="../../webpage/resource/js/jquery.placeholder.min.js"></script>
<script>$(function() {$('input[type="text"],input[type="password"], textarea').placeholder();});</script>
<![endif]--> 
<script type="text/javascript">
// 	var sessionid_cc=0;
//检查用户是否打开多个会话
	/* var sessionid="44661582D6B380269C3ABFCBDF41F5D4";
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
		var sessionid="44661582D6B380269C3ABFCBDF41F5D4";
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
		//synUserConfig();
		 
        $("#mask").css("height",$(document).height());     
        $("#mask").css("width",$(document).width());     
        $("#mask").show();     
     
	});
	
</script>
<style type="text/css">     
    .mask {       
            position: absolute; top: 0px; filter: alpha(opacity=60); background-color: #777;     
            z-index: 1002; left: 0px;     
            opacity:0.5; -moz-opacity:0.5;     
        }     
</style>   
<title>订单轨迹回放 - Tracker</title>

</head>
 
<input type="hidden" value="zh" id="language">
<div style="display: none;">
	 <input type="hidden" id="agencyId" name="agencyId" value="${ordershow.agencyId}"/> 
</div>		 
		
 
<body class="bc-gray">
	<div class="wrapper oh">
		<!-- main start -->
		<div class="container-fluid">
			<div class="row">
				
				<div id="mapview">
					<div class="pr">
						<div id="gridView" class="grid-view bc-fff fs-12 dn c-666 pr">
			            	<div class="grid-view-header clearfix">
			            		<h5 class="fl m-0 fw-b">轨迹明细</h5>
			            		<a class="grid-view-close fr fs-18 cp"><i class="fa fa-close"></i></a>
			            		<div class="grid-view-tools fr ws-n">
							      <a class="cp btn btn-default btn-xs" onclick="exportTrackDetail()">导出 轨迹明细</a>
							    </div>
			            	</div>
					        <div class="table-header">
					          <table class="table table-condensed table-hover table-ellipsis m-b0" id="gridViewTableHeader">
					            <thead>
					              <tr>
					                <th title="序号">序号</th>
					                <th title="时间">时间</th>
					                <th title="经度/纬度">经度/纬度</th>
					                <th title="速度(km/h)">速度(km/h)</th>
					                <th title="方向">方向</th>
					                <th title="定位类型">定位类型</th>
					                <th title="位置">位置</th>
					              </tr>
					            </thead>
					          </table>
					        </div>
					        <div class="table-scrollbar oy-a h150">
								<table class="table table-condensed table-hover table-ellipsis m-b0" id="gridViewTableContent">
									<colgroup>
										<col width="80" />
										<col width="140" />
										<col/>
										<col width="100" />
										<col width="160" />
										<col width="120" />
										<col width="25%" />
									</colgroup>	
									<tbody id="trackDetailTable">
					            	</tbody>
					        	</table>
		              			<div id="noMoreData" class="dn"><div class="ta-c c-666 p-tb10"><span class="p-5 d-ib">&nbsp;<i class="fa fa-bell-o"></i> 无更多数据&nbsp;</span></div></div>
		                		<div class="dn ta-c m-t10" id="seeMore"><button class="btn btn-default btn-sm mw-100" type="button" onclick="loadTrackDetail(0)">查看更多</button></div>
					    	</div>
					    </div>
						<div id="allmap"></div>
					</div>
					<div class="map-top-menu bc-fff p-lr10 clearfix b-b1-ddd">
					<ul class="list-fl fl location-type" style="position:relative;height:200px;width:100%">
			            <div  id="weight_container"  style="position:relative;height:200px;width:100%"></div>
			        </ul>
					</div>
					<div class="map-left-sidebar">
						<span class="side-icon"><i class="fa fa-chevron-left"></i></span>
						<div class="bc-fff">
							<div class="side-subtitle" title="轨迹回放">
								<button type="button" class="btn btn-default btn-xs fr js-toggle-time-btn" title="收起">收起&nbsp;
									<i class="fa fa-angle-double-up" aria-hidden="true"></i>
								</button>
								<b>订单轨迹回放</b>
							</div>
							<div class="map-left-downbox clearfix oy-a">
								<div class="p-10 time-form">
									<form class="form-horizontal form-sm">
										<div class="form-group"   style="border-radius: 4px;border: 1px solid #ddd;margin-right:0px;margin-left:0px">
											<div class="col-sm-12  fw-b" id="driverName">
											${devicename}&nbsp;<span>(IMEI：<%=request.getParameter("imei")%>)</span>
											</div>
											<div class="col-sm-12  fw-b" id="driverName">
											发货单号：&nbsp;<span><%=request.getParameter("fahuodanhao") %></span>
											</div>
											<div class="col-sm-12  fw-b" id="driverName">
											发货数量：&nbsp;<span><%=request.getParameter("fahuoshuliang") %>(吨)</span>
											</div>
											<div class="col-sm-12  fw-b" id="driverName">
											包装方式：&nbsp;<span><%=new String(request.getParameter("baozhuangfangshi").getBytes("iso-8859-1"),"utf-8") %></span>
											</div>
											<div class="col-sm-12  fw-b" id="driverName">
											客户名称：&nbsp;<span><%=new String(request.getParameter("kehumingcheng").getBytes("iso-8859-1"),"utf-8") %></span>
											</div>
											<div class="col-sm-12  fw-b" id="driverName">
											产品名称：&nbsp;<span><%=new String(request.getParameter("chanpinmingcheng").getBytes("iso-8859-1"),"utf-8") %></span>
											</div>
											
										</div>
										<div class="form-group">
										  <label class="col-sm-4 control-label" title="'开始时间'"> <span class="fl"><span class="c-red">*</span>订单开始时间:</span></label>
											<div class="col-sm-8 p-l0">
												<input type="text" class="form-control form-control-sm" id="start_Time"  readOnly="true" disabled placeholder="开始时间" value="${createtime}">
											</div>
										</div>
										<div class="form-group">
										  <label class="col-sm-4 control-label" title="'结束时间'"> <span class="fl"><span class="c-red">*</span>订单结束时间:</span></label>
											<div class="col-sm-8 p-l0">
												<input type="text" class="form-control form-control-sm" id="end_Time" onclick="bindChangeDate()" readOnly="true" onblur="date()" placeholder="结束时间" value="${endtime}">
											</div>
										</div>
										<div class="form-group" style="display:none">
											<div class="col-sm-12">
												<div class="btn-group btn-group-xs js-tab">
													<button type="button" class="btn btn-default" name="sz" title="上周" onclick="selectTimeat('sz')">上周</button>
													<button type="button" class="btn btn-default" name="bz" title="本周" onclick="selectTimeat('bz')">本周</button>
													<button type="button" class="btn btn-default" name="sy" title="前天" onclick="selectTimeat('qt')">前天</button>
													<button type="button" class="btn btn-default" name="zt" title="昨天" onclick="selectTimeat('zt')">昨天</button>
													<button id="today" type="button" class="btn btn-default" name="by" title="今天" onclick="selectTimeat('jt')">今天</button>
												</div>
											</div>
										</div>
										<div class="form-group m-b0">
											<div class="col-sm-12">
												<button type="button" id="selectLocus" onclick="formSumbit()" class="btn btn-sm btn-primary btn-block">确定</button>
											</div>
										</div>
									</form>
								</div>
								<div class="col-md-12">
									<div class="m-b10 locus-date">
										<ul class="driving-list">
											<li class="card" id="card"><a>
												<dl class="start">
													<dt id="dts"></dt>
													<dd></dd>
												</dl>
												<dl class="end">
													<dt id="dte"></dt>
													<dd></dd>
												</dl>
											</a></li>
										</ul>
									</div>
									<ul class="stroke-list lh-2" style="font-size:14px">
										<li id="km" style="display:none">总里程：0km</li>
										<li>速度：<span id="gpsSpeed">0</span><span id="Km_hr">KM/H</span></li>
										<li>吨位：<span id="gpsWeight">0</span><span id="Km_hT">T</span></li>
										
									</ul>
									<div class="play-control pr oh" id="statue">
										<div class="play-btn cp js-play fl" id="paly" onclick="Operate()"></div>
										<div class="play-line">
											<div id="playSlider" class="nstSlider" data-range_min="0" data-range_max="1000" data-cur_min="0">
												<div class="leftGrip"></div>
											</div>
											<div class="play-info">

												<div class="speed speed-control fr clearfix">
													<div class="speed-text d-ib" title="速度">速度:</div>
													<div class="speed-line d-ib">
														<div id="speedSlider" class="nstSlider" data-range_min="0" data-range_max="100" data-cur_min="50">
		    												<div class="leftGrip" data-hover="normal"></div>
														</div>
													</div>
												</div>
												<span class="time" id="gpsTime">--</span>
											</div>
										</div>
									</div>
									<div class="m-tb10">
								    	<div class="clearfix p-tb10">
								    	  <div class="fl">
											<button id="_draw" onclick="draw()" class="btn btn-default btn-xs" type="button" title="轨迹"><span class=" fs-12">轨迹</span></button>
											<button id="resetBut" onclick="reset()" class="btn btn-default btn-xs" type="button" title="重置"><span class=" fs-12">重置</span></button>
										    <button id="_weight" onclick="weight()" class="btn btn-default btn-xs" type="button" title="载重"><span class=" fs-12">载重</span></button>
											
										  </div>
											<div class="fr p-l15" style="display:none">
												<label>停留标识：</label>
												<div class="d-ib w100 va-m">
													<div class="easydropdown easydropdown-full easydropdown-xs">
														<select class="js-select" id="simstate">
															<option value="600">10 分钟</option>
															<option value="900">15 分钟</option>
															<option value="1800">30 分钟</option>
															<option value="2700">45 分钟</option>
															<option value="3600">1 小时</option>
															<option value="7200">2 小时</option>
															<option value="21600">6 小时</option>
															<option value="43200">12 小时</option>
															<option value="86400">24 小时</option>
														</select>
													</div>
												</div>
											</div>
										</div>


										<div class="p-t5" style="display:none">
											
												<button id="switcMode" onclick="togglePlayMode()" class="btn btn-primary btn-sm text-ellipsis maw-150 v-ib" type="button" title="切换至打点播放">切换至打点播放</button>
											
											<button id="trackDetail" class="btn btn-success btn-sm" type="button"><span class="fs-12">轨迹明细</span></button>
											<button id="exportKml" class="btn btn-default btn-sm" onclick="exportTrackKml();" type="button" title="导出Kml"><span class="fs-12">导出Kml</span></button>
										</div>								
									</div>
								</div>
								<div class="col-md-12 p-t10 b-t1-eee btn-link-list" style="display:none">
										<span class="dn" id="tracking">
											<button class="btn btn-default btn-sm" onclick="driving('tracking')" type="button" title="实时跟踪"><span class="fs-12">实时跟踪</span></button>
										</span>
										<button id="driving" class="btn btn-default btn-sm" onclick="driving('driving')" type="button" title="行车记录"><span class="fs-12">行车记录</span></button>
										<button id="export" class="btn btn-default btn-sm" onclick="exportTrack();" type="button" title="导出Excel"><span class="fs-12">导出Excel</span></button>
										
								</div>
							</div>
						</div>
					</div>
					<form name="forms"  id="driving_form" method="get" action="/drivingrecord/driving" target="_self">
						<input type="hidden" id="startTime" name="start_time" value=""> 
						<input type="hidden" id="endTime" name="end_time" value="">
						<input type="hidden" id="imei" name="imei" value="<%=request.getParameter("imei") %>"/>
						<input type="hidden" name="userId" value="16341"/>
						<input type="hidden" name="mode" value=""/>
						<input type="hidden" name="isTracking" value="0"/>
					</form>
					<input type="hidden" id="palyTime" value="0"/>
					<input type="hidden" id="PalyisDisabled" value="true">
					<input type="hidden" id="isPaly" value="false">
					<input type="hidden" id="is_Paly" value="">
					<input id="stauts" type="hidden" name="stauts" value="0"/>
					<input type="hidden" id="permission" name="permission" value="1"/>
					<input type="hidden" id="isExpire" name="isExpire" value="0"/>
				</div>
			</div>
		</div>
		<!-- main end -->
		<div id="mask" class="mask"></div>   
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
<a class="alarm-toggle-btn pf ta-c oh cp js-alarm-toggle-btn" id="gaojing"  title="报警"> <i class="fa fa-bell-o"></i></a>
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
<div id="weightChart" class="modal fade in"  aria-hidden="false">
    <div class="modal-dialog">
    <div class="modal-content w800">
       <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="weight_chart">载重曲线</h4>
      </div>
      <div class="modal-body">
      
        <!-- <div class="p-tb15 mah-450 oy-a" id="weight_container">
        </div> -->
      </div>
      <div class="modal-footer">
        <button class="btn btn-sm btn-primary mw-100" type="button" id="btn-submit-vehilebund" >确定</button>&nbsp;
        <button data-dismiss="modal" class="btn btn-sm btn-default mw-100" type="button">取消</button>
      </div>
    </div>
  </div>
</div>

<!-- custom --> 
<script src="../../webpage/resource/js/custom.js"></script> 
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
					audioPlay("../../webpage/resource/media/alarm.wav");//播放
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
		
		
// 		setInterval(function(){
// 			getAlarmInfoList(2);
// 		},5000);
		
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
	
	var header='accountCenter';
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
				var stopFlagIcon=_ctx+"../../webpage/resource/images/36x43/alarm.png";
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
				var stopFlagIcon = {url:_ctx+"../../webpage/resource/images/36x43/alarm.png" ,size:new google.maps.Size(23, 27),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(3,26)};
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
			closeIconUrl : _ctx + "../../webpage/resource/images/close.png",
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
			url:"../../rest/customControl/alertInfo",
			data: {},
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
	    				audioPlay("../../webpage/resource/media/alarm.wav");
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
		    				audioPlay("../../webpage/resource/media/alarm.wav");
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
	
<!--地图初始化加载 在页面展示地图的div的ID为 allMap即可加载-->

<script>
//地图自动高度
function mapAutoHeight() {
	$("#allmap").height($(window).height() - $(".header").outerHeight() - $(".menu-seach").outerHeight() - $(".breadcrumb-func").outerHeight() - $(".footer").outerHeight());
}
mapAutoHeight();     
$(window).resize(function(){
	mapAutoHeight();
});
</script>

<!-- baidu 相关 -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=b55lMArV9Tg1uFOY980gzpkcMCKvVfI5"></script>
<script type="text/javascript" src="../../webpage/resource/js/map/DrawingManager_min.js"></script>
<!-- <link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" /> -->
<link rel="stylesheet" href="../../webpage/resource/js/map/DrawingManager_min.css" />
<link rel="stylesheet" href="../../webpage/resource/js/map/TrafficControl_min.css" />
<script src="../../webpage/resource/js/map/TrafficControl.js"></script>
<script src="../../webpage/resource/js/map/TextIconOverlay_min.js"></script>
<script src="../../webpage/resource/js/map/MarkerClusterer_min.js"></script>


<!-- Google 相关 -->


  
  
<script src="http://ditu.google.cn/maps/api/js?libraries=drawing,places&sensor=false&language=zh&key=AIzaSyCrn9nb2pql3pdPToOxHy6Uyof9ll1lEY4"></script>

<script type="text/javascript" src="../../webpage/resource/js/index/infobox.js"></script>
<script type="text/javascript" src="../../webpage/resource/js/index/InfoBox_min.js"></script>
<script type="text/javascript" src="../../webpage/resource/js/index/carList.js"></script>
<script type="text/javascript" src="../../webpage/resource/js/index/LocationMap2.js"></script>
<script type="text/javascript" src="../../webpage/resource/js/index/jQuery.jsort.0.4.js"></script>

<script src="../../webpage/resource/js/index/markerclusterer.js"></script>

<script type="text/javascript">
var allMap;//公共的默认加载百度google地图
var language=$("#language").val();
//initBaiDuMap();
var allMapType=$.cookie('currtMapType');

//当前登录用户id
var currentUserId="16341";

/* var global_userId="16341";
var account="yanshi"; */

if(allMapType==null){
	
	
	allMapType="baiduMap";
	
}

if(allMapType!=null&&(allMapType=="googleMap"||allMapType=="baiduMap")){
	$("#selectMap").easyDropDown("select",allMapType).change(function(){
		isGoogleMap($(this).val()=="googleMap");
		setRangClass($(this).val());
	});
	if(allMapType=="googleMap"){
		isGoogleMap(true);
		initGoogleMap();
		mapFullScreen('googleMap');
		setRangClass("googleMap");
	}else{
		initBaiDuMap();//默认自动加载百度地图
		//initGoogleMap();
		mapFullScreen();
		setRangClass("baiduMap");
	}
}else{
	if(language=='en'){
		isGoogleMap(true);
		initGoogleMap();
		mapFullScreen('googleMap');
		setRangClass("googleMap");
	}else{
		initBaiDuMap();//默认自动加载百度地图
		//initGoogleMap();
		mapFullScreen();
		setRangClass("baiduMap");
	}
}

//设置测距按钮class
function setRangClass(mapType){
	if(mapType=="googleMap"){
		$('#rangBtn').attr('class','map-ranging google-ranging cp');
	}else{
		$('#rangBtn').attr('class','map-ranging baidu-ranging cp');
	}
}

//针对谷歌浏览器的计时偏移
function isGoogleMap(flag){
	var map_box = $('.map-box');
	if(flag){
		map_box.addClass('map-google-box');
	}else{
		map_box.removeClass('map-google-box');
	}
}



//点击按钮地图全屏
function mapFullScreen(allMapType){
	$(".js-full-toggle-btn").click(function(){
		if(!$("body").hasClass("full-map")){
		  $("body").addClass("full-map");
		  $(this).find(".fa").removeClass("fa-arrows-alt").addClass("fa-compress");
		  $("#allmap").css("height",$(window).height());
		  $(window).resize(function(){
		    $("#allmap").css("height",$(window).height());
		  });
		}else{
		  $("body").removeClass("full-map");
		  mapAutoHeight();
		  $(window).resize(function(){
		    mapAutoHeight();
		  });
		  $(this).find(".fa").removeClass("fa-compress").addClass("fa-arrows-alt");
		}
		if(allMapType=='googleMap'){
			google.maps.event.trigger(allMap, 'resize'); 
		}
	});
}

//普通
$("#selectMap").change(function(){
	var mapType=$(this).children('option:selected').val();//这就是selected的值 
	$.cookie('currtMapType',mapType);
	if(mapType==allMapType){
		return;
	}
	allMapType=mapType;
	if(mapType=='googleMap'){
		initGoogleMap();
		addGoogleTrafficControl();
		if( typeof getAllBaiduStatus === 'function' ){
			getAllBaiduStatus();
		}
 		if( typeof getBaiduStatus === 'function' ){
			getBaiduStatus();
		}
	}else if(mapType=="baiduMap"){
		initBaiDuMap();
	}else{
		initBaiDuMap();
		addTrafficControl();
		if( typeof getAllGoogleStatus === 'function' ){
			getAllGoogleStatus();
		}
 		if( typeof getGoogleStatus === 'function' ){
			getGoogleStatus();
		}
 		var ctrl = new BMapLib.TrafficControl({
 			showPanel: true //是否显示路况提示面板
 		});      
	}
	if( typeof initPiont === 'function' ){
		initPiont();
	}

	
	window.setTimeout(function(){searchCondition(curDeviceStatus);},100);
//	mapFullScreen(allMapType);
});

/***
电子围栏切换
$("#selectGeozoneMap").change(function(){
	var mapType=$(this).children('option:selected').val();//这就是selected的值 
	if(mapType=='googleMap'){
		initGoogleMap();//初始化google地图
		intoGoogleTools();//初始化google地图绘制工具
	}else{
		initBaiDuMap();//初始化百度地图
		intoBaiDuMapTools();//初始化百度地图绘制工具
	}
});
**/

function initBaiDuMaps(){
	var myCity = new BMap.LocalCity();
	myCity.get(myCenterAndZoom); 
	function myCenterAndZoom(result){
	    var cityName = result.name;
	    //initBaiDuMaps(cityName);
	}
}
function initBaiDuMap(){
	// 百度地图API功能
	
	var myCenter = new BMap.Point(108.90852,34.378244);
 	allMap= new BMap.Map("allmap",{enableMapClick:false}); //创建Map实例 divID必须为allmap
 	allMap.centerAndZoom(myCenter,5); // 初始化地图,设置中心点坐标和地图级别
 	allMap.addControl(new BMap.MapTypeControl()); //添加地图类型控件
 	allMap.addControl(new BMap.NavigationControl());//设置导航条 （左上角，添加默认缩放平移控件）
 	allMap.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
 	allMap.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_HYBRID_MAP]}));//控制地图模式去掉三维选择
 	//allMap.setMapStyle({style:'googlelite'});
 	allMap.clearOverlays();
 	
 	loadBaiduMap();
 	
 	allMap.defaultLatLng = myCenter;
 	addDistanceTool(rangOps(allMap,'baidu'));
    //var cr = new BMap.CopyrightControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT});  
    //cr.addCopyright({id: 1, content: "<a href='#' style='font-size:20px;background:yellow'>我是自定义版权控件呀</a>"});  
    //allMap.addControl(cr); //添加版权控件  

}

//测距工具配置
function rangOps(map,map_type){
    return {
        btn: 'rangBtn',
        mapType: map_type,
        map: map,
        imgs: {
            ruler: _ctx + '../../webpage/resource/plugins/distanceTool/ruler.cur',
            hand: _ctx + '../../webpage/resource/plugins/distanceTool/openhand.cur',
            circle: _ctx + '../../webpage/resource/plugins/distanceTool/mapCircle.png',
            close: _ctx + '../../webpage/resource/plugins/distanceTool/distance_close.png'
        },
        infobox: _ctx + '../../webpage/resource/plugins/distanceTool/labelinfobox.js'
    }
};

//添加测距工具
function addDistanceTool(obj){
    if(typeof window.getDistance != 'undefined'){
        createDistanceTool(obj);
    }else{
        $.getScript(_ctx + '../../webpage/resource/plugins/distanceTool/distanceTool.js',function(){
            createDistanceTool(obj);
        });
    }

    function createDistanceTool(obj) {
    	obj.map.lang = {
            clickStart: '单击确定起点',
            doubleClickEnd: '单击确定地点，双击结束',
            startingPoint: '起点',
            totalDistance: '总长：'
        };

        var DT = new getDistance(obj);
        var icon, point, marker, polyline, label;
        DT.btn.onclick = function() {
            this.style.backgroundColor = '#8EA8E0';
            this.style.color = '#fff';
            this.style.borderColor = '#8EA8E0';
            DT.flag = true;
            DT.changeCursor();
            DT.overlayArr[DT.overlayIndex] = [];
            DT.addFollowLabel();
        };

        DT.addMapEvent(obj.map,'click',function(event){
            if(DT.flag){
                DT.setFollowLabelText(DT.lang.doubleClickEnd);
                icon = DT.createMarkerIcon({
                    url: DT.imgs.circle,
                    size: {
                        width: 12,
                        height: 12
                    },
                    offset: {
                        left: 5,
                        top: 5
                    }
                });
                point = DT.createPoint(event);
                marker = DT.createMarker(point, icon);
                label = DT.createLabel({
                    point: point,
                    success: function(label) {
                        polyline = DT.createPolyline(point, {
                            color: '#fd8044',
                            width: 2,
                            opacity: .9
                        });
                        DT.addOverlay(marker, polyline, label);
                        if (polyline) {
                            DT.overlayArr[DT.overlayIndex].push(marker, polyline, label);
                        } else {
                            DT.overlayArr[DT.overlayIndex].push(marker, label);
                        }

                        DT.addMapEvent(marker,'dblclick',function(event){
                            DT.removeFollowLabel();
                            DT.totalMileage(label);
                            DT.resetDistance(point);
                        });
                    }
                });
            }
        })
    }
}

//百度加路况--->需要引入 TrafficControl.js /TrafficControl.css
function addTrafficControl(){
	if(allMap.addControl){

		var ctrl = new BMapLib.TrafficControl({
			showPanel: true //是否显示路况提示面板
		});      
		allMap.addControl(ctrl);
		//    BMAP_ANCHOR_TOP_LEFT 控件将定位到地图的左上角。 
		//    BMAP_ANCHOR_TOP_RIGHT 控件将定位到地图的右上角。 
		//    BMAP_ANCHOR_BOTTOM_LEFT 控件将定位到地图的左下角。 
		//    BMAP_ANCHOR_BOTTOM_RIGHT 控件将定位到地图的右下角。 
		ctrl.setAnchor(BMAP_ANCHOR_TOP_RIGHT);
	}
}


function initGoogleMap(){
	//Google地图API功能
	//纬度&经度
	if(allMap&&allMap.removeEventListener)
	{
		allMap.removeEventListener("zoomend",baiduzoomendEvent);
	}
	var myCenter=new google.maps.LatLng(21.7220357,14.7292155);
	var mapProp = {
			center:myCenter,
			zoom:2,
			mapTypeId:google.maps.MapTypeId.ROADMAP,
			mapTypeControlOptions: { 
				style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR, position: google.maps.ControlPosition.TOP_RIGHT
			}
	};
	allMap = new google.maps.Map(document.getElementById("allmap"),mapProp);
	loadGooleMap();
	allMap.defaultLatLng = myCenter;
	addDistanceTool(rangOps(allMap,'google'));
	addGoogleTrafficControl();
}

//google 
function googleCheckResize(pmap){
	google.maps.event.trigger(allMap, 'resize');
	if(pmap){
		google.maps.event.trigger(pmap, 'resize');
	}
}


function getClientLocation(showPosition){ 
    if (navigator.geolocation){ 
        navigator.geolocation.getCurrentPosition(showPosition); 
    }else{ 
        alert("浏览器不支持地理定位。"); 
    } 
} 

//google加路况
var googletrafficLayer;
function addGoogleTrafficControl(){
	googletrafficLayer= new google.maps.TrafficLayer();
	googletrafficLayer.setMap(allMap);
	addGoogleControl(allMap);
}


//stauts 0,离线; 1,在线静止; 2,在线运动.
function getbdIcon(carType,stauts){
	
	if((carType=="per" || carType=="cow" ||carType=="plane") && (stauts==1 || stauts==2)){
		stauts = 2;
	}
	var icon	=	 {icon:new BMap.Icon(_ctx+"../../webpage/resource/images/36x43/"+carType+"/"+carType+"_"+stauts+".png" ,new BMap.Size(23,28)),offset:new BMap.Size(0,-10),imageOffset:new BMap.Size(0,0)};
	return icon;
}

//run Direction
function run_bd_icon(carType,direction){
	var runicon	=	 {icon:new BMap.Icon(_ctx+"../../webpage/resource/images/runcar/"+carType+"/"+carType+"_"+parseInt((Number(direction)+22.5)/45)+".png"	,new BMap.Size(48,48)),offset:new BMap.Size(0,-10),imageOffset:new BMap.Size(0,0)};
	return runicon;
}
//run Direction
function runxz_bd_icon(carType,direction){
	var runicon	=	 {icon:new BMap.Icon(_ctx+"../../webpage/resource/images/runcar/"+carType+"/xz_"+carType+"_"+parseInt((Number(direction)+22.5)/45)+".png"	,new BMap.Size(50,50)),offset:new BMap.Size(0,0),imageOffset:new BMap.Size(0,0)};
	return runicon;
}

function getbdother(carType){
	var icon	=	 {icon:new BMap.Icon(_ctx+"../../webpage/resource/images/36x43/"+carType+".png" ,new BMap.Size(36,44)),offset:new BMap.Size(0,-22),imageOffset:new BMap.Size(0,-22)};
	return icon;
}

//stauts 0,离线; 1,在线静止; 2,在线运动.
function getggIcon(carType,stauts){
	if((carType=="per" || carType=="cow" ||carType=="plane") && (stauts==1 || stauts==2)){
		stauts = 2;
	}
	var icon	=	{url:_ctx+"../../webpage/resource/images/36x43/"+carType+"/"+carType+"_"+stauts+".png" ,size:new google.maps.Size(23,28),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(18,22)};
	return icon;
}

//run Direction
function run_gg_icon(carType,direction){
	var runicon	=	{url:_ctx+"../../webpage/resource/images/runcar/"+carType+"/"+carType+"_"+parseInt((Number(direction)+22.5)/45)+".png"	,size:new google.maps.Size(48,48),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(20,30)};
	return runicon;
}
//run Direction
function runxz_gg_icon(carType,direction){
	var runicon	=	{url:_ctx+"../../webpage/resource/images/runcar/"+carType+"/xz_"+carType+"_"+parseInt((Number(direction)+22.5)/45)+".png"	,size:new google.maps.Size(50,50),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(25,25)};
	//debugger;
	return runicon;
}


function getggother(carType){
	var icon	=	{url:_ctx+"../../webpage/resource/images/36x43/"+carType+".png"	,size:new google.maps.Size(36,44),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(18,44)};
	return icon;
}


var op = false;
function addGoogleControl(map) {
	googletrafficLayer.setMap(null);
    // 创建一个DOM元素
    var div = document.createElement("div");
    // 添加文字说明
    div.appendChild(document.createTextNode("Traffic"));
    // 设置样式
    div.id = "trafficDiv";
    div.setAttribute("class","map-traffic cp");
//     div.style.cursor = "pointer";
//     div.style.width = "40px";
//     //div.style.marginRight = "80px";
//     div.style.border = "1px solid rgb(139, 164, 220)";
//     div.style.backgroundColor = "white";
//     div.style.padding = "2px 6px";
//     div.style.borderRadius = "3px";
//     div.style.position = "absolute";
//     div.style.right = "210px";
//     div.style.top = "12px";
//     div.style.zIndex = "999";
    // 绑定事件,点击一次放大两级
    //div.style = "box-shadow: rgba(0, 0, 0, 0.34902) 2px 2px 3px; border: 1px solid rgb(139, 164, 220); padding: 2px 6px; font-style: normal; font-variant: normal; font-stretch: normal; font-size: 12px; line-height: 1.3em; font-family: arial, sans-serif; text-align: center; white-space: nowrap; border-top-left-radius: 0px; border-top-right-radius: 3px; border-bottom-right-radius: 3px; border-bottom-left-radius: 0px; color: rgb(0, 0, 0); background: rgb(255, 255, 255);position: absolute; right: 50px; top: 50px; display:block;";
    div.onclick = function (e) {
        if (!op) {
        	div.setAttribute("class","map-traffic cp active");
            op = true;
            googletrafficLayer.setMap(allMap);
        } else {
        	div.setAttribute("class","map-traffic cp");
            op = false;
            googletrafficLayer.setMap(null);
        }
    }
    // 添加DOM元素到地图中
    map.getDiv().appendChild(div);
}

</script>

<script type="text/javascript" src="../../webpage/resource/js/dateUtil.js"></script>
<script type="text/javascript" src="../../webpage/resource/js/map/getAddres.js"></script>
<script>
	//页面高度计算
	(function($){
		//左侧高度计算
		function map_downbox(){
			$(".map-left-downbox").height($(window).height()-$(".side-subtitle").outerHeight());
		}
		map_downbox();

		var a,b;
		//地图自动高度
		function mapAutoHeight() {
			a = $(window).height();
			b= $(".map-top-menu").outerHeight() + 1;
			var map_h = a - b;
			$("#allmap").css("height",map_h);
		}
		mapAutoHeight();		

		$(window).resize(function() {
			if($(window).height()>500) {
				mapAutoHeight();
				map_downbox();
			}
			tableHeaderAutoWidth("#gridViewTableHeader","#gridViewTableContent");

		});
	})(jQuery);
</script>
<script>
	var pathQueryRange = '60';//轨迹查询范围(上限)
	var trackPlayType = '2';//轨迹查询类型
	var start=null;
	var end=null;

	//设备在线则显示实时跟踪
	if($("#stauts").val()!=0){
		$("#tracking").show();
	}

	var oldStartTime=$("#start_Time").val();
	var oldEndTime=$("#end_Time").val();
	
	//验证时间是否改变并保存时间至隐藏input并取消高亮
	function date(){
		window.setTimeout(function(){
			if(oldStartTime!=$("#start_Time").val()||oldEndTime!=$("#end_Time").val()){
				oldStartTime=$("#start_Time").val();
				oldEndTime=$("#end_Time").val();
				for(var i=2;i<=6;i++){
					$("div button.btn").eq(i).removeClass("btn-primary");
				}
			}
		},300); 
	}
	
	//加载时间插件
	//$("#start_Time,#end_Time").datetimepicker({lang:'ch',format:'Y-m-d H:i:s',step:1,maxDate: getNowDate(),minDate:addMonthDate(-3).replace("-","/").replace("-","/")}); //datetimepicker
	laydate({
	  elem: "#start_Time",
	  format: 'YYYY-MM-DD hh:mm',
	  min: laydate.now(-180), //-1代表昨天，-2代表前天，以此类推
	  max: laydate.now(0), //-1代表昨天，-2代表前天，以此类推
	  istime: false, //是否可以选择具体时间
	  isclear: true, //是否显示清空
	  istoday: false, //是否显示今天
	  issure: true, //是否显示确认
	  event: 'focus' //响应事件。
	});
	laydate({
	  elem: "#end_Time",
	  format: 'YYYY-MM-DD hh:mm',
	  min: laydate.now(-180), //-1代表昨天，-2代表前天，以此类推
	  max: laydate.now(0), //-1代表昨天，-2代表前天，以此类推
	  istime: true, //是否可以选择具体时间
	  isclear: true, //是否显示清空
	  istoday: false, //是否显示今天
	  issure: true, //是否显示确认
	  event: 'focus' //响应事件。
	});

	$(".js-tab .btn").click(function(){
		 $(this).siblings("[class*='btn-primary']").removeClass("btn-primary");
		 $(this).toggleClass("btn-primary");
	});
	
	//日期选择
	function selectTimeat(flag){ 
		if(flag=="qt"){
			addDate(-2);
		}else if(flag=="zt"){
			addDate(-1);
		}else if(flag=="jt"){
			addDate(0);
		}else if(flag=="bz"){
			bzDate(flag);
		}else if(flag=="sz"){
			bzDate(flag);
		}else if(flag=="by"){
			byDate(flag);
		}else if(flag=="sy"){
			byDate(flag);
		}
	}
	
	function getDayTime(days){
		var d=new Date(); 
		d.setDate(d.getDate()+days); 
		var month=d.getMonth()+1; 
		var day = d.getDate(); 
		if(month<10){ 
			month = "0"+month; 
		} 
		if(day<10){ 
			day = "0"+day; 
		} 
		start = d.getFullYear()+"-"+month+"-"+day+" 00:00";
		end = d.getFullYear()+"-"+month+"-"+day+" 23:59";
	}
	
	function getWeekTime(flag){
		start = getWeekStartDate()+" 00:00";
		end =getWeekEndDate()+" 23:59";
		if(flag=="sz"){
			start= getSzWeekStartDate()+" 00:00";
			end =getSzWeekEndDate()+" 23:59";
		}
	}
	
	function isHighlight(button_index){
		if($("#start_Time").val()==start&&$("#end_Time").val()==end){
			$("div button.btn").eq(button_index).addClass("btn-primary");
		}else{
			$("div button.btn").eq(button_index).removeClass("btn-primary");
		}
	}
	
	//本周
	function bzDate(flag){ 
		getWeekTime(flag);
		oldStartTime=start;
		oldEndTime=end;
		$("#start_Time").val(start);
		$("#end_Time").val(end);
	}

	//昨天
	function addDate(days,isNow){ 
		getDayTime(days);
		oldStartTime=start;
		oldEndTime=end;
		//$("#start_Time").val(start);
		//$("#end_Time").val(end);
		
		//$("#start_Time").val(start);
		if($("#end_Time").val()==null||$("#end_Time").val()==""){
				$("#end_Time").val(end);
		}
	}
	
	if($("#start_Time").val()){
		getDayTime(0);
		isHighlight(5);
	}
	
	//时间验证
	function formSumbit(){
		debugger
		if($("#permission").val()=="1"&&$("#isExpire").val()!="1"){
			if(vailFrom()){
				getAllPoints();
			}
		}else if($("#permission").val()!="1"){
			layer.msg("您无权限访问该设备",{icon:2});
		}else if($("#isExpire").val()=="1"){
			layer.msg("设备已过期，暂不能访问",{icon:2});
		}
	}

	function vailFrom(){
		var start_time=$("#start_Time").val();      //开始时间
		var end_time=$("#end_Time").val();          //结束时间
		if(start_time){
			start_time=start_time+":00";
		}
		if(end_time){
			end_time=end_time+":59"
		}

		var ST = new Date(start_time.replace(/\-/g, "\/"));  
		var ED = new Date(end_time.replace(/\-/g, "\/"));  
		if(start_time!=""&&end_time!=""){
			if(ST<=ED){
				var isDay=(ED-ST)/1000/60/60/24;
				if(pathQueryRange=="60"&&isDay>60){
					layer.msg($.i18n.prop('comm.Over60daysbetweenStartandEndtime'), {icon: 7});
					return false;
				}else if(pathQueryRange=="30"&&isDay>30){
					layer.msg($.i18n.prop('comm.Over30daysbetweenStartandEndtime'), {icon: 7});
					return false;
				}else if(pathQueryRange!="60"&&pathQueryRange!="30"&&isDay>7){
					layer.msg($.i18n.prop('comm.Over7daysbetweenStartandEndtime'), {icon: 7});
					return false;
				}else{
					return true;
				}
			}else if(ST>ED){
				layer.msg($.i18n.prop('comm.StarttimegtEndtime'), {icon: 7}); 
				return false;
			}
		}else{
			layer.msg($.i18n.prop('comm.ChooseStarttimeEndtime'), {icon: 7}); 
			return false;
		}
		
	}
	
	//对天数进行加减
	function addDay(date,dd){ 
		var d = new Date(date);
	    d.setDate(d.getDate()+dd);
	    var day = d.getDate(); 
	    var month=d.getMonth()+1;
	    if(month<10){ 
	        month = "0"+month; 
	    } 
	    if(day<10){ 
	        day = "0"+day; 
	    }
	    var hh=d.getHours();      //获取当前小时数(0-23)
        var mm=d.getMinutes();    //获取当前分钟数(0-59)
        var ss=d.getSeconds();    //获取当前秒数(0-59)
        if(hh<10){
            hh= "0" + hh; 
        }
        if(mm<10){
            mm= "0" + mm; 
        }
        if(ss<10){
            ss= "0" + ss; 
        }
	    return d.getFullYear()+"-"+month+"-"+day+" "+hh+":"+mm+":"+ss;
	}
	
	//将七天以上的查询时间段拆分成各个最长7天的时间段
	function splitTime(startTime,endTime){
		var allTimes = [];
		var end=startTime;
		while (true)
		{
			var next7 = new Date(addDay(end,7));
			if(next7.getTime()<endTime.getTime()){
				allTimes.push([addDay(end,0),addDay(next7,0)]);
				end = next7;
			}else{
				allTimes.push([addDay(end,0),addDay(endTime,0)]);
				break;
			}
		}
		return allTimes;
	}

	$("#trackDetail").click(function(){
		$("#gridView").toggle();
		if($("#gridView").is(":visible")){
			tableHeaderAutoWidth("#gridViewTableHeader","#gridViewTableContent");
		}
		$("#gridView .grid-view-close").click(function(){
			$("#gridView").hide();
		})
	});
	
	function bindChangeDate(){
		$("#laydate_ok").one("click.changeDate",date);
	}
	
	var initDate = '';
	if(initDate==null||initDate==""){
	   // var time=$("#start_Time").val();
		$("#today").click();
		
		//$("#start_Time").val(time);
	}
</script>

<script>
	//是否修改进度条中
	var isModification=0;
	//播放进度
	var schedule;
	//是否为临时播放一次  1是,0否
	var isTemporaryPlay=0;
	//当前进度
	//var currentSchedule=0;
	//加载滑块插件
	function initNstSlider(){
		$('#playSlider').nstSlider({
			"left_grip_selector" : ".leftGrip",
			"value_changed_callback" : function(cause, leftValue, rightValue) {
				//console.log(leftValue);
				schedule=leftValue;
			}
		});
	}
	
	//调播放进度
	function setSchedule(){
		$('#playSlider').mousedown(function(){
			if (timer&&!statue) {
				window.clearTimeout(timer);
			}
			$('body').mouseup(function(){
				isModification = 1;
				index = parseInt((points.length-1)*schedule/1000);
				if(points.length==1){
					$('#playSlider').nstSlider('set_position', 1);
					index=0;
				}
				unbindNstSlider();
				bindNstSlider();
				if(playMode==0){
					if(!statue){
						timer = window.setTimeout("play(" + index + ")", timeat);
					}else{
						isTemporaryPlay=1;
						play();
						isTemporaryPlay=0;
					}
				}else if(playMode==1){
					reSetPlaySchedule();
				}
			});
		});
	}
	function unbindNstSlider(){
		$('#playSlider').unbind();
		$('body').unbind();
	}
	function bindNstSlider(){
		initNstSlider();
		setSchedule();
	}
	initNstSlider();
	setSchedule();
	
	/* //还原播放进度
	$('#playSlider').mouseout(function(){
		$('#playSlider').nstSlider('set_position', currentSchedule);
		$('body').unbind("mousemove");
	}); */
	
	
	//播放速度的设置和初始化
	
	$('#speedSlider').nstSlider({
		"left_grip_selector" : ".leftGrip",
		"value_changed_callback" : function(cause, leftValue, rightValue) {
			 var $this = $(this).parent().find(".leftGrip");
			 $("#palyTime").val(leftValue*10);
			if(leftValue<=33.3){
				$this.attr("data-hover",$.i18n.prop('track.Playspeed.Slow'));
			}else if(leftValue>33.3 && leftValue<=66.6){
				$this.attr("data-hover",$.i18n.prop('track.Playspeed.Normal'));
			}else{
				$this.attr("data-hover",$.i18n.prop('track.Playspeed.Fast'));
			}
		}
	});

	var playMode=0;//播放模式 0：轨迹播放 1：打点播放
	if(trackPlayType && trackPlayType != 2){
		playMode = trackPlayType;
	}
	function togglePlayMode(){
		if (timer&&!statue) {
			window.clearTimeout(timer);
		}
		if(playMode==0){
			playMode=1;
			$("#switcMode").text("切换至轨迹播放");
			emptyTrackLine();
			reSetPlaySchedule();
		}else if(playMode==1){
			playMode=0;
			$("#switcMode").text("切换至打点播放");
			emptyMarker();
			isPlayNext=0;
			setTrackLine();
			if(!statue){
				timer = window.setTimeout("play(" + index + ")", timeat);
			}
		}
	}
	
	var mcTypeUseScope='personal';
	var vechleioc='automobile';
	var cariconImg = _ctx + "../../webpage/resource/images/36x43/other/other_2.png";
	var cariconImgObj ;
	if(vechleioc){
		cariconImg = _ctx + "../../webpage/resource/images/36x43/"+vechleioc+"/"+vechleioc+"_2.png";
	}else{
		vechleioc='other';
	}
	var locationIcon;
	
	$(window).resize(function() {
		if(allMapType=="googleMap"){
			google.maps.event.trigger(allMap, 'resize');
		}
	});
	/** 通过点击展开左边栏 **/
	$(".side-icon").click(function() {
		var $this = $(this).children();
		if ($this.hasClass("fa-chevron-left")) {
			$("#mapview").addClass("nosidebar");
			$this.attr("class", "fa fa-chevron-right")
		} else {
			$("#mapview").removeClass("nosidebar");
			$this.attr("class", "fa fa-chevron-left")
		}
		window.setTimeout(
			function (){
				if(allMapType=="googleMap"){
					google.maps.event.trigger(allMap, 'resize');
				}
		},500);
	});
	
	var btn_expansion_html = '展开&nbsp;<i class="fa fa-angle-double-down"></i>';
	var btn_collapse_html = '收起&nbsp;<i class="fa fa-angle-double-up"></i>';
	
	$(".js-toggle-time-btn").click(function(){
		if($(this).children(i).hasClass("fa-angle-double-up")){
			$(this).html(btn_expansion_html).attr("title",'展开');
			$(".time-form").hide();
		}else{
			$(".time-form").show();
			$(this).html(btn_collapse_html).attr("title",'收起');
		}
	})
	
</script>

<script>
	var language = $("#language").val();
	if(allMapType==null||allMapType==""){
		if(language=="zh"){
			allMapType="baiduMap";
		}else{
			allMapType="googleMap";
		}
	}
	var devImei='868120143055298';
	var exportStartTime;
	var exportEndTime;
	
	var is_Paly = $("#is_Paly").val();
	
	var curImei = null;
	
	var carsMarker; // 汽车图标
	var currentTravelData; // 当前播放的点的气泡数据
	
	var startIcon = _ctx + "../../webpage/resource/images/36x43/start.png";//
	var startPoint;
	
	var endIcon = _ctx + "../../webpage/resource/images/36x43/end.png";//
	var endPoint;
	
	var timer; // 定时器
	var index = 0; // 记录播放到第几个point
	
	var points = []; // 坐标
	var gpsSpeeds = []; // 时速
	var gpsTimes = []; // 时间
	var geoNames = []; // 地标
	var directionArry = []; // 角度
	var posTypes = []; // 定位类型
	
	var totalDistance=0;
	
	var ppline;//边播边画
	var marker;
	
	var statue = true; // 默认停止
	
	// 百度地图边播边画的线
	var polyline;
	//谷歌地图边播边画的线
	var ggpolyline;
	var lineSymbol = {
			// travelMode: google.maps.DirectionsTravelMode.DRIVING,
		//	path : google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
			scale : 2,
			strokeColor : '#0000',
			strokeOpacity : 1, // 透明度
			strokeWeight : 1, // 宽度
			fillColor : "#0000",
			fillOpacity : 0.4
		};
	try
	{
		lineSymbol.path=google.maps.SymbolPath.FORWARD_CLOSED_ARROW;
	}
	catch(e)
	{
	}
	
	
	// TODO 初始化
	$(function($) {
		
		if($("#permission").val()=="1"&&$("#isExpire").val()!="1"){
			getAllPoints();
		}else if($("#permission").val()!="1"){
			layer.msg("您无权限访问该设备",{icon:2});
			noPermission();
		}else if($("#isExpire").val()=="1"){
			layer.msg("设备已过期，暂不能访问",{icon:2});
			noPermission();
		}
	});
	
	function noPermission(){
		$("#PalyisDisabled").val(true);
		$("#driving").attr({"disabled":"disabled"});
		$("#paly").attr({"disabled":"disabled"});
		$("#resetBut").attr({"disabled":"disabled"});
		$("#_draw").attr({"disabled":"disabled"});
		$("#export").attr({"disabled":"disabled"});
		$("#gpsTime").text("--");
		$("#address").text("--");
		$("#gpsSpeed").text("0");
		$("#km").text("总里程：0 km");
	}
	
	//清空谷歌地图覆盖物
	function emptyGGMap(){
		if(prev_infowindow){prev_infowindow.close();}
		if(marker){marker.setMap(null);};
		if(endGoogelMaker){endGoogelMaker.setMap(null);};
		if(startGoogelMaker){startGoogelMaker.setMap(null);};
		if(_draw_ggPolyline){_draw_ggPolyline.setMap(null);}
		if(ggpolyline){ggpolyline.setMap(null);ggpolyline=null;}
		emptyStopPoint();
		if(isModification!=1){
			allMap.setCenter(new google.maps.LatLng(21.7220357,14.7292155)); 
			allMap.setZoom(2);	
		}
	}
	
	function emptyStopPoint(){
		if (allMapType == 'googleMap') {
			for(var i=0;i<stopPoint.length;i++){
				var point = stopPoint[i];
				if(point){
					point.setMap(null);
				}
			}
		}else{
			for(var i=0;i<stopPoint.length;i++){
				allMap.removeOverlay(stopPoint[i]);
			}
		}
		if (prev_infowindow) {
			prev_infowindow.close();
		}
		stopPoint = [];
	}
	
	function loadStopPoint(){
		var simstate = $("#simstate").val();
		if(!stopPointDatas){
			return;
		}
		for(var i=0;i<stopPointDatas.length;i++){
			var data=stopPointDatas[i];
			stopStartTimeMap[i]=data.startTime;
			stopEndTimeMap[i]=data.endTime;
				if(allMapType=='googleMap'){
					var stopFlagIcon = {url:_ctx+"../../webpage/resource/images/36x43/stopFlag.png" ,size:new google.maps.Size(23, 27),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(3,26)};
					googleMarker=new google.maps.Marker({
						position :new google.maps.LatLng(data.lat,data.lng),
						icon : stopFlagIcon,
						map : allMap
					});
					stopPoint[i] = googleMarker;
					(function(markerValue,i){
						google.maps.event.addListener(markerValue, 'click', function() {
							showStopFlag(markerValue,i);
						});
					})(googleMarker,i);
				}else{
					var stopFlagIcon=_ctx+"../../webpage/resource/images/36x43/stopFlag.png";
					var stopFlagPoint =new BMap.Point(data.lng, data.lat);
					var stopFlagMaker = new BMap.Marker(stopFlagPoint, {
						icon : new BMap.Icon(stopFlagIcon, new BMap.Size(23, 27)),
						offset : new BMap.Size(6,-12),
						imageOffset : new BMap.Size(0,0)
					});
					allMap.addOverlay(stopFlagMaker);
					stopPoint[i] = stopFlagMaker;
					(function(markerValue,i){
						stopFlagMaker.addEventListener("click",function(e){
							showStopFlag(markerValue,i);
						});
					})(stopFlagMaker,i);
				}	
		}
	}
	
	var trackDetailTplParams={};
	
	var pageSize = 300;
	var pageNo = 1;
	var oldTrackDetail=null;
	//加载轨迹明细
	function loadTrackDetail(isCreate){
		if(trackDetailTplParams.data.length>0){
			var trackDetailTplParam = {"data":trackDetailTplParams.data.splice(0,pageSize),"mapType":allMapType,"lats":trackDetailTplParams.lats.splice(0,pageSize),"lngs":trackDetailTplParams.lngs.splice(0,pageSize),"pageSize":pageSize};
			if(isCreate==1){
				pageNo=1;
				trackDetailTplParam.pageNo = pageNo;
				$("#trackDetailTable").html(template("trackDetailTpl",trackDetailTplParam));	
			}else{
				pageNo++;
				trackDetailTplParam.pageNo = pageNo;
				$("#trackDetailTable").append(template("trackDetailTpl",trackDetailTplParam));	
			}
			if(trackDetailTplParams.data.length>0){
				$("#seeMore").show();
				$("#noMoreData").hide();
			}else{
				$("#seeMore").hide();
				$("#noMoreData").show();
			}
			if(oldTrackDetail){
				trackDetailTplParam.data=oldTrackDetail.data.concat(trackDetailTplParam.data);
				trackDetailTplParam.lats=oldTrackDetail.lats.concat(trackDetailTplParam.lats);
				trackDetailTplParam.lngs=oldTrackDetail.lngs.concat(trackDetailTplParam.lngs);
			}
			oldTrackDetail = trackDetailTplParam;
			tableHeaderAutoWidth("#gridViewTableHeader","#gridViewTableContent");
		}
	}
	

	var startMaker;
	var endMaker;
	// TODO initBaidu 初始化百度地图
	function initBaidu() {

		startPoint = points[0];
		carsMarker = new BMap.Marker(startPoint, {
			icon : new BMap.Icon(cariconImg, new BMap.Size(24, 28)),
			offset : new BMap.Size(-1,-13),
			imageOffset : new BMap.Size(0, 0)
		});
		allMap.addOverlay(carsMarker);
		(function(markerValue,data){
			carsMarker.addEventListener("click",function(e){
				showBaiduLocusPoint(markerValue,data);
			});
		})(carsMarker,data);
		allMap.setCenter(points[0]);
		allMap.setZoom(15);
		if(points.length==1){
			endPoint = startPoint;
			toggleButton(true);
			allMap.setViewport(points);
			return;
		}
		startMaker = new BMap.Marker(startPoint, {
			icon : new BMap.Icon(startIcon, new BMap.Size(24, 28)),
			offset : new BMap.Size(-1,-11),
			imageOffset : new BMap.Size(0,0)
		});
		var startTitle="<div class='map-tooltip tooltip top default' style='width:100px; margin-left:-14px;'><div class='tooltip-arrow'></div><div class='tooltip-inner text-ellipsis'>起始点</div></div>"
		var startlabel = new BMap.Label(startTitle,{offset:new BMap.Size(-30,-30)});
		startMaker.setLabel(startlabel);
		allMap.addOverlay(startMaker);
		var data = {"time":gpsTimes[0],"posType":posTypes[0],"index":0,"point":startPoint,"mapType":"baiduMap"};
		(function(markerValue,data){
			startMaker.addEventListener("click",function(e){
				showBaiduLocusPoint(markerValue,data);
			});
		})(startMaker,data);
		
		
		endPoint = points[points.length - 1];
		endMaker = new BMap.Marker(endPoint, {
			icon : new BMap.Icon(endIcon, new BMap.Size(24, 28)),
			offset : new BMap.Size(-1,-11),
			imageOffset : new BMap.Size(0, 0)
		});
		var endTitle="<div class='map-tooltip tooltip top default' style='width:100px; margin-left:-14px;'><div class='tooltip-arrow'></div><div class='tooltip-inner text-ellipsis'>终止点</div></div>"
		var endlabel = new BMap.Label(endTitle,{offset:new BMap.Size(-30,-30)});
		endMaker.setLabel(endlabel);
		allMap.addOverlay(endMaker);
		data = {"time":gpsTimes[points.length-1],"posType":posTypes[points.length-1],"index":points.length-1,"point":endPoint,"mapType":"baiduMap"};
		(function(markerValue,data){
			endMaker.addEventListener("click",function(e){
				showBaiduLocusPoint(markerValue,data);
			});
		})(endMaker,data);
		allMap.setViewport(points);
	}
	
	var startGoogelMaker;
	var endGoogelMaker;
	// TODO initGoogel 初始化谷歌地图
	function initGoogel() {
		
		startPoint = points[0];
		if(points.length==1){
			cariconImgObj=run_gg_icon(vechleioc,Number(directionArry[index]));
			cariconImgObj.anchor=new google.maps.Point(25,38);//加左减右 加上减下
			marker = new google.maps.Marker({
				position : startPoint,
				icon : cariconImgObj,
				map : allMap
			});
			endPoint = startPoint;
			allMap.setCenter(points[0]);
			allMap.setZoom(15);
			return;
		}
		var indexCenter = points.length / 2;
		indexCenter = indexCenter >> 0;
		allMap.setCenter(points[indexCenter]);
		allMap.setZoom(14);
		startGoogelMaker = new google.maps.Marker({
			position : points[0],
			icon : startIcon,
			map : allMap
		});
		var currentData = {"time":gpsTimes[0],"posType":posTypes[0],"index":0,"point":points[0],"mapType":"googleMap"};
		(function(markerValue,data){
			google.maps.event.addListener(markerValue, 'click', function() {
				showGoogleLocusPoint(markerValue,data);
			});
		})(startGoogelMaker,currentData);
		
		endGoogelMaker = new google.maps.Marker({
			position : points[points.length - 1],
			icon : endIcon,
			map : allMap
		});
		var currentData = {"time":gpsTimes[points.length-1],"posType":posTypes[points.length-1],"index":points.length-1,"point":points[points.length-1],"mapType":"googleMap"};
		(function(markerValue,data){
			google.maps.event.addListener(markerValue, 'click', function() {
				showGoogleLocusPoint(markerValue,data);
			});
		})(endGoogelMaker,currentData);
		var bounds = new google.maps.LatLngBounds();
		for (var iz = 0; iz < points.length; iz++) {
			bounds.extend(points[iz]);
		}
		allMap.fitBounds(bounds);
		endPoint = points[points.length - 1];
	}
	
	//当前打开的停车点窗口
	var prev_infowindow = null;
	//所有谷歌停车点
	var stopPoint = [];
	var stopStartTimeMap={};
	var stopEndTimeMap={};
	var stopPointDatas;
	//查询停车点加载至地图中
	function getStopFlagPoint(){
		var startTime = $("#start_Time").val();
		var endTime = $("#end_Time").val();
		var imei = $("#imei").val();
		$.ajax({
			type : "post",
			url : _ctx + "../../rest/Gps/getExceptionPoint",
			async : true,
			cache : false,
			data : {
				"startTime" : startTime+":00",
				"endTime" : endTime+":59",
				"imei" : imei,
				"selectMap" : allMapType
			},
			dataType : 'json',
			error:function(e){
				ajaxError("locus_Map.jsp",e);
			},
			success : function(returnData) {
			
			    $("#mask").hide();
			    weight();
				if(returnData!=null&&returnData.data!=null){
					stopPointDatas = returnData.data;
					if(!stopPointDatas.length){
						return;
					}
					stopStartTimeMap={};
					stopEndTimeMap={};
					reloadStopPoint();
				}
			}
		});
		if(is_Paly=="1"){
			is_Paly="0";
			Operate();
		}
	}
	
	//清空地图中的停车点并重新加载停车点
	function reloadStopPoint(){
		emptyStopPoint();
		loadStopPoint();
	}
	
	$('#simstate').change(function(){
		reloadStopPoint();
	});
	
	function MillisecondToDate(msd) {
		var hhi18n=" "+$.i18n.prop('comm.commHour');
		var mmi18n=" "+$.i18n.prop('comm.commMinute');
		var ssi18n=" "+$.i18n.prop('comm.commSeconds');
	    var time = parseFloat(msd) / 1000;
	    if (null != time && "" != time) {
	        if (time > 60 && time < 60 * 60) {
	            time = parseInt(time / 60.0) + mmi18n + parseInt((parseFloat(time / 60.0) -
	                parseInt(time / 60.0)) * 60) + ssi18n;
	        }
	        else {
	            time = parseInt(time / 3600.0) + hhi18n + parseInt((parseFloat(time / 3600.0) -
	                parseInt(time / 3600.0)) * 60) + mmi18n +
	                parseInt((parseFloat((parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60) -
	                parseInt((parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60)) * 60) + ssi18n;
	        }
	    }
	    return time;
	}
	
	//播放轨迹回放
	function Operate() {
		var palyisDisabled = $("#PalyisDisabled").val();
		if (palyisDisabled == 'false' || !palyisDisabled) {
			$("#paly").parent().toggleClass("active");
			if (statue) {
				statue = false;
				if(index == points.length){
					emptyMarker();
					index = 0;
				}
				play();
			} else {
				statue = true;
				pause();
			}
		}
	}
	
	function play(){
		if(playMode==0){
			play_trackLine();
		}else if(playMode==1){
			play_trackPoint();
		}
	}
	
	var timeat;
	//轨迹播放
	function play_trackLine() {
		if(isTemporaryPlay==1&&(index+1)==points.length&&1!=points.length){
			index--;
		}
		if($("#PalyisDisabled").val()=="true"){
			return;
		}
		debugger
		timeat = $("#palyTime").val();
		var point = points[index];
		var speed = gpsSpeeds[index];
		var weights=[];
		for(var i=0;i<allWeight.length;i++){
			//weights.push(allWeight[i]);
			Array.prototype.push.apply(weights,allWeight[i])	 
		}
		var gweight=weights[index];
		var time = gpsTimes[index];
		var showlabel=null;
		var showTite="<div class='map-tooltip tooltip top default' style='width:200px; margin-left:-14px;'><div class='tooltip-arrow'></div><div class='tooltip-inner text-ellipsis'>速度："+speed+"KM/H 载重："+gweight+"T </div></div>"
		showlabel = new BMap.Label(showTite,{offset:new BMap.Size(-40,-30)});
		if(allMapType=='googleMap'){
			cariconImgObj=run_gg_icon(vechleioc,Number(directionArry[index]));
		}else{
			cariconImgObj=run_bd_icon(vechleioc,Number(directionArry[index]));
		}
		timeat = 1000 - timeat;
		if(index==0){
			emptyTrackLine();
		} 
		if (allMapType == 'googleMap') { // Googel
			isPlayNext=1;
			setTrackLine();
			if (point)
				allMap.panTo(point);
			if(isModification==0||isTemporaryPlay==1){
				$('#playSlider').nstSlider('set_position', parseInt(index/(points.length-1)*1000));
			}
			if (index < points.length) {
				cariconImgObj.anchor=new google.maps.Point(25,38);//加左减右 加上减下
				if (!marker) {
					marker = new google.maps.Marker({
						position : point,
						icon : cariconImgObj,
						map : allMap
					});
				} else {
					if (index < points.length) {
						marker.setIcon(cariconImgObj);
						marker.setPosition(point);
					}
				}
				if(isTemporaryPlay==0){
					timer = window.setTimeout("play(" + index + ")", timeat);
				}
			}
			index++;
		} else { // baidu
			isPlayNext=1;
			setTrackLine();
			carsMarker.setIcon(cariconImgObj.icon);
			carsMarker.setPosition(point);
			if(carsMarker.getLabel()!=null){
			   carsMarker.getLabel().remove();
			}
	        carsMarker.setLabel(showlabel);
			if(isModification==0||isTemporaryPlay==1){
				$('#playSlider').nstSlider('set_position', parseInt(index/(points.length-1)*1000));
			}
			index++;
			allMap.setCenter(point);
			if (index < points.length && isTemporaryPlay==0) {
				timer = window.setTimeout("play(" + index + ")", timeat);
			} else {
				allMap.panTo(point);
			}
		}
		if(index == points.length){
			speed=0;
		}
		$("#gpsTime").text(time);
		if(vechleioc=="per"||vechleioc=="cow"||vechleioc=="plane"){
			$("#Km_hr").text("");
			if(speed>=0&&speed<=15){
				$("#gpsSpeed").text($.i18n.prop('index.Normal'));
			}else if(speed>15){
				$("#gpsSpeed").text($.i18n.prop('index.Soon'));
			}else{
				$("#gpsSpeed").text("暂无速度");
			}
		}else{
			if(speed>=0){
				$("#Km_hr").text("KM/H");
				$("#gpsSpeed").text(speed);	
				$("#gpsWeight").text(gweight);	
			}else{
				$("#Km_hr").text("");
				$("#gpsSpeed").text("暂无速度");
				$("#gpsWeight").text(gweight);
			}
		}
		if (index == points.length) {
			if(allPoints.length>0){
				conneNextPoint();
				return;
			}
			if(isModification==0||isTemporaryPlay==1){
				$('#playSlider').nstSlider('set_position', parseInt(index/(points.length-1)*1000));
			}
			Operate();
			var title =$.i18n.prop('comm.Operationtips');
			layer.confirm($.i18n.prop('track.Replay_OK'),{
					icon: 1 ,
					title:title,
					btn: [$.i18n.prop('track.Replay'),$.i18n.prop('comm.Confirm')]
				}, function(index){
					layer.close(index);
					Operate();
			});
		}
		isModification=0;
	}
	
	
	var markers=[];
	var currentTopMaker;//当前置顶的百度图标
	//打点播放
	function play_trackPoint() {
		if(isTemporaryPlay==1&&(index+1)==points.length&&1!=points.length){
			index--;
		}
		if($("#PalyisDisabled").val()=="true"){
			return;
		}

		timeat = $("#palyTime").val();
		var point = points[index];
		var speed = gpsSpeeds[index];
		var time = gpsTimes[index];
		var posType = posTypes[index];
		var data = {"time":gpsTimes[index-1],"posType":posTypes[index-1],"index":index-1,"point":points[index-1]};
		
		if(allMapType=='googleMap'){
			cariconImgObj=run_gg_icon(vechleioc,Number(directionArry[index]));
		}else{
			cariconImgObj=run_bd_icon(vechleioc,Number(directionArry[index]));
		}
		timeat = 1000 - timeat;
		if (allMapType == 'googleMap') { // Googel
			if (index>1) {
				data.mapType = "googleMap";
				setMarker(data);
			}
			if (point)allMap.panTo(point);
			if(isModification==0||isTemporaryPlay==1){
				$('#playSlider').nstSlider('set_position', parseInt(index/(points.length-1)*1000));
			}
			if (index < points.length) {
				cariconImgObj.anchor=new google.maps.Point(25,38);//加左减右 加上减下
				if (!marker) {
					marker = new google.maps.Marker({
						position : point,
						icon : cariconImgObj,
						map : allMap
					});
				} else {
					if (index < points.length) {
						marker.setIcon(cariconImgObj);
						marker.setPosition(point);
					}
				}
				if(currentTopMaker){
					currentTopMaker.setZIndex(9999);
				}
				currentTopMaker=marker;
				marker.setZIndex(10000);
				
				var currentData = {"time":time,"posType":posType,"index":index,"point":point,"mapType":"googleMap"};
				(function(markerValue,data){
					google.maps.event.addListener(markerValue, 'click', function() {
						showGoogleLocusPoint(markerValue,data);
					});
				})(marker,currentData);
				showGoogleLocusPoint(marker,currentData);
				if(isTemporaryPlay==0){
					timer = window.setTimeout("play(" + index + ")", timeat);
				}
			}
			index++;
		} else { // baidu
			if (index > 1) {
				data.mapType = "baiduMap";
				setMarker(data);
			}
			carsMarker.setIcon(cariconImgObj.icon);
			carsMarker.setPosition(point);
			if(currentTopMaker){
				currentTopMaker.setZIndex(9999);
			}
			currentTopMaker=carsMarker;
			carsMarker.setZIndex(10000);
			
			currentTravelData = {"time":time,"posType":posType,"index":index,"point":point,"mapType":"baiduMap"};
			(function(markerValue,data){
				carsMarker.addEventListener("click",function(e){
					showBaiduLocusPoint(markerValue,data);
				});
			})(carsMarker,currentTravelData);
			showBaiduLocusPoint(carsMarker,currentTravelData);

			if(isModification==0||isTemporaryPlay==1){
				$('#playSlider').nstSlider('set_position', parseInt(index/(points.length-1)*1000));
			}
// 			allMap.setCenter(point);
			if (index < points.length && isTemporaryPlay==0) {
				timer = window.setTimeout("play(" + index + ")", timeat);
			} else {
				allMap.panTo(point);
			}
			index++;
		}
		if(index == points.length){
			speed=0;
		}
		$("#gpsTime").text(time);
		if(vechleioc=="per"||vechleioc=="cow"||vechleioc=="plane"){
			$("#Km_hr").text("");
			if(speed>=0&&speed<=15){
				$("#gpsSpeed").text($.i18n.prop('index.Normal'));
			}else if(speed>15){
				$("#gpsSpeed").text($.i18n.prop('index.Soon'));
			}else{
				$("#gpsSpeed").text("暂无速度");
			}
		}else{
			if(speed>=0){
				$("#Km_hr").text("KM/H");
				$("#gpsSpeed").text(speed);	
			}else{
				$("#Km_hr").text("");
				$("#gpsSpeed").text("暂无速度");
			}
		}
		if (index == points.length) {
			if(allPoints.length>0){
				conneNextPoint();
				return;
			}
			if(isModification==0||isTemporaryPlay==1){
				$('#playSlider').nstSlider('set_position', parseInt(index/(points.length-1)*1000));
			}
			Operate();
			var title =$.i18n.prop('comm.Operationtips');
			layer.confirm($.i18n.prop('track.Replay_OK'),{
					icon: 1 ,
					title:title,
					btn: [$.i18n.prop('track.Replay'),$.i18n.prop('comm.Confirm')]
				}, function(index){
					layer.close(index);
					Operate();
			});
		}
		isModification=0;
	}
	
	//打点播放重设播放进度
	function reSetPlaySchedule(){
		emptyMarker();
		for(var i=1;i<index;i++){
			var time = gpsTimes[i];
			var posType = posTypes[i];
			var point = points[i];
			var data = {"time":time,"posType":posType,"index":i,"point":point};
			
			
			if(allMapType == 'googleMap'){
				if(i+1<index){
					data.mapType = "googleMap";
					setMarker(data);
				}
				if((i+1)==index&&point){
					cariconImgObj=run_gg_icon(vechleioc,Number(directionArry[i]));
					cariconImgObj.anchor=new google.maps.Point(25,38);//加左减右 加上减下
					if (!marker) {
						marker = new google.maps.Marker({
							position : point,
							icon : cariconImgObj,
							map : allMap
						});
					} else {
						if (i < points.length) {
							marker.setIcon(cariconImgObj);
							marker.setPosition(point);
						}
					}
					allMap.panTo(point);
					if(currentTopMaker){
						currentTopMaker.setZIndex(9999);
					}
					currentTopMaker=marker;
					marker.setZIndex(10000);
					
					var currentData = {"time":time,"posType":posType,"index":i,"point":point,"mapType":"googleMap"};
					(function(markerValue,data){
						google.maps.event.addListener(markerValue, 'click', function() {
							showGoogleLocusPoint(markerValue,data);
						});
					})(marker,currentData);
					showGoogleLocusPoint(marker,currentData);
				}
			}else{
				data.mapType = "baiduMap";
				if(i+1<index){
					setMarker(data);
				}
				if((i+1)==index&&point){
					cariconImgObj=run_bd_icon(vechleioc,Number(directionArry[i]));
					carsMarker.setIcon(cariconImgObj.icon);
					carsMarker.setPosition(point);
					
					var currentData = data;
					(function(markerValue,data){
						carsMarker.addEventListener("click",function(e){
							showBaiduLocusPoint(markerValue,data);
						});
					})(carsMarker,currentData);
					showBaiduLocusPoint(carsMarker,currentData);
					
					if(currentTopMaker){
						currentTopMaker.setZIndex(9999);
					}
					currentTopMaker=carsMarker;
					carsMarker.setZIndex(10000);
// 					allMap.setCenter(point);
				}
			}
		}
		if(!statue){
			timer = window.setTimeout("play(" + index + ")", timeat);
		}
	}
	
	var isPlayNext=0;//是否播放下一点所连的线
	//设置轨迹播放的线
	function setTrackLine(){
		if(isPlayNext==0){
			ppline=points.slice(0,index);
		}else{
			ppline=points.slice(0,index+1);
		}

		if (allMapType == 'googleMap') { // Googel
			if (index>0) {
				if(ggpolyline){
					ggpolyline.setPath(ppline);
				}else{
					ggpolyline= new google.maps.Polyline({
						path : ppline,
						icons : [ {
							icon : lineSymbol,
							offset : '1%'
						} ],
						strokeColor : '#00cc00',
						map : allMap
					});
				}
			}
		}else{
			if (index > 0) {
				if(polyline){
					polyline.setPath(ppline);
				}else{
					polyline=new BMap.Polyline(ppline, {
						strokeColor : "#00cc00",
						strokeWeight : 3,
						strokeOpacity : 1
					});
					allMap.addOverlay(polyline);
				}
			}
		}
	}
		
	function pause() {
		if (timer) {
			window.clearTimeout(timer);
		}
	}
	
	//重播轨迹
	function reset() {
		if(playMode==0){
			emptyTrackLine();
		}else if(playMode==1){
			emptyMarker();
		}
		
		if (timer) {
			window.clearTimeout(timer);
		}
		index = 0;
		if (carsMarker) {
			carsMarker.setPosition(points[0]);
		}
		if (marker&&points.length!=1) {
			marker.setMap(null);
			marker=null;
		}
		
		$('#playSlider').nstSlider('set_position', 0);
		$("#statue").removeClass("active");
		statue = true;

		allMap.panTo(points[0]);
		$("#gpsTime").text(gpsTimes[0]);
		if(vechleioc=="per"||vechleioc=="cow"||vechleioc=="plane"){
			$("#Km_hr").text("");
			$("#gpsSpeed").text($.i18n.prop('index.Normal'));
		}else{
			$("#gpsSpeed").text(0);
		}
	}
	
	//当前轨迹点信息窗口
	var locusPoint_infowindow;
	//谷歌地图点击轨迹点事件
	function showGoogleLocusPoint(googleMarker,data){
		if(playMode==1){
			var tpl = template('showLocusPointInfo',data);
			var content = $(tpl);
			var portrait=-303;;
			
			var infowindow = getGGDialog(content,-245,portrait);//加右减左
			
			content.find(".popover-close").click(function() {
				InfoWindow_falg = false;
				infowindow.close();
			});
			
			if (locusPoint_infowindow) {
				locusPoint_infowindow.close();
			}
			infowindow.open(allMap,googleMarker);
			locusPoint_infowindow=infowindow;
			if(currentTopMaker){
				currentTopMaker.setZIndex(9999);
			}
			currentTopMaker=googleMarker;
			googleMarker.setZIndex(10000);	
		}
	}
	
	
	//百度地图点击轨迹点事件
	function showBaiduLocusPoint(stopFlagMaker,data){
		if(playMode==1){
			var tpl = template('showLocusPointInfo',data);
			
			var opts = {
				  width : 500,     // 信息窗口宽度
				  height: 250,     // 信息窗口高度
				  enableMessage:true,//设置允许信息窗发送短息
			};
			
			var portrait = 289;
			var _gDialog = getDialog(tpl,490,portrait);
			
			allMap.addOverlay(_gDialog);
			_gDialog.open(stopFlagMaker);

			$(_gDialog._div).find(".popover-close").click(function() {
				_gDialog.hide();
			});
			
			if (locusPoint_infowindow) {
				locusPoint_infowindow.close();
			}
			
			locusPoint_infowindow=_gDialog;
			if(currentTopMaker){
				currentTopMaker.setZIndex(9999);
			}
			currentTopMaker=stopFlagMaker;
			stopFlagMaker.setZIndex(10000);	
		}
	}
	
	//清空地图标记恢复初始状态
	function emptyMapMarker(){
		if(allMapType == 'googleMap'){
			emptyGGMap();
		}else{
			isHideBubble=1;
			allMap.clearOverlays();
			polyline=null;
			allMap.centerAndZoom(new BMap.Point(108.90852,34.378244),5); // 初始化地图,设置中心点坐标和地图级别
		}
	}
	
	//启用或禁用部分按钮以及部分区域填值
	function toggleButton(flag){
		var state;
		if(flag){
			$("#km").text("总里程：0 km");
			$("#gpsTime").text("--");
			state = "disabled";
		}else{
			$("#km").html("总里程："+totalDistance+" km");
			$("#gpsTime").text(gpsTimes[0]);
			state = false;
		}
		$("#trackDetail").attr({"disabled":state});
		$("#exportKml").attr({"disabled":state});
		$("#switcMode").attr({"disabled":state});
		$("#resetBut").attr({"disabled":state});
		$("#_draw").attr({"disabled":state});
		$("#paly").attr({"disabled":state});
		$("#export").attr({"disabled":state});
		$("#gpsSpeed").text("0");
		$("#PalyisDisabled").val(flag);
		if(allPoints.length>0)
			$("#_draw").attr({"disabled":"disabled"});
	}
	
	//点击停车点事件
	function showStopFlag(stopFlagMaker,stopTimeMapIndex){
		var startTime=stopStartTimeMap[stopTimeMapIndex];
		var endTime=stopEndTimeMap[stopTimeMapIndex];
		var d=startTime;//new Date(startTime.replace("-","/").replace("-","/")).getTime();
		var d2=endTime;//new Date(endTime.replace("-","/").replace("-","/")).getTime();
		var stopTime=MillisecondToDate(d2-d);
		var stopInfo = $.i18n.prop('cust.StopInfo');
		var datas={
			startTime:startTime,
			endTime:endTime,
			stopTime:stopTime,
			stopInfo:stopInfo
		};
		var tpl = template('showStopFlagInfo',datas);
		if (prev_infowindow) {
			prev_infowindow.close();
		}
		var portrait;
		var infowindow;
		if(allMapType=='googleMap'){
			var content = $(tpl);
			portrait=-245;;
			infowindow = getGGDialog(content,-224,portrait);
			infowindow.open(allMap,stopFlagMaker);
			content.find(".popover-close").click(function() {
				InfoWindow_falg = false;
				infowindow.close();
			});
		}else{
			portrait=231;;
			if(language!="zh"){
				portrait=248;
			}
			infowindow = getDialog(tpl,460,portrait);
			allMap.addOverlay(infowindow);
			infowindow.open(stopFlagMaker);
			$(infowindow._div).find(".popover-close").click(function() {
				infowindow.hide();
			});
		}
		prev_infowindow=infowindow;
		if(currentTopMaker){
			currentTopMaker.setZIndex(9999);
		}
		currentTopMaker=stopFlagMaker;
		stopFlagMaker.setZIndex(10000);
	}
	
	function getBDIcon(posType){
		var bdIcon = "";
		switch(posType){
			case 1 :
				bdIcon="icon-satellite.png";
				break;
			case 2 :
				bdIcon="icon-station.png";
				break;
			case 3 :
				bdIcon="icon-wifi.png";
				break;
		}
		var icon = {icon:new BMap.Icon(_ctx+"../../webpage/resource/images/"+bdIcon	,new BMap.Size(22,27)),offset:new BMap.Size(0,-10),imageOffset:new BMap.Size(0,0)};
		return icon;
	}
	
	function getGGIcon(posType){
		var ggIcon = "";
		switch(posType){
			case 1 :
				ggIcon="icon-satellite.png";
				break;
			case 2 :
				ggIcon="icon-station.png";
				break;
			case 3 :
				ggIcon="icon-wifi.png";
				break;
		}
		var icon = {url:_ctx+"../../webpage/resource/images/"+ggIcon ,size:new google.maps.Size(22,27),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(11,26)};//减右减下
		return icon;
	}
	
	//设置打点播放的轨迹点
	function setMarker(data){
		if(data.mapType=="googleMap"){
			locationIcon = getGGIcon(data.posType);
			var newMarker = new google.maps.Marker({
				position : data.point,
				icon : locationIcon,
				map : allMap
			});	
			(function(markerValue,data){
				google.maps.event.addListener(markerValue, 'click', function() {
					showGoogleLocusPoint(markerValue,data);
				});
			})(newMarker,data);
			markers[markers.length]=newMarker;
		}
		if(data.mapType=="baiduMap"){
			locationIcon = getBDIcon(data.posType);
			var newCarsMarker = new BMap.Marker(data.point, {
				icon : locationIcon.icon,
				offset : new BMap.Size(-1,-13),
				imageOffset : new BMap.Size(0, 0)
			});	
			allMap.addOverlay(newCarsMarker);
			(function(markerValue,data){
				newCarsMarker.addEventListener("click",function(e){
					showBaiduLocusPoint(markerValue,data);
				});
			})(newCarsMarker,data);
			markers[markers.length]=newCarsMarker;
		}
	}
	
	//清空打点播放的轨迹点
	function emptyMarker(){
		if (locusPoint_infowindow) {
			locusPoint_infowindow.close();
		}
		if(allMapType=='googleMap'){
			cariconImgObj={url:_ctx+"../../webpage/resource/images/icon-satellite.png"	,size:new google.maps.Size(33,33),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(20,30)};
			for(var i=0;i<markers.length;i++){
				markers[i].setMap(null);
			}
			markers = [];
		}else{
			cariconImgObj={icon:new BMap.Icon(_ctx+"../../webpage/resource/images/icon-satellite.png"	,new BMap.Size(33,33)),offset:new BMap.Size(0,-10),imageOffset:new BMap.Size(0,0)};
			for(var i=0;i<markers.length;i++){
				allMap.removeOverlay(markers[i]);
			}
			markers=[];
		}
	}
	
	//清空轨迹播放的轨迹线
	function emptyTrackLine(){
		if (allMapType == 'googleMap') {
			if(ggpolyline){
				ggpolyline.setMap(null);
				ggpolyline=null;
			}
		}else{
			if(polyline){
				allMap.removeOverlay(polyline);
				polyline=null;
			}
		}
	}
	
	function exportTrackDetail(){

		var form = $("<form>");
	    form.attr('style', 'display:none');
	    form.attr('target', '');
	    form.attr('method', 'post');
	    form.attr('action', _ctx+'/trackreplay/exportTrackDetail');
	    
 	    var titles = $("#gridViewTableHeader thead tr th");
	    var jsonVal = {};
	    jsonVal.title = [
	                		titles.eq(0).text(),
	                		titles.eq(1).text(),
	                		titles.eq(2).text(),
	                		titles.eq(3).text(),
	                		titles.eq(4).text(),
	                		titles.eq(5).text(),
	                		titles.eq(6).text()
	                	];
 		var trackDetail = $("#trackDetailTable tr");
 		jsonVal.points = [];
		for(var i=0;i<trackDetail.length;i++){
			var pointInfo = trackDetail.eq(i);
			var point = [
					pointInfo.children().eq(0).text(),
					pointInfo.children().eq(1).text(),
					pointInfo.children().eq(2).text(),
					pointInfo.children().eq(3).text(),
					pointInfo.children().eq(4).text(),
					pointInfo.children().eq(5).text(),
					pointInfo.children().eq(6).text()
			];
			jsonVal.points.push(point);
 		}
		var inputTrackDetail = $('<input>');
		inputTrackDetail.attr('type', 'hidden');
		inputTrackDetail.attr('name', 'jsonVal');
		inputTrackDetail.attr('value', JSON.stringify(jsonVal));
		
		var inputLanguage = $('<input>');
		inputLanguage.attr('type', 'hidden');
		inputLanguage.attr('name', 'language');
		inputLanguage.attr('value', language);
		
		var inputImei = $('<input>');
		inputImei.attr('type', 'hidden');
		inputImei.attr('name', 'imei');
		inputImei.attr('value', devImei);
		
		

	    $('body').append(form);
	    form.append(inputTrackDetail);
	    form.append(inputLanguage);
	    form.append(inputImei);
	    form.submit();
        form.remove();
	}
	
	var _draw=true;
	var _ggdraw=true;
	var _draw_Polyline;
	var _draw_ggPolyline;
	//边播边放线路信息
	function draw(){
		debugger
		if (index == points.length) {
			if (allMapType == 'googleMap') {
				if(ggpolyline){
					_ggdraw=false;
					ggpolyline.setMap(null);
					ggpolyline=undefined;
				}
			}else{
				if(polyline){
					_draw=false;
					allMap.removeOverlay(polyline)
					polyline=undefined;
				}
			}
		}
		if (allMapType == 'googleMap') {
			if(_draw_ggPolyline){
				_draw_ggPolyline.setMap(null);
			}
			if(_ggdraw){
				_draw_ggPolyline = new google.maps.Polyline({
					path : points,
					icons : [ {
						icon : lineSymbol,
						offset : '1%'
					} ],
					strokeColor : '#00cc00',
					// travelMode: google.maps.DirectionsTravelMode.DRIVING,
					map : allMap
				});
			} 
			_ggdraw=!_ggdraw;
		}else{
			if(_draw_Polyline){
				allMap.removeOverlay(_draw_Polyline)
			}
			if(_draw){
				_draw_Polyline=new BMap.Polyline(points, {
					strokeColor : "#00cc00",
					strokeWeight : 2,
					strokeOpacity : 1
				});
				allMap.addOverlay(_draw_Polyline);
			}
			_draw=!_draw;
		}
	}
	
	function weight(){
		debugger
		var data=[];
		var times=[];
		//$("#weightChart").modal();
		for(var i=0;i<allWeight.length;i++){
		//	data.push(allWeight[i]);	
			Array.prototype.push.apply(data,allWeight[i])
		}
		var interval=Math.ceil(data.length/5);
		times=getDateArray(allstartTimes,allendTimes,data.length);
		$('#weight_container').highcharts({
        chart: {
            alignTicks: false,
            type: 'line',
            events: {
                click: function (e) {
					var x = e.xAxis[0].value;					
					$('#playSlider').nstSlider('set_position', parseInt(x/(points.length-1)*1000));
					$('#playSlider').mousedown();
                }
            }
        },
        credits: {
            enabled: false
        },
        exporting:{  
        	enabled:false 
        	}, 
        title: {
            text: null
        },
         
        xAxis: {
            categories:times,
            tickInterval: interval,
            labels: {
             //autoRotation: [-90] 
        }
        }, 
       
        yAxis: {
            title: {
                text: '吨 (T)'
            }
           
        },
        tooltip: {
            crosshairs: true,
            shared: true
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: false          // 开启数据标签
                },
                enableMouseTracking: true // 关闭鼠标跟踪，对应的提示框、点击事件会失效
            }
        },
        scrollbar: {
       		enabled: true
   		},
        series: [{
            name: '载重历史',
            data: data
        }]
    });
	
	}
	
	//清空并初始化数据
	function emptyData(){
	debugger
		oldTrackDetail=null;
		allWeight=[];
		allPoints=[];
		allLngs=[];
		allLats=[];
		carsMarker = undefined;
		startPoint = undefined;
		endPoint = undefined;
		totalDistance=0;
		if(marker){
			marker.setMap(null);
		}
		marker = undefined;
		index = 0;
	
		points = [];
		gpsSpeeds = [];
		gpsTimes = [];
		geoNames = [];
		directionArry =[];
		if(timer!=null){
			window.clearTimeout(timer);
		}
		stopPointDatas = null;
		emptyMarker();
		emptyStopPoint();
		statue = false;
		$("#statue").removeClass("active");
		$('#playSlider').nstSlider('set_position', 0);
		_ggdraw=true;
		_draw=true;
		$("#PalyisDisabled").val(true);
	}
	
	//清空地图的起始和结束点 防止出现分页时会加载多个起始点和结束点
	function emptyStartEnd(){
		if (allMapType == 'googleMap') {
			if(startGoogelMaker){startGoogelMaker.setMap(null);};
			if(endGoogelMaker){endGoogelMaker.setMap(null);};
		}else{
			if(startMaker){allMap.removeOverlay(startMaker);};
			if(endMaker){allMap.removeOverlay(endMaker);};
		}
	}
	
	
	//接续下一周的轨迹数据
	function conneNextPoint(){
	debugger
		var p = allPoints.splice(0,1)[0];
		var g = allLngs.splice(0,1)[0];
		var t = allLats.splice(0,1)[0];
		$.each(p , function(n, value) {
			if(allMapType != 'googleMap'){
				points.push(new BMap.Point(value.lng, value.lat));
			}else{
				points.push(new google.maps.LatLng(value.lat, value.lng));
			}
			gpsSpeeds.push(value.gpsSpeed);
			gpsTimes.push(value.gpsTime);
			geoNames.push(value.geoname);
			directionArry.push(value.direction);
			posTypes.push(value.posType);
		});
		trackDetailTplParams.data = trackDetailTplParams.data.concat(p);
		trackDetailTplParams.lats = trackDetailTplParams.lats.concat(t);
		trackDetailTplParams.lngs = trackDetailTplParams.lngs.concat(g);
		loadWebPageData();
		if(timer)
			window.clearTimeout(timer);
		if(statue==false)
			timer = window.setTimeout("play(" + index + ")", timeat);
	}
	
	//加载网页中的数据
	function loadWebPageData(){
		emptyStartEnd();
		if(allMapType != 'googleMap'){
			initBaidu(); 
			getPointBaiDuLocation(points[0],'dts');
			getPointBaiDuLocation(points[points.length - 1],'dte');
		}else{
			initGoogel();
			getGoogleLocation(points[0],'dts');
			getGoogleLocation(points[points.length - 1],'dte');
		}
		$('li.card dl.start dd').text(gpsTimes[0]);
		$('li.card dl.end dd').text(gpsTimes[gpsTimes.length-1]);
		var geoname = geoNames[geoNames.length-1];
		if (geoname) {
			$("#address").text(geoname+"("+$.i18n.prop('landmark')+")");
		} else {
			if(allMapType != 'googleMap'){
				getPointBaiDuLocation(points[points.length - 1],"address");
			}else{
				getGoogleLocationText(points[points.length - 1],"#address");
			}
		}
		loadTrackDetail(1);
	}
	
	//初始化地图标记并解析地址、加载停车点、加载轨迹详情
	function loadMapData(returnData){
		var tempPoint=[];
		allWeight.push(returnData.data.weight);
		$.each(returnData.data.data , function(n, value) {
			if(allMapType != 'googleMap'){
				//tempPoint.push(new BMap.Point(value.lng, value.lat));
				points.push(new BMap.Point(value.lng, value.lat));
			}else{
				points.push(new google.maps.LatLng(value.lat, value.lng));
			
			}
			gpsSpeeds.push(value.gpsSpeed);
			gpsTimes.push(value.gpsTime);
			geoNames.push(value.geoname);
			directionArry.push(value.direction);
			posTypes.push(value.posType);
		});
		//坐标转换
		/**translateCallback = function (data){
		      if(data.status === 0) {
		        for (var i = 0; i < data.points.length; i++) {
		            points.push(new BMap.Marker(data.points[i]));
		        }
		      }
		    }
		
		var convertor = new BMap.Convertor();
        convertor.translate(tempPoint, 1, 5, translateCallback);**/
        
        
        
		trackDetailTplParams.data=returnData.data.data;
		trackDetailTplParams.lats=returnData.data.lats;
		trackDetailTplParams.lngs=returnData.data.lngs;
		loadWebPageData();
		getStopFlagPoint();//停车点
	}
	
	var allendTimes;
	var allstartTimes;
	
	//获取所有轨迹点
	function getAllPoints(){
	    debugger
		var start = $("#start_Time").val()+":00";
		var end = $("#end_Time").val()+":59";
		allendTimes=end;
		allstartTimes=start;
		var startTime = new Date(start);
		var endTime = new Date(end);
		var allTimes = [[start,end]];
		$("#selectLocus").attr("disabled",true);
		emptyData();
		emptyMapMarker();
		if(new Date(addDay(startTime,7)).getTime()<endTime.getTime()){
			allTimes = splitTime(startTime,endTime);
// 			getPoints(addDay(allTimes[0][0],0),addDay(allTimes[0][1],0),analyData);
// 			for(var i=1;i<allTimes.length;i++){
// 				getPoints(addDay(allTimes[i][0],0),addDay(allTimes[i][1],0),compoundAnalyData);
// 			}
		}
		getPoints(allTimes,analyData);
 	    showPolygon();
// 		}else{
// 			getPoints(addDay(startTime,0),addDay(endTime,0),analyData);
// 		}
		$("#selectLocus").attr("disabled",false);
	}

	var allPoints=[];
	var allWeight=[];
	
	var allLngs=[];
	var allLats=[];
	
	
	
	var _url="<%=request.getContextPath()%>";
// 	function getPoints(startTime,endTime,callback){
	function getPoints(allTimes,callback,startPoint){
		var times = allTimes.splice(0,1); //取数组
		var startTime = times[0][0];
		var endTime = times[0][1];
		var imei = $("#imei").val();
		
		if (startTime != "" && startTime != "" && imei != "") {
			$.ajax({
				type : "get",
				url : _url+"/rest/Gps/initPiont",
				async : true,
				cache : false,
				data : {
					"startTime" : startTime,
					"endTime" : endTime,
					"imei" : imei,
					"selectMap" : allMapType,
					"startPoint" : startPoint
				},
				dataType : 'json',
				error:function(e){
					//ajaxError("locus_Map.jsp",e);
				},
				success : function(returnData) {
					callback(returnData,allTimes);
// 					callback(returnData);
				}
			})
		}
	}
	
	
	//单次查询可完成的点的解析与加载
	function analyData(returnData,allTimes){
		exportStartTime=$("#start_Time").val();
		exportEndTime=$("#end_Time").val();
		var latLng=null;
		if (returnData.code == 0) {
			if (returnData.data && returnData.data.data) {
				latLng = returnData.data.data[returnData.data.data.length-1].lat+","+returnData.data.data[returnData.data.data.length-1].lng;
				statue = true;
				posTypes = [];
				
				loadMapData(returnData);
				totalDistance = returnData.data.totalMileage;
				toggleButton(false);
				if(allTimes.length>0)
					getPoints(allTimes,compoundAnalyData,latLng);
			} else {
				if(allTimes.length>0){
					getPoints(allTimes,analyData,latLng);
				}else{
				    $("#mask").hide();
					layer.msg($.i18n.prop('comm.Nologsinthisperiod'));
					toggleButton(true);
					$("#gridView").hide();
					$("#address").text("--");
					$("#card").html("<a><dl class=\"start\"><dt  id='dts'></dt><dd></dd></dl><dl class=\"end\"><dt id='dte'></dt><dd></dd></dl></a>");
				}
			}
		}
	}
	
	//需要多次查询的点的解析与加载
	function compoundAnalyData(returnData,allTimes){
		var latLng;
		if (returnData.code == 0) {
			if (returnData.data && returnData.data.data) {
				latLng = returnData.data.data[returnData.data.data.length-1].lat+","+returnData.data.data[returnData.data.data.length-1].lng;
				allPoints.push(returnData.data.data);
				allWeight.push(returnData.data.weight);
				allLngs.push(returnData.data.lngs);
				allLats.push(returnData.data.lats);
				totalDistance = (Number(totalDistance) + Number(returnData.data.totalMileage)).toFixed(1);
				toggleButton(false);
			}
		}
		if(allTimes.length>0){
			getPoints(allTimes,compoundAnalyData,latLng);
		}
		conneNextPoint();
	}
	
	
	
	
	
	//获取百度气泡
	function getDialog(tpl,abscissa,portrait){
		var _gDialog = new BMapLib.InfoBox(allMap, tpl, {
			boxStyle : {
				width : abscissa+"px",//加左减右
				height : "0px"
			},
			offset : new BMap.Size(0 ,portrait),
			// 直接隐藏官方关闭按钮
			closeIconMargin : "2px;display:none;",
			closeIconUrl : _ctx + "../../webpage/resource/images/close.png",
			enableAutoPan : true,
			align : INFOBOX_AT_TOP
		});
		return _gDialog;
	}
	
	//获取谷歌气泡
	function getGGDialog(tpl,abscissa,portrait){
		var infowindow = new InfoBox({
			content : tpl.get(0),
			disableAutoPan : false,
			maxWidth : 0,
			pixelOffset : new google.maps.Size(abscissa, portrait),
			zIndex : null,
			closeBoxURL : "",
			isHidden : false,
			pane : "floatPane",
			enableEventPropagation : false
		});
		return infowindow;
	}

	
	var isHideBubble=0;//是否取消显示 0否1是
	//显示当前气泡信息
	function showBDBubble(){
		if(isHideBubble==1){
			isHideBubble==0;
			return;
		}
		if(carsMarker!=null&&currentTravelData!=null){
			window.setTimeout(function (){showBaiduLocusPoint(carsMarker,currentTravelData)},300);
		}
	}
	
	if(allMapType=='baiduMap'){
		allMap.addEventListener("zoomend",showBDBubble);
	}
	
	//导出轨迹信息
	function exportTrack(){
		window.open(_ctx+"/trackreplay/export?imei="+$("#imei").val()+"&startTime="+exportStartTime+":00"+"&endTime="+exportEndTime+":59"+"&language="+language,'top');
	}
	
	//导出轨迹为kml文件
	function exportTrackKml(){
		window.open(_ctx+"/trackreplay/exportTrackKml?imei="+$("#imei").val()+"&startTime="+exportStartTime+":00"+"&endTime="+exportEndTime+":59"+"&language="+language,'top');
	}
	
	//跳转至行车记录或实时跟踪
	function driving(data){
		$("#startTime").val(exportStartTime);
		$("#endTime").val(exportEndTime);
		var imei =$("#imei").val();
		var url;
		if(data=="driving"){
			url=_ctx+"/drivingrecord/driving";
			$('#driving_form').attr("action", url).submit();
		}else if(data=="tracking"){
			url=_ctx+"/trackpreset/tracking/"+imei;
			$('#driving_form').attr("action", url).submit();
		}
	}
	//获取时间数组
	 function getDateArray(starttime,endtime,length) {
	          var endDate = new Date(endtime).getTime();
	          var startDate = new Date(starttime).getTime();
			  //var splitTime =  5 * 60 * 1000;
			  var splitCount =  length;
			  var splice=Math.ceil((endDate-startDate)/splitCount);
			  var count=0;
			  
			  var dateArray = [];
			  while( endDate >startDate+ count * splice) {
			    var d = new Date();
			    d.setTime(startDate + count * splice);
			    dateArray.push(
						    (d.getMonth() + 1) + '-' + 
						    d.getDate() + ' ' + 
						    d.getHours() + ':' + 
						    d.getMinutes());
						    
				count++;		    
			  }
			  return dateArray;
			}
			

</script>

<script id="showStopFlagInfo" type="text/html">
<div class="map-popover">
      <div class="popover-header">
      <b>异常信息</b>
      <span class="popover-close" title="关闭">&times;</span></div>
      <div class="popover-body">
        <table class="tl-f m-tb5">
          <tbody>
			<tr>
              <td title="{{startTime}}">{{startTime}}</td>
            </tr>
            
          </tbody>
        </table>
      </div>
    </div>
</script>

<script type="html/text" id="showLocusPointInfo" >
	<div class="map-popover map-dot-popover" style="width:300px;">
		<div class="popover-header">
			<b>序号{{index+1}}</b>
			<span class="popover-close" title="关闭">×</span>
		</div>
		<div class="popover-body">
			<table class="tl-f w-100" style="height:114px">
				<tbody>
					<tr>
						<th width="70" title="定位类型">定位类型：</th>
						{{if posType=="1"}}<td title="卫星定位">卫星定位</td>{{/if}}
						{{if posType=="2"}}<td title="基站定位">基站定位</td>{{/if}}
						{{if posType=="3"}}<td title="WIFI定位">WIFI定位</td>{{/if}}
					</tr>
					<tr>
						<th title="定位时间">定位时间：</th>
						<td title="{{time}}">{{time}}</td>
					</tr>
					<tr>
						<th title="定位地点">定位地点：</th>
						<td id="td{{index+1}}">
							{{if mapType=="googleMap"}}<a class='cp' onclick="getGoogleLocation('','td{{index+1}}','{{point.lat}}','{{point.lng}}')">查看地址</a>{{/if}}
							{{if mapType=="baiduMap"}}<a class='cp' onclick="getPointBaiDuLocation('','td{{index+1}}','{{point.lng}}','{{point.lat}}')">查看地址</a>{{/if}}
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</script>

<script type="text/html" id="trackDetailTpl">
{{each data as point i}}
	<tr>
		<td title="{{pageSize*(pageNo-1)+i+1}}">{{pageSize*(pageNo-1)+i+1}}</td>
		<td title="{{point.gpsTime}}">{{point.gpsTime}}</td>
		<td title="{{lngs[i]}}/{{lats[i]}}">{{lngs[i]}}/{{lats[i]}}</td>
		{{if point.gpsSpeed!="-1"}}
			<td title="{{point.gpsSpeed}}KM/H">{{point.gpsSpeed}}KM/H</td>
		{{/if}}
		{{if point.gpsSpeed=="-1"}}
			<td title="暂无速度">暂无速度</td>
		{{/if}}

		{{if point.direction!="-1"}}
			{{if point.direction>=338||point.direction<=22}}<td title="正北向(方向数：{{point.direction}})">正北向(方向数：{{point.direction}})</td>{{/if}}
			{{if point.direction>=23&&point.direction<=67}}<td title="东北向(方向数：{{point.direction}})">东北向(方向数：{{point.direction}})</td>{{/if}}
			{{if point.direction>=68&&point.direction<=112}}<td title="正东向(方向数：{{point.direction}})">正东向(方向数：{{point.direction}})</td>{{/if}}
			{{if point.direction>=113&&point.direction<=157}}<td title="东南向(方向数：{{point.direction}})">东南向(方向数：{{point.direction}})</td>{{/if}}
			{{if point.direction>=158&&point.direction<=202}}<td title="正南向(方向数：{{point.direction}})">正南向(方向数：{{point.direction}})</td>{{/if}}
			{{if point.direction>=203&&point.direction<=247}}<td title="西南向(方向数：{{point.direction}})">西南向(方向数：{{point.direction}})</td>{{/if}}
			{{if point.direction>=248&&point.direction<=292}}<td title="正西向(方向数：{{point.direction}})">正西向(方向数：{{point.direction}})</td>{{/if}}
			{{if point.direction>=293&&point.direction<=337}}<td title="西北向(方向数：{{point.direction}})">西北向(方向数：{{point.direction}})</td>{{/if}}
		{{/if}}
		{{if point.direction=="-1"}}
			<td title="无">无</td>
		{{/if}}
		
		{{if point.posType=="1"}}<td title="卫星定位">卫星定位</td>{{/if}}
		{{if point.posType=="2"}}<td title="基站定位">基站定位</td>{{/if}}
		{{if point.posType=="3"}}<td title="WIFI定位">WIFI定位</td>{{/if}}
		{{if mapType!="googleMap"}}<td id="trackDetail{{pageSize*(pageNo-1)+i}}"><a onclick="getPointBaiDuLocation('','trackDetail{{pageSize*(pageNo-1)+i}}','{{point.lng}}','{{point.lat}}')" title="查看地址">点击获取地址</a></td>{{/if}}
		{{if mapType=="googleMap"}}<td id="trackDetail{{pageSize*(pageNo-1)+i}}"><a onclick="getGoogleLocation('','trackDetail{{pageSize*(pageNo-1)+i}}','{{point.lat}}','{{point.lng}}')" title="查看地址">点击获取地址</a></td>{{/if}}
	</tr>
{{/each}}
</script>

</body>
</html>