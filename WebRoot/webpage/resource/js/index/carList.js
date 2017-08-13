/** 刷新是否失效 */
var isrefresh=false;

/** 设备信息框 */
var dialogParen = null;

/** 搜索的设备信息 */
var word="";

/** 当前定时任务id */
var setTimeOutId;

/** 当前跟踪的imei */
var curImei = null;

/** 运行超时标识 */
var timeoutRunFlag = true;

/** 当前跟踪的设备状态 全部 已关注 在线 离线*/
var curDeviceStatus=null;


/**
 * 计时器刷新的方法
 */
function refleshTime() {
	$("#refreshCountdown b").text(intervaltime);
	if (intervaltime == 0) {
		isrefresh=true;
		search(curDeviceStatus);
	} else if (intervaltime > 0) {
		if (timeoutRunFlag) {
			intervaltime--;
		}
		setTimeOutId = window.setTimeout(function() {refleshTime();}, 1000);
	}
}

window.refleshTime = refleshTime;

/**
 * 搜索控制台设备列表(需要刷新计数器)
 * @param deviceStatus 当前跟踪的设备在线状态
 */
function search(deviceStatus){
	if(deviceStatus){
		tabActive(deviceStatus);
	}
	if(dialogMarker){dialogMarker = null;}//打开车辆信息框所用的marker
	curDeviceStatus=deviceStatus;
	window.clearTimeout(setTimeOutId);
	//重新获得刷新剩余时间
	refreshIntervalTime();
	setTimeOutId = window.setTimeout(function() {refleshTime();}, 1000);
	searchCommon(deviceStatus);
}

/**
 * 刷新间隔改变时
 */
$('.js-select-intervaltime').change(function() {
	refreshIntervalTime();
});

/**
 * 显示设备名称按钮
 */
$("#checkboxForDeviceName").on('ifChecked', function(event) {showMapDeviceName();});
/**
 * 关闭设备名称按钮
 */
$("#checkboxForDeviceName").on('ifUnchecked', function(event) {clearMapDeviceName();});

/**
 * 关注设备入口
 * @param imei
 * @returns
 */
function attention(imei) {
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:{"imei":imei},
	    url:_ctx+"/deviceAttention/attention",
		success:function(returnData){
			if(returnData.code==0){
				$("#"+imei).children().eq(1).children().eq(0).attr("title",Unfollow).text(Unfollow).attr("onclick","cancelAttention("+imei+")");
				//同步关注列表数
				$("#attentions").text((parseInt($("#attentions").text())+1));
				$("#"+imei).addClass("heart");
			} 
		},
		error:function(e){
			ajaxError("index.jsp",e);
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}
/**
 * 取消关注
 * @param imei
 * @returns
 */
function cancelAttention(imei) {
	$.ajax({
		type:"post",
		async: false,
	    cache: false,
	    data:{"imei":imei},
	    url:_ctx+"/deviceAttention/cancelAttention",
		success:function(returnData){
			if(returnData.code==0){
				$("#"+imei).children().eq(1).children().eq(0).attr("title",Attention).text(Attention).attr("onclick","attention("+imei+")");
				//同步关注列表数
				$("#attentions").text((parseInt($("#attentions").text())-1));
				var className = $(".js-device-status-tab>.btn").eq(1).attr("class");
				var boo = className.indexOf("btn-primary");
				 if(boo>=0){
					 	//清除已经取消关注的设备和相应组的数量自减
					 	var delId ="vehicleCount_"+$("#"+imei).parent(".submenu").prev().attr("id");
					 	var count = $("#"+delId).html();
					 	$("#"+delId).html(parseInt(count)-1);
						$("#"+imei).remove();
				 } 
				 $("#"+imei).removeClass("heart");
			}
		},
		error:function(e){
			ajaxError("index.jsp",e);
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
	//将之前的设备信息框关闭
	if(dialogParen&&(curDeviceStatus==="attention")){
		dialogParen.close();
	}
}

/**
 * 设备状态切换
 * @param deviceStatus 设备状态
 */
function tabActive(deviceStatus){
	var li_index;
	switch(deviceStatus){
		case "all":
			li_index = 0;
			break;
		case "attention":
			li_index = 1;
			break;
		case "online":	
			li_index = 2;
			break;
		case "offline":
			li_index = 3;
			break;
		case "nonactivated":
			li_index = 4;
			break;
	}
	$(".js-device-status-tab>.btn").eq(li_index).addClass("btn-primary").siblings().removeClass("btn-primary");
}

/**
 * 清除搜索值
 */
function  clerWord(){
	 word = '';
	 $("#nope").val('');
}

var lastRequest;//上一次查询请求
function searchCommon(deviceStatus){
	 /*$(".device-status-tab a").eq($(".device-status-tab a."+deviceStatus).index()).attr("disabled",true).siblings().removeAttr("disabled"); 
		var southWest=new baidu.maps.LatLng({lat: -150, lng: -151})
		var northEast=new baidu.maps.LatLng({lat: 150, lng: 151})
		if(allMap.getBounds()!=null)
		{
			//window.setTimeout(searchCommon(deviceStatus),100);
			southWest = allMap.getBounds().getSouthWest();
			northEast = allMap.getBounds().getNorthEast();
			
		}
		
		if(allMapType==="googleMap"){
			//googleMap
			southWestLng = southWest.lng();
			southWestLat = southWest.lat();
			northEastLng = northEast.lng();
			northEastlat = northEast.lat();
		}else{
			//baiduMap
			southWestLng = southWest.lng;
			southWestLat = southWest.lat;
			northEastLng = northEast.lng;
			northEastlat = northEast.lat;
		}
	//地图缩放大小
	var zoom = allMap.getZoom();*/
	
	//将置顶设备名称对象清空,防止切换时出现多余设备名称气泡
	if(lastRequest){
		lastRequest.abort();
	}
	clickMarker = null;
	clickVehicle = null;
	clickDialog = null;
	
	if(!isrefresh)
	{
		//清除设备名称气泡框
		//$('#checkboxForDeviceName').iCheck('uncheck');
		clearMapDeviceName();
		var htmlstr='<div class="ta-c m-tb15" id="homeOrglogindata"><i class="fa fa-spinner fa-pulse fa-fw"></i><spring:message code="comm.loadingData"/></div>	';
		$('ul#accordion').html(htmlstr);
	}
	else
	{
		$("#accordion").find(".submenu").find("li").attr("refresh","Y");
	}
	imeis="";
	keyword="";

//	if(deviceStatus=="sousuo"){
//		setWord();
//		word=word.replace(/(^\s+)|(\s+$)/g,"");
//		deviceStatus="all";
//	}
	var currtRequest = $.ajax({//当前查询请求
		type:"post",
		async: true,
	    cache: false,
	    dataType:"json",
	    data:{
	    	"keyword" : word,
	    	"id" : userId,
	    	"searchParentId":searchParentId,
	    	"deviceStatus":deviceStatus,
	    	"curimei":curImei/*,
	    	"southWestLng":southWestLng,
	    	"southWestLat":southWestLat,
	    	"northEastLng":northEastLng,
	    	"northEastlat":northEastlat,
	    	"zoom":zoom*/
	    },
	    url:_ctx+"rest/Gps/getGpsInfo",
	    error: function(XMLHttpRequest, textStatus, errorThrown) {
// 	    	 alert(XMLHttpRequest.status);
// 	    	 alert(XMLHttpRequest.readyState);
// 	    	 alert(textStatus);
	    },
		success:function(ret){
			/* $(".device-status-tab a."+deviceStatus).removeAttr("disabled"); */
			$("#none-data").hide();
			organizes=[];
			if(ret.code==0){
				if(!$(".device-status-tab a.btn-primary").hasClass(deviceStatus)){
					return;
				}
				$("#onlineCount").text(ret.data.onlineCount);
				$("#offlineCount").text(ret.data.offlineCount);
				$("#indexAll").text(ret.data.all);
				$("#attentions").text(ret.data.attentions);
				$("#nonactivated").text(ret.data.noActiveCount);

				$("#marker_runing").text(ret.data.runing);
				$("#marker_idle").text(ret.data.idel);
				$("#marker_stopped").text(ret.data.offlineCount);
				
				if(ret.data&&ret.data.imei){
					imeis=ret.data.imei;
					ret.userId=userId;
				}
				if(ret.data && ret.data.organizes && ret.data.organizes.length){
					var leng = $("#accordion").children().length;
					var accordions = $("#accordion").children().children(0).eq(0).hasClass("default-group");
					var size = $("#accordion").children().children(0).eq(0).children(0).children(1).children(2).children(0).html();
					if(!((leng==1)&&(accordions)&&(size==0))){
						showDevicestatus(ret.data.organizes);//显示设备地图标点  
						//alert("leng:"+leng+"--accordions:"+accordions+"--size:"+size);
					}
					for (var orgi = 0; orgi < ret.data.organizes.length; orgi++) {
						var organize= ret.data.organizes[orgi];
						if(organize.vehicles && organize.vehicles.length){
							var vehicles=organize.vehicles;
							for (var vehj = 0; vehj < vehicles.length; vehj++) {
								
								var deviceType =  vehicles[vehj].vechleioc;
								
								var show=false;
								var statuscss="default";
								
								// 0,离线; 1,在线静止; 2,在线运动.
								if(vehicles[vehj].show==2){
									show=true;
									statuscss="runing";
								}
								if(vehicles[vehj].show==1){
									show=true;
									statuscss="stopped";
								}
								if(vehicles[vehj].show==0){
									show=true;
									statuscss="default";
								}							
								if(vehicles[vehj].show==-1){
									show=true;
									statuscss="arrears";
								}
								if(vehicles[vehj].show==-2){
									show=true;
									statuscss="inactivated";
								}
								
								//如果设备是人和牛
								if((deviceType==="cow") || (deviceType ==="per") || (deviceType==="plane")){
									vehicles[vehj].idleTime =vehicles[vehj].idleTime.replace('静止',onLine).replace('行驶中',onLine);
									
									//人和牛设备离线时需计算离线时间
									if(statuscss==="default"){
										vehicles[vehj].idleTime = vehicles[vehj].idleTime.replace('天',day).replace('小时',hour)
										.replace('分',minutes);
									}else{
										//静止也显示绿色
										if((vehicles[vehj].show==1) || (vehicles[vehj].show==2)){statuscss="runing";}
										vehicles[vehj].idleTime = vehicles[vehj].idleTime.replace('天','').replace('小时','')
										.replace('分','').replace(/\d+/g,"");
									}
									
								}else{
									vehicles[vehj].idleTime =vehicles[vehj].idleTime.replace('静止',Stopped).replace('天',day)
									.replace('小时',hour).replace('分',minutes).replace('行驶中',travel);
								}
								
								//公共的国际化替换
								vehicles[vehj].idleTime = vehicles[vehj].idleTime.replace('离线',Offline).replace('未激活',Inactive)
								.replace('欠费',Arrearage);
								
								
								vehicles[vehj].show=show;
								vehicles[vehj].statuscss=statuscss;//搜索时车辆状态
								//设备绑定样式
							}
						}
					}
				}
				if(isrefresh)
				{
					isrefreshMthod(ret);
				}
				else
				{
					noIsrefreshMthod(ret);
				}
				if(ret.data.curVehicle)
				{
					refreshCurImei(ret.data.curVehicle);
				}
			}else{
				imeis="";
			}
		}
	});
	lastRequest = currtRequest;
}



function isrefreshMthod(ret){

	if(ret.data && ret.data.organizes && ret.data.organizes.length){
		
		for (var orgi = 0; orgi < ret.data.organizes.length; orgi++) {
			var organize= ret.data.organizes[orgi];
			var organizeId=organize.id;
			var odcount=organize.organizeCount;
			if(organize.vehicles && organize.vehicles.length){
					var vehicles=organize.vehicles;
					var selectHistoy = $("#accordion ul li.active");
					for (var vehj = 0; vehj < vehicles.length; vehj++) {
						if($("#"+vehicles[vehj].imei).length==0)
						{
							var devHtml=template("devLiTemp",{"vehicle":vehicles[vehj],"organize":organize});
							$("#accordion").find("[organizeid='"+organizeId+"']").append(devHtml);
						}
						else
						{
							if(curDeviceStatus=="online" && vehicles[vehj].statuscss!="runing"&& vehicles[vehj].statuscss!="runing bind"&&vehicles[vehj].statuscss!="stopped"&&vehicles[vehj].statuscss!="stopped bind")
							{
								$("#"+vehicles[vehj].imei).remove();
								odcount--;
							}
							
							if(curDeviceStatus=="offline" && vehicles[vehj].statuscss!="default"&& vehicles[vehj].statuscss!="default bind"&& vehicles[vehj].statuscss!="arrears"&& vehicles[vehj].statuscss!="arrears bind" && vehicles[vehj].statuscss!="inactivated")
							{
								$("#"+vehicles[vehj].imei).remove();
								odcount--;
							}
							
							if(curDeviceStatus=="noactive" && vehicles[vehj].statuscss!="inactivated")
							{
								$("#"+vehicles[vehj].imei).remove();
								odcount--;
							}
							
							$("#"+vehicles[vehj].imei).removeAttr("refresh");
							$("#"+vehicles[vehj].imei).find(".status").text(vehicles[vehj].idleTime);
							$("#dev_"+vehicles[vehj].imei).next("span").attr("title",vehicles[vehj].idleTime);
							$("#"+vehicles[vehj].imei).attr("class",vehicles[vehj].statuscss);
							 
							//重新为某个设备设置相应的功能选项
							var funcClearFix = $("#funcClearFix"+vehicles[vehj].imei);
							var funcClearFixShow = template("funcClearFixShow",{"vehicle":vehicles[vehj],"organize":organize});
							funcClearFix.children().remove();
							funcClearFix.append(funcClearFixShow);
						}
						
						//已关注的要增加关注的图标样式
						var attentions = vehicles[vehj].isAttention;
						if(attentions==0){
							//已关注
							$("#"+vehicles[vehj].imei).addClass("heart");
						}
					}
					if(selectHistoy){
						$("li#"+$(selectHistoy).attr("id")).addClass("active");
					}
				}
			$("#accordion").find("[organizeid='"+organizeId+"']").find("li[refresh]").each(function(){
					var em=$(this);
					var emImei=em.attr("id");
					
					removeMark(emImei);
					em.remove();
				});
			$("#vehicleCount_"+organizeId).text(odcount);
			}
	}
}

function noIsrefreshMthod(ret){

	ret.data.userType = complex_loginUserType;
	//console.log(ret);
	$('ul#accordion').html(template("organize-submenu-tpl",ret));
	/*  if($(".js-add-group-form").is(":visible")){  //刷新后如果添加分组表单显示，则隐藏添加分组按钮
		$(".js-add-group").hide();
	} */ 
	var Accordion = function(el, multiple) {
		this.el = el || {};
		this.multiple = multiple || false;

		// Variables privadas
		var links = this.el.find('.link .node');
		// Evento
		links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown);
	}

	Accordion.prototype.dropdown = function(e) {
		var $el = e.data.el;
			$this = $(this),
			$next = $this.parents(".link").next();

		$next.slideToggle();
		$this.parents("li").toggleClass('open');

		if (!e.data.multiple) {
			$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
		};
	}	
	var accordion = new Accordion($('#accordion'), true);
}