/*** 
 * SelectDateUtil.js  
 * 开始与结束时间选择JQ
 * 
 * @author Li.Shznaghzi
 * @TIME 2016-05-25 14:34:51
 * 
 * ...onclick="selectRTimeat('Yesterday','Report0')"
 * <input type="text" id="startTime_Report0" ...
 * 
 * ***/

/**
 * @param seleType   
 * 			选择类型、选择节点{Yesterday、ThisWeek、LastWeek、ThisMonth、LastMonth}
 * @param staisType  
 * 			指定后缀 X {startTime_X、endTime_X}
 */
var after_seleType="";
function selectRTimeat(seleType,staisType){
	//layDateflag = true;
	after_seleType = seleType;
    if(seleType=="Today"){
    	getTDayTimes(0, staisType);
	}else if(seleType=="Yesterday"){
		getRDayTimes(-1, staisType);
	}else if(seleType=="ThisWeek"){
		getRWeekTimes(null, staisType);
	}else if(seleType=="LastWeek"){
		getRWeekTimes("sz", staisType);
	}else if(seleType=="ThisMonth"){
		gettRMonthTimes(null, staisType);
	}else if(seleType=="LastMonth"){
		gettRMonthTimes("sy", staisType);
	}
}


/**
 * 获取前后今天天的开始与结束时间
 * @param days 
 * 		  间隔标准
 * @param staisType
 * 		  指定后缀
 */
function getTDayTimes(days,staisType){
	var d=new Date(); 
	d.setDate(d.getDate()+days); 
	var month=d.getMonth()+1; 
	var day = d.getDate(); 
	if(month<10){ 
		month = "0"+month; 
	} 
	if(day<10){ 
		day = "0"+day; 
	} 
	var start = d.getFullYear()+"-"+month+"-"+day;
	var hh=d.getHours();      //获取当前小时数(0-23)
	var mm=d.getMinutes();    //获取当前分钟数(0-59)
	var ss=d.getSeconds();    //获取当前秒数(0-59)
	if(hh<10){
		hh= "0" + hh; 
	}
	if(mm<10){
		mm= "0" + mm; 
	}
	if(ss<10){
		ss= "0" + ss; 
	}
	end = d.getFullYear()+"-"+month+"-"+day;
	start = start + " 00:00";
	end = end + " "+ hh +":"+ mm;
	$("#startTime_"+staisType).val(start);
	$("#endTime_"+staisType).val(end);
}



/**
 * 获取前后X天的开始与结束时间
 * @param days 
 * 		  间隔标准
 * @param staisType
 * 		  指定后缀
 */
function getRDayTimes(days,staisType){
	var d=new Date(); 
	d.setDate(d.getDate()+days); 
	var month=d.getMonth()+1; 
	var day = d.getDate(); 
	if(month<10){ 
		month = "0"+month; 
	} 
	if(day<10){ 
		day = "0"+day; 
	} 
	var start = d.getFullYear()+"-"+month+"-"+day;
	var hh=d.getHours();      //获取当前小时数(0-23)
	var mm=d.getMinutes();    //获取当前分钟数(0-59)
	var ss=d.getSeconds();    //获取当前秒数(0-59)
	if(hh<10){
		hh= "0" + hh; 
	}
	if(mm<10){
		mm= "0" + mm; 
	}
	if(ss<10){
		ss= "0" + ss; 
	}
	end = d.getFullYear()+"-"+month+"-"+day;
	start = start + " 00:00";
	end = end + " "+ "23" +":"+ "59";
	$("#startTime_"+staisType).val(start);
	$("#endTime_"+staisType).val(end);
}

/**
 * 获取本周X 时间
 * 
 * @param staisType
 */
var now = new Date(); //当前日期 
var nowDayOfWeek = now.getDay(); //今天本周的第几天 
var nowDay = now.getDate(); //当前日 
var nowMonth = now.getMonth(); //当前月 
var nowYear = now.getYear(); //当前年 
nowYear += (nowYear < 2000) ? 1900 : 0; // 

function formatDate(date) {
    var myyear = date.getFullYear();
    var mymonth = date.getMonth()+1;
    var myweekday = date.getDate();

    if(mymonth < 10){
        mymonth = "0" + mymonth;
    }
    if(myweekday < 10){
        myweekday = "0" + myweekday;
    }
    return (myyear+"-"+mymonth + "-" + myweekday);
}

function getRWeekTimes(falg,staisType){
	var d=new Date(); 
	var month=d.getMonth()+1; 
	var day = d.getDate(); 
	if(month<10){ 
		month = "0"+month; 
	} 
	if(day<10){ 
		day = "0"+day; 
	} 
	var hh=d.getHours();      //获取当前小时数(0-23)
	var mm=d.getMinutes();    //获取当前分钟数(0-59)
	var ss=d.getSeconds();    //获取当前秒数(0-59)
	if(hh<10){
		hh= "0" + hh; 
	}
	if(mm<10){
		mm= "0" + mm; 
	}
	if(ss<10){
		ss= "0" + ss; 
	}
	var start = "";
	var end = "";
	if($("#language").val()!="zh"){
		if(falg=="sz"){
			var getUpWeekStartDate = new Date(nowYear, nowMonth, ((nowDay-7) - nowDayOfWeek));
		    start =  formatDate(getUpWeekStartDate);
		    var getUpWeekEndDate = new Date(nowYear, nowMonth, (nowDay-7) + (7 - nowDayOfWeek)-1); 
		    end =  formatDate(getUpWeekEndDate);
		}else{
			var getWeekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
			start = formatDate(getWeekStartDate);
			end =getWeekEndDate();
		}
	}else{
		if(falg=="sz"){
			var getUpWeekStartDate = "";
			var getUpWeekEndDate = "";
			if(nowDayOfWeek==0){
				getUpWeekStartDate=new Date(nowYear, nowMonth, ((nowDay-7) - nowDayOfWeek -6));
				getUpWeekEndDate= new Date(nowYear, nowMonth, (nowDay-7) + (7 - nowDayOfWeek - 6)-1); 
			}else{
				getUpWeekStartDate=new Date(nowYear, nowMonth, ((nowDay-7) - nowDayOfWeek + 1));
				getUpWeekEndDate= new Date(nowYear, nowMonth, (nowDay-7) + (7 - nowDayOfWeek + 1)-1); 
			}
		    start =  formatDate(getUpWeekStartDate);
		    end =  formatDate(getUpWeekEndDate);
		}else{
			var getWeekStartDate = "";
			if(nowDayOfWeek==0){
				getWeekStartDate=new Date(nowYear, nowMonth, (nowDay - nowDayOfWeek -6));
			}else{
				getWeekStartDate=new Date(nowYear, nowMonth, (nowDay - nowDayOfWeek + 1));
			}
			start = formatDate(getWeekStartDate);
			end =getWeekEndDate();
		}
	}
	start = start + " 00:00";
	end = end + " "+ "23" +":"+ "59";
	$("#startTime_"+staisType).val(start);
	$("#endTime_"+staisType).val(end);
}

/**
 * 获取上月X 时间
 * 
 * @param falg
 * @param staisType
 */
function gettRMonthTimes(falg,staisType){
	var d=new Date(); 
	var month=d.getMonth()+1; 
	var day = d.getDate(); 
	if(month<10){ 
		month = "0"+month; 
	} 
	if(day<10){ 
		day = "0"+day; 
	} 
	var hh=d.getHours();      //获取当前小时数(0-23)
	var mm=d.getMinutes();    //获取当前分钟数(0-59)
	var ss=d.getSeconds();    //获取当前秒数(0-59)
	if(hh<10){
		hh= "0" + hh; 
	}
	if(mm<10){
		mm= "0" + mm; 
	}
	if(ss<10){
		ss= "0" + ss; 
	}
	var start = getMonthStartDate();
	var end   =getMonthEndDate();
	if(falg=="sy"){
		start= getLastMonthStartDate();
		end =getLastMonthEndDate();
	}
	start = start + " 00:00";
	end = end + " "+ "23" +":"+ "59";
	$("#startTime_"+staisType).val(start);
	$("#endTime_"+staisType).val(end);
}

