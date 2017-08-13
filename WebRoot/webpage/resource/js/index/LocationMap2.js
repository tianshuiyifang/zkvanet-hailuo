var baiduzoomendEvent=null;
var vehicleArray = null;//设备名称数据集
var markindex=100;
var showLandmark_OK=false;
var overlayArray;//显示地标名称的对象数组

//显示设备名称的相关对象
var clickImei;
var clickDialog;
var clickMarker;
var clickVehicle;
var clickNum = 1000;

$("#checkbox1").on('ifUnchecked', function(event) {
	hideLandmark();
	showLandmark_OK = false;
});

function loadGooleMap() {
	$("#mapdreess").slideUp();
	var imeiMaps = {};// 所有车辆设备信息
	var points =  new google.maps.LatLngBounds();;// 车辆坐标点信息

	var dialog = null;// 车辆信息框
	var _gBusy = false;

	var markerNum = 0;// 地图坐标的数量
	var markerMaxNum = 500;// 允许显示的最大数量
	

	window.start = function() {
		timeoutRunFlag = true;
	}
	window.stop = function() {
		timeoutRunFlag = false;
	}

	// acc状态对应的国际化
	var accstatus = {
		"status1" : "index.On",
		"status0" : "index.Close"
	};

	var landmarkList = null;// 地标
	var gglandmark = [];// google地图地标
	
	var bdvehiclemark = [];// 车辆标记
	window.bdvehiclemark=bdvehiclemark;
	/**
	 * google地图下获取指定车辆的标记
	 */
	var getMark = function(vehicle) {
		if (vehicle.statusMap && vehicle.statusMap.gps) {
			var vgps = vehicle.statusMap.gps;
			var point = getPoint(vehicle)
		//	points.push(point);
			points.extend(point);
			var icon = getggIcon(vehicle.vechleioc, vehicle.statusMap.status);
			if (vehicle.statusMap.status == 2) {
				icon = run_gg_icon(vehicle.vechleioc, Number(vgps.direction));
			}
			var marker = new google.maps.Marker({
				// map : allMap,
				position : point,
				icon : icon
			});
			marker.setZIndex(vehicle.statusMap.status+90);
			if(prev_maker){prev_maker.setZIndex(vehicle.statusMap.status-10);}//prev_maker是告警信息图标
			// 标记点击事件
			google.maps.event.addListener(marker, 'click', function(e, imei) {
				showInfoWindow(vehicle.imei);
				
			});
//			marker.addEventListener("click", function() {
//				showInfoWindow(vehicle.imei);
//			});

			return marker;
		} else {
			return null;
		}
	}

	/**
	 * googleMap获取知道车辆的坐标点
	 */
	var getPoint = function(vehicle) {
		if (vehicle.statusMap && vehicle.statusMap.gps) {
			var vgps = vehicle.statusMap;
			var point = new google.maps.LatLng(vgps.gg.lat, vgps.gg.lng)
		//	var point = new BMap.Point(vgps.longitude, vgps.latitude);
			return point;
		} else {
			return null;
		}
	}

	/**
	 * 清除地图上所有车辆的坐标点
	 */
	var clearVehicleMark = function(curFlag) {
		for (var i = 0; i < bdvehiclemark.length; i++) {
			if (curImei&&(curFlag==null||!curFlag)) {
				var _vehicle = imeiMaps[curImei];
				if (_vehicle && _vehicle.marker) {
					if (bdvehiclemark[i] == _vehicle.marker) {
						continue;
					}
				}
				bdvehiclemark[i].setMap(null);
			//	allMap.removeOverlay(bdvehiclemark[i]);
			}
			else
				{
				bdvehiclemark[i].setMap(null);
			//	allMap.removeOverlay(bdvehiclemark[i]);
				}
		}
	}

	/**
	 * 刷新地图的所有地标
	 *//*
	var reloadDevicestatus = function() {
		window.clearTimeout(setTimeOutId);
		checkbox_Online = $("#checkbox_Online:checked").length;// 在线
		checkbox_Offline = $("#checkbox_Offline:checked").length;// 离线
		$.get(_ctx + "/getAllStatus?_=" + new Date().getTime(), {
			"imeis" : imeis,
			"userId" : userId,
			"searchParentId" : searchParentId,
			"checkbox_Online" : checkbox_Online,
			"checkbox_Offline" : checkbox_Offline
		}, function(result) {
			
			var data = result.data;
			showDevicestatus(data);
			intervaltime = parseInt($("#intervaltime").val());
			refleshTime();
		})
	}
	*/
	
	
	/**
	 * google地图下的设备标点
	 */
	var showDevicestatus=function(data)
	{
		$("#mapdreess").slideUp();//初始加载隐藏地址栏
		clearMapDeviceName();//清除设备名
		vehicleArray = new Array();
		/**
		 * 防止两次ajax回调无法清空imeiMaps;
		 */
		clearMapData(true);
		for (var i = 0; i < data.length; i++) {
			
			if (data[i].vehicles) {
				for (var j = 0; j < data[i].vehicles.length; j++) {
					var vehicle = data[i].vehicles[j];
					if(vehicle.show==-1||vehicle.show==-2)
					{
						continue;
					}

					if (imeiMaps[vehicle.imei] != null) {
						if (imeiMaps[vehicle.imei].marker == null) {
							imeiMaps[vehicle.imei] = {
								vehicle : vehicle
							};
							if (markerNum <= markerMaxNum) {
								var marker = getMark(vehicle);
								if (marker != null) {
									marker.setMap(allMap);
									//allMap.addOverlay(marker);
									bdvehiclemark.push(marker);
									imeiMaps[vehicle.imei].marker = marker;
									markerNum++;
								}
							}
						} else {
							imeiMaps[vehicle.imei].vehicle = vehicle;
							var marker = imeiMaps[vehicle.imei].marker;
							marker.setPosition(getPoint(vehicle));
							var devIcon = getggIcon(vehicle.vechleioc, vehicle.statusMap.status);
							if (vehicle.statusMap.status == 2) {
								devIcon = run_gg_icon(vehicle.vechleioc, Number(vehicle.statusMap.gps.direction));
								
							}
							
							marker.setIcon(devIcon);
							marker.setMap(allMap);
						//	marker.draw();
						}
					} else {
						imeiMaps[vehicle.imei] = {
							vehicle : vehicle
						};
						if (markerNum <= markerMaxNum) {
							var marker = getMark(vehicle);
							
							if((vehicle.statusMap) && (vehicle.statusMap.gps)){
								
								var isAdd = true;
								for(var s = 0; s<vehicleArray.length; s++){
									var imei = vehicleArray[s].get("vehicle")["imei"];
									if(vehicle.imei==imei){isAdd= false;}
								}
								if(isAdd){
									initGoogleMapDeviceName(vehicle, marker);
								}
							}
						//	marker.setPosition(getPoint(vehicle));
							/*var devIcon = getggIcon(vehicle.vechleioc, vehicle.statusMap.status);
							if (vehicle.statusMap.status == 2) {
								devIcon = run_gg_icon(vehicle.vechleioc, Number(vehicle.statusMap.gps.direction));
							}*/
					
							
							if (marker != null) {
								if(clickImei && vehicle.imei==clickImei){
									//设置当前选中设备优先显示车辆图标标注
									marker.setZIndex(clickNum++);
								}
								marker.setMap(allMap);
							//	allMap.addOverlay(marker);
								bdvehiclemark.push(marker);
								imeiMaps[vehicle.imei].marker = marker;
								markerNum++;
							}

						}
					}

				}
			}

		}

		if (!isrefresh&&curImei==null) {// 显示当前imei的窗口刷新时保持窗口不关闭
			
			allMap.fitBounds(points);
			if(markerNum==0)
			{
				allMap.setZoom(3);
				allMap.panTo(new google.maps.LatLng(20, 0));
			}
		}
		if($("#checkboxForDeviceName").is(":checked")){
			showMapDeviceName();
		}
	}
	
	var vehicleLocationClick = function(imei,flag) {
		//console.log(intervaltime);
		if(intervaltime<=1)
		{
			return;
		}
		if(!flag){
			$("#mapdreess").slideUp();
		}
		showInfoWindow(imei,flag);
		
	}

/*	var opts = {
		width : 300, // 信息窗口宽度
		height : 300, // 信息窗口高度
		enableMessage : false,// 设置允许信息窗发送短息
		title : "",
		enableCloseOnClick : false
	};*/

	/**
	 * 显示地址栏
	 */
	var showAddress = function(vehicle) {
		
		var geoc = new google.maps.Geocoder();
		geoc.geocode({
			'latLng' : getPoint(vehicle)
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (status == google.maps.GeocoderStatus.OK) {
					if (results[0] && results[0].formatted_address) {
						address = results[0].formatted_address;
						var sindex = address.indexOf("邮政编码");
						if (sindex > 0) {
							address = address.substring(0, sindex)
						}
					}
					$("#mapdreess").slideDown();
					$("#mapdreess").text(address);
					
				}else {
					var t = setTimeout(function() {
						$("#mapdreess").slideDown();
						$("#mapdreess").text("google地图解析地址失败!")
					}, 2000);
				}
				
				
			}
		});
		
		

	}
	

	/**
	 * google显示车辆信息窗口
	 */
	var showInfoWindow = function(imei,flag) {
		//保存当前点击的imei
		clickImei = getClickImei(imei);
		//点击设备列表某个设备时,动态将设备名称气泡置顶显示 
		if($("#checkboxForDeviceName").is(":checked")){
			showDeviceName(imei);
		}
		
		deviceListClickActive(imei,true);
		curImei = imei;
		
		
		if(dialogParen){
			dialogParen.close();
			//$("#mapdreess").slideUp();
		}
		if(typeof(imeiMaps[imei])!="undefined"){
			var vehicle = imeiMaps[imei].vehicle;
			
			if (vehicle.statusMap && vehicle.statusMap.gps) {
				var info = {};
				info.name = vehicle.name; // 车辆名称
				info.imei = imei;
				info.isSupportFence = vehicle.isSupportFence; // 是否支持电子围栏
				info.vechleioc = vehicle.vechleioc;
				info.statuscss = vehicle.statuscss;
				info.show = vehicle.show;
				info.driverPhone = vehicle.driverPhone;
				var gTime = vehicle.statusMap.gps.gpsTime;
				info.gpsTime = gTime;
				info.acc = $.i18n.prop(accstatus["status"
						+ vehicle.statusMap.gps.acc]);
				//info.gpsSpeed = vehicle.statusMap.gps.gpsSpeed;
				if(vehicle.statusMap.gps.gpsSpeed==null || vehicle.statusMap.gps.gpsSpeed==""){
					info.gpsSpeed=-1;
				}else{
					info.gpsSpeed = parseInt(vehicle.statusMap.gps.gpsSpeed);
				}
				info.accFlag = vehicle.accFlag;
				info.postType = vehicle.postType;
				//当前登录用户类型（12:体验用户）
				info.complex_loginUserType = complex_loginUserType;
				info.electricity = vehicle.electricity;
				//var vStatus = vehicle.statusMap.status;
				/*if(vStatus==0|vStatus==1)
				{
					info.gpsSpeed=0;
				}*/
				if(vehicle.statusMap.hb){
					var hbTime = vehicle.statusMap.hb.time;
					info.hbtime = gTime>hbTime?gTime:hbTime;
				}
				var content = template('InfoWindowTpl', $.extend({
					_ctx : _ctx,
					userId : userId
				}, info));
				content=$(content);
				if(vehicle.isArrears||vehicle.show==-1)
				{
					return;
				}
				//TODO 欠费,不显示气泡
				//欠费,不显示气泡
				if((vehicle.show==-1) || (vehicle.statuscss=="arrears")){
					clearCurImei();
					 return;
				}
				if( vehicle.statusMap.status==0)
				{
					content.find(".tracking").remove();
				}
				var marker = imeiMaps[vehicle.imei].marker;

				if (marker == null) {
					marker = getMark(vehicle);
					imeiMaps[vehicle.imei].marker = marker;
					//allMap.addOverlay(marker);
					bdvehiclemark.push(marker);
				}
				marker.setZIndex(clickNum++);
				if(prev_maker){prev_maker.setZIndex(markindex-10);}//prev_maker是告警信息图标
				_gBusy = true;
				var geoname = vehicle.statusMap.geoname;
				if (geoname)// 展示地标
				{
					$("#mapdreess").slideDown();
					$("#mapdreess").text(
							geoname + "(" + $.i18n.prop('landmark') + ")");
				}else if(!flag)// 显示真实地址
				{
					showAddress(vehicle);
				}


				pywdith = -256;
				dialog= new InfoBox({
					content : content.get(0),
					disableAutoPan : false,
					maxWidth : 0,
					pixelOffset : new google.maps.Size(pywdith, -340),//减上加下
					zIndex : null,
					closeBoxURL : "",
					isHidden : false,
					pane : "floatPane",
					enableEventPropagation : false
				});
				
				//为关闭设备信息框,进行赋值
				dialogParen = dialog;
				
				curImei = imei;
				//allMap.addOverlay(dialog);
				dialog.open(allMap, marker);
			//	dialog.open(marker);

				content.find(".popover-close").click(function() {
					_gBusy = false;
					curImei = null;
					dialog.hide();
					$("#mapdreess").slideUp();// 隐藏地址展示
				});
			} else {
					layer.msg($.i18n.prop('index.No_data_from_vehicle'), {
						icon : 5
					});
				}
		}else{
				layer.msg($.i18n.prop('index.No_data_from_vehicle'), {
					icon : 5
				});
			}
	}
	
	/**
	 * 删除地图标记
	 */
	function removeMark(imei)
	{
		if((curImei!=imei) && (imeiMaps[imei]))
		{
			var marker = imeiMaps[imei].marker;
			marker.setMap(null);
			//allMap.removeOverlay(marker);
			delete  imeiMaps[imei];
		}
	}
	window.removeMark=removeMark;
	allMap.addListener("zoom_changed", function(){
		if(curImei)
		{
			window.setTimeout(function(){
				vehicleLocationClick(curImei,true);
			},100)
			
		}
		
		
	});

	/**
	 * 显示地标
	 */
	function showLandmark() {
		$.get(_ctx + "/geozone/findFlag1List?_=" + new Date().getTime()+"&userId="+userId,
				function(result) {
					findFlag1List = null;
					if (result.ok && result.data.length) {
						landmarkList = result.data;
						showLandmarkResult(landmarkList);
					}
				});
	}



	/**
	 * 显示地标
	 */
	function showLandmarkResult(landmarkList) {
		if (landmarkList && landmarkList.length) {
			overlayArray = new Array();
			for (var i = 0; i < landmarkList.length; i++) {
				var data = landmarkList[i]
				var typeMap = data.mapType;
				var title = data.title;
				var datas = null;
				var coords = null;
				var geomType = null;
				var point = null;

				if (typeMap == 'google') {
					datas = data.geom;
				} else {
					datas = data.backGeom;
				}
				coords = datas.point;
				geomType = datas.type;
				if (geomType == 'circle') {
					var radius = Number(datas.radius);
					var circlePoint = new google.maps.LatLng(coords[0].lat, coords[0].lng);
					point = circlePoint;
					var populationOptions = {
						strokeColor : '#FF0000',
						strokeOpacity : 0.8,
						strokeWeight : 2,
						fillColor : '#FF0000',
						fillOpacity : 0.35,
						map : allMap,
						center : circlePoint,
						radius : radius
					};
					var cityCircle = new google.maps.Circle(populationOptions);
					gglandmark.push(cityCircle);
				} else {
					var GmapPointArray = [];
					for (var j = 0; j < coords.length; j++) {
						var lat = coords[j].lat;
						var lng = coords[j].lng;
						var pointArray = new google.maps.LatLng(lat, lng);
						GmapPointArray.push(pointArray);
						point = GmapPointArray[0];
					}
					var mapOptions = {
						mapTypeId : google.maps.MapTypeId.ROADMAP,
						mapTypeControlOptions : {
							style : google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
							position : google.maps.ControlPosition.TOP_RIGHT
						}
					};
					var polygonGoogle = new google.maps.Polygon({
						path : GmapPointArray,
						strokeColor : "#0000FF",
						strokeOpacity : 0.8,
						strokeWeight : 2,
						fillColor : "#FF0000",
						fillOpacity : 0.4,
						editable : false, // 是否可以编辑
						draggable : false
					// 是否可拖动
					});
					polygonGoogle.setMap(allMap);
					gglandmark.push(polygonGoogle);
				}
				
				//显示地标名称
				function MyMarker(map, options) {   
					  this.latlng = options.latlng; //设置图标的位置   
					  this.labelText = options.labelText || 'no date';
					  this.map_ = map;      
					  this.div_ = null;     
					  this.setMap(map);   
				}  

				 MyMarker.prototype = new google.maps.OverlayView();
				 
				//初始化图标  
				MyMarker.prototype.onAdd = function() {   	  
					var div = document.createElement('DIV'); //创建文字的div  
					div.style.borderWidth = "0px";     
					div.style.position = "absolute";    
					//初始化文字标签  
					var label = document.createElement('div');//创建文字标签   
					label.innerHTML = this.labelText;
					label.style.cssText="width: 100px;text-align: left; padding: 2px;font-size: 10px; background-color: rgba(255, 255, 255, 0.89); border: 1px solid #999; padding: 5px; border-radius: 4px; word-break: break-all; overflow: auto; color:#333;";     						
					div.appendChild(label);     
					this.div_ = div;        
					var panes = this.getPanes();    
					panes.overlayLayer.appendChild(div);  	
		      }

				//绘制图标，主要用于控制图标的位置  
				MyMarker.prototype.draw = function() {  		
		          var overlayProjection = this.getProjection();        
		          var position = overlayProjection.fromLatLngToDivPixel(this.latlng);   //将地理坐标转换成屏幕坐标     
		          var div = this.div_;    
		          div.style.left =position.x-5 + 'px';    
		          div.style.top  =position.y-5 + 'px';    
				  //控制图标的大小  
		          //div.style.width = '10px';    
		          //div.style.height ='10px';  
		      }
				
				MyMarker.prototype.onRemove = function() {   
					this.div_.parentNode.removeChild(this.div_);     
					this.div_ = null;   
				}
			  overlay = new MyMarker(allMap,{latlng:new google.maps.LatLng(coords[0].lat, coords[0].lng),labelText:title});
			  overlayArray.push(overlay);
			}
		}
	}
	
	/**
	 * 
	 * 刷新跟踪车辆
	 */
	var refreshCurImei=function(vehicle){
		if(curImei)
		{
			//在欠费时,将之前的设备信息框关闭
			if(undefined == imeiMaps[curImei]){
				if(dialogParen){
					dialogParen.close();
				}
				return;
			}
			
			imeiMaps[curImei].vehicle=vehicle;
			
			
			var _marker=imeiMaps[curImei].marker;
			if(vehicle.show==-1)
			{
				_marker.setMap(null);
				curImei = null;
				dialog.hide();
				imeiMaps[curImei]=null;
				return;
			}
			_marker.setPosition(getPoint(vehicle));
			//_marker.draw();
			showInfoWindow(curImei);
		}
		
	}
	
	//清除当前车辆信息
	window.clearCurImei=function(){
		curImei=null;
		//$("#mapdreess").slideUp();
		if(dialog)
		{
			dialog.hide();
		}
		
	}
	
	window.refreshCurImei=refreshCurImei;
	/**
	 * 隐藏地标
	 */
	function hideLandmark() {
		$("#checkbox1").iCheck('uncheck')
		for (var i = 0; i < gglandmark.length; i++) {
			overlayArray[i].setMap(null);
			gglandmark[i].setMap(null);
		}
		gglandmark = [];
	}
	window.hideLandmark=hideLandmark;

	
	window.clearMapData=function(curFlag)
	{
		if(curImei&&(!curFlag&&curFlag==null))
		{
			var _vehicle=imeiMaps[curImei];
			imeiMaps ={};
			imeiMaps[curImei]=_vehicle;
		}
		else
		{
			imeiMaps = {};
		}
		
		markerNum = 0;
		/*if (dialog) {
			$("#mapdreess").slideUp();
		}*/
		clearVehicleMark(curFlag);

	}
	

	window.imeiMaps = imeiMaps;
	window.points = points;
	window.getAllBaiduStatus = function() {
		
	}
	window.showLandmark=showLandmark;
	window.vehicleLocationClick = vehicleLocationClick;
	window.showDevicestatus = showDevicestatus;
//	reloadDevicestatus();
	if(showLandmark_OK)
	{
		showLandmark();
	}
}


var dialogMarker;//打开车辆信息框所用的marker
function loadBaiduMap()
{
		var imeiMaps = {};// 所有车辆设备信息
		var points = [];// 车辆坐标点信息

		var dialog = null;// 车辆信息框
		var _gBusy = false;

		var markerNum = 0;// 地图坐标的数量
		var markerMaxNum = 5000;// 允许显示的最大数量
		

		window.start = function() {
			timeoutRunFlag = true;
		}
		window.stop = function() {
			timeoutRunFlag = false;
		}
		$("#mapdreess").slideUp();
		// acc状态对应的国际化
		var accstatus = {
			"status1" : "index.On",
			"status0" : "index.Close"
		};

		var landmarkList = null;// 地标
		var bdlandmark = [];// 百度地图地标
		var bdvehiclemark = [];// 车辆标记

		/**
		 * 百度地图下获取指定车辆的标记
		 */
		var getMark = function(vehicle) {
			if (vehicle.statusMap && vehicle.statusMap.gps) {
				var vgps = vehicle.statusMap.gps;
				var point = getPoint(vehicle)
				points.push(point);
				var icon = getbdIcon(vehicle.vechleioc, vehicle.statusMap.status);
			//	if (vehicle.statusMap.status == 0) {
				if (vehicle.statusMap.status == 2) {
					icon = run_bd_icon(vehicle.vechleioc, Number(vgps.direction));
				}
				var marker = new BMap.Marker(point, icon);
				marker.setZIndex(vehicle.statusMap.status+90);
				if(prev_maker){prev_maker.setZIndex(vehicle.statusMap.status-10);}//prev_maker是告警信息图标
				// 标记点击事件
				marker.addEventListener("click", function() {
					showInfoWindow(vehicle.imei);
					deviceListClickActive(vehicle.imei,true);
				});

				return marker;
			} else {
				return null;
			}
		}

		/**
		 * 获取知道车辆的坐标点
		 */
		var getPoint = function(vehicle) {
			if (vehicle.statusMap && vehicle.statusMap.gps) {
				var vgps = vehicle.statusMap;
				var point = new BMap.Point(vgps.bd.lng, vgps.bd.lat);
				return point;
			} else {
				return null;
			}
		}

		/**
		 * 清除地图上所有车辆的坐标点
		 */
		var clearVehicleMark = function(curFlag) {
			for (var i = 0; i < bdvehiclemark.length; i++) {
				if (curImei&&(curFlag==null||!curFlag)) {
					var _vehicle = imeiMaps[curImei];
					if (_vehicle && _vehicle.marker) {
						if (bdvehiclemark[i] == _vehicle.marker) {
							continue;
						}
					}

					allMap.removeOverlay(bdvehiclemark[i]);
				}
				else
					{
						allMap.removeOverlay(bdvehiclemark[i]);
					}
			}
		}

		/**
		 * 刷新地图的所有地标
		 *//*
		var reloadDevicestatus = function() {
			window.clearTimeout(setTimeOutId);
			checkbox_Online = $("#checkbox_Online:checked").length;// 在线
			checkbox_Offline = $("#checkbox_Offline:checked").length;// 离线
			$.get(_ctx + "/getAllStatus?_=" + new Date().getTime(), {
				"imeis" : imeis,
				"userId" : userId,
				"searchParentId" : searchParentId,
				"checkbox_Online" : checkbox_Online,
				"checkbox_Offline" : checkbox_Offline
			}, function(result) {
				
				var data = result.data;
				showDevicestatus(data);
				intervaltime = parseInt($("#intervaltime").val());
				refleshTime();
			})
		}
		*/
		
		/**
		 * 百度地图下的设备标点
		 */
		var showDevicestatus=function(data)
		{
			$("#mapdreess").slideUp();//初始加载隐藏地址栏
			clearMapDeviceName();//清除设备名
			clearMapData(true);
			for (var i = 0; i < data.length; i++) {
				
				if (data[i].vehicles) {
					for (var j = 0; j < data[i].vehicles.length; j++) {
						var vehicle = data[i].vehicles[j];
						if(vehicle.show==-1||vehicle.show==-2)
						{
							continue;
						}
						

						if (imeiMaps[vehicle.imei] != null) {
							if (imeiMaps[vehicle.imei].marker == null) {
								imeiMaps[vehicle.imei] = {
									vehicle : vehicle
								};
								if (markerNum <= markerMaxNum) {
									var marker = getMark(vehicle);
									if (marker != null) {
										allMap.addOverlay(marker);
										bdvehiclemark.push(marker);
										imeiMaps[vehicle.imei].marker = marker;
										markerNum++;
									}
								}
							} else {
								imeiMaps[vehicle.imei].vehicle = vehicle;
								var marker = imeiMaps[vehicle.imei].marker;
								marker.setPosition(getPoint(vehicle));
								var devIcon = getbdIcon(vehicle.vechleioc, vehicle.statusMap.status);
								if (vehicle.statusMap.status == 2) {
									devIcon = run_bd_icon(vehicle.vechleioc, Number(vehicle.statusMap.gps.direction));
								}
								marker.setZIndex(vehicle.statusMap.status+90);
								if(prev_maker){prev_maker.setZIndex(vehicle.statusMap.status-10);}//prev_maker是告警信息图标
								marker.setIcon(devIcon.icon);
								marker.draw();
							}
						} else {
							imeiMaps[vehicle.imei] = {
								vehicle : vehicle
							};
							if (markerNum <= markerMaxNum) {
								var marker = getMark(vehicle);
								if (marker != null) {
									if(clickImei && vehicle.imei==clickImei){
										marker.setZIndex(clickNum++);
									}
									
									allMap.addOverlay(marker);
									initBaiduMapDeviceName(vehicle,marker);
									bdvehiclemark.push(marker);
									imeiMaps[vehicle.imei].marker = marker;
									markerNum++;
								}

							}
						}

					}
				}

			}

			if (!isrefresh&&curImei==null) {// 显示当前imei的窗口刷新时保持窗口不关闭
				allMap.setViewport(points);
				if(markerNum==0){
					allMap.setZoom(5);
				}else if(markerNum==1){
					allMap.setZoom(6);
				}

			}
			
			if($("#checkboxForDeviceName").is(":checked")){
				showMapDeviceName();
			}
		}
		
		var vehicleLocationClick = function(imei,flag) {
			if(intervaltime<=1)
			{
				return;
			}
			
			if(!flag){
				$("#mapdreess").slideUp();
			}
			//deviceListClickActive(imei);
			showInfoWindow(imei,flag);
			
		}

/*		var opts = {
			width : 300, // 信息窗口宽度
			height : 300, // 信息窗口高度
			enableMessage : false,// 设置允许信息窗发送短息
			title : "",
			enableCloseOnClick : false
		};*/

		/**
		 * 显示地址栏
		 */
		var showAddress = function(vehicle) {
			var geoc = new BMap.Geocoder();

			geoc.getLocation(getPoint(vehicle), function(rs) {
				if (rs.address && rs.address != null && rs.address != '') {
					address = parseBaiduLocation(rs);
					$("#mapdreess").slideDown();
					$("#mapdreess").text(address);
				} else {
					var t = setTimeout(function() {
						$("#mapdreess").slideDown();
						$("#mapdreess").text("百度地图解析地址失败!")
					}, 2000);
				}
				// $('#grid-table tr[data-imei=' + imei + ']
				// td[data-address]').text(address)
			});
		}
		

		/**
		 * baidu显示车辆信息窗口
		 */
		var showInfoWindow = function(imei,flag) {		
			deviceListClickActive(imei,true);
			curImei = imei;
			if(dialogParen){
				dialogParen.close();
				//$("#mapdreess").slideUp();
			}
		//	curImei=null;
			if(typeof(imeiMaps[imei])!="undefined"){
				var vehicle = imeiMaps[imei].vehicle;
				if (vehicle.statusMap && vehicle.statusMap.gps) {
					var info = {};
					info.name = vehicle.name; // 车辆名称
					info.imei = imei;
					info.isSupportFence = vehicle.isSupportFence; // 是否支持电子围栏
					info.vechleioc = vehicle.vechleioc;
					info.statuscss = vehicle.statuscss;
					info.show = vehicle.show;
					info.weight = vehicle.weight;
					info.ordertype = vehicle.ordertype;
					info.createTime = vehicle.createTime;
					info.fahuodanhao = vehicle.fahuodanhao;
					info.baozhuangfangshi = vehicle.baozhuangfangshi;
					info.kehumingcheng = vehicle.kehumingcheng;
					info.driverPhone = vehicle.driverPhone;
					var gTime = vehicle.statusMap.gps.gpsTime;
					info.gpsTime = gTime;
					info.acc = $.i18n.prop(accstatus["status"
							+ vehicle.statusMap.gps.acc]);
					//info.gpsSpeed = vehicle.statusMap.gps.gpsSpeed;
					if(vehicle.statusMap.gps.gpsSpeed==null || vehicle.statusMap.gps.gpsSpeed==""){
						info.gpsSpeed=-1;
					}else{
						info.gpsSpeed = parseInt(vehicle.statusMap.gps.gpsSpeed);
					}
					info.electricity = vehicle.electricity;
					info.accFlag = vehicle.accFlag;
					//var vStatus = vehicle.statusMap.status;
					/*if(vStatus==0|vStatus==1)
					{
						info.gpsSpeed=0;
					}*/
					if(vehicle.statusMap.hb){
						var hTime = vehicle.statusMap.hb.time;
						info.hbtime = gTime>hTime?gTime:hTime;
					}
					info.postType = vehicle.postType;
					////当前登录用户类型（12:体验用户）
					info.complex_loginUserType = complex_loginUserType;
					var content = template('InfoWindowTpl', $.extend({
						_ctx : _ctx,
						userId : userId
					}, info));
					content=$(content);
					if(vehicle.isArrears||vehicle.show==-1)
					{
						content.find(".street").remove();
						content.find(".tracking").remove();
						content.find(".playback").remove();
						content.find(".command").remove();
					}
					
					//TODO 欠费,不显示气泡
					//欠费,不显示气泡
					if((vehicle.show==-1) || (vehicle.statuscss=="arrears")){
						clearCurImei();
						 return;
					}
					if( vehicle.statusMap.status==0)
					{
						content.find(".tracking").remove();
					}
					
					content=content.get(0);
					var marker = imeiMaps[vehicle.imei].marker;

					if (marker == null) {
						marker = getMark(vehicle);
						imeiMaps[vehicle.imei].marker = marker;
						allMap.addOverlay(marker);
						bdvehiclemark.push(marker);
					}
					marker.setZIndex(clickNum++);
					//跟踪点击imei
					clickImei = vehicle.imei;
					if(prev_maker){prev_maker.setZIndex(markindex-10);}//prev_maker是告警信息图标
					marker.draw();
					_gBusy = true;
					var geoname = vehicle.statusMap.geoname;
					if (geoname)// 展示地标
					{
						$("#mapdreess").slideDown();
						$("#mapdreess").text(
								geoname + "(" + $.i18n.prop('landmark') + ")");
					} else if(!flag) // 显示真实地址
					{
						showAddress(vehicle);
					}
					
					dialog = new BMapLib.InfoBox(allMap, content, {
						boxStyle : {
							width : "500px",
							height : "0px"
						},
						offset : new BMap.Size(500, 330),
						// 直接隐藏官方关闭按钮
						closeIconMargin : "2px;display:none;",
						closeIconUrl : _ctx + "/resource/images/close.png",
						enableAutoPan : true,
						align : INFOBOX_AT_TOP
					});
					
					////为关闭设备信息框,进行赋值
					dialogParen = dialog;
					
					allMap.addOverlay(dialog);
					dialogMarker = marker;
					dialog.open(marker);

					$(dialog._div).find(".popover-close").click(function() {
						dialogMarker = null;//防止设备信息框再次因为滚轮事件显示
						_gBusy = false;
						curImei = null;
						dialog.hide();
						$("#mapdreess").slideUp();// 隐藏地址展示
					});
				} else {
					if(!flag){
						layer.msg($.i18n.prop('index.No_data_from_vehicle'), {
							icon : 5
						});
					}
				}
			}else{
				if(!flag){
					layer.msg($.i18n.prop('index.No_data_from_vehicle'), {
						icon : 5
					});
				}
			}
		}
		
		/**
		 * 删除地图标记
		 */
		function removeMark(imei)
		{
			if((curImei!=imei) && (imeiMaps[imei]))
			{
				var marker = imeiMaps[imei].marker;
				allMap.removeOverlay(marker);
				delete  imeiMaps[imei];
			}
			
		}
		window.removeMark=removeMark;
		
		
		baiduzoomendEvent=function(){
			window.setTimeout(function(){
				if(prev_infowindow && prev_maker && $("#alarmInfo").is(":visible")){
					prev_infowindow.open(prev_maker);
				}else if(curImei){
					vehicleLocationClick(curImei,true);
				}
				if(dialogParen!=null&&dialogMarker!=null){
					dialogParen.close();
					dialogParen.open(dialogMarker);
				}
			},100);
		}
		allMap.addEventListener("zoomend", baiduzoomendEvent);

		

		/**
		 * 显示地标
		 */
		function showLandmark() {
		$.get(_ctx + "/geozone/findFlag1List?_=" + new Date().getTime()+"&userId="+userId,
				function(result) {
					findFlag1List = null;
					if (result.ok && result.data.length) {
						landmarkList = result.data;
						showLandmarkResult(landmarkList);
					}
				});
		}

		

		/**
		 * 显示地标
		 */
		function showLandmarkResult(landmarkList) {
			if (landmarkList && landmarkList.length) {
				for (var i = 0; i < landmarkList.length; i++) {
					var data = landmarkList[i]
					var typeMap = data.mapType;
					var title = data.title;
					var datas = null;
					var coords = null;
					var geomType = null;
					var point = null;

					if (typeMap == 'google') {
						datas = data.backGeom;
					} else {
						datas = data.geom;
					}
					coords = datas.point;
					geomType = datas.type;
					if (geomType == 'circle') {
						var radius = datas.radius;
						var circlePoint = new BMap.Point(coords[0].lng,
								coords[0].lat);
						point = circlePoint;
						var circle = new BMap.Circle(circlePoint, radius);
						circle.setFillColor("#ff0000"); // 填充颜色
						circle.setStrokeColor("#0000ff"); // 边线颜色
						allMap.addOverlay(circle); // 增加圆
						bdlandmark.push(circle);
					} else {
						var BmapPointArray = [];
						for (var j = 0; j < coords.length; j++) {
							var lat = coords[j].lat;
							var lng = coords[j].lng;
							var BmapPoint = new BMap.Point(lng, lat);
							BmapPointArray.push(BmapPoint);
							point = BmapPointArray[0];
						}
						// 回显多边形
						var polygon = new BMap.Polygon(BmapPointArray, {
							strokeColor : "#0000FF",
							strokeOpacity : 0.8,
							strokeWeight : 2,
							fillColor : "#FF0000",
							fillOpacity : 0.4,
							editable : false,
							draggable : false
						});
						allMap.addOverlay(polygon);
						bdlandmark.push(polygon);
					}
					var label = new BMap.Label(title, {
						position : point
					});
					label.setStyle({
						"fontSize" : "12px",
						"height" : "20px",
						"lineHeight" : "20px",
						"maxWidth" : "200px",
						"whiteSpace":"nowrap",
		                "overflow":"hidden",
		                "textOverflow":"ellipsis",
		                "verticalAlign":"top"
					});
					label.setTitle(title);
					allMap.addOverlay(label);
					bdlandmark.push(label);
				}
			}
		}
		
		/**
		 * 
		 * 刷新跟踪车辆
		 */
		var refreshCurImei=function(vehicle)
		{
			if(curImei)
			{
				//在欠费时,将之前的设备信息框关闭
				if(undefined == imeiMaps[curImei]){
					if(dialogParen){
						dialogParen.close();
					}
					return;
				}
				imeiMaps[curImei].vehicle=vehicle;
				var _marker=imeiMaps[curImei].marker;
				if(_marker){
					_marker.setPosition(getPoint(vehicle));
					_marker.draw();
					showInfoWindow(curImei);
				} 
			}
			
		}
		
		//清除当前车辆信息
		window.clearCurImei=function()
		{
			curImei=null;
			$("#mapdreess").slideUp();
			if(dialog)
			{
				dialog.hide();
			}
			
		}
		
		window.refreshCurImei=refreshCurImei;
		/**
		 * 隐藏地标
		 */
		function hideLandmark() {
			$("#checkbox1").iCheck('uncheck')
			for (var i = 0; i < bdlandmark.length; i++) {
				allMap.removeOverlay(bdlandmark[i])
			}
			bdlandmark = [];
		}
		window.hideLandmark=hideLandmark;

		
		window.clearMapData=function(curFlag)
		{
			if(curImei&&(curFlag==null||!curFlag))
			{
				var _vehicle=imeiMaps[curImei];
				imeiMaps ={};
				imeiMaps[curImei]=_vehicle;
			}
			else
			{
				imeiMaps = {};
			}
			
			markerNum = 0;
			/*if (dialog) {
				$("#mapdreess").slideUp();
			}*/
			clearVehicleMark(curFlag);

		}
		

		window.imeiMaps = imeiMaps;
		window.points = points;
		window.getAllBaiduStatus = function() {
			
		}
		window.showLandmark=showLandmark
		window.vehicleLocationClick = vehicleLocationClick;
		window.showDevicestatus = showDevicestatus;
//		reloadDevicestatus();
		if(showLandmark_OK)
		{
			showLandmark();
		}


}
$("#checkbox1").on('ifChecked', function(event) {
	// hideLandmark();
	showLandmark();
	showLandmark_OK = true;
});

//设备列表点击高亮
function deviceListClickActive(imei,flag){
	if($("#"+imei).length){
		$("#accordion .submenu > li").removeClass("active");
		$("#"+imei).addClass("active");
		$("#"+imei).parent().show().parent().addClass("open");
		
		if(flag){//如果需要定位列表滚动条位置
			var scroll_h = $("#"+imei).offset().top - $("#accordion").parent().offset().top + $("#accordion").parent().scrollTop();
			if(scroll_h <= $("#accordion").parent().height()){
				scroll_h = 0;
			}
			//$("#accordion").parent().scrollTop(scroll_h); //去除滚动条
		}
	}
}

//客户列表和车辆列表搜索时可以通过点击回车键执行搜索操作
function keyDown(e) {
  var ev= window.event||e;
	//13是键盘上面固定的回车键
  if (ev.keyCode == 13) {
	  //clearMapData();
	  setWord();
	  searchCondition();
  }
  
 }

/**
 * 编辑分组
 * 		生成样式与标签
 * @author Huang.gangqiang
 * @time 2016-4-11 17:57:23
 */
function editgroup(obj,organizeName,orgId){
	 //点击编辑时，若添加分组框存在，则隐藏
	 if($(".add-group-form").is(":visible")){
		$(".add-group-form").remove();
		 $(".js-toolsbar-func").show();
	}
	 //点击编辑时，组名编辑框若存在，则先删除
	if($(".edit-group-form").length>0)	{
		$(".edit-group-form").parents(".node-func").removeClass("show-edit-group");
		$(".edit-group-form").remove();
		$(".devnum").show();
	}
	//点击编辑时，若删除框存在，则隐藏删除框
	if($("[id^=layui-layer]").length>0){
		$("[id^=layui-layer]").hide();
	}
 
	var newOrganizeName=$("#"+orgId).find(".group-name").text().replace(/(^\s*)|(\s*$)/g,'');
	//编辑时把数量隐藏
	$("#"+orgId+"_count").hide();
	
	var html = '<form class="form-inline pa d-ib edit-group-form">';
	    html += '<input id="newOrganizeName" type="text" class="form-control form-control-xs" title="'+$.i18n.prop("cust.pleaseenterGroupName")+'" size="22" value="'+ newOrganizeName +'" placeholder="'+$.i18n.prop("cust.pleaseenterGroupName")+'"/> ';
	    html += '<button type="button" class="btn btn-success btn-xs" onclick="updateOrganize(this,\''+newOrganizeName+'\',\''+orgId+'\');" id="updateOrganize'+ orgId +'" title="'+$.i18n.prop("comm.Confirm")+'">'+$.i18n.prop("comm.Confirm")+'</button> ';
	    html += '<button type="button" class="btn btn-default btn-xs" title="'+$.i18n.prop("comm.Cancel")+'">'+$.i18n.prop("comm.Cancel")+'</button> ';
	    html += '</form>';
	    $(obj).parents(".node-func").addClass("show-edit-group").find(".node").after(html);
	    $(obj).parents(".node-func").find(".edit-group-form input[type=text]").focus().select();
	    $(obj).parents(".node-func").find(".edit-group-form .btn").click(function(){
	    	/*if($(this).hasClass("btn-success")){
	    		var new_text =  $(this).prevAll("input[type=text]").val();
	    		$(this).parents(".node-func").find(".group-name").text(new_text);
	    	}*/
	    	//点击取消，数量显示
	    	if($(this).hasClass("btn-default")){
	    		$("#"+orgId+"_count").show();
	    	}
		  $(this).parents(".node-func").removeClass("show-edit-group");
		  $(this).parent().remove();
	    });

}


////保存修改
function updateOrganize(obj,organizeName,orgid){
	//新组名
	var current_Name= $("#newOrganizeName").val().replace(/(^\s*)|(\s*$)/g,'');
	if(current_Name.length>20){
		layer.msg($.i18n.prop("Asset.GroupNameLength"),{icon:7});
		$("#newOrganizeName").focus();
		$("#newOrganizeName").val(organizeName);
		return ;
	}
	if(organizeName.replace(/(^\s*)|(\s*$)/g,'')!=current_Name){
		if(current_Name!="" && current_Name!=undefined){
			$.ajax({
				type:"post",
				async: false,
			    cache: false,
			    dataType :"json",
			    data:{"orgId":orgid,"organizeName":current_Name,"userId":userId,"searchParentId":searchParentId,"keyword":word},
			    url:_ctx+"/VOrganize/organizeUpdate",
				success:function(ret){
					if(ret.code==0){
						layer.msg($.i18n.prop("comm.Operationdone"),{icon:1});
						$("#"+orgid).find(".group-name").text(current_Name);
					}else if(ret.code == -1){
						$("#newOrganizeName").val(organizeName);
						layer.msg($.i18n.prop("Asset.GroupNameIsExist"),{icon:4});
					}else if(ret.code == -2){
						layer.msg($.i18n.prop("comm.NoAccess"),{icon:4});
					}else{
						layer.msg($.i18n.prop("comm.Failed"),{icon:5});
					}
				},
				error:function(e){
					//ajaxError("index.jsp",e);
				},
				complete:function(XMLHttpRequest, textStatus){
					authorityValide(XMLHttpRequest);
				}
			});
		}else{
			$("#newOrganizeName").val(organizeName);
			layer.msg($.i18n.prop("Asset.GroupNameNotEmpty"),{icon:7});
		}
	}else{
		layer.msg($.i18n.prop("Asset.GroupNameNotChange"),{icon:7});
	}
	//编辑后,设备数量显示
	$("#"+orgid+"_count").show();
	
}

/**
 * 添加分组 
 * 		生成样式与标签
 * @author Huang.gangqiang
 * @time 2016-4-11 17:32:46
 */
function addgroup(){
	$(".js-toolsbar-func").hide();
	 //点击添加分组时，若编辑框存在，则隐藏编辑框
	if($(".edit-group-form").is(":visible")){
		$(".edit-group-form").parents(".node-func").removeClass("show-edit-group");
		$(".edit-group-form").remove();
		$(".devnum").show();
	}
	//点击添加分组时，若删除框存在，则隐藏删除框
	if($("[id^=layui-layer]").length>0){
		$("[id^=layui-layer]").hide();
	}
		 
	var html = '<form class="form-inline add-group-form js-add-group-form">';
		html += '<input type="text" class="form-control form-control-xs" id="orgName" size="20" title="'+$.i18n.prop("cust.pleaseenterGroupName")+'" placeholder="'+$.i18n.prop("cust.pleaseenterGroupName")+'"/> ';
		html += '<button type="button" class="btn btn-success btn-xs but-true" onclick="addOrganize();" title="'+$.i18n.prop("comm.Add")+'">'+$.i18n.prop("comm.Add")+'</button> ';
		html += '<button type="button" class="btn btn-default btn-xs but-false" title="'+$.i18n.prop("comm.Cancel")+'">'+$.i18n.prop("comm.Cancel")+'</button> ';
		html += '</form>';
	$(".js-toolsbar-func").after(html);
	if($.browser.msie && $.browser.version<10){
		$(".js-add-group-form input[type=text]").placeholder();
	}
	$(".js-add-group-form input[type=text]").focus();
	$(".js-add-group-form .but-false").click(function(){
		$(".js-add-group-form").remove();
	    $(".js-toolsbar-func").show();
	    $(".js-add-group").show();
	});
}

/**
 * 添加分组
 * 		添加数据
 * @check  true
 * 		   非空、正则、重复验证
 * @author Huang.gangqiang
 * @time 2016-4-11 17:35:52
 */
function addOrganize(){
	var new_group_name = $("#orgName").val().replace(/(^\s*)|(\s*$)/g,'');
	if(!new_group_name){
		layer.msg($.i18n.prop("Asset.GroupNameNotEmpty"),{icon:7});
		$("#orgName").focus();
		return ;
	}
	if(new_group_name.length>20){
		layer.msg($.i18n.prop("Asset.GroupNameLength"),{icon:7});
		$("#orgName").focus();
		return ;
	}
	if(new_group_name == "默认组" || new_group_name.toLowerCase() == "Default group".toLowerCase()){
		layer.msg($.i18n.prop("Asset.GroupNameIsExist"),{icon:4});
		$("#orgName").val("");
		$("#orgName").focus();
		return ;
	}
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    dataType :"json",
	    data:{"organizeName":new_group_name,"userId":userId,"searchParentId":searchParentId,"keyword":word},
	    url:_ctx+"/VOrganize/OrganazeInsert",
		success:function(returnData){
				if (returnData && returnData.code==0){
					layer.msg($.i18n.prop("comm.Operationdone"),{icon:1});
					//TODO 隐藏增加新组
					$(".js-add-group-form").remove();
					$(".js-toolsbar-func").show();
					var orgId=returnData.data.id;
					var html ="";
					html += '<li>';	
					html += '<div class="link" id="'+orgId+'">';
					html += '<div class="node-func">';
					html += '<span class="func fr">';
					html += '<a title="'+$.i18n.prop("Asset.Update")+'" class="js-edit-group" onclick="editgroup(this,\''+new_group_name+'\',\''+orgId+'\')"><i class="fa fa-pencil-square-o"></i></a>&nbsp;&nbsp;';
					html += '<a title="'+$.i18n.prop("Asset.Delete")+'"><i class="fa fa-trash" onclick="deleteOrganize(\''+orgId+'\');"></i></a>';
					html += '</span>';
					html += '<span class="node"><i class="fa fa-caret-right"></i>&nbsp;&nbsp;';
					html += '<span class="group-name">'+new_group_name+'';
					html += '</span>';
					html += '<span class="c-666 fs-12 devnum" id="'+orgId+'_count">(<span id="vehicleCount_'+orgId+'">0</span>)</span>';
					html += '</span>';
					html += '</div>';
					html += '</div>';
					html += '<ul class="submenu" organizeid="'+orgId+'" id="'+orgId+'_ul"></ul>';
					html += '</li>';

					
					$("#accordion").append(html);
					$("#"+orgId).find(".node").on("click",function(){
						$(this).parents("li").toggleClass("open").find(".submenu").slideToggle();
					});
					//TODO 更新分组				
				}else if(returnData.code==-1){
					layer.msg($.i18n.prop("Asset.GroupNameIsExist"),{icon:4});
					$("#orgName").val("");
					$("#orgName").focus();
				}else if(returnData.code==-2){
					layer.msg($.i18n.prop("Asset.GroupNameNotEmpty"),{icon:7});
					$("#orgName").focus();
				}else{
					layer.msg($.i18n.prop("comm.Failed"),{icon:5});
				}
		},
		error:function(e){
			//ajaxError("index.jsp",e);
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}

/**
 * 删除组
 */
function deleteOrganize(orgid){
	 //点击删除时，若添加分组框存在，则隐藏
	 if($(".add-group-form").is(":visible")){
		$(".add-group-form").remove();
		 $(".js-add-group").show();
	}
	 //点击删除时，组名编辑框若存在，则先删除
	if($(".edit-group-form").length>0)	{
		$(".edit-group-form").parents(".node-func").removeClass("show-edit-group");
		$(".edit-group-form").remove();
		$(".devnum").show();
	}	

	layer.confirm($.i18n.prop("Asset.Suredeleterecord"), {
		title:$.i18n.prop("comm.Operationtips"),
		btn: [$.i18n.prop("comm.Yes"),$.i18n.prop("comm.Cancel")],  
		shade: false       
	}, function(){
		$.ajax({
			url: _ctx+"/VOrganize/getDeviceByOrgid", 
			data:{"orgid":orgid,"userId":userId,"searchParentId":searchParentId,"keyword":word},  
			async: false,
			cache: false,
			type: "POST",
			dataType: 'json',
			success: function (returnData){
				$("#deleteModal").modal('hide');
				if (returnData && returnData.code==0){
					layer.msg($.i18n.prop("comm.Operationdone"), {icon: 1});
					//searchCondition("all");
					$("#"+orgid).parent().remove();
				}else if(returnData && returnData.code==-1){
					layer.msg($.i18n.prop("Asset.UnableDeleteGroup"),{icon: 4});
				}else if(returnData && returnData.code==-2){
					layer.msg($.i18n.prop("Asset.UnableDeleteDefaultGroup"),{icon: 4});
				}else if(returnData && returnData.code==-3){
					layer.msg($.i18n.prop("comm.NoAccess"),{icon: 4});
				}else{
					layer.msg($.i18n.prop("comm.Failed"),{icon: 5});
				}
			},
			error:function(e){
				//ajaxError("index.jsp",e);
			},
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});
	})
}

/**
 * 搜索控制台设备列表(不需要刷新计数器)
 * @param deviceStatus
 */
function searchCondition(deviceStatus){
	if(dialogMarker){dialogMarker = null;}//打开车辆信息框所用的marker
	refreshIntervalTime();
	//将之前的设备信息框关闭
	if(dialogParen){
		dialogParen.close();
	}
	if(deviceStatus)
	{
		curDeviceStatus=deviceStatus;
	}
	isrefresh=false;
	if(deviceStatus){
		tabActive(deviceStatus);
	}
	searchCommon(curDeviceStatus);
}
function setWord()
{
	word = $("#nope").val().replace(/(^\s+)|(\s+$)/g,"");
}
/**
 * 重置计时器当前时间
 */
function refreshIntervalTime(){
	intervaltime = parseInt($("#intervaltime").val());
}
/**
 * 初始化baidu地图设备名气泡
 */
function initBaiduMapDeviceName(vehicle,marker){
	var content = template('showDeviceName',{"vehicle":vehicle});
	content=$(content).get(0);
	//设备图标角度
	var direction = vehicle.statusMap.gps.direction;
	var label;
	direction = parseInt(direction);
	if(vehicle.show!=2){
		//设备离线和静止时,设备名气泡离设备图标的距离
		label = new BMap.Label(content.outerHTML,{offset:new BMap.Size(-40,-30)});
	}else{
		if(direction<22.5){
			//设备运行在90度时,设备名气泡离设备图标的距离
			label = new BMap.Label(content.outerHTML,{offset:new BMap.Size(-28,-30)});
		}else{
			//设备运行不在90度时,设备名气泡离设备图标的距离
			label = new BMap.Label(content.outerHTML,{offset:new BMap.Size(-28,-22)});
		}
	}
	label.setStyle({
		 border:0,
		 backgroundColor:"transparent"
	 });
	marker.setLabel(label);
	
	if($("#checkboxForDeviceName").is(":Unchecked")){
		var allOverlay = allMap.getOverlays();
		for (var i = 0; i < allOverlay.length; i++){
			if(allOverlay[i].V && allOverlay[i].V.className=="BMap_Marker BMap_noprint" && allOverlay[i].getLabel()){
				allOverlay[i].getLabel().hide();
			}
		}
	}
}

/**
 * 初始化google地图设备名气泡
 */
function initGoogleMapDeviceName(vehicle,marker){
	var content = template('showDeviceName',{"vehicle":vehicle});
	content=$(content).get(0);
	dialog= new InfoBox({
			content : content,
			disableAutoPan : false,
			maxWidth : 0,
			pixelOffset : new google.maps.Size(-50, -50),//减上加下
			zIndex : -1,
			closeBoxURL : "",
			isHidden : false,
			pane : "floatPane",
			enableEventPropagation : false
		});
	
	var mapMaps  = new Map();
	marker.setZIndex(markindex++);
	mapMaps.put("marker",marker);
	mapMaps.put("vehicle",vehicle);
	mapMaps.put("dialog",dialog);
	vehicleArray.push(mapMaps);
}

/**
 * 显示地图设备名气泡
 */
function showMapDeviceName(){
	
	if(allMapType==="googleMap"){
		for(var i = 0; i<vehicleArray.length; i++){
			 var dialog = vehicleArray[i].get("dialog");
			 var marker = vehicleArray[i].get("marker")
			 var imei = vehicleArray[i].get("vehicle")["imei"];
			 if(imei===clickImei){
				marker.setZIndex(markindex++);
				clickMarker = marker;
				clickDialog = dialog;
				clickVehicle = vehicleArray[i].get("vehicle");
			 }else{
				dialog.open(allMap, marker);
			 }
		 }
		if(clickDialog&&clickMarker&&clickVehicle){
			clickDialog.open(allMap, clickMarker);
			var mapMaps  = new Map();
			mapMaps.put("marker",clickMarker);
			mapMaps.put("vehicle",clickVehicle);
			mapMaps.put("dialog",clickDialog);
			vehicleArray.push(mapMaps);
		}
	}else{
		var allOverlay = allMap.getOverlays();
		for (var i = 0; i < allOverlay.length; i++){
			if(allOverlay[i].V && allOverlay[i].V.className=="BMap_Marker BMap_noprint" && allOverlay[i].getLabel()){
				allOverlay[i].getLabel().show();
			}
		}
	}
}

/**清除地图设备名称图标*/
function clearMapDeviceName(){
		if(allMapType==="googleMap"){
			if(vehicleArray){
				for(var i = 0; i<vehicleArray.length; i++){
					var dialog = vehicleArray[i].get("dialog");
					var marker = vehicleArray[i].get("marker")
					dialog.close(allMap,marker);
				 }
			}
		}else{
			var allOverlay = allMap.getOverlays();
			for (var i = 0; i < allOverlay.length; i++){
				if(allOverlay[i].V && allOverlay[i].V.className=="BMap_Marker BMap_noprint" && allOverlay[i].getLabel()){
					allOverlay[i].getLabel().hide();
				}
			}
	}
}

/**
 * 点击设备列表某个设备时,动态将设备名称气泡置顶显示
 */
function showDeviceName(oldImei){
	for(var s = 0; s<vehicleArray.length; s++){
		var imei = vehicleArray[s].get("vehicle")["imei"];
		if(oldImei==imei){
			var marker = vehicleArray[s].get("marker");
			var dialog = vehicleArray[s].get("dialog");
			marker.setZIndex(markindex++);
			if(allMapType==="googleMap"){
				dialog.open(allMap, marker);
			}
			clickImei = imei;
			break;
		}
	}
	
}

/**
 * 点击设备列表获得点击imei
 */
function getClickImei(oldImei){
	for(var s = 0; s<vehicleArray.length; s++){
		var imei = vehicleArray[s].get("vehicle")["imei"];
		if(oldImei==imei){
			return imei;
		}
	}
}