//0:电子围栏，1:地标
var flag = $("#flag").val();
var geoorlamk = $("#flag").val();
var polyType="";
var drawingManager;
var geozonePolygon = null;
var geozonePolygonArray=[];
var infowindow = "";
var areaFence = "";
var areaCode = "";
var areaGeoFlag = false;
/**
 * Google绘制工具加载
 * */

//$(document).ready(function(){
//	var language=$("#language").val();
//	var allMapType=$("#selectGeozoneMap").val();
//	if(language=='en'){
//		$("#map-pin").hide();
//		intoGoogleTools();//初始化google地图绘制工具
//		$("#baiduSearch").hide();
//		$("#googleSearch").show();
//	}else{
//		$("#map-pin").show();
//		//initBaiDuMap();//默认自动加载百度地图
//		intoBaiDuMapTools("polygon");//默认开启多边形
//		alertHtml();
//		$("#baiduSearch").show();
//		$("#googleSearch").hide();
//	}
//	ggSearchAddrTip();
//});

//改变圆的半径
function googleradiusChange(obj){
	if(isNaN(obj.value)){
		$.i18n.prop("comm.InputNotNumber");
	};
	var radius = obj.value;
	if(polyType == "circle"){
		
		if(radius<100){
			geozonePolygon.setRadius(100);
			allMap.setZoom(18);
			radius=100;
			$("#radius").val(radius);
		}else{
			geozonePolygon.setRadius(parseInt(obj.value));
			allMap.setZoom(18);
			$("#radius").val(radius);
		}
	}
}
var cityCircle = "";
var allContent = "";
function defalutCircleSize(radiusMap,flag){
	if(flag == 0){
		var center = $("#coors").val();
		var point = (center.replace("(","").replace(")","")).split(",");
		var circlePoint = new google.maps.LatLng(point[0],point[1]);
		var marker = new google.maps.Marker({
			map : allMap,
			anchorPoint : new google.maps.Point(0, -29)
		});
		var mapOptions = {
				zoom : 17,
				center : circlePoint,
				mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		allMap.setZoom(17);
		allMap.setCenter(circlePoint);
		marker.setPosition(circlePoint);
		marker.setVisible(true);
		var populationOptions = {
				strokeColor : '#FF0000',
				strokeOpacity : 0.8,
				strokeWeight : 2,
				fillColor : '#FF0000',
				fillOpacity : 0.35,
				map : allMap,
				center : circlePoint,
				radius : radiusMap
			};
		cityCircle = new google.maps.Circle(populationOptions);
		geozonePolygonArray.push(cityCircle);
		geozonePolygonArray.push(marker);
		infowindow.setPosition(circlePoint);
		setTimeout(function(){
			infowindow.open(allMap,marker);
		},100);
		$("#maptype").val("google");
	}else{
		cityCircle.setRadius(parseInt(radiusMap));
	}
	setTimeout(function(){
		$("#radius").val(radiusMap);
		$("#ggGeoChangeRadius").val(radiusMap);
		var t = $("#ggGeoChangeRadius").val(); 
		if($.browser.msie){
			//$("#ggGeoChangeRadius").focus().val(t); 
			//$("#ggGeoChangeRadius").val("").focus().val(t); 
			$("#ggGeoChangeRadius").focus();
		}else{
			$("#ggGeoChangeRadius").val("").focus().val(t); 
		}
	},100);
	areaFence = "";
	areaCode = "";
	//$("#ggGeoChangeRadius").focus();
}

$("#map-draw-circle").click(function(){
	$(this).addClass("active");
	drawingManager.setDrawingMode(null); //切换为选择模式,为了使点击地图事件生效
	addOrRemoveCursorClass(0);
	polyType ='circle';
	ggAlertHtml(0);
//	$("#allmap>div>div>div>div>div>div[style]").each(function(){
//		if($(this).css('z-index') == '2000000000'){
//			alert('1');
//		}
//	});
	
});


//function intGginfowindow(){
//	var ggbtn = $('#ggGeoChangeRadius')[0];
//	$("#ggGeoChangeRadius").keyup(function(e){        //pos_keyword就是搜索框，当搜索框按下时响应事件keyup,e就是当前元素element  
//		alert($("ggGeoChangeRadius").val());
//		ggMyfun($("ggGeoChangeRadius").val());
//	});  
//	if($.browser.msie && $.browser.version < 9){
//		ggbtn.onpropertychange = function() {
//			console.log(this.value);
//			ggMyfun(this.value);
//		};
//	}else{
//		ggbtn.oninput = function() {
//			console.log(this.value);
//			ggMyfun(this.value);
//		};
//	}
//}
var radiusMap = "";
function ggMyfun(){
	radiusMap = document.getElementById("ggGeoChangeRadius").value;
	if(!((/^(\+|-)?\d+$/.test(radiusMap)) && radiusMap > 0 )){
		$("#radius").val(radiusMap);
    	layer.msg($.i18n.prop("comm.IsNum"), {time: 2000});
    	return;
	}
	defalutCircleSize(radiusMap,1);
	//console.log(radiusMap);
}

function addOrRemoveCursorClass(flag){
	$("#allmap>div>div>div>div[style]").each(function(){
		if($.browser.msie && ($(this).css('z-index') == '1')){
			if(flag == 0){
				$(this).css({
					"cursor": "url('http://maps.gstatic.cn/mapfiles/crosshair.cur'), auto"
				});
			}else{
				$(this).css({
					"cursor": ""
				});
			}
		}
		if($(this).css('z-index') == '3'){
			if(flag == 0){
				$(this).css({
					"cursor": "url('http://maps.gstatic.cn/mapfiles/crosshair.cur'), auto"
				});
				return false;
			}else{
				$(this).css({
					"cursor": ""
				});
				return false;
			}
		}
	});
}

function ggAlertHtml(flag){
	var htmlcontent = '';
    var setContent ='';
	var strName=$.i18n.prop("Geozones.CreateGeozone");
	var name = $.i18n.prop("Geozones.Name");
	var description = $.i18n.prop("comm.Discription");
	var enterName = $.i18n.prop("Geozones.EnterZoneName");
	var enterDiscription = $.i18n.prop("Geozones.EnterZoneDiscription");
	var radius = $.i18n.prop("comm.Radius");
	var enterRadius = $.i18n.prop("comm.EnterRadius");
	var mi = $.i18n.prop("Geozones.BlackCar.M");
	if(geoorlamk == 1 || flag == 0){
		strName=$.i18n.prop("landmark.CreateLandmark");
		//name=$.i18n.prop("header.ManageLandmarks.LandmarkName");
		//enterName = $.i18n.prop("header.ManageLandmarks.EnterLandmarkName");
		//enterDiscription = $.i18n.prop("comm.Discription");
		description = $.i18n.prop("header.ManageLandmarks.Discription");
		if(flag == 0){
			setContent +='<div class="form-group">';
			setContent +=	'<label title="'+ radius +'" class="col-md-4 control-label p-r0">'+ radius +':</label>';
			setContent +=	'<div class="col-md-6">';
			setContent +=		'<input type="text" id="ggGeoChangeRadius" onkeyup="ggMyfun()" class="form-control form-control-sm">';
			setContent +=	'</div>';
			setContent +=	'<div class="col-md-2 p-t10">'+ mi +'</div>'
			setContent +='</div>';
		}
	}else if(geoorlamk == 2 || flag == 0){
		if(geoorlamk == 2){
			strName=$.i18n.prop("Geozones.BlackCar.CreateAddress");
		}
		setContent +='<div class="form-group">';
		setContent +=	'<label title="'+ radius +'" class="col-md-4 control-label p-r0">'+ radius +':</label>';
		setContent +=	'<div class="col-md-6">';
		setContent +=		'<input type="text" id="ggGeoChangeRadius" onkeyup="ggMyfun()" class="form-control form-control-sm">';
		setContent +=	'</div>';
		setContent +=	'<div class="col-md-2 p-t10">'+ mi +'</div>'
		setContent +='</div>';
	}
	
	htmlcontent += '<form action="" id="userForm" class="form-horizontal form-sm form-ellipsis form-preset p-lr15 p-t15 bs-bb" novalidate="novalidate">';
	htmlcontent += setContent;
	htmlcontent +='<div class="form-group">';
	htmlcontent +=	'<label title="'+ name +'" class="col-md-4 control-label p-r0"><font color="#ff0000">*</font>&nbsp;'+name+':</label>';
	htmlcontent +='<div class="col-md-8">';
	htmlcontent +='<input type="text" id="geonameGoo" name="geonameGoo" class="form-control form-control-sm" "title="'+strName+'"  placeholder="'+enterName+'" />';
	htmlcontent +=	'</div>';
	htmlcontent +='</div>';
	htmlcontent +='<div class="form-group">';
	htmlcontent +=	'<label title=" '+ description +'" class="col-md-4 control-label p-r0">'+description+':</label>';
	htmlcontent +=	'<div class="col-md-8">';
	htmlcontent +=		'<input type="text" id="descriptionGoo" name="descriptionGoo" class="form-control form-control-sm" "title="'+description+""+strName+"" +description+'"  placeholder="'+enterDiscription+'" />';
	htmlcontent +=	'</div>';
	htmlcontent +='</div>';
	htmlcontent +='<div class="form-group">';
	htmlcontent +=	'<label class="col-md-4 control-label p-r0"></label>';
	htmlcontent +=	'<div class="col-md-8">';
	htmlcontent +=		'<input type="button" id="saveGeobuGoo" value="'+$.i18n.prop("comm.Submit")+'"class="btn btn-sm btn-primary mw-100" onclick="saveGoogleGeozoneInfo();"  />';
	htmlcontent +=	'</div>';
	htmlcontent +='</div>';
	htmlcontent +='</form>';
	allContent = htmlcontent;
    infowindow = new google.maps.InfoWindow({
        content: htmlcontent,
        zIndex: 1000
    });
    
  //信息框弹出关闭
	google.maps.event.addListener(infowindow,'closeclick', function() {
		deleteOverlays();
		if(polyType==='polygon'){
			drawingManager.setDrawingMode(google.maps.drawing.OverlayType.POLYGON);
		}
    });
}

function intoGoogleTools(){
	//图形绘制工具控加载此AIP链接后面加上&libraries=drawing
	if(geoorlamk == 2){
		ggAlertHtml(2);
		drawingManager = new google.maps.drawing.DrawingManager({
			//drawingMode: google.maps.drawing.OverlayType.CIRCLE,
			drawingControl: true,
			drawingControlOptions: {
			position: google.maps.ControlPosition.TOP_CENTER,
			drawingModes: [
		      //google.maps.drawing.OverlayType.MARKER,
		      google.maps.drawing.OverlayType.CIRCLE,
		      //google.maps.drawing.OverlayType.POLYLINE,
		     // google.maps.drawing.OverlayType.RECTANGLE
		    ]
		  },
		  circleOptions: {
			strokeColor : "#0000FF",
			strokeOpacity : 0.8,
			strokeWeight : 2,
			fillColor : "#FF0000",
			fillOpacity : 0.4,
			editable:false, //是否可以编辑
			draggable:false //是否可拖动
	  	  }
		});
		polyType = "circle";
	}else{
		drawingManager = new google.maps.drawing.DrawingManager({
			drawingMode: google.maps.drawing.OverlayType.POLYGON,
			drawingControl: true,
			drawingControlOptions: {
			position: google.maps.ControlPosition.TOP_CENTER,
			drawingModes: [
		      //google.maps.drawing.OverlayType.MARKER,
		      google.maps.drawing.OverlayType.CIRCLE,
		      google.maps.drawing.OverlayType.POLYGON, //仅使用多边形绘制工具
		      //google.maps.drawing.OverlayType.POLYLINE,
		      //google.maps.drawing.OverlayType.RECTANGLE
		    ]
		  },
		  circleOptions: {
			strokeColor : "#0000FF",
			strokeOpacity : 0.8,
			strokeWeight : 2,
			fillColor : "#FF0000",
			fillOpacity : 0.4,
			editable:false, //是否可以编辑
			draggable:false //是否可拖动
	  	  },
	  	  polygonOptions: {//设置画线样式
	  	    strokeColor: "#0000FF",  
	  	    strokeOpacity: 0.8,  
	  	    strokeWeight: 3,  
	  	    fillColor: "#FF0000",  
	  	    fillOpacity: 0.35,  
	  	    editable: false 
	  	    } 
		});
	}
	//点击地图页面
    google.maps.event.addListener(allMap, 'click', function(event) {
    	deleteOverlays();
    	if(polyType == "circle"){
			$("#coors").val(event.latLng);
			ggAlertHtml(0);
        	defalutCircleSize(200,0);
    	}else{
			if(polyType==='polygon'){
				 drawingManager.setDrawingMode(google.maps.drawing.OverlayType.POLYGON);
			}
    	}
    	infowindow.setMap(null);
	});
    
	drawingManager.setMap(allMap);
	//注册 多边形 绘制完成事件  
	google.maps.event.addListener(drawingManager, 'polygoncomplete', function(polygon) {
		drawingManager.setDrawingMode(null); //切换为选择模式,为了使点击地图事件生效
		addOrRemoveCursorClass(1);
		geozonePolygon=polygon;
		geozonePolygonArray.push(polygon);
		polyType="polygon";
		ggShowLonLat(polyType,polygon);
	});
	
	google.maps.event.addListener(drawingManager, 'circlecomplete', function(circle) {
		drawingManager.setDrawingMode(null); //切换为选择模式，为了使点击地图事件生效
		addOrRemoveCursorClass(1);
		geozonePolygon=circle;
		geozonePolygonArray.push(circle);
		polyType="circle";
		ggShowLonLat(polyType,circle);
	});
	google.maps.event.addListener(drawingManager, 'drawingmode_changed', function(event) {
		deleteOverlays();
		if(areaGeoFlag){
			infowindow.close();
		}
		if(!drawingManager.drawingMode){
			polyType = "hand";
		}
		if(polyType!="circle"){
			addOrRemoveCursorClass(1);
			ggAlertHtml(1);
		}
		infowindow.setMap(null);
	});
    
	//循环显示 经纬度  
	function ggShowLonLat(polyType,polygon){
		var array;
		if(polyType==='polygon'){
			array= polygon.getPath().getArray();
			var paths = polygon.getPath();
			var geozone=""; 
		    for(var i=0; i<array.length;i++){  
		    	geozone+="|"+array[i];
		    };
		    geozone=geozone.substring(1);
		    //document.getElementById('mapinfo').innerHTML = "手动绘制多边形节点数：" + arr.length + "<br>节点坐标："+info;
		    var falgs=false;
		    var len=array.length;
		    len=Number(len);
		    if(len>=3){
		 	   falgs=true;
		    }else{
		    	infowindow.setMap(null);
		        geozonePolygon.setMap(null);
		        drawingManager.setDrawingMode(google.maps.drawing.OverlayType.POLYGON);
		        if(geoorlamk == 0){
		    		  layer.msg($.i18n.prop("Geozones.EnclosedPolygons"),{time: 2000});
		    	  }else{
		    		  layer.msg($.i18n.prop("landmark.EnclosedPolygons"),{time: 2000});
		    	  }
		 	}
		    if(falgs){
		  	  	$("#coors").val(geozone);
		  	    $("#radius").val("");
		  	  	infowindow.setPosition(paths.getAt(0));
		  	  	infowindow.open(allMap);
		  	  	parent.attrRemoveAndAdd("geonameGoo");
		  	  	placeMarker(array[0]);//取第一个点的坐标为标记
		  	  	$("#radius").val("");
		  	    areaFence = "";
		  	    areaCode = "";
		    }
		}else{
			var radius = polygon.getRadius();
			if(radius<100){
				polygon.setRadius(100);
				allMap.setZoom(18);
				radius=100;
			}
			var center=polygon.center;
			placeMarker(center);//添加标记
			$("#coors").val(center);
			$("#radius").val(radius);
			infowindow.open(allMap);
			parent.attrRemoveAndAdd("geonameGoo");
			infowindow.setPosition(center);
			$("#ggchangeRadius").val(parseInt(radius));
		}
		
		$("#maptype").val("google");
		$("#geonameGoo").focus();
	}  
	
	//增加标记
	function placeMarker(location) {
		  var marker = new google.maps.Marker({
		    position: location,
		    map: allMap,
		  });
		  geozonePolygonArray.push(marker);
		  infowindow.open(allMap,marker);
		}
}

//删除界面所画多变形
function deleteOverlays() {
	if (geozonePolygonArray) {
		for (i in geozonePolygonArray) {
			geozonePolygonArray[i].setMap(null);
		}
		geozonePolygonArray.length = 0;
	}
}

// 弹框后输入围栏信息保存
function saveGoogleGeozoneInfo(){
	var totalRecord=parseInt($("#userCount").val());
	$("#saveGeobuGoo").removeAttr("onclick");
	$("input[name='geonameGoo']").removeClass("form-control-error");
	var num=10;
	geoorlamk=Number(geoorlamk);
	if(geoorlamk==0){
		num=geozoneCount;
	}else{
		num=landMarCount;
	}
	
	var geoname=$("#geonameGoo").val();
	var description=$("#descriptionGoo").val();
	geoname=$.trim(geoname);
	if(geoname==''){
        document.getElementById('geonameGoo').focus();
        var strName=$.i18n.prop("Geozones.Geozone");
        if(geoorlamk != 0){
            strName=$.i18n.prop("landmark");
        }
        $("input[name='geonameGoo']").addClass("form-control-error");
        $("#saveGeobuGoo").attr("onclick","saveGoogleGeozoneInfo();");
        //layer.msg($.i18n.prop("landmark.Enter")+""+strName+""+$.i18n.prop("comm.title"));
        return;
    }
	 if (geoname && geoname.indexOf("'") > 0) {
	   	  document.getElementById('geonameGoo').focus();
	   	  layer.msg($.i18n.prop("Geozones.Tip").replace("#","'"),{time: 2000});
	   	  $("input[name='geonameGoo']").addClass("form-control-error");
	   	  $("#saveGeobuGoo").attr("onclick","saveGoogleGeozoneInfo();");
	        return;
     }
	 NameMaxLength = 200;
    if(geoname.length>NameMaxLength){
        document.getElementById('geonameGoo').focus();
        layer.msg($.i18n.prop("Geozones.NameMaxLength").replace("#",NameMaxLength),{time: 2000});
        $("#saveGeobuGoo").attr("onclick","saveGoogleGeozoneInfo();");
        return;
    }
    DescMaxLength = 500;
    if(description.length>DescMaxLength){
        document.getElementById('descriptionGoo').focus();
        layer.msg($.i18n.prop("Geozones.DescrMaxLength").replace("#",DescMaxLength),{time: 2000});
        $("#saveGeobuGoo").attr("onclick","saveGoogleGeozoneInfo();");
        return;
    }
	
	if(totalRecord<1000){
		var mapType=$("#maptype").val();
		var coors=$("#coors").val();
		var radius=$("#radius").val();
		if(polyType =='circle'){
			if(!((/^(\+|-)?\d+$/.test(radius)) && radius > 0 )){  
		    	layer.msg($.i18n.prop("comm.IsNum"), {time: 2000});
		    	$("#saveGeobuGoo").attr("onclick","saveGoogleGeozoneInfo();");
				if($.browser.msie){
					$("#ggGeoChangeRadius").focus().val(radius); 
				}else{
					$("#ggGeoChangeRadius").val("").focus().val(radius); 
				}
		    	return;
			}
			if(radius && (radius < 200)){
				layer.msg($.i18n.prop("Geozones.TipRadius").replace("#","200"), {time: 2000});
				$("#saveGeobuGoo").attr("onclick","saveGoogleGeozoneInfo();");
				if($.browser.msie){
					$("#ggGeoChangeRadius").focus().val(radius); 
				}else{
					$("#ggGeoChangeRadius").val("").focus().val(radius); 
				}
				return;
			}
		}
		

		GoogleajaxMapFencingSave(mapType,coors,radius,geoname,description);
	}else{
		var alertmsg="";
		if(geoorlamk==0){
			var msg=$.i18n.prop("Geozones.GeozoneCountMax");
			alertmsg=msg.replace("#",geozoneCount);
			parent.createFenceModalHide();
			parent.getGeozoneList('1','10','0');
			parent.layer.msg(alertmsg, {time: 2000});
		}else if(geoorlamk==1){
			var msg=$.i18n.prop("Geozones.LandMarCountMax");
			alertmsg=msg.replace("#",landMarCount);
			parent.createFenceModalHide();
			parent.getLamkList('1','10','1');
			parent.layer.msg(alertmsg, {time: 2000});
		}else if(geoorlamk==2){
			var msg=$.i18n.prop("Geozones.BlackCar.CountMax");
			alertmsg=msg.replace("#",blackCarCount);
			parent.createFenceModalHide();
			parent.getBlackCarAddressLibraryList('1','10','2');
			parent.layer.msg(alertmsg, {time: 2000});
		}
	}
}

//围栏保存到后台  geoorlamk:0为电子围栏
var postSaveUrl=_ctx+"/geozone/editGeozone";
var NameMaxLength=20;
var DescMaxLength=40;
function GoogleajaxMapFencingSave(mapType,coors,radius,geoname,description){
	if(geoname!=''){
		var zoom=allMap.getZoom();
		var geonId = $("#geonId").val();
		$.ajax({
			type:'POST',
			url:postSaveUrl,
			data:{
				"id":geonId,
				"geom":coors,
				"radius":radius,
				"mapType":mapType,
				"type":polyType,
				"geoname":geoname,
				"description":description,
				"scale":zoom,
				"areaFlag":areaFence,
				"areaCode":areaCode,
				"flag":geoorlamk},
			dataType:'json',
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			},
			success: function(rest){
				if(rest.ok){
					if(geoorlamk == 0){
						parent.createFenceModalHide();
						parent.layer.msg($.i18n.prop("Geozones.SaveGeoSuccessTip"), {time: 2000});
						setTimeout(function(){
							var geonid = rest.data.id;
							var geonames = rest.data.geoname;
							parent.createAlarm(geonid,geonames,"0");
							$("#maptype").val(mapType);
							$("#coors").val(coors);
							$("#radius").val(radius);
						},1000);
					}else if(geoorlamk == 1){
						parent.createFenceModalHide();
						parent.getLamkList('1','10','1');
					}else if(geoorlamk == 2){
						parent.createFenceModalHide();
						parent.getBlackCarAddressLibraryList('1','10','2');
					}
				}else{
					if(rest.code==31002){
						layer.msg($.i18n.prop("Geozones.YESGeozoneName"),{time: 2000});
						$("#saveGeobuGoo").attr("onclick","saveGoogleGeozoneInfo();");
					}else{
						if(geoorlamk == 0){
							layer.msg($.i18n.prop("comm.Failed"),{time: 2000,icon: 2});
						}else{
							layer.msg($.i18n.prop("comm.Operationdone"),{time: 2000,icon: 1});
						}
					}
				}
			}
		});
	}else{
		document.getElementById('geonameGoo').focus();
		var strName=$.i18n.prop("Geozones.Geozone");
		if(geoorlamk != 0){
			strName=$.i18n.prop("landmark");
		}
		layer.msg($.i18n.prop("landmark.Enter")+""+strName+""+$.i18n.prop("comm.title"));
	}
}

//设置围栏
function gotoCreateAlarm(id,geoname){
	//window.location.href=_ctx+"/geozone/giveanalarm?id="+id+"&geonames="+geoname;
	
	$.ajax({
  		type:'post',
  		url:_ctx+'/geozone/giveanalarm',
  		data:{"id":id,"geoname":geoname},
  		success:function(ret){
  			if(ret.ok){
  				$("#setFenceModal").modal();
  			}
  		}
  	});
}

/**
 * Google搜索
 * */
function googleSeach(){
 	var input = document.getElementById('googlemapSearchText');
	var autocomplete = new google.maps.places.Autocomplete(input);
	autocomplete.bindTo('bounds', allMap);

	var marker = new google.maps.Marker({
		map : allMap,
		anchorPoint : new google.maps.Point(0, -29)
	});
	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		marker.setVisible(false);
		var place = autocomplete.getPlace();
		if (!place.geometry) {
			//window.alert("Google地图仅支持国外访问搜索！");
			return;
		}
		// If the place has a geometry, then present it on a map.
		if (place.geometry.viewport) {
			allMap.fitBounds(place.geometry.viewport);
		} else {
			allMap.setCenter(place.geometry.location);
			var zoom = allMap.getZoom();
			if(zoom==2){
				zoom = 17;
			}else if(zoom==12){
				zoom = 17;
			}else{
				zoom = 17;
			}
			allMap.setZoom(zoom); // Why 17? Because it looks good.
		}
//		marker.setIcon(/** @type {google.maps.Icon} */
//		({
//			url : place.icon,
//			size : new google.maps.Size(71, 71),
//			origin : new google.maps.Point(0, 0),
//			anchor : new google.maps.Point(17, 34),
//			scaledSize : new google.maps.Size(35, 35)
//		}));
		marker.setPosition(place.geometry.location);
		marker.setVisible(true);
		var center = marker.getPosition();
		if(polyType == "circle"){
			$("#coors").val(center);
			defalutCircleSize(200,0);
		}
	});

	// Sets a listener on a radio button to change the filter type on Places
	// Autocomplete.
	function setupClickListener(id, types) {
		var radioButton = document.getElementById(id);
		google.maps.event.addDomListener(radioButton, 'click', function() {
			autocomplete.setTypes(types);
		});
	}

//	setupClickListener('changetype-all', []);
//	setupClickListener('changetype-address', [ 'address' ]);
//	setupClickListener('changetype-establishment', [ 'establishment' ]);
//	setupClickListener('changetype-geocode', [ 'geocode' ]);
	  
}

function getAdministrativeAreaPoint(myMapType,geoCityPickerName,areaflag,geoCode){
	areaGeoFlag = true;
	deleteOverlays();
	if(infowindow){
		infowindow.close();
	}
	$.ajax({
		url: _ctx + "/geozone/getAdministrativeAreaPoint",
		async: true,
	    cache: false,
	    data:{"mapType": myMapType,"code":geoCode},
	    dataType: 'json',
	    complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
	    success: function(ret){
	    	if(ret.code == 0){
	    		ggAlertHtml(1);
	    		var points = ret.data;
	    		var centerAndZoomPointLat;
				var centerAndZoomPointLng;
				var GmapPointArray = [];
				var bounds = new google.maps.LatLngBounds();
	    		for (var i = 0;i<points.length;i++) {
					var lat = points[i].lat;
					var lng = points[i].lng;
					centerAndZoomPointLat = points[0].lat;
					centerAndZoomPointLng = points[0].lng;
					var pointArray = new google.maps.LatLng(lat, lng);
					GmapPointArray.push(pointArray);
					bounds.extend(pointArray);
				}
				var myLatlng = new google.maps.LatLng(centerAndZoomPointLat,
						centerAndZoomPointLng);
				var mapOptions = {
					zoom : allMap.getZoom(),
					center : myLatlng,
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
					editable : false, //是否可以编辑
					draggable : false
				//是否可拖动
				});
				polygonGoogle.setMap(allMap);
				allMap.fitBounds(bounds);
				geozonePolygonArray.push(polygonGoogle);
				if(areaflag == 0){
					polyType ='polygon';
					allMap.setCenter(myLatlng);
					infowindow.setPosition(myLatlng);
					infowindow.open(allMap);
					$("#radius").val("");
					setTimeout(function(){
				    	var area = $.i18n.prop("Geozones.AdministrativeArea");
						$("#geonameGoo").val(geoCityPickerName+"("+area+")");
						$("#geonameGoo").attr("disabled",true);
				    },300);
				    areaFence = "1";
				}
	    	}else{
	    		layer.msg($.i18n.prop("Geozones.NotSupportDraw"),{time: 2000});
	    	}
	    },
		error : function(e) {
			ajaxError("getBoundary()", e);
		}
	});
}