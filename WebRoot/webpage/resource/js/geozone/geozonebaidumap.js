//0:电子围栏，1:地标
var flag = $("#flag").val();
var geoorlamk = $("#flag").val();
var drawingManagerBaidu;
var polyType="";
var baiduoverlays=[];
var infoWindow;
var infoWindowFlag=true;
var drawingModes;
var areaFence = "";
var areaCode = "";
var definitionDrawingType = "";
if(geoorlamk == 2){
	var definitionDrawingType = "circle";
}else{
	var definitionDrawingType = "polygon";
}

//$("#selectGeozoneMap").change(function(){
//	var mapType=$(this).children('option:selected').val();//这就是selected的值 
//	if(mapType=='googleMap'){
//		$("#map-pin").hide();
//		$("#baiduSearch").hide();
//		$("#googleSearch").show();
//		initGoogleMap();//初始化google地图
//		intoGoogleTools();//初始化google地图绘制工具
//		googleSeach();
//	}else{
//		$("#map-pin").show();
//		$("#baiduSearch").show();
//		$("#googleSearch").hide();
//		initBaiDuMap("");//初始化百度地图
//		intoBaiDuMapTools("polygon");//初始化百度地图绘制工具
//		baiduInit();
//	}
//});

///**
// * 地址查询 
// * 自动提示功能
// * @param inputId
// */
//function bdSearchAddrTip(){
//	var language=$("#language").val();
//	var allMapType=$("#selectGeozoneMap").val();
//	if(language=='en'){
//		googleSeach();
//	}else{
//		baiduInit();
//	}
//}
var test = "";
/**
 * 百度绘制工具加载
 * */
function intoBaiDuMapTools(myDrawingModes,mode){
	//allMap.removeEventListener("click", initToDrawing);
	//实例化鼠标绘制工具
	if(geoorlamk == 2){
		drawingManagerBaidu = new BMapLib.DrawingManager(allMap, {
		    isOpen: false, //是否开启绘制模式
		    enableDrawingTool: true, //是否显示工具栏
		    drawingToolOptions: {
		        anchor: BMAP_ANCHOR_TOP_RIGHT, //位置
		        drawingModes: [BMAP_DRAWING_CIRCLE],
		        offset: new BMap.Size(150, 5), //偏离值
		        scale: 0.6 //工具栏缩放比例
		    },
		    circleOptions: {
		    	enableClicking:true,
		    	strokeColor : "#0000FF",
		   		strokeOpacity : 0.8,
		   		strokeWeight : 2,
		   		fillColor : "#FF0000",
		        fillOpacity : 0.4,
		   		editable:false, //是否可以编辑
		   		draggable:false//是否可拖动	
		    }
		});
		myDrawingModes = "circle";
		definitionDrawingType == "circle"
	}else{
		drawingManagerBaidu = new BMapLib.DrawingManager(allMap, {
		    isOpen: false, //是否开启绘制模式
		    enableDrawingTool: true, //是否显示工具栏
		    drawingToolOptions: {
		        anchor: BMAP_ANCHOR_TOP_RIGHT, //位置
		       // drawingModes: [BMAP_DRAWING_CIRCLE,BMAP_DRAWING_POLYGON],
		        drawingModes: [BMAP_DRAWING_POLYGON],
		        offset: new BMap.Size(150, 5), //偏离值
		        scale: 0.6 //工具栏缩放比例
		    },
		  /*  circleOptions: {
		    	enableClicking:false,
		    	strokeColor : "#0000FF",
		   		strokeOpacity : 0.8,
		   		strokeWeight : 2,
		   		fillColor : "#FF0000",
		        fillOpacity : 0.4,
		   		editable:false, //是否可以编辑
		   		draggable:false//是否可拖动	
		    }, //多边形的样式*/	
	     polygonOptions: {
		    	enableClicking:true,
		    	strokeColor : "#0000FF",
		   		strokeOpacity : 0.8,
		   		strokeWeight : 2,
		   		fillColor : "#FF0000",
		        fillOpacity : 0.4,
		   		editable:false, //是否可以编辑
		   		draggable:false //是否可拖动	
		    } //多边形的样式
		});
	}
	
	drawingManagerBaidu.setDrawingMode(myDrawingModes);//默认进入地图开启画多边形
	//添加鼠标绘制工具监听事件，用于获取绘制结果
	drawingManagerBaidu.addEventListener('overlaycomplete', overlaycomplete);
	//if(mode==1){
		drawingManagerBaidu.open();
	//}
	
}

//if($.browser.msie) {  //判断是否IE浏览器
//	geoChangeRadius.onpropertychange = myfun;  //IE的话添加onpropertychange 事件
//}else{
//	geoChangeRadius.addEventListener("input",myfun,false);  //非IE的话用 addEventListener 添加监听事件
//}

$("#drawAreaGeo").click(function(){
	if(myMapType == "baidu"){
		infoWindow.close();
		//allMap.clearOverlays();
		intoBaiDuMapTools("hander");
		drawingManagerBaidu.close();
	}else{
		drawingManager.setDrawingMode(null); //切换为选择模式,为了使点击地图事件生效
	}
});

var radiusMap = "";
function myfun(){
	radiusMap = $("#bdGeoChangeRadius").val();
	if(!((/^(\+|-)?\d+$/.test(radiusMap)) && radiusMap > 0 )){  
		$("#radius").val(radiusMap);
    	layer.msg($.i18n.prop("comm.IsNum"), {time: 2000});
    	return;
	}
	//console.log(radiusMap);
	displayCircle(radiusMap,1);
}
var lngMap = "";
var latMap = "";
function showInfo(e){
	if(definitionDrawingType == "circle"){
		allMap.clearOverlays();
		lngMap = e.point.lng;
		latMap = e.point.lat;
		radiusMap = 200;
		displayCircle(radiusMap,0);
	}
}

function bdradiusChange(obj){
	if(isNaN(obj.value)){
		$.i18n.prop("comm.InputNotNumber");
	};
	if(drawingModes.target.getDrawingMode() === 'circle'){
		var radius;
		if(obj.value<100){
			drawingModes.overlay.setRadius(100);
			allMap.setZoom(18);
			radius=100;
			$("#radius").val(radius);
		}else{
			drawingModes.overlay.setRadius(obj.value);
			allMap.setZoom(18);
			$("#radius").val(radius);
		}
	}
}

//TODO 
var circle = "";
function displayCircle(radius,flag){
	if(flag == 0){
		clearAll();
		var circlePoint = new BMap.Point(lngMap,latMap);
		if(flag == 0){
			allMap.centerAndZoom(circlePoint, allMap.getZoom()); //设置中心点坐标和地图级别
		}
		circle = new BMap.Circle(circlePoint, radius);
		circle.setFillColor("#ff0000"); //填充颜色
		circle.setStrokeColor("#0000ff"); //边线颜色
		var marker = new BMap.Marker(circlePoint);
		allMap.addOverlay(marker);    //添加标注3
		allMap.addOverlay(circle); //增加圆
		baiduoverlays.push(circle);
		if(flag == 0){
			allMap.openInfoWindow(infoWindow,circlePoint); //开启信息窗口
		}
		intoBaiDuMapTools("circle");
		$("#maptype").val("baidu");
		var coors="("+latMap+","+lngMap+")";
		$("#coors").val(coors);
		 
	}else{
		circle.setRadius(radius);
	}
	$("#radius").val(radius);
	areaFence = "";
	areaCode = "";
}

function switchingDrawing(drawingType){
	infoWindow.close();
	//allMap.clearOverlays();
	intoBaiDuMapTools(drawingType,1);
	definitionDrawingType = drawingType;
	if(drawingType == "circle"){
		alertHtml(0);
	}else{
		alertHtml(1);
	}
}

//清除围栏
function clearAll() {
	for (var i = 0; i < baiduoverlays.length; i++) {
		allMap.removeOverlay(baiduoverlays[i]);
	}
	baiduoverlays.length = 0;
}

function alertHtml(flag){
	var htmlcontent = '';
	var opts ={};
	var setContent = "";
	var strName=$.i18n.prop("Geozones.CreateGeozone");
	var name = $.i18n.prop("Geozones.Name");
	var description = $.i18n.prop("comm.Discription");
	var enterName = $.i18n.prop("Geozones.EnterZoneName");
	var enterDiscription = $.i18n.prop("Geozones.EnterZoneDiscription");
	var radius = $.i18n.prop("comm.Radius");
	var enterRadius = $.i18n.prop("comm.EnterRadius");
	var mi = $.i18n.prop("Geozones.BlackCar.M");
	var size = 180;
	if(geoorlamk == 1|| flag == 0){
		strName=$.i18n.prop("landmark.CreateLandmark");
		//name=$.i18n.prop("header.ManageLandmarks.LandmarkName");
		//enterName = $.i18n.prop("header.ManageLandmarks.EnterLandmarkName");
		//enterDiscription = $.i18n.prop("comm.Discription");
		description = $.i18n.prop("header.ManageLandmarks.Discription");
		if(flag == 0){
			setContent +='<div class="form-group">';
			setContent +=	'<label title="'+ radius +'" class="col-md-3 control-label p-r0">'+ radius +':</label>';
			setContent +=	'<div class="col-md-6 p-r0">';
			setContent +=		'<input type="text" id="bdGeoChangeRadius" onkeyup="myfun()" class="form-control">';
			setContent +=	'</div>';
			setContent +=	'<div class="col-md-2 p-t10">'+ mi +'</div>'
			setContent +='</div>';
			size = 220;
		}
	}else if(geoorlamk == 2 || flag == 0){
		if(geoorlamk == 2){
			strName=$.i18n.prop("Geozones.BlackCar.CreateAddress");
		}
		setContent +='<div class="form-group">';
		setContent +=	'<label title="'+ radius +'" class="col-md-3 control-label p-r0">'+ radius +':</label>';
		setContent +=	'<div class="col-md-6 p-r0">';
		setContent +=		'<input type="text" id="bdGeoChangeRadius" onkeyup="myfun()" class="form-control">';
		setContent +=	'</div>';
		setContent +=	'<div class="col-md-2 p-t10">'+ mi +'</div>'
		setContent +='</div>';
		size = 220;
	}
	
	htmlcontent += '<form action="" id="userForm" class="form-horizontal form-sm form-ellipsis form-preset p-t15 bs-bb" novalidate="novalidate">';
	htmlcontent += setContent;
	htmlcontent +='<div class="form-group">';
	htmlcontent +=	'<label title="'+ name +'" class="col-md-3 control-label p-r0"><font color="#ff0000">*</font>&nbsp;'+name+':</label>';
	htmlcontent +='<div class="col-md-8">';
	htmlcontent +='<textarea style="height: 40px" class="form-control" id="geonameHtml" name="geonameHtml" "title="'+strName+'"  placeholder="'+enterName+'" rows="2"></textarea>';
//	htmlcontent +='<input type="text" id="geonameHtml" name="geonameHtml" class="form-control form-control-sm" "title="'+strName+'"  placeholder="'+enterName+'" />';
	htmlcontent +=	'</div>';
	htmlcontent +='</div>';
	htmlcontent +='<div class="form-group">';
	htmlcontent +=	'<label title="'+ description +'" class="col-md-3 control-label p-r0">'+description+'</label>';
	htmlcontent +=	'<div class="col-md-8">';
	htmlcontent +=		'<textarea style="height: 40px" class="form-control" id="descriptionHtml" name="descriptionHtml" "title="'+description+'" placeholder="'+enterDiscription+'" rows="2"></textarea>';
//改用多行	htmlcontent +=		'<input type="text" id="descriptionHtml" name="descriptionHtml" class="form-control form-control-sm" "title="'+description+'"  placeholder="'+enterDiscription+'" />';
	htmlcontent +=	'</div>';
	htmlcontent +='</div>';
	htmlcontent +='<div class="form-group m-b0">';
	htmlcontent +=	'<label class="col-md-3 control-label p-r0"></label>';
	htmlcontent +=	'<div class="col-md-8">';
	htmlcontent +=		'<input type="button" id="saveGeoBu" value="'+$.i18n.prop("comm.Submit")+'"class="btn btn-sm mw-100 btn-primary" onclick="saveBaiduGeozoneInfo();"  />';
	htmlcontent +=	'</div>';
	htmlcontent +='</div>';
	htmlcontent +='</form>';
	opts = {
			width : 300,     // 信息窗口宽度
			height: size,    // 信息窗口高度
			//title : strName, // 信息窗口标题
			enableMessage:false,//设置允许信息窗发送短息
			message:htmlcontent
	};
	infoWindow = new BMap.InfoWindow(htmlcontent,opts);  // 创建信息窗口对象 
	infoWindow.addEventListener("close", function(e) {
		//allMap.clearOverlays();
    	if(areaFence == "1"){
    		intoBaiDuMapTools("hander");
        	drawingManagerBaidu.close();
    	}else{
    		if(polyType=='polygon'){
    			intoBaiDuMapTools("polygon");
    		}else if(polyType=='circle'){
    			intoBaiDuMapTools("circle");
    		}
    	}
	});
	infoWindow.addEventListener("open", function(e) {
		setTimeout(function(){
			if(areaFence == "1"){
				var area = $.i18n.prop("Geozones.AdministrativeArea");
				$("#geonameHtml").val(geoCityPickerName+"("+area+")");
				$("#geonameHtml").attr("disabled",true);
			}
			$("#bdGeoChangeRadius").val(radiusMap);
			var t=$("#bdGeoChangeRadius").val(); 
			if($.browser.msie){
				$("#bdGeoChangeRadius").focus().val(t); 
			}else{
				$("#bdGeoChangeRadius").val("").focus().val(t); 
			}
			//document.getElementById("bdGeoChangeRadius").focus();
		},100);
		
		if(polyType=='polygon'){
			intoBaiDuMapTools("polygon");
		}
	});
}

	// 回调获得覆盖物信息
function overlaycomplete(e) {
	drawingModes=e;
	baiduoverlays.push(e.overlay);
	try {
		if (e.target.getDrawingMode() === 'polygon') {
			polyType = "polygon";
			var array = e.overlay.getPath();
			
			drawingManagerBaidu.setDrawingMode(BMAP_DRAWING_POLYLINE);//开启画多边形
			showLonLat(array);
		}
		if (e.target.getDrawingMode() === 'circle') {
			polyType = "circle";
			var points = e.overlay.point;
			var radius = e.overlay.getRadius();
			if(radius<100){
				e.overlay.setRadius(100);
				allMap.setZoom(18);
				radius=100;
			}
			$("#radius").val(radius);
			showLonLat(points);
			drawingManagerBaidu.setDrawingMode(BMAP_DRAWING_CIRCLE);//
		}
	} catch (e) {
		
	}
}


	//获取所画围栏点经纬度
function showLonLat(arr){
	areaFence = "";
	areaCode = "";
	var coors;
	if(polyType==='polygon'){
		  var info="{"; 
	      for(var i=0; i<arr.length;i++){
	   		//纬度&经度
	   	   info+=arr[i].lat+","+arr[i].lng+";";
	      }
	      info+="}";
	      coors=info;//.substring(1);
	      var str=$.i18n.prop("landmark.PolygonNodeNumber")+"：" + (arr.length) + "&nbsp;"+$.i18n.prop("landmark.NodeCoordinate")+"："+info;
	      //document.getElementById('mapinfo').innerHTML = "手动绘制多边形节点数：" + arr.length + "<br>节点坐标："+info;
//		      console.log("overlaycomplete:"+str);
	      
	      var falgs=false;
	      var len=arr.length;
	      len=Number(len);
	      if(len>=3){
	   	   falgs=true;
	      }else{
	    	  intoBaiDuMapTools(polyType);
	    	  if(geoorlamk == 0){
	    		  layer.msg($.i18n.prop("Geozones.EnclosedPolygons"),{time: 2000});
	    	  }else{
	    		  layer.msg($.i18n.prop("landmark.EnclosedPolygons"),{time: 2000});
	    	  }
	    	  clearAll();
	   	  }
	      if(falgs){
	    	  $("#coors").val(coors);
	    	  var point = new BMap.Point(arr[0].lng,arr[0].lat);
	    	  
	    	  var marker = new BMap.Marker(point);
	    	  baiduoverlays.push(marker);
	  		  allMap.addOverlay(marker);
			  allMap.openInfoWindow(infoWindow,point); //开启信息窗口
			  intoBaiDuMapTools("hander");
			  $("#radius").val("");
	      }
	}else{
		coors="("+arr.lat+","+arr.lng+")";
		$("#coors").val(coors);
		var centerPoint=new BMap.Point(arr.lng,arr.lat);
		var marker = new BMap.Marker(centerPoint);//创建标记
		baiduoverlays.push(marker);//将标记放入数据，以便信息窗口关闭同时清掉
		allMap.addOverlay(marker);//添加标记
		allMap.openInfoWindow(infoWindow,centerPoint); //开启信息窗口
	}
	$("#maptype").val("baidu");
	document.getElementById('geonameHtml').focus();
 }

//弹框后输入围栏信息保存
function saveBaiduGeozoneInfo(){
	var totalRecord=parseInt($("#userCount").val());
	if($("#agencyId").val()=='new'){
		$(parent.document.getElementById('areaRail')).val($("#coors").val());
		parent.createFenceModalHide();
	}

	var agencyId=parseInt($("#agencyId").val());
	$("#saveGeoBu").removeAttr("onclick");
	$("#geonameHtml").removeClass("form-control-error");
	var num=10;
	geoorlamk=Number(geoorlamk);
	if(geoorlamk==0){
		num=geozoneCount;
	}else{
		num=landMarCount;
	}
	
	var geoname=$("#geonameHtml").val();
	var description=$("#descriptionHtml").val();
	geoname=$.trim(geoname);
	if(geoname==''){
        document.getElementById('geonameHtml').focus();
        var strName=$.i18n.prop("Geozones.Geozone");
        if(geoorlamk != 0){
            strName=$.i18n.prop("landmark");
        }
        $("#geonameHtml").addClass("form-control-error");
        $("#saveGeoBu").attr("onclick","saveBaiduGeozoneInfo();");
        //layer.msg($.i18n.prop("landmark.Enter")+""+strName+""+$.i18n.prop("comm.title"));
        return;
    }
	 if (geoname && geoname.indexOf("'") > 0) {
   	  document.getElementById('geonameHtml').focus();
   	  layer.msg($.i18n.prop("Geozones.Tip").replace("#","'"),{time: 2000});
	   	$("#geonameHtml").addClass("form-control-error");
	    $("#saveGeoBu").attr("onclick","saveBaiduGeozoneInfo();");
         return;
     } 
	NameMaxLength = 200;
    if(geoname.length>NameMaxLength){
        document.getElementById('geonameHtml').focus();
        layer.msg($.i18n.prop("Geozones.NameMaxLength").replace("#",NameMaxLength),{time: 2000});
        $("#saveGeoBu").attr("onclick","saveBaiduGeozoneInfo();");
        return;
    }
    DescMaxLength = 500;
    if(description.length>DescMaxLength){
        document.getElementById('descriptionHtml').focus();
        layer.msg($.i18n.prop("Geozones.DescrMaxLength").replace("#",DescMaxLength),{time: 2000});
        $("#saveGeoBu").attr("onclick","saveBaiduGeozoneInfo();");
        return;
    }
	
	if(totalRecord<1000){
		var mapType=$("#maptype").val();
		var coors=$("#coors").val();
		var radius=$("#radius").val();
		if(definitionDrawingType == "circle"){
			if(!((/^(\+|-)?\d+$/.test(radius)) && radius > 0 )){  
		    	layer.msg($.i18n.prop("comm.IsNum"), {time: 2000});
		    	$("#saveGeoBu").attr("onclick","saveBaiduGeozoneInfo();");
				if($.browser.msie){
					$("#bdGeoChangeRadius").focus().val(radius); 
				}else{
					$("#bdGeoChangeRadius").val("").focus().val(radius); 
				}
		    	return;
			}
			if(radius && (radius < 200)){
				layer.msg($.i18n.prop("Geozones.TipRadius").replace("#","200"), {time: 2000});
				$("#saveGeoBu").attr("onclick","saveBaiduGeozoneInfo();");
				if($.browser.msie){
					$("#bdGeoChangeRadius").focus().val(radius); 
				}else{
					$("#bdGeoChangeRadius").val("").focus().val(radius); 
				}
				return;
			}
		}
		ajaxMapFencingSave(mapType,coors,radius,geoname,description,agencyId);
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
var postSaveUrl=_ctx+"../../rest/geozoneControl/geozone/addgeozone";
var NameMaxLength=20;
var DescMaxLength=40;
function ajaxMapFencingSave(mapType,coors,radius,geoname,description,agencyId){
	
	if(geoname!=''){
		var zoom=allMap.getZoom();
		var geonId = $("#geonId").val();
		$.ajax({
			type:'POST',
			url:"postSaveUrl",
			data:{
				"agencyId":agencyId,
				"id":geonId,
				"geom":coors,//坐标
				"radius":radius,//半径
				"mapType":mapType,//地图类型
				"type":polyType,//多边形还是圆
				"geoname":geoname,
				"description":description,
				"scale":zoom,//地图级别
				"flag":geoorlamk,//区分围栏还是地标还是黑车地址库
				"areaFlag":areaFence,//区分是否是区域围栏
				"areaCode":areaCode},
			dataType:'json',
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			},
			success: function(rest){
				if(rest.statusCode==0){
					if(geoorlamk == 0){
						parent.createFenceModalHide();
						parent.layer.msg($.i18n.prop("Geozones.SaveGeoSuccessTip"), {time: 2000});
						setTimeout(function(){
							allMap.clearOverlays();
							var geonid = rest.data.id;
							var geonames = rest.data.geoname;
							parent.createAlarm(geonid,geonames,"0");
							$("#maptype").val(mapType);
							$("#coors").val(coors);
							$("#radius").val(radius);
						},1000);
					}else if(geoorlamk == 1){
						layer.msg($.i18n.prop("保存成功"), {time: 2000});
						//parent.createFenceModalHide();
//						allMap.clearOverlays();
//						parent.getLamkList('1','10','1');
					}else if(geoorlamk == 2){
						parent.createFenceModalHide();
						allMap.clearOverlays();
						parent.getBlackCarAddressLibraryList('1','10','2');
					}
				}else{
					if(rest.code==31002){
						layer.msg($.i18n.prop("Geozones.YESGeozoneName"),{time: 2000});
						$("#saveGeoBu").attr("onclick","saveBaiduGeozoneInfo();");
					}else{
						if(geoorlamk == 0){
							layer.msg($.i18n.prop("comm.Failed"),{time: 2000,icon: 2});
							$("#saveGeoBu").attr("onclick","saveBaiduGeozoneInfo();");
						}else{
							layer.msg($.i18n.prop("comm.Operationdone"),{time: 2000,icon: 1});
						}
					}
				}
			}
		});
	}else{
		document.getElementById('geonameHtml').focus();
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

//百度搜索
function baiduInit(){
	// 百度地图API功能
	function G(id) {
		return document.getElementById(id);
	}
	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
		{"input" : "mapSearchText"
		,"location" : allMap
	});
	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		G("searchResultPanel").innerHTML = str;
	});
	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
		myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		setPlace();
		/*var language=$("#language").val();
		var allMapType=$("#selectGeozoneMap").val();
		if(language=='en'){
			intoGoogleTools();
		}else{
			intoBaiDuMapTools();
		}*/
	});

	function setPlace(){
		allMap.clearOverlays();    //清除地图上所有覆盖物
		function myFun(){
			var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
			var zoom = allMap.getZoom();
			allMap.centerAndZoom(pp,18);
			var marker = new BMap.Marker(pp);
			allMap.addOverlay(marker);    //添加标注3
			if(definitionDrawingType == "circle"){
				lngMap = pp.lng;
				latMap = pp.lat;
				radiusMap = 200;
				displayCircle(radiusMap,0);
			}
			//拖动覆盖物
//			marker.enableDragging();
//			marker.addEventListener("dragend",getAttr);
		}
		var local = new BMap.LocalSearch(allMap, { //智能搜索
		  onSearchComplete: myFun
		});
		local.search(myValue);
		drawingManagerBaidu.setDrawingMode("hander");//
	}
}

//拖动覆盖物
//function getAttr(){
//	var p = marker.getPosition();       //获取marker的位置
//	lngMap = p.lng;
//	latMap = p.lat;
//	displayCircle(radiusMap,0);
//}
//
//function dragCircle(point){
//	var circle = new BMap.Circle(point, 200);
//	circle.setFillColor("#FF0000"); //填充颜色
//	circle.setStrokeColor("#0000FF"); //边线颜色
//	allMap.addOverlay(circle); //增加圆
//	baiduoverlays.push(circle);
//}
//设置行政区域  
var geoCityPickerName;
function getBoundary(areaflag,geoCode,geoName,seeMapType){  
    var bdary = new BMap.Boundary();
    var name = "";
    var codeFlag = true;
    if(areaflag == 1){
    	name = geoName;
    	myMapType = seeMapType;
    }else{
    	name = $("#geoCityPicker").val();
    	if(!name){
    		layer.msg($.i18n.prop("Geozones.chooseArea"),{time: 2000});
    		return;
    	}
    	$('.select-item').each(function(){
    		areaCode = $(this).data('code');
    	});
    	if(!geoCode){
    		geoCode = areaCode;
    		codeFlag = false;
    	}
    }
    geoCityPickerName = name;
    if(myMapType == "baidu"){
    	if(areaflag == 1){
    		initSeeBaiDuMap();
    	}
    	var lng = "";
        var lat = "";
        bdary.get(name, function(rs){       //获取行政区域  
        	allMap.clearOverlays();   //清除地图覆盖物  
            var count = rs.boundaries.length; //行政区域的点有多少个  
            if(count == 0){
            	layer.msg($.i18n.prop("Geozones.NotSupportDraw"),{time: 2000});
            	return;
            }
            var places = new Array();
            var info = "";
            var startPoint = "";
            var endPoint = "";
            var flag = true;
            for(var i = 0; i < count; i++){  
                var ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight:2,fillColor: "#FF0000", strokeColor: "#0000FF"}); //建立多边形覆盖物  
                allMap.addOverlay(ply);  //添加覆盖物
                var path = ply.getPath();
                lng = path[0].lng;
                lat = path[0].lat;
                var len = ply.getPath().length - 1;
                for (var j = 0; j < ply.getPath().length; j++) {
                	info+="("+ply.getPath()[j].lat+","+ply.getPath()[j].lng+")|";//得到坐标
                	
                	if(flag){
                		startPoint = "("+ply.getPath()[j].lat+","+ply.getPath()[j].lng+")|";
                		flag = false;
                	}
                	if(len == j){
                		endPoint = "("+ply.getPath()[j].lat+","+ply.getPath()[j].lng+")|";
                	}
                	places.push(ply.getPath()[j]);
                } 
            }
            if(areaflag == 0){
            	definitionDrawingType = "polygon";
            	var circlePoint = new BMap.Point(lng,lat);
                alertHtml(1);
                allMap.openInfoWindow(infoWindow,circlePoint); //开启信息窗口
                $("#maptype").val("baidu");
                if(startPoint != endPoint){
                	info = info + startPoint;
                }
            	$("#coors").val(info);
            	polyType = 'polygon';
            	$("#radius").val("");
            	areaFence = "1";
            	intoBaiDuMapTools("hander");
            	drawingManagerBaidu.close();
            }
            allMap.setViewport(places);    //调整视野           
        });  
    }else{
    	if(codeFlag && areaflag == 1){
    		initSeeGoogleMap();
    	}
    	getAdministrativeAreaPoint(myMapType,geoCityPickerName,areaflag,geoCode);
    }
}  

//获取当前的位置
function getCurrentLocation(){
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var Points = new BMap.Point(r.point.lng,r.point.lat);
			allMap.panTo(Points);
			var myGeo = new BMap.Geocoder();      
			// 根据坐标得到地址描述    
			myGeo.getLocation(Points, function(result){  
                 if (result){   
                     var province = result.addressComponents.province;
                     var district = result.addressComponents.district;
                     var city = result.addressComponents.city;
                     $("#geoCityPicker").citypicker('reset');
                 	 $("#geoCityPicker").citypicker('destroy');
                 	 $("#geoCityPicker").citypicker({
                 	   	 province:province,
                 	   	 city:city,
                 	   	 district:district
                     });
                  }      
			});
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})
}

var styleOptions = {
        strokeColor:"blue",    //边线颜色。
        fillColor:"#FF0000",      //填充颜色。当参数为空时，圆形将没有填充效果。
        strokeWeight: 2,       //边线的宽度，以像素为单位。
        strokeOpacity: 0.5,    //边线透明度，取值范围0 - 1。
        fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
        strokeStyle: 'solid' //边线的样式，solid或dashed。
        	
    }
var pointParams = null; 
var myPoint = [];
var myPoints = [];
function  showPolygon(btn){
	debugger
	getPoint();
	if(myPoints.length==0){
		return ;
	}
	for(var i=0;i<myPoints.length;i++){
		var myPointsi=myPoints[i];
		var pointId=myPointsi[myPointsi.length-1];
		//myPoints[i].pop(myPointsi.length-1);
		var polygon = new BMap.Polygon(myPoints[i], styleOptions);  //创建多边形
		polygon.id=pointId;
		polygon.addEventListener("dblclick",function(e){
			layer.confirm("是否删除", {
				title:$.i18n.prop("comm.Operationtips"),
				btn: [$.i18n.prop("comm.Yes"),$.i18n.prop("comm.Cancel")],  
				shade: false       
			}, function(){
				$.ajax({
					url: "../../rest/geozoneControl/geozone/delgeozone", 
					data:{"id":e.currentTarget.id},  
					async: false,
					cache: false,
					type: "POST",
					dataType: 'json',
					success: function (returnData){
						if (returnData && returnData.statusCode==0){
							e.currentTarget.hide();
							layer.msg("删除成功", {icon: 1});
							
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
		})
	    allMap.addOverlay(polygon);   //增加多边形
	}
    
    //overlays.push(polygon); //是否把该图像加入到编辑和删除行列
    //showText();
   }

  function showText(){
      var opts = {
    		  position : new BMap.Point(116.339225,39.863925),    // 指定文本标注所在的地理位置
    		  offset   : new BMap.Size(30, 30)    //设置文本偏移量
     }
     
   var label = new BMap.Label("不可编辑", opts);  // 创建文本标注对象
      label.setStyle({
      color : "black",
       fontSize : "16px",
      fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
      });
      allMap.addOverlay(label);  
 }
function getPoint(){
	
	var id=$("#agencyId").val();;
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    dataType :"json",
		beforeSend:function(XHR){
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
	    data:{"agencyId":id},
	    url:_ctx+"../../rest/loginController/getAgencyPoint",
		success:function(ret){
			if(ret.statusCode==0){
				var data =null;
				if(ret.data!=null&&ret.data!=null){
					
					for(var m = 0; m < ret.data.length; m++){
						var railpoint=[];
						var l=ret.data;
						var a=l[m].railData;
						pointParams=a.substring(1,a.length-2).split(';');
						
						for (var i = 0; i < pointParams.length; i++) {
							var point=pointParams[i].split(',');
							railpoint.push(new BMap.Point(point[1],point[0]));
						}
						railpoint.push(l[m].id);
						myPoints.push(railpoint);
					}
					
				}
			}
		},
		error:function(e){
			ajaxError("customer_search.jsp",e);
		}
	});
	
	
}
