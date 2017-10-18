<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=uf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=b55lMArV9Tg1uFOY980gzpkcMCKvVfI5"></script>
    <script src="../resource/js/jquery-1.8.3.min.js"></script>
	<style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";font-family:"微软雅黑";}
		#allmap{width:100%;height:500px;}
		p{margin-left:5px; font-size:14px;}
	</style>
</head>
<body>
	<div id="allmap"></div>
	<input type="text" class="plat" style="display:none" value="<%=request.getParameter("lat") %>" />
	<input type="text" class="plon" style="display:none" value="<%=request.getParameter("lon") %>"/>
	<input type="text" class="paddress" style="display:none" value="<%=request.getParameter("address")%>"/>
</body>
</html>


<script type="text/javascript">	

$(document).ready(function(){
	initBaiDuMap();
});
var allMap;
var marker ;
function initBaiDuMap(){
 	allMap= new BMap.Map("allmap",{enableMapClick:false}); //创建Map实例 divID必须为allmap
 	
 	var plat=$(".plat").val();
 	var plon=$(".plon").val();
 	var paddress=$(".paddress").val();
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
 	if(plat!=""&&plon!=""){
 	   marker = new BMap.Marker(new BMap.Point(plon,plat));  // 创建标注
       allMap.addOverlay(marker);

     //画图
   	  var label = new BMap.Label(paddress,{offset:new BMap.Size(20,-10)});
    //  marker.setLabel(label);
      
 	}else{
 	   allMap.clearOverlays();
 	}
 	
 	
 	//loadBaiduMap();
 	allMap.addEventListener("click", showInfo);
    //var cr = new BMap.CopyrightControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT});  
    //cr.addCopyright({id: 1, content: "<a href='#' style='font-size:20px;background:yellow'>我是自定义版权控件呀</a>"});  
    //allMap.addControl(cr); //添加版权控件  
 	

	
}


function showInfo(e){
	 allMap.clearOverlays();  
     //存储经纬度
     var lng = e.point.lng;
     var lat = e.point.lat;
     
     //在地图上面描点
     marker = new BMap.Marker(new BMap.Point(lng,lat));  // 创建标注
     allMap.addOverlay(marker);

    var gc = new BMap.Geocoder();
     //获取地址的数据地址
     var pt = e.point;
     gc.getLocation(pt, function(rs){
     var addComp = rs.addressComponents;
     var address = addComp.province +  addComp.city + addComp.district + addComp.street + addComp.streetNumber;

     //画图
      var label = new BMap.Label(address,{offset:new BMap.Size(20,-10)});
      marker.setLabel(label);
      
      parent.setAddress(address,lat,lng);
     });

}
function myCenterAndZoom(result){
		var cityName = result.name;
		var centerPoint = result.center;
		allMap.setCenter(cityName);
		allMap.centerAndZoom(cityName,12);
}

</script>


