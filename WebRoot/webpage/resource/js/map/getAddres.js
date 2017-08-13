
var getGoogleKey=[
		"AIzaSyC451gaFbprPMHa3XiJ9SMyNZWWR6Xlloc",
		"AIzaSyAFVZResy_0I3zpEbzdDxvoY4PNJoGVTZU",
		"AIzaSyBfNU1oR-Aryc3SsXWxyUJ4vOh6xC_kP4I",
		"AIzaSyDp2JSZahk-5NdjV4xHW4QX_irVMlvzL0c",
		"AIzaSyB7-7rKyouIav6ig0kX_66eiWHkqqYZ1Ls",
		"AIzaSyD7O7ocxus80ICoWwHiTEdLDQh0qSAMP4k",
		"AIzaSyAijPeeNxjJ4VRDJ24BGI-QsydyLUoaXPA",
		"AIzaSyCB6vflGmSFoGkgERrAdCs2QvFLXc0vlkI",
		"AIzaSyDKJK8P5DvAMYSe-3toZl4OYXs9syH69t4",
		"AIzaSyCtA1cE4wZfOwf2SM2_pa4VJ2xvBzMJsxQ",
		"AIzaSyCrn9nb2pql3pdPToOxHy6Uyof9ll1lEY4",
		"AIzaSyBnPvFBpS0d-pxE_4NiBjgSyeRyhCqpVNU",
		"AIzaSyBn8EP_Sw-9HFkFizIljDKdwFiuENXb1sc",
		"AIzaSyBouofvVMJCCCJabiq9hqfbc2eO20Ahskk",
		"AIzaSyAQV-6bhGlIqjNYyGPK0Ns36VyjNVFafeA",
		"AIzaSyCukhh6oi6C54eGMmFLbXK4c-9uVTQnPL4"
];
//根据经纬度获取地点
var tempK = Number(-1);
var pointData;
/**
 * 传入坐标点[]
 * Pdata 点数据 数组
 * address_ 返回时放入地图位置表示 
 * */
function getBaiDuLocation(Pdata,address_) {
	tempK++;
	pointData = Pdata;
	var len = pointData.length;
	setTimeout(function() {
		var geoc = new BMap.Geocoder();
		//pointData[tempK].lat,pointData[tempK].lng
		var point = new BMap.Point(pointData[tempK].lng, pointData[tempK].lat);
		geoc.getLocation(point, function(rs) {
			var address;
			if (rs && rs.address) {
				address = rs.address;
			}
			var description = "";
			if (rs.surroundingPois[0]) {
				var allMap;
				if(!allMap){
					allMap = new BMap.Map("hiddenMap"); // 创建Map实例 divID必须为allmap	
				}
				var poi = rs.surroundingPois[0];
				description += "/离" + poi.title + "向"
						+ getDirDescription(rs.point, poi.point) + " "
						+ Math.round(allMap.getDistance(rs.point, poi.point))
						+ "米"
			}

			var tempStr = address_+""+tempK;
			$("#" + tempStr).html(address + " " + description);
			if (tempK < (len - 1)) {
				getBaiDuLocation(pointData,address_);
			}
		});
	}, 10);
}
/**
 * 传入坐标点
 * point 点数据
 * address_ 返回时放入地图位置表示 
 * */
function getPointBaiDuLocation(point,address_,lat,lng) {
	$("#" + address_).html($.i18n.prop('Business.Getaddress'));
	if(!point){point = new BMap.Point(lat, lng);}
	var geoc = new BMap.Geocoder();
	geoc.getLocation(point, function(rs) {
		var address="";
		if (rs && rs.address) {
			address = rs.address;
		}
		var description = "";
		if (rs && rs.surroundingPois[0]) {
			var allMap;
			if (!allMap) {
				allMap = new BMap.Map("hiddenMap"); // 创建Map实例 divID必须为allmap
			}
			var poi = rs.surroundingPois[0];
			description += "/离" + poi.title + "向"
					+ getDirDescription(rs.point, poi.point) + " "
					+ Math.round(allMap.getDistance(rs.point, poi.point)) + "米"
		}

		if(address!="" && address!=null){
			$("#" + address_).html(address + " " + description).attr("title",address + " " + description);
			$("#" + address_).attr("title",address + " " + description);
		}else{
			window.setTimeout(function (){
				$("#" + address_).html("<a class='cp' onclick=\"getPointBaiDuLocation('','"+address_+"','"+point.lat+"','"+point.lng+"')\" title='"+ $.i18n.prop('Business.Failedtoobtainaddress')+$.i18n.prop('track.ClickRetry') +"'>"+$.i18n.prop('Business.Failedtoobtainaddress')+$.i18n.prop('track.ClickRetry')+"</a>");
			},500);
		}
	});
}

function getBaiduLocationText(point,text){
	var geoc = new BMap.Geocoder();
	geoc.getLocation(point, function(rs) {

		 $(text).text(parseBaiduLocation(rs));
	});
}
function parseBaiduLocation(rs){

	var address;
	if (rs && rs.address) {
		address = rs.address;
	}
	var description = "";
	if (rs && rs.surroundingPois[0]) {
//		var allMap;
//		if (!allMap) {
//			allMap = new BMap.Map("hiddenMap"); // 创建Map实例 divID必须为allmap
//		}
		var poi = rs.surroundingPois[0];
		description += "/离" + poi.title + "向"
				+ getDirDescription(rs.point, poi.point) + " "
				+ Math.round(allMap.getDistance(rs.point, poi.point)) + "米"
	}
	if (address) {
		return address + " " + description;
	}
}
function getGoogleLocationText(point,text){
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({
		'latLng' : point
	}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			if (results[0]) {
				var address = results[0].formatted_address;
				var sindex = address.indexOf("邮政编码");
				if (sindex > 0) {
					$(text).text(address.substring(0, sindex));
				} else {
					$(text).text(address);
				}
			}
		}
	});
}


function getGoogleLocation(point,text,lat,lng){
	$("#"+text).html($.i18n.prop('Business.Getaddress'));
	if(!point){point = new google.maps.LatLng(lat, lng);}
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({
		'latLng' : point
	}, function(results, status) {
		//alert(results);
		if (status == google.maps.GeocoderStatus.OK) {
			if (results[0]) {
				var address = results[0].formatted_address;
				var sindex = address.indexOf("邮政编码");
				if(_language&&_language=="zh"){
					address = address.replace("Unnamed Road","无名路");
				}
				if (sindex > 0) {
					$("#"+text).html(address.substring(0, sindex));
					$("#"+text).attr("title",address.substring(0, sindex));
				} else {
					$("#"+text).html(address);
					$("#"+text).attr("title",address);
				}
			}
		}else{
			window.setTimeout(function (){
				$("#"+text).html("<a class='cp' onclick=\"getGoogleLocation('','"+text+"','"+point.lat()+"','"+point.lng()+"')\">"+$.i18n.prop('Business.Failedtoobtainaddress')+$.i18n.prop('track.ClickRetry')+"</a>");
			},500);
		}
	});
}
/**
 * 获取两点东西南北的位置关系
 */
function getDirDescription(pt1, pt2) {
	var h = pt1.lng - pt2.lng;
	var v = pt1.lat - pt2.lat;
	if (Math.abs(h) > Math.abs(v)) {
		if (h < 0) {
			return "西";
		} else {
			return "东";
		}
	} else {
		if (v < 0) {
			return "南";
		} else {
			return "北";
		}
	}
}