/**
 * 解析当前下拉框选中的时间
 * 附加了部分原页面代码减轻负荷防止JSP页面过大
 */

/**
 * 0表示当前选中为即将过期 1表示当前选中为已过期
 */
var dueTimeTypeFlag=0;
var devDueTimeTypeFlag=0;

var dueTimeId;
var devDueTimeId;

function setDateType() {
	var dueType = $("#dueType").val();
	if(dueType==$.i18n.prop('cust.userExpiration')){
		dateType="userExpiration";
	}else if(dueType==$.i18n.prop('cust.PlatformExpiration')){
		dateType="expiration";
	}
	var devDueType = $("#devDueType").val();
	if(devDueType==$.i18n.prop('cust.userExpiration')){
		devDateType="userExpiration";
	}else if(devDueType==$.i18n.prop('cust.PlatformExpiration')){
		devDateType="expiration";
	}
};

function setEndDate(){
	var dueTimeType = $("#dueTimeType").val();
	if(dueTimeType==$.i18n.prop('cust.Expired')){
		if(dueTimeTypeFlag==0){
			$("#dueTime").easyDropDown('destroy');
			$("#dueTime_expired").easyDropDown();
			dueTimeTypeFlag=1;
		}
	}
	if(dueTimeType==$.i18n.prop('cust.AboutToExpire')){
		if(dueTimeTypeFlag==1){
			$("#dueTime_expired").easyDropDown('destroy');
			$("#dueTime").easyDropDown();
			dueTimeTypeFlag=0;
		}
	}
	setExpirationDate();
	
	var devDueTimeType = $("#devDueTimeType").val();
	if(devDueTimeType==$.i18n.prop('cust.Expired')){
		if(devDueTimeTypeFlag==0){
			$("#devDueTime").easyDropDown('destroy');
			$("#devDueTime_expired").easyDropDown();
			devDueTimeTypeFlag=1;
		}
	}
	if(devDueTimeType==$.i18n.prop('cust.AboutToExpire')){
		if(devDueTimeTypeFlag==1){
			$("#devDueTime_expired").easyDropDown('destroy');
			$("#devDueTime").easyDropDown();
			devDueTimeTypeFlag=0;
		}
		
	}
	setDevExpirationDate();
}

//获取当前过期时间选中项所在的select的id
function getDueTimeId(){
	if(dueTimeTypeFlag==0){
		dueTimeId="dueTime";
	}else{
		dueTimeId="dueTime_expired";
	}
	if(devDueTimeTypeFlag==0){
		devDueTimeId="devDueTime";
	}else{
		devDueTimeId="devDueTime_expired";
	}
}

function setExpirationDate() {
	getDueTimeId();
	var dueTime = $("#"+dueTimeId).val();
	var date = new Date();
	if($("#dueTimeType").val()==$.i18n.prop('cust.AboutToExpire')){
		startDate = formatDates(date);
		if(dueTime==$.i18n.prop('cust._7days')){
			date.setDate(date.getDate()+7);
			endDate = formatDates(date);
		}
		if(dueTime==$.i18n.prop('cust._30days')){
			date.setDate(date.getDate()+30);
			endDate = formatDates(date);
		}
		if(dueTime==$.i18n.prop('cust._60days')){
			date.setDate(date.getDate()+60);
			endDate = formatDates(date);
		}
		if(dueTime==$.i18n.prop('cust._7-30Days')){
			date.setDate(date.getDate()+6);
			startDate = formatDates(date);
			date.setDate(date.getDate()+24);
			endDate = formatDates(date);
		}
		if(dueTime==$.i18n.prop('cust._30-60Days')){
			date.setDate(date.getDate()+29);
			startDate = formatDates(date);
			date.setDate(date.getDate()+31);
			endDate = formatDates(date);
		}
	}else{
		
		if(dueTime==$.i18n.prop('cust.Morethan60days')){
			date.setDate(date.getDate()-60);
			endDate = formatDates(date);
			startDate=null;
		}else{
			endDate = formatDates(date);
		}
		if(dueTime==$.i18n.prop('cust._7days')){
			date.setDate(date.getDate()-7);
			startDate = formatDates(date);
		}
		if(dueTime==$.i18n.prop('cust._30days')){
			date.setDate(date.getDate()-30);
			startDate = formatDates(date);
		}
		if(dueTime==$.i18n.prop('cust._60days')){
			date.setDate(date.getDate()-60);
			startDate = formatDates(date);
		}
		
		if(dueTime==$.i18n.prop('cust._7-30Days')){
			date.setDate(date.getDate()-6);
			endDate = formatDates(date);
			date.setDate(date.getDate()-24);
			startDate = formatDates(date);
		}
		if(dueTime==$.i18n.prop('cust._30-60Days')){
			date.setDate(date.getDate()-29);
			endDate = formatDates(date);
			date.setDate(date.getDate()-31);
			startDate = formatDates(date);
		}
		
	}
	
}

function setDevExpirationDate() {
	getDueTimeId();
	var devDueTime = $("#"+devDueTimeId).val();
	var devDate = new Date();
	
	if($("#devDueTimeType").val()==$.i18n.prop('cust.AboutToExpire')){
		devStartDate = formatDates(devDate);
		if(devDueTime==$.i18n.prop('cust._7days')){
			devDate.setDate(devDate.getDate()+7);
			devEndDate = formatDates(devDate);
		}
		if(devDueTime==$.i18n.prop('cust._30days')){
			devDate.setDate(devDate.getDate()+30);
			devEndDate = formatDates(devDate);
		}
		if(devDueTime==$.i18n.prop('cust._60days')){
			devDate.setDate(devDate.getDate()+60);
			devEndDate = formatDates(devDate);
		}
		if(devDueTime==$.i18n.prop('cust._7-30Days')){
			devDate.setDate(devDate.getDate()+6);
			devStartDate = formatDates(devDate);
			devDate.setDate(devDate.getDate()+24);
			devEndDate = formatDates(devDate);
		}
		if(devDueTime==$.i18n.prop('cust._30-60Days')){
			devDate.setDate(devDate.getDate()+29);
			devStartDate = formatDates(devDate);
			devDate.setDate(devDate.getDate()+31);
			devEndDate = formatDates(devDate);
		}
	}else{
		
		if(devDueTime==$.i18n.prop('cust.Morethan60days')){
			devDate.setDate(devDate.getDate()-60);
			devEndDate = formatDates(devDate);
			devStartDate = null;
		}else{
			devEndDate = formatDates(devDate);
		}
		
		if(devDueTime==$.i18n.prop('cust._7days')){
			devDate.setDate(devDate.getDate()-7);
			devStartDate = formatDates(devDate);
		}
		if(devDueTime==$.i18n.prop('cust._30days')){
			devDate.setDate(devDate.getDate()-30);
			devStartDate = formatDates(devDate);
		}
		if(devDueTime==$.i18n.prop('cust._60days')){
			devDate.setDate(devDate.getDate()-60);
			devStartDate = formatDates(devDate);
		}
		if(devDueTime==$.i18n.prop('cust._7-30Days')){
			devDate.setDate(devDate.getDate()-6);
			devEndDate = formatDates(devDate);
			devDate.setDate(devDate.getDate()-24);
			devStartDate = formatDates(devDate);
		}
		if(devDueTime==$.i18n.prop('cust._30-60Days')){
			devDate.setDate(devDate.getDate()-29);
			devEndDate = formatDates(devDate);
			devDate.setDate(devDate.getDate()-31);
			devStartDate = formatDates(devDate);
		}
	}
}
