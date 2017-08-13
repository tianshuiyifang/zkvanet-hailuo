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
<!--[if lte IE 9]>
<script src="../../webpage/resource/js/jquery.placeholder.min.js"></script>
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
<title>实时跟踪 - Tracker</title>
</head>
	 
		   
			<body class="bc-gray show-street">
			<input type="hidden" value="zh" id="language">
		 
		
	 
		<!-- main start -->
		<div class="container-fluid">
			<div class="row">
				<div id="mapview">
					<div class="map-top-menu bc-fff p-lr10 fs-16 clearfix b-b1-ddd">
						<span class="timer"> <b>20</b>&nbsp;秒后刷新</span>
						<!--<div class="fr camera js-toggle-side cp">街景</div>-->
						<div class="func fr p-lr15 dn">
							<div class="easydropdown d-ib">
								<select class="js-select" id="selectMap" name="selectMap">
									<option value="baiduMap">百度地图</option>
									<option value="googleMap" selected="selected">谷歌地图</option>
								</select>
							</div>
						</div>

						<div class="func fr p-l15"> <span class="func-label">刷新间隔：</span>
							<div class="easydropdown d-ib va-t">
								<select id="intervaltime" name="intervaltime" >
									<option value="10">10s</option>
									<option value="20" selected="selected">20s</option>
									<option value="30">30s</option>
								</select>
							</div>
						</div>
					</div>
					<div class="map-street-box">
						<div class="map-box">
							<div id="allmap"></div>
						</div>
						<div class="side-street-box dn">
							<div id="streetView"></div>
							<div class="narrow-street fs-18 cp">
								<i class="fa fa-minus-square-o"></i>
							</div>
							<div class="tips-content fs-12"><span class="text">温馨提示：该地区暂不支持街景模式</span><br><br>已支持街景模式城市：<br><a target="view_window" href="http://map.qq.com/jiejing/city.html">http://map.qq.com/jiejing/city.html</a></div>
						</div>
						<div class="show-streetview cp dn"><span class="street-img"></span></div>
					</div>
										
					<div class="map-left-sidebar">
						<span class="side-icon"><i class="fa fa-chevron-left"></i></span>
						<div class="bc-fff">
							<div class="side-subtitle" title="实时跟踪"><b>实时跟踪</b></div>
							<div class="col-md-12">
								<div class="form-horizontal form-ellipsis form-xs form-label-align-left p-t10">
									<div class="form-group">
										<div class="col-sm-12 c-009934 fw-b" id="driverName">
											
												皖A99999
											
											
										</div>
									</div>
									<div class="form-group">
			            			  	<label class="col-sm-3 p-r0 control-label" title="IMEI">IMEI：</label>
			            				<div class="col-sm-9 p-t7"><span id="imeiHead">868120141245867</span></div>
			            			</div>
			            			
			            			<div class="form-group">
			            			  	<label class="col-sm-3 p-r0 control-label" title="速度">速度：</label>
			            				<div class="col-sm-9 p-t7"><span id="gpsSpeed">0</span><span id="Km_hr">KM/H</span></div>
			            			</div>
			            			<div class="form-group">
			            			  	<label class="col-sm-3 p-r0 control-label" title="日期">日期：</label>
			            				<div class="col-sm-9 p-t7"><span id="gpsTime"></span></div>
			            			</div>
			            			<div class="form-group">
			            			  	<label class="col-sm-3 p-r0 control-label" title="地址">地址：</label>
			            				<div class="col-sm-9 p-t7"><span id="address"></span></div>
			            			</div>
								</div>
								<div class="p-tb10"><button type="button" class="btn btn-default btn-sm btn-block text-ellipsis" id="show-street" title="街景"><span class="fs-12">街景</span></button></div>
							</div>
							<div class="col-md-12 p-t10 b-t1-eee btn-link-list">
								<button id="locus" type="button" class="btn btn-default btn-sm" onclick="submitForm('locus')" title="轨迹回放"><span class=" fs-12">轨迹回放</span></button>
								<button id="driving" type="button" class="btn btn-default btn-sm" onclick="submitForm('driving')" title="行车记录"><span class=" fs-12">行车记录</span></button>
							</div>
						</div>
					</div>
					<form  id="forms" name="forms" method="get"  action="/drivingrecord/driving" target="_self">
						<input type="hidden" id="startTime" name="start_time" value=""> 
						<input type="hidden" id="endTime" name="end_time" value="">
						<input type="hidden" id="imei" name="imei" value="868120141245867"/>
						<input type="hidden" name="userId" value="16341"/>
						<input type="hidden" name="mode" value=""/>
					</form>
					<input id="isTracking" type="hidden" name="isTracking" value="1"/>
					<input type="hidden" id="permission" name="permission" value="1"/>
					<input type="hidden" id="isExpire" name="isExpire" value="0"/>
				</div>
			</div>
		</div>
		<!-- main end -->
		
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
	
	var header='alarm';
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
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=S7gxefmASouTllUyjE71hWV3"></script>
<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
<script type="text/javascript" src="../../webpage/resource/js/map/DrawingManager_min.js"></script>
<!-- <link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" /> -->
<link rel="stylesheet" href="../../webpage/resource/js/map/DrawingManager_min.css" />
<link rel="stylesheet" href="../../webpage/resource/js/map/TrafficControl_min.css" />
<script src="../../webpage/resource/js/map/TrafficControl.js"></script>
<script src="../../webpage/resource/js/map/TextIconOverlay_min.js"></script>
<script src="../../webpage/resource/js/map/MarkerClusterer_min.js"></script>


<!-- Google 相关 -->


  
  
<script src="http://ditu.google.cn/maps/api/js?libraries=drawing,places&sensor=false&language=zh&key=AIzaSyBouofvVMJCCCJabiq9hqfbc2eO20Ahskk"></script>

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

	
	<!-- qq map -->
	<script src="http://map.qq.com/api/js?v=2.exp&key=b55lMArV9Tg1uFOY980gzpkcMCKvVfI5&libraries=convertor"></script>

	<script type="text/javascript" src="../../webpage/resource/js/map/getAddres.js"></script>
	
	<script type="text/javascript">
	
	var isTracking = $("#isTracking").val();
	var language = $("#language").val();
	if(allMapType==null||allMapType==""){
		if(language=="zh"){
			allMapType="baiduMap";
		}else{
			allMapType="googleMap";
		}
	}
	
	/** 通过点击展开左边栏 **/
	$(".side-icon").click(function() {
		var $this = $(this).children();
		if ($this.hasClass("fa-chevron-left")) {
			$("#mapview").addClass("nosidebar");
			$this.attr("class", "fa fa-chevron-right");
		} else {
			$("#mapview").removeClass("nosidebar");
			$this.attr("class", "fa fa-chevron-left");
		}
	});
	
	
	if(allMapType=="baiduMap"){
		if(isTracking==0){
			$(".show-streetview").show(0);
			$('.side-street-box').css("zIndex",'-1');
			$('.side-street-box').show(0);
		}else{
			$(".show-streetview").hide(0);
			$('.side-street-box').css("zIndex",'1');
			$('.side-street-box').show(0);
		}
	}else{
		$("#show-street").hide();
	}
	
	$("#selectMap").change(function(){
		if($("#selectMap").val()=='googleMap'){
			$("#show-street").hide();
			$(".show-streetview").hide(0);
			$('.side-street-box').css("zIndex",'-1');
		}else if($("#selectMap").val()=="baiduMap"){
			$("#show-street").show();
			if(isTracking==0){
				$(".show-streetview").show(0);
				$('.side-street-box').css("zIndex",'-1');
			}else{
				$(".show-streetview").hide(0);
				$('.side-street-box').css("zIndex",'1');
			}
		}
	});
	
	var pano = null;	
	var panos = '';
	var streetStatus = function (){};
	streetStatus.prototype.streetHave = function(){//GPS地点存在街景的事件
		var init = function() {
			pano = new qq.maps.Panorama(document.getElementById('streetView'), {
				pano: panos,
				disableMove: false,
				disableFullScreen: false,    //设置是否全屏
		        zoom:1,
		        pov:{
		        	heading:20,              //设置南北仰角
		        	pitch:15                 //设置与地面的夹角
		    	}
			});
		};
	    init();
	    $("#streetView").show();
	    $(".tips-content").hide();
	};
	streetStatus.prototype.streetNone = function(){//GPS地点不存在街景的事件
		$("#streetView").hide();
		$(".tips-content").show();
	};
	
	var a = new streetStatus();
	//a.streetHave();
	
	var pano_service = new qq.maps.PanoramaService();   
	
	//设备位置刷新的时候调用     
	function change(lat,lng){
		var svids="";
		qq.maps.convertor.translate(new qq.maps.LatLng(lat, lng), 1, function(res) {
			var point = new qq.maps.LatLng(res[0].lat,res[0].lng);
			var radius="";
			pano_service.getPano(point, radius, function (result){
				if(result!=null){
					svids=result.svid;
					if(svids!=""){
						panos=svids;
						a.streetHave();
						//pano.setPano(svids);
					}else{
						a.streetNone();
					}
				}else{
					a.streetNone();
				}
			});
		});
	}
	   
	//地图自动高度
	function mapAutoHeight() {
		$("#allmap").height($(window).height() - $(".map-top-menu").outerHeight(true));
	}
	mapAutoHeight();
	$(window).resize(function() {
		mapAutoHeight();
	});

	//街景显示隐藏
	$("#show-street,.narrow-street,.show-streetview").click(function(){
		if(isTracking=="0"){isTracking="1";getBaiduStatus();}
		if($('.side-street-box').css("zIndex")=='1'){
			$('.side-street-box').css("zIndex",'-1');
			$(".show-streetview").show(0);
		}else{
			$('.side-street-box').css("zIndex",'1');
			$(".show-streetview").hide(0);
		}
	});
	
	function noPermission(){
		$("#imeiHead").text('--');
		$("#acc").text('--');
		$("#gpsSpeed").text("0");
		$("#gpsTime").text("--");
		$("#address").text("--");
		$("#locus").attr({"disabled":"disabled"});
		$("#driving").attr({"disabled":"disabled"});
		$("#show-street").hide();
		$(".show-streetview").hide();
		$('.side-street-box').css("zIndex",'-1');
	}
	
	</script>
	
	<script type="text/javascript">

		var curImei = null;
// 		var zoom;
		// 刷新时间10s
// 		var INTERVAL = 10 * 1000;
		
		//定时任务间隔时间10s
		var intervaltime=parseInt($("#intervaltime").val());
		// 定时任务刷新 倒计时
		var intervaltime_refresh=intervaltime;
		//定时任务刷新 倒计时id
		var intervaltime_id;
		//定时任务 方法名
		var interval_fn;
		
		
		var startPoint;
		var endPoint;
		//居中的点
		var MPoint=[];
		var m_=0;
		var m_p=3;
		var endMarker;
		
		var gstartPoint;
		var gendPoint;
		//居中的点
		var gMPoint=[];
		var gm_=0;
		var gm_p=3;
		var gendMarker;
		
		var acc;//"未通电";
// 		var engineStatus = "熄火";
		var gpsTime = "";
		var lastTime = "";
		var gpsSpeed = 0;
		var address = "";
		var imei = '868120141245867';
		
		var mcTypeUseScope='personal';
		var vechleioc = 'automobile';
		if(!vechleioc){
			vechleioc="other";
		}
		var vechlestatus="0";
		
		var points = []; //数组，放经纬度信息
		
		var gpoints = []; //数组，放经纬度信息
		
		var polyline; //折线覆盖物
		
		var gpolyline ;
		
		//定时任务id
		var interval_id;
		
		// TODO 初始化
		$(function($) {
			if($("#permission").val()=="1"&&$("#isExpire").val()!="1"){
				if (imei) {
					if (allMapType == 'googleMap') {
						addGoogleTrafficControl();
						if(gpolyline)
							gpolyline.setMap(null);
						gpolyline = new google.maps.Polyline({
						    strokeColor: '#00cc00',
						    strokeOpacity: 1.0,
						    strokeWeight: 3
						  });
						gpolyline.setMap(allMap);
					//Google
						getGoogleStatus();
						interval_id = setInterval(function() {
							getGoogleStatus();
						}, intervaltime*1000);
					}else{
						addTrafficControl();
						if(polyline)
							allMap.removeOverlay(polyline);
						polyline = new BMap.Polyline(); //折线覆盖物
						//Baidu
						getBaiduStatus();
						interval_id =setInterval(function() {
							getBaiduStatus();
						}, intervaltime*1000);
					}
				}else{
					layer.msg($.i18n.prop('index.No_data'));
				}
				setTimeout(function() {
					if(gstartPoint)
						allMap.setCenter(gstartPoint);
					
					if(startPoint)
						allMap.setCenter(startPoint);
				}, 50);
			}else if($("#permission").val()!="1"){
				layer.msg("您无权限访问该设备",{icon:2});
				noPermission();
			}else if($("#isExpire").val()=="1"){
				layer.msg("设备已过期，暂不能访问",{icon:2});
				noPermission();
			}
		});
		
		//加载谷歌地图的位置数据
		function getGoogleStatus(){
			acc = $.i18n.prop('index.Close');//"未通电";
			interval_fn=getGoogleStatus;
			intervaltimeRefresh();
			
			MPoint = [];
			endMarker = undefined;
			endPoint = undefined;
			m_ = 0;
			m_p = 3;
			points = [];
			polyline = undefined;
			startPoint = undefined;

			if (allMapType == 'googleMap') {
			} else {
				if(polyline)
					allMap.removeOverlay(polyline);
				polyline = new BMap.Polyline(); //折线覆盖物
				if (interval_id)
					clearInterval(interval_id);
				getBaiduStatus();
				interval_id = setInterval(function() {
					getBaiduStatus();
				}, intervaltime*1000);
				return;
			}
			$.get(_ctx + "/getStatus?_=" + new Date().getTime(), {
				'imei' : imei
			}, function(result) {
				if (result.code == 0 && result.data && result.data.gps) {
					var value = result.data;
					if (value.status) {
						vechlestatus = value.status;
					}
					var direction=0;
					if (value.gps) {
						if (value.status && ( value.status == 1 || value.status == 2 ) && value.gps.acc && value.gps.acc == "1"){
							acc = $.i18n.prop('index.On');//"通电";
						}else{
							acc = $.i18n.prop('index.Close');//"未通电";
						}
						if (value.gps.gpsTime)
							gpsTime = value.gps.gpsTime;
						if (value.gps.direction)
							direction = value.gps.direction;
						//var image=gvechleIconMap[vechlestatus+"_"+vechleioc];
						gicon_start=getggother("start");
						var image=getggIcon(vechleioc,vechlestatus);
						if(vechlestatus==2){
							image=run_gg_icon(vechleioc,Number(direction));
						}
						gm_++;
						if (!gstartPoint) {
							lastTime=gpsTime;

							//街景
							//change(value.gg.lat,value.gg.lng);
							
							gstartPoint = new google.maps.LatLng(value.gg.lat,value.gg.lng);
							allMap.setCenter(gstartPoint);
							allMap.setZoom(15);

							gicon_start.anchor=new google.maps.Point(12,26);
							var marker = new google.maps.Marker({
				                map: allMap,
				                position : gstartPoint,
				                icon: gicon_start,
				     		});
							
							marker.setMap(allMap);
							
							gpoints.push(gstartPoint); //将新增的点放到数组中
							  var path = gpolyline.getPath();
							  path.push(gstartPoint);
							
							gMPoint[gm_%gm_p]=gstartPoint;
// 							allMap.panTo(gstartPoint);
						} else {
						// TODO
							if(gpsTime>=lastTime){
								lastTime=gpsTime;
								if (gendMarker) {
									gendMarker.setMap(null);
								}

								//街景
								//change(value.gg.lat,value.gg.lng);
								gendPoint = new google.maps.LatLng(value.gg.lat, value.gg.lng);
								
								if(vechlestatus==2){
									image.anchor=new google.maps.Point(25,38);//加左减右 加上减下
								}else{
									image.anchor=new google.maps.Point(12,26);
								}
								
								allMap.setCenter(gendPoint);
								allMap.setZoom(allMap.getZoom());
								gendMarker = new google.maps.Marker({
									map : allMap,
									position : gendPoint,
									icon : image,
								});
								gendMarker.setMap(allMap);
								gpoints.push(gendPoint);
								var path = gpolyline.getPath();
								path.push(gendPoint);
								gMPoint[gm_ % gm_p] = gendPoint;
								allMap.panTo(gendPoint);
							}
						}
						var p;
						if (gendPoint) {
							p = gendPoint;
						} else {
							p = gstartPoint;
						}
						if(value.geoname){
							$("#address").text(value.geoname+"("+$.i18n.prop('landmark')+")");
						}else{
							getGoogleLocation(p,"address");
						}
					}
					if (value.status && value.status == 2 && value.gps && value.gps.gpsSpeed && value.gps.gpsSpeed!="" && value.gps.gpsSpeed > 0) {
						gpsSpeed = value.gps.gpsSpeed;
					}else if(value.gps.gpsSpeed==""){
						gpsSpeed=-1;
					}else{
						gpsSpeed=0;
					}
// 					if (value.obd && value.obd.engineStatus && value.obd.engineStatus == "1") {
// 						engineStatus = "启动";
// 					}
				}else {
						if (interval_id){
							clearInterval(interval_id);
						}
						if(intervaltime_id){
							clearInterval(intervaltime_id);
							$("span.time b").text("0");
						}
					layer.msg($.i18n.prop('index.No_data_from_vehicle'), {
						icon : 5
					});
				}
				$("#acc").text(acc);
				$("#gpsTime").text(lastTime);
				if(vechleioc=="per"||vechleioc=="cow"||vechleioc=="plane"){
					$("#Km_hr").text("");
					if(gpsSpeed>=0&&gpsSpeed<=15){
						$("#gpsSpeed").text($.i18n.prop('index.Normal'));
					}else if(gpsSpeed>15){
						$("#gpsSpeed").text($.i18n.prop('index.Soon'));
					}else{
						$("#gpsSpeed").text("暂无速度");
					}
				}else{
					if(gpsSpeed>=0){
						$("#Km_hr").text("KM/H");
						$("#gpsSpeed").text(gpsSpeed);
					}else{
						$("#Km_hr").text("");
						$("#gpsSpeed").text("暂无速度");
					}
				}
				if(""==lastTime||null==lastTime){
					$("#gpsTime").text("--");
				}
				if(""==value||null==value){
					$("#address").text("--");
				}
// 				$("ul span#engineStatus").text(engineStatus);
// 				var zoom_ = allMap.getZoom();
// 				if (!zoom || zoom_ == zoom) {
// 					if (gMPoint.length == gm_p && gm_ >= gm_p) {
// 						var bounds = new google.maps.LatLngBounds();
// 						for (var iz = 0; iz < gMPoint.length; iz++) {
// 							bounds.extend(gMPoint[iz]);
// 						}
// 						allMap.fitBounds(bounds);
// 					}
// 				}
			}, 'json');
		}
		
		//加载百度地图的位置数据以及腾讯街景
		function getBaiduStatus() {
			acc = $.i18n.prop('index.Close');//"未通电";
			interval_fn=getBaiduStatus;
			intervaltimeRefresh();
			
			gMPoint = [];
			gendMarker = undefined;
			gendPoint = undefined;
			gm_ = 0;
			gm_p = 3;
			gpoints = [];
			gpolyline = undefined;
			gstartPoint = undefined;
			
			if (allMapType == 'googleMap') {
				if(gpolyline)
					gpolyline.setMap(null);
				gpolyline = new google.maps.Polyline({
				    strokeColor: '#7d9de5',
				    strokeOpacity: 1.0,
				    strokeWeight: 3
				  });
				gpolyline.setMap(allMap);
				
				if (interval_id)
					clearInterval(interval_id);
				getGoogleStatus();
				interval_id = setInterval(function() {
					getGoogleStatus();
				}, intervaltime*1000);
				return;
			}
			$.ajax({
				type : "get",
				url : _ctx + "/getStatus?_=" + new Date().getTime(),
				async : true,
				cache : false,
				data : {
					"imei" : imei,
				},
				dataType : 'json',
				error:function(e){
					ajaxError("tracking.jsp",e);
				},
				success : function(result) {
					if (result.code == 0 && result.data && result.data.gps) {
						var value = result.data;
						if (value.status) {
							vechlestatus = value.status;
						}
						var direction=0;
						if (value.gps) {
							if (value.status && ( value.status == 1 || value.status == 2 ) && value.gps.acc && value.gps.acc == "1"){
								acc = $.i18n.prop('index.On');//"通电";
							}else{
								acc = $.i18n.prop('index.Close');//"未通电";
							}
							if (value.gps.gpsTime)
								gpsTime = value.gps.gpsTime;
							if (value.gps.direction)
								direction = value.gps.direction;
							var icon_start=getbdother("start");
							var icon=getbdIcon(vechleioc,vechlestatus);
							if(vechlestatus==2){
								icon=run_bd_icon(vechleioc,Number(direction));
							}
							m_++;
							polyline.setStrokeColor("#00cc00");
							if (!startPoint) {
								lastTime=gpsTime;
								
								//街景
								if(isTracking!="0"){change(value.gps.latitude,value.gps.longitude);}
								
								startPoint = new BMap.Point(value.bd.lng, value.bd.lat);
								allMap.centerAndZoom(startPoint, 15);
								var marker = new BMap.Marker(startPoint, icon_start);
								marker.setOffset(new BMap.Size(6,-4));
								allMap.addOverlay(marker);

								points.push(startPoint); //将新增的点放到数组中
								polyline.setPath(points); //设置折线的点数组
								allMap.addOverlay(polyline); //将折线添加到地图上
								MPoint[m_ % m_p] = startPoint;
//	 							allMap.panTo(startPoint);
							} else {
							// TODO
								if(gpsTime>=lastTime){
									lastTime=gpsTime;
									if (endMarker) {
										allMap.removeOverlay(endMarker);
									}
									//街景
									if(isTracking!="0"){change(value.gps.latitude,value.gps.longitude);}
									
									endPoint = new BMap.Point(value.bd.lng, value.bd.lat);
									allMap.centerAndZoom(endPoint, allMap.getZoom());
									endMarker = new BMap.Marker(endPoint, icon);
									if(vechlestatus!=2){
										endMarker.setOffset(new BMap.Size(-2,-12));
									}
									allMap.addOverlay(endMarker);
		
									points.push(endPoint);
									polyline.setPath(points);
									allMap.addOverlay(polyline);
									MPoint[m_ % m_p] = endPoint;
									//画面追随
									allMap.panTo(endPoint);
								}
							}
							var p;
							if (endPoint) {
								p = endPoint;
							} else {
								p = startPoint;
							}
							if(value.geoname){
								$("#address").text(value.geoname+"("+$.i18n.prop('landmark')+")");
							}else{
//	 							var geoc = new BMap.Geocoder();
//	 							geoc.getLocation(p, function(rs) {
//	 								if (rs.address)
//	 									$("ul span#address").text(rs.address);
//	 							});
								getPointBaiDuLocation(p, "address");
								//getPointBaiDuLocation(p,"ul span#address");
							}
						}
						if (value.status && value.status == 2 && value.gps && value.gps.gpsSpeed && value.gps.gpsSpeed!="" && value.gps.gpsSpeed > 0) {
							gpsSpeed = value.gps.gpsSpeed;
						}else if(value.gps.gpsSpeed==""){
							gpsSpeed=-1;
						}else{
							gpsSpeed=0;
						}
//	 					if (value.obd && value.obd.engineStatus && value.obd.engineStatus == "1") {
//	 						engineStatus = "启动";
//	 					}
					}else {
						if (interval_id){
							
							clearInterval(interval_id);
						}
						if(intervaltime_id){
							clearInterval(intervaltime_id);
							$("span.timer b").text("0");
						}
						layer.msg($.i18n.prop('index.No_data_from_vehicle'), {
							icon : 5
						});
						a.streetNone();
					}
					$("#acc").text(acc);
					$("#gpsTime").text(lastTime);
					if(vechleioc=="per"||vechleioc=="cow"||vechleioc=="plane"){
						$("#Km_hr").text("");
						if(gpsSpeed>=0&&gpsSpeed<=15){
							$("#gpsSpeed").text($.i18n.prop('index.Normal'));
						}else if(gpsSpeed>15){
							$("#gpsSpeed").text($.i18n.prop('index.Soon'));
						}else{
							$("#gpsSpeed").text("暂无速度");
						}
					}else{
						if(gpsSpeed>=0){
							$("#Km_hr").text("KM/H");
							$("#gpsSpeed").text(gpsSpeed);
						}else{
							$("#Km_hr").text("");
							$("#gpsSpeed").text("暂无速度");
						}
					}
					if(""==lastTime||null==lastTime){
						$("#gpsTime").text("--");
					}
					if(""==value||null==value){
						$("#address").text("--");
					}
//	 				$("ul span#engineStatus").text(engineStatus);
//	 				var zoom_ = allMap.getZoom();
//	 				if (!zoom || zoom_ == zoom) {
//	 					if (MPoint.length == m_p && m_ >= m_p)
//	 						allMap.setViewport(MPoint);
//	 				}
				}
			});
			if(isTracking=="0"){
				$('.side-street-box').css("zIndex",'-1');
				$(".show-streetview").show();
			}
		}
		
		//刷新间隔修改时主动刷新
		$('#intervaltime').easyDropDown().change(function(){
			var selected=$(this).children('option:selected').val();//selected的值 
			selected=parseInt(selected);
			if(selected==intervaltime){
				return;
			}
			intervaltime=selected;
				if( interval_fn&&(typeof interval_fn=== 'function' )){
					if (interval_id){
						clearInterval(interval_id);
					}
					interval_fn();
					interval_id = setInterval(function() {
						interval_fn();
					}, intervaltime*1000);
				}
		});
		
		//刷新倒计时
		function intervaltimeRefresh() {
			intervaltime_refresh=intervaltime;
			if(intervaltime_id){
				clearInterval(intervaltime_id);
				$("span.timer b").text("20");
			}
			intervaltime_id = setInterval(function() {
				if(intervaltime_refresh){
					intervaltime_refresh--;
					if(intervaltime_refresh>=0)
					$("span.timer b").text(intervaltime_refresh);
				}
			}, 1000);
		}
		
		//跳转至行车记录或轨迹回放
		function submitForm(data){
			var url;
			if(data=="driving"){
				url=_ctx+"/drivingrecord/driving";
				$('#forms').attr("action", url).submit();
			}else if(data=="locus"){
				url=_ctx+"/trackreplay/locus";
				$('#forms').attr("action", url).submit();
			}
		}
		
	</script>
	
</body>
</html>