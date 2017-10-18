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
<link rel="icon" href="../resource/images/favicon.ico" type="image/x-icon"/> 
<link rel="tracker icon" href="../resource/images/favicon.ico" type="image/x-icon"/> 
<link rel="stylesheet" href="../resource/css/normalize.css">
<link rel="stylesheet" href="../resource/css/base.css">
<link rel="stylesheet" href="../resource/css/bootstrap.min.css">
<link rel="stylesheet" href="../resource/css/non-responsive.css">
<link rel="stylesheet" href="../resource/css/font-awesome.min.css">
<link rel="stylesheet" href="../resource/css/iconfont.css">
<link rel="stylesheet" href="../resource/plugins/autocompleter/jquery.autocompleter.css">
<link rel="stylesheet" href="../resource/plugins/mCustomScrollbar/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="../resource/plugins/simplPagination/simplePagination.css">
<link rel="stylesheet" href="../resource/plugins/easydropdown/easydropdown.css">
<link rel="stylesheet" href="../resource/plugins/zTree/css/zTreeStyle.css">
<link rel="stylesheet" href="../resource/plugins/nstSlider/jquery.nstSlider.css">
<link rel="stylesheet" href="../resource/plugins/datetimepicker/jquery.datetimepicker.css">
<link rel="stylesheet" href="../resource/plugins/timePicker/jquery.timePicker.css">
<link rel="stylesheet" href="../resource/plugins/icheck/icheck.css">
<link rel="stylesheet" href="../resource/plugins/ciTy/css/city.css">
<link rel="stylesheet" href="../resource/css/site.css">


<!--CSS3 Media Queries (for IE 6-8)-->
<!--[if lte IE 8]><script src="../resource/js/respond.min.js"></script><![endif]-->

<!-- Compatible with HTML5 tags -->
<script src="../resource/js/modernizr-2.8.3.js"></script>
<script src="../resource/js/jquery-1.8.3.min.js"></script>
<script src="../resource/js/jquery.cookie.js"></script> 
<!-- 国际化 -->
<script src="../resource/plugins/i18n/jquery.i18n.properties.js"></script>
<!-- 主题切换
<script src="../resource/js/themes.js"></script> -->
<script type="text/javascript">

function setJsLanguage(locale){
	var propertiesObj=null;
	if(locale){
		propertiesObj = {
		    name:"messages", 
			path:_ctx+"../resource/plugins/i18n/",
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
<script type="text/javascript" src="../resource/js/map.js"></script>
<!-- 模板渲染 --> 
<script src="../resource/plugins/artTemplate/template.js"></script> 
<script src="../resource/plugins/artTemplate/template-plugin.js"></script>
<!-- page --> 
<script src="../resource/plugins/simplPagination/jquery.simplePagination.js"></script>
<script src="../resource/plugins/layer/layer.js"></script>
<!-- message --> 
<!-- easydropdown --> 
<script src="../resource/plugins/easydropdown/jquery.easydropdown.min.js"></script> 
<!-- modal --> 
<script src="../resource/js/modal.js"></script>
<script src="../resource/plugins/autocompleter/jquery.autocompleter.js"></script>
<script src="../resource/js/tooltip.js"></script>
<script src="../resource/js/popover.js"></script>
<script src="../resource/plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

<!-- datetimepicker --> 
<script src="../resource/plugins/datetimepicker/jquery.datetimepicker.js"></script>

<!-- laydate -->
<script type="text/javascript" src="../resource/plugins/laydate/laydate.js"></script>

<!-- tab --> 
<script src="../resource/js/tab.js"></script>
<!-- icheck -->
<script src="../resource/plugins/icheck/icheck.min.js"></script>

<!-- ztree --> 
<script src="../resource/plugins/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script src="../resource/plugins/zTree/js/jquery.ztree.exhide-3.5.js"></script>
<!-- validate -->
<script src="../resource/plugins/validate/jquery.validate.js"></script>
<script src="../resource/plugins/validate/additional-methods.js" ></script> 
<!-- nstSlider -->
<script src="../resource/plugins/nstSlider/jquery.nstSlider.min.js"></script>

<script src="../resource/js/index/devices.js"></script>
<!--timePicker-->
<script src="../resource/plugins/timePicker/jquery.timePicker.js"></script>
<!--[if lte IE 9]>
<script src="../resource/js/jquery.placeholder.min.js"></script>
<script>$(function() {$('input[type="text"],input[type="password"], textarea').placeholder();});</script>
<![endif]--> 
<script type="text/javascript">
// 	var sessionid_cc=0;
//检查用户是否打开多个会话
	/* var sessionid="E3ED17F2C0279248A17A55089F5F2031";
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
	}
	
	function authorityValide(XMLHttpRequest){
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
	
	
	
</script>
<title>

	
	
		地标
	
-
Tracker</title>
<link rel="stylesheet" href="../resource/plugins/cityPicker/css/city-picker.css">
<script type="text/javascript" src="../resource/plugins/cityPicker/city-picker.data.js"></script>
<script type="text/javascript" src="../resource/plugins/cityPicker/city-picker.js"></script>

</head>

<body>
<input type="hidden" id="language" value="zh"/>
<input  type="hidden" id="flag" value="1">
<input type="hidden" id="geonId" value="">
<!-- <div class="b1-ccc b-b0" style="position: absolute; top:6px; left:350px; z-index:99; ">
	<input id="geoCityPicker" readonly="readonly" type="text" size="40" style="height:30px;"/>
</div>
<div style="position: absolute; top:6px; left:620px; z-index:99; ">
	<button class="btn btn-warning" id="reset" type="button">重置行政区域</button>
	<button class="btn btn-warning" onclick="getBoundary();" type="button">绘画行政区域</button>
	<button class="btn btn-warning" onclick="getCurrentLocation();" type="button">获取当前行政区域</button>
</div> -->
<span class="map-draw-circle" id="map-draw-circle" style="display: none;"></span>
<div class="map-search">
	<div id="baiduSearch" style="display: none;">
		<div class="input-group js-map-search">
			<div  id="masearchdiv" class="input-group-addon"><i class="fa fa-search c-999"></i></div>
			<input type="text" class="form-control" id="mapSearchText" placeholder="百度搜索地址">
			<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
		</div>
	</div>
	<div id="googleSearch" style="display: none;">
		<div class="input-group js-map-search">
			<div  id="googleasearchdiv" class="input-group-addon"><i class="fa fa-search c-999"></i></div>
			<input type="text" class="form-control" id="googlemapSearchText" title="Google搜索地址(国外)"  placeholder="Google搜索地址(国外)">
			<div id="googlesearchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
		</div>
	</div>
	
	<!-- 测试行政区域 -->
<!-- 	<input type="text" id="districtName"/> -->
<!-- 	<button onclick="getBoundary();">districtName</button> -->
</div>
<!--main 页的开始-->

	     
	    
  	
<input type="hidden" id="maptype" name="maptype" value="0"/>
<input type="hidden" id="coors" name="coors" value="0"/>
<input type="hidden" id="radius" name="radius" value="-1"/>
<span class="draw-fence-btn" style="display: none;"><button type="button" id="drawAreaGeo" class="btn btn-default btn-sm w120 text-ellipsis">绘制行政区域围栏</button></span>
<div class="b1-ddd draw-fence-box" style="display: none;>
	<form class="form-horizontal clearfix p-15">
		<div class="form-group m-b10">
		 <label class="col-sm-12 cotrol-label">绘制行政区域围栏</label>
		</div>
		<div class="form-group">
			<div class="col-sm-12" id="geoCityPickerTitle" title="">
		      <input id="geoCityPicker" class="form-control form-control-sm" readonly type="text" value="" data-toggle="city-picker">
		    </div>
		</div>
		<div class="form-group m-b0">
			<div class="col-sm-12 ta-c">
		      <button type="button" onclick="getBoundary(0);" class="btn btn-primary btn-sm">绘制</button>
			  <button type="button" id="reset" class="btn btn-default btn-sm">重置</button>
		    </div>
		</div>
	</form>
</div>
<span id="map-pin" class="map-pin dn"><i class="fa fa-info-circle"></i>&nbsp;图形绘制完毕请双击鼠标左键保存&nbsp;重新打开后通过双击已有图形进行删除</span>
<div id="allmap"></div>
	
<div style="display: none;">
	<form  id="giveanalarmForm" name="giveanalarmForm" method="post" action="/geozone/giveanalarm">
		<input type="hidden" id="geonid" name="id"/>
		<input type="hidden" id="geonames" name="geonames"/>
		<input type="hidden" id="userCount" name="userCount" value="0"/>
		<input type="hidden" id="agencyId" name="agencyId" value="<%=request.getParameter("id")%>"/>
		<input type="submit" id="sub"/>
	</form>
</div>
<!--设置围栏-->
<div id="setFenceModal" class="modal fade in oh" aria-hidden="false">
    <div class="modal-dialog">
      <div class="modal-content w800">
        <div class="modal-header">
          <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span></button>
          <h4 class="modal-title">围栏设置</h4>
        </div>
        <div class="modal-body">
          <div class="mah-400 oy-a">
            <div class="row">
              <div class="col-md-5">
                <div class="tree-box">
                  <div class="tree-search"> <i class="tree-search-icon"></i>
                    <input type="text" placeholder="搜索" name="imei" id="key" value="" class="empty fs-12" />

                    <input type="hide" id="name" name="keyType" class="hide" checked />
                    <input type="hide" checked="" style="margin-left:36px;" class="hide" name="funType" id="getNodesByParamFuzzy">

                  </div>
                  <div class="tree-scroll">
                    <ul id="treeDemo" class="ztree">
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-2">
                <div class="toggle ta-c">
                  <button id="chosen-all-node" type="button" title="添加全部">&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;</button>
                  <br>
                  <br>
                  <button id="chosen-node" type="button" title="添加">&nbsp;&nbsp;&gt;&nbsp;&nbsp;</button>
                  <br>
                  <br>
                  <button id="remove-node" type="button" title="移除">&nbsp;&nbsp;&lt;&nbsp;&nbsp;</button>
                  <br>
                  <br>
                  <button id="remove-all-node" type="button" title="移除全部">&nbsp;&nbsp;&lt;&lt;&nbsp;&nbsp;</button>
                </div>
              </div>
              <div class="col-md-5">
                <div class="tree-box">
                  <div class="chosen-title fs-12">
                    <a class="delete-all fr" id="delete-all" href="javascript:;">
                      清空
                    </a>
                    已选（<span id="chosen-number" class="chosen-number">0</span>/<span id="all-number" class="all-number">10</span>）</div>
                  <div class="chosen-scroll">
                    <ul class="chosen-list ztree" id="chosen-list">
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-tail">
            <form class="form-horizontal form-preset form-ellipsis p-t10" action="" id="acc_configure_form">
              <div data-example-id="inline-checkboxes-radios" class="bs-example p-t15">
                围栏告警设置：&emsp;&emsp;
                <label class="icheck-min"> 
                  <input type="checkbox" class="geozone-geolist-checkbox" id="geoCheckboxIn" value="in" name="inOut" checked="checked"> &nbsp;
                  进&emsp;是否开启
                </label>
                &nbsp;&nbsp;
                <label class="icheck-min">    
                  <input type="checkbox" class="geozone-geolist-checkbox" id="geoCheckboxOut" value="out" name="inOut" checked="checked"> &nbsp;
                  出&emsp;是否开启
                </label>
              </div>


              <div data-example-id="inline-checkboxes-radios" class="js-email-acc bs-example p-t10">
                告警方式：&emsp;&emsp;
                <label class="icheck-min">
                  <input type="checkbox" id="mapEmailSend" name="mapEmailSend"> &nbsp;
                  邮件发送
                </label>
              </div>
              <div class="form-group js-mapEmail-address dn m-b0">
                <label class="col-md-3 control-label p-t5 p-r0"><span class="c-red"></span>
                  邮件地址：</label>
                <div class="col-md-6 form-inline">
                  <div><input type="text" class="form-control form-control-sm" placeholder="请输入邮件地址" name="mapEmail" size="40">&emsp;<button type="button" class="btn btn-default btn-sm js-add-mapEmail-address"><i class="fa fa-plus"></i></button></div>
                  <ul class="js-input-mapEmail-list"></ul>
                </div>
              </div>
              </form>
            </div>
          </div>
        </div>
        <div class="modal-footer ta-c">
          <button class="btn btn-primary mw-100 cancelAlarm" type="button" onclick="saveMapConfigureInfo() ">
            保存</button>
          <button data-dismiss="modal" class="btn btn-default mw-100 cancelAlarm" type="button">
            取消</button>
        </div>
      </div>
    </div>
  </div>
  
<!-- <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> -->
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
<script type="text/javascript" src="../resource/js/map/DrawingManager_min.js"></script>
<link rel="stylesheet" href="../resource/js/map/DrawingManager_min.css" />
<link rel="stylesheet" href="../resource/js/map/TrafficControl_min.css" />
<script src="../resource/js/map/TrafficControl.js"></script>
<script src="../resource/js/map/TextIconOverlay_min.js"></script>
<script src="../resource/js/map/MarkerClusterer_min.js"></script>

<!-- <link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" /> -->

<!-- Google 相关 -->


  
  

<script type="text/javascript" src="../resource/js/index/infobox.js"></script>
<script type="text/javascript" src="../resource/js/index/InfoBox_min.js"></script>

<script type="text/javascript" src="../resource/js/index/LocationMap2.js"></script>

<script src="../resource/js/index/markerclusterer.js"></script>



<script type="text/javascript">


//点击按钮地图全屏
// function mapFullScreen(allMapType){
// 	$(".js-full-toggle-btn").click(function(){
// 		if(!$("body").hasClass("full-map")){
// 		  $("body").addClass("full-map");
// 		  $(this).find(".fa").removeClass("fa-arrows-alt").addClass("fa-compress");
// 		  $("#allmap").css("height",$(window).height());
// 		  $(window).resize(function(){
// 		    $("#allmap").css("height",$(window).height());
// 		  });
// 		}else{
// 		  $("body").removeClass("full-map");
// 		  mapAutoHeight();
// 		  $(window).resize(function(){
// 		    mapAutoHeight();
// 		  });
// 		  $(this).find(".fa").removeClass("fa-compress").addClass("fa-arrows-alt");
// 		}
// 		if(allMapType=='googleMap'){
// 			google.maps.event.trigger(allMap, 'resize'); 
// 		}
// 	});
// }

//普通
// $("#selectMap").change(function(){
// 	var mapType=$(this).children('option:selected').val();//这就是selected的值 
// 	if(mapType==allMapType){
// 		return;
// 	}
// 	allMapType=mapType;
// 	if(mapType=='googleMap'){
// 		initGoogleMap();
// 		addGoogleTrafficControl();
// 		if( typeof getAllBaiduStatus === 'function' ){
// 			getAllBaiduStatus();
// 		}
//  		if( typeof getBaiduStatus === 'function' ){
// 			getBaiduStatus();
// 		}
// 	}else if(mapType=="baiduMaps"){
// 		initBaiDuMap();
// 	}else{
// 		initBaiDuMap();
// 		addTrafficControl();
// 		if( typeof getAllGoogleStatus === 'function' ){
// 			getAllGoogleStatus();
// 		}
//  		if( typeof getGoogleStatus === 'function' ){
// 			getGoogleStatus();
// 		}
//  		var ctrl = new BMapLib.TrafficControl({
//  			showPanel: true //是否显示路况提示面板
//  		});      
// 	}
// 	if( typeof initPiont === 'function' ){
// 		initPiont();
// 	}
// 	window.setTimeout(function(){searchCondition(curDeviceStatus);},100);
	
// });

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

function myCenterAndZoom(result){
		var cityName = result.name;
		var centerPoint = result.center;
		allMap.setCenter(cityName);
		allMap.centerAndZoom(cityName,12);
		//marker = new BMap.Marker(centerPoint);
		//allMap.addOverlay(marker);//添加标记
}

function initBaiDuMap(){
	// 百度地图API功能
 	allMap= new BMap.Map("allmap",{enableMapClick:false}); //创建Map实例 divID必须为allmap
 	
 	
 	//定位城市
 	var myCity = new BMap.LocalCity();
 	if(myCity){
 		myCity.get(myCenterAndZoom);
 	 	
 	}else{
 		allMap.centerAndZoom(new BMap.Point(116.3942466,39.9135819), 5); // 初始化地图,设置中心点坐标和地图级别，默认为中国116.3942466,39.9135819
 	}
 	
 	allMap.addControl(new BMap.MapTypeControl()); //添加地图类型控件
 	allMap.addControl(new BMap.NavigationControl());//设置导航条 （左上角，添加默认缩放平移控件）
 	allMap.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
 	allMap.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_HYBRID_MAP]}));//控制地图模式去掉三维选择
 	//allMap.setMapStyle({style:'googlelite'});
 	allMap.clearOverlays();
 	//loadBaiduMap();
 	allMap.addEventListener("click", showInfo);
 	
    //var cr = new BMap.CopyrightControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT});  
    //cr.addCopyright({id: 1, content: "<a href='#' style='font-size:20px;background:yellow'>我是自定义版权控件呀</a>"});  
    //allMap.addControl(cr); //添加版权控件  
 	

	
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


//开启测距 -->需要引入DistanceTool_min.js
function openDistanceTool(){
	var myDis = new BMapLib.DistanceTool(map);
	map.addEventListener("load",function(){
		myDis.open();  //开启鼠标测距
		//myDis.close();  //关闭鼠标测距大
	});
}


function initGoogleMap(){
	//Google地图API功能
	//纬度&经度
	if(allMap&&allMap.removeEventListener)
	{
		allMap.removeEventListener("zoomend",baiduzoomendEvent);
	}
	var myCenter=new google.maps.LatLng(10.7220357,14.7292155);
// 	if (navigator.geolocation) {
// 		//获取当前地理位置
// 		navigator.geolocation.getCurrentPosition(function (position) {
// 			var coords = position.coords;
// 			//console.log(position);
// 			//指定一个google地图上的坐标点，同时指定该坐标点的横坐标和纵坐标
// 			var latlng = new google.maps.LatLng(coords.latitude, coords.longitude);
// 			if(latlng){
// 				//center = latlng;
// 				var mapProp = {
// 						center:latlng,
// 						zoom:12,
// 						mapTypeId:google.maps.MapTypeId.ROADMAP,
// 						mapTypeControlOptions: { 
// 							style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR, position: google.maps.ControlPosition.TOP_RIGHT
// 						}
// 				};
// 				allMap = new google.maps.Map(document.getElementById("allmap"),mapProp);
				
// 				placeMarker(latlng);
// 				intoGoogleTools();//初始化google地图绘制工具
// 				//loadGooleMap();
// 				googleSeach();
// 				addGoogleTrafficControl();
// 				return;
// 			}
// 		}); 
// 	}
	var mapProp = {
			center:myCenter,
			zoom:2,
			mapTypeId:google.maps.MapTypeId.ROADMAP,
			mapTypeControlOptions: { 
				style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR, position: google.maps.ControlPosition.TOP_RIGHT
			}
	};
	allMap = new google.maps.Map(document.getElementById("allmap"),mapProp);
	//loadGooleMap();
	//addGoogleTrafficControl();
}

//增加标记
function placeMarker(location) {
	
	  var marker = new google.maps.Marker({
	    position: location,
	    map: allMap,
	  });
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
	var icon	=	 {icon:new BMap.Icon(_ctx+"../resource/images/36x43/"+carType+"/"+carType+"_"+stauts+".png" ,new BMap.Size(23,28)),offset:new BMap.Size(0,-22),imageOffset:new BMap.Size(0,-22)};
	return icon;
}

//run Direction
function run_bd_icon(carType,direction){
	var runicon	=	 {icon:new BMap.Icon(_ctx+"../resource/images/runcar/"+carType+"/"+carType+"_"+parseInt((Number(direction)+22.5)/45)+".png"	,new BMap.Size(50,50)),offset:new BMap.Size(0,-22),imageOffset:new BMap.Size(0,-22)};
	return runicon;
}
//run Direction
function runxz_bd_icon(carType,direction){
	var runicon	=	 {icon:new BMap.Icon(_ctx+"../resource/images/runcar/"+carType+"/xz_"+carType+"_"+parseInt((Number(direction)+22.5)/45)+".png"	,new BMap.Size(50,50)),offset:new BMap.Size(0,-22),imageOffset:new BMap.Size(0,-22)};
	return runicon;
}

function getbdother(carType){
	var icon	=	 {icon:new BMap.Icon(_ctx+"../resource/images/36x43/"+carType+".png" ,new BMap.Size(36,44)),offset:new BMap.Size(0,-22),imageOffset:new BMap.Size(0,-22)};
	return icon;
}

//stauts 0,离线; 1,在线静止; 2,在线运动.
function getggIcon(carType,stauts){
	var icon	=	{url:_ctx+"../resource/images/36x43/"+carType+"/"+carType+"_"+stauts+".png" ,size:new google.maps.Size(36,44),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(18,44)};
	return icon;
}

//run Direction
function run_gg_icon(carType,direction){
	var runicon	=	{url:_ctx+"../resource/images/runcar/"+carType+"/"+carType+"_"+parseInt((Number(direction)+22.5)/45)+".png"	,size:new google.maps.Size(50,50),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(25,50)};
	return runicon;
}
//run Direction
function runxz_gg_icon(carType,direction){
	var runicon	=	{url:_ctx+"../resource/images/runcar/"+carType+"/xz_"+carType+"_"+parseInt((Number(direction)+22.5)/45)+".png"	,size:new google.maps.Size(50,50),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(25,25)};
	//debugger;
	return runicon;
}


function getggother(carType){
	var icon	=	{url:_ctx+"../resource/images/36x43/"+carType+".png"	,size:new google.maps.Size(36,44),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(18,44)};
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


<script type="text/javascript">	
var isForeign = "TUQIANG";
var allMap;//公共的默认加载百度google地图
var consoleGeo = false;
var language=$("#language").val();
var allMapType = $.cookie('currtMapType');
var myMapType = "";
$(document).ready(function(){
	setJsLanguage(language);
	if(allMapType!=null&&(allMapType=="googleMap"||allMapType=="baiduMap")){
		if(allMapType=="googleMap"){
			$("#map-pin").hide();
			if($("#flag").val() == 0){
				$(".draw-fence-btn").show();
			}
			if($("#flag").val() == 2){
				$(".map-draw-circle").addClass("m-l0");
			}else{
				$(".map-draw-circle").removeClass("m-l0");
			}
			$("#googleSearch").show();
			initGoogleMap();
			intoGoogleTools();//初始化google地图绘制工具
			$("#trafficDiv").hide();
			$(".map-draw-circle").show();
			googleSeach();
			myMapType = "google";
		}else{
		    debugger
			$("#map-pin").show();
			if($("#flag").val() == 0){
				$(".draw-fence-btn").show();
			}
			$("#baiduSearch").show();
			initBaiDuMap();//默认自动加载百度地图
			intoBaiDuMapTools("polygon");//初始化百度地图绘制工具
			alertHtml(1);
			baiduInit();
			
			myMapType = "baidu";
		}
	}else{
		if(language!='zh'){
			$("#map-pin").hide();
// 			if($("#flag").val() == 0){
// 				$(".draw-fence-btn").show();
// 			}
			if($("#flag").val() == 2){
				$(".map-draw-circle").addClass("m-l0");
			}else{
				$(".map-draw-circle").removeClass("m-l0");
			}
			$("#googleSearch").show();
			initGoogleMap();
			intoGoogleTools();//初始化google地图绘制工具
			$("#trafficDiv").hide();
			
			$(".map-draw-circle").show();
			googleSeach();
			myMapType = "google";
		}else{
			if(isForeign == "TUQIANG"){
				$("#map-pin").show();
				if($("#flag").val() == 0){
					$(".draw-fence-btn").show();
				}
				$("#baiduSearch").show();
				initBaiDuMap();//默认自动加载百度地图
				intoBaiDuMapTools("polygon");//初始化百度地图绘制工具
				alertHtml(1);
				baiduInit();
				myMapType = "baidu";
				showPolygon();
				
			}else{
				$("#map-pin").hide();
// 				if($("#flag").val() == 0){
// 					$(".draw-fence-btn").show();
// 				}
				if($("#flag").val() == 2){
					$(".map-draw-circle").addClass("m-l0");
				}else{
					$(".map-draw-circle").removeClass("m-l0");
				}
				$("#googleSearch").show();
				initGoogleMap();
				intoGoogleTools();//初始化google地图绘制工具
				$("#trafficDiv").hide();
				$(".map-draw-circle").show();
				googleSeach();
				myMapType = "google";
			}
		}
	}
	
});

function setJsLanguage(locale){
	var propertiesObj=null;
	if(locale){
		propertiesObj = {
		    name:"messages", 
			path:_ctx+"../resource/plugins/i18n/",
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

function setLanguage(locale){
	$.post("/setLanguage?locale="+locale,function(Ret){
		window.location.reload();
	});
}
$("#geoCityPicker").citypicker();
$('#reset').click(function () {
	$("#geoCityPicker").citypicker('reset');
});
// $("#geoCityPicker").citypicker({
// 	province:"江苏省",
// 	city:"常州市",
// 	district:"溧阳市"
// });
</script>
<script type="text/javascript" src="../resource/js/geozone/geozonebaidumap.js"></script>
<script type="text/javascript" src="../resource/js/geozone/geozonegooglemap.js"></script>
<script type="text/javascript">
var geozoneCount='';//围栏限制数
var landMarCount='1000'; //地标限制数
var blackCarCount ='';//黑车限制数
</script>
<script>
	$(".draw-fence-btn").click(function(){
		$(".draw-fence-box").toggleClass("hide");
	})
</script>
</body>
</html>

