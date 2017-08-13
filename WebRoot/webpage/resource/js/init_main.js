

/**
 * 加载中间部分
 * @returns void
 */
function loadIndexPage(index) {
	;
	var url=null;
	if(index==2){
		url="customer";
	}else{
		url="index2"
	}
	$.ajax( {
		url : "meunController.do?getMiddle?url="+url,
		type : "POST",
		dataType : "html",
		async : false,
		cache : false,
		success : function(data) {
			$(".main").html(data);
		}
	});
}

/**
 * 菜单点击事件
 * @param {String} subtitle 名字
 * @param {String} url 地址
 * @param {String} icon 图标
 * @returns void
 */
function showContent(subtitle, url){
	if(isNull(url)){
		return;
	}

	$.ajax( {
		url : url,
		type : "POST",
		dataType : "text",
		async : false,
		cache : false,
		success : function(data) {
			$("#wrapper").html(data);
			$.parser.parse($('#wrapper'));
		}
	});
}
/**
 * 判断空
 * @param {String} val
 * @returns {Boolean}
 */
function isNull(val){
	if(!val){
		return true;
	}
	if(val == null || val == "" || val == "undefined" || val == "null" || val == "NULL"){
		return true;
	}
	return false;
}