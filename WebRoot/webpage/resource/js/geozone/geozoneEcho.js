var geozId=$("#geozId").val();

var data;
// initBaiDuMap();
// allMap.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_HYBRID_MAP]}));
// echoGeozoneBaiduMapData(data);//百度回显
// $("#selectGeozoneMap").change(function(){
// 	//echoGeozone();
// 	var mapType=$(this).children('option:selected').val();//这就是selected的值 
// 	if(mapType=='googleMap'){
// 		//initGoogleMap();
// 		echoGeozoneGoogleMapData(data);//google回显
// 	}else{
// 		initBaiDuMap();
// 		allMap.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_HYBRID_MAP]}));
// 		echoGeozoneBaiduMapData(data);//百度回显
// 	}
// });

function echoGeozone(geozId, geoname){
	$.ajax({	
		type:'POST',
		url:_ctx+"/geozone/getgeozone",
		data:{"geozId":geozId,"geoname":geoname},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
		cache:false, 
		success: function(ret){
				if (ret.ok) {
					data = ret.data;
					ret.msg
					var language = $("#language").val();
					var allMapType = $.cookie('currtMapType');
					if(allMapType){
						if(allMapType=="googleMap"){
							initGoogleMap();
							echoGeozoneGoogleMapData(data);//谷歌回显
						}else{
							initBaiDuMap();
							allMap.addControl(new BMap.MapTypeControl({
								mapTypes : [ BMAP_HYBRID_MAP ]
							}));
							echoGeozoneBaiduMapData(data);//百度回显
						}
					}else{
						if (language !="zh") {
							initGoogleMap();
							echoGeozoneGoogleMapData(data);//谷歌回显
						} else {
							initBaiDuMap();
							allMap.addControl(new BMap.MapTypeControl({
								mapTypes : [ BMAP_HYBRID_MAP ]
							}));
							echoGeozoneBaiduMapData(data);//百度回显
						}
					}
				}
			}
		});
	}

	//百度地图回显
	function echoGeozoneBaiduMapData(data) {
		var typeMap = data.mapType;
		var scales = Number(data.scale);
		if (scales <= 0) {
			scales = 13;
		}
		var datas = null;
		if (typeMap == 'google') {
			datas = data.backGeom;
		} else {
			datas = data.geom;
		}
		var coords = datas.point;

		var coords = datas.point;
		var geomType = datas.type;

		if (geomType == 'circle') {
			var radius = datas.radius;
			var circlePoint = new BMap.Point(datas.point[0].lng,
					datas.point[0].lat);
			allMap.centerAndZoom(circlePoint, scales); //设置中心点坐标和地图级别
			var circle = new BMap.Circle(circlePoint, radius);
			//circle.setBounds() 
			circle.setFillColor("#ff0000"); //填充颜色
			circle.setStrokeColor("#0000ff"); //边线颜色
			allMap.addOverlay(circle); //增加圆
			//allMap.setViewport(circlePoint);
		} else {
			var centerAndZoomPointLat;
			var centerAndZoomPointLng;
			var BmapPointArray = [];
			for (var i = 0; i < coords.length; i++) {
				var lat = coords[i].lat;
				var lng = coords[i].lng;
				centerAndZoomPointLat = coords[0].lat;
				centerAndZoomPointLng = coords[0].lng;
				var BmapPoint = new BMap.Point(lng, lat);
				BmapPointArray.push(BmapPoint);
			}
			//回显多边形
			var polygon = new BMap.Polygon(BmapPointArray, {
				strokeColor : "#0000FF",
				strokeOpacity : 0.8,
				strokeWeight : 2,
				fillColor : "#FF0000",
				fillOpacity : 0.4,
				editable : false, //是否可以编辑
				draggable : false
			//是否可拖动	
			}); //创建多边形
			//allMap.centerAndZoom(new BMap.Point(centerAndZoomPointLng,centerAndZoomPointLat),scale); //设置中心点坐标和地图级别
			allMap.addOverlay(polygon); //增加多边形
			allMap.setViewport(BmapPointArray);
			//allMap.setZoom(scales); //设置中心点坐标和地图级别
		}
	}
	//google 地图回显示
	function echoGeozoneGoogleMapData(data) {
		var typeMap = data.mapType;
		var scales = Number(data.scale);
		if (scales <= 0) {
			scales = 13;
		}
		var datas = null;
		if (typeMap == 'baidu') {
			datas = data.backGeom;
		} else {
			datas = data.geom;
		}
		var coords = datas.point;
		var geomType = datas.type;
		if (geomType == 'circle') {
			var circlePoint = new google.maps.LatLng(datas.point[0].lat,
					datas.point[0].lng);
			var dataradius = Number(datas.radius);
			//var myLatlng = new google.maps.LatLng(centerAndZoomPointLat,centerAndZoomPointLng);
			var mapOptions = {
				zoom : scales,
				center : circlePoint,
				//mapTypeId: google.maps.MapTypeId.TERRAIN
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			//$("#allmap").html("");
			//allMap = new google.maps.Map(document.getElementById("allmap"),mapOptions);
			allMap.setZoom(scales);
			allMap.setCenter(circlePoint);
			var populationOptions = {
				strokeColor : '#FF0000',
				strokeOpacity : 0.8,
				strokeWeight : 2,
				fillColor : '#FF0000',
				fillOpacity : 0.35,
				map : allMap,
				center : circlePoint,
				radius : dataradius
			};
			var cityCircle = new google.maps.Circle(populationOptions);
			//var bounds = new google.maps.LatLngBounds ();
			//bounds.extend (circlePoint);
			//allMap.fitBounds(bounds);
		} else {
			var centerAndZoomPointLat;
			var centerAndZoomPointLng;
			var GmapPointArray = [];
			var bounds = new google.maps.LatLngBounds();
			for (var i = 0; i < coords.length; i++) {
				var lat = coords[i].lat;
				var lng = coords[i].lng;
				centerAndZoomPointLat = coords[0].lat;
				centerAndZoomPointLng = coords[0].lng;
				var pointArray = new google.maps.LatLng(lat, lng);
				GmapPointArray.push(pointArray);
				bounds.extend(pointArray);
			}
			var myLatlng = new google.maps.LatLng(centerAndZoomPointLat,
					centerAndZoomPointLng);
			var mapOptions = {
				zoom : scales,
				center : myLatlng,
				mapTypeId : google.maps.MapTypeId.ROADMAP,
				mapTypeControlOptions : {
					style : google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
					position : google.maps.ControlPosition.TOP_RIGHT
				}
			};
			allMap = new google.maps.Map(document.getElementById("allmap"),
					mapOptions);

			var polygonGoogle = new google.maps.Polygon({
				path : GmapPointArray,
				strokeColor : "#0000FF",
				strokeOpacity : 0.8,
				strokeWeight : 2,
				fillColor : "#FF0000",
				fillOpacity : 0.4,
				editable : false, //是否可以编辑
				draggable : false
			//是否可拖动
			});
			polygonGoogle.setMap(allMap);
			allMap.fitBounds(bounds);
		}
	}
	
//function echoInfowindowData(data){
//	if (data.typeMap == 'google') {
//		datas = data.backGeom;
//	} else {
//		datas = data.geom;
//	}
//	infowindow.open(allMap);
//	infowindow.setPosition(circlePoint);
//	coors="("+datas.point[0].lat+","+datas.point[0].lng+")";
//	$("#coors").val(coors);
//	$("#bdchangeRadius").val(datas.radius);
//	$("#radius").val(datas.radius);
//	$("#maptype").val("baidu");
//	$("#type").val(datas.type);
//	$("#geonameHtml").val(data.title);
//	$("#descriptionHtml").val(data.title);
//	$("#geoZoom").val(Number(data.scale));
//	$("#flag").val("2");
//}