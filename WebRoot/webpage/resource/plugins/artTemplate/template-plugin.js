//template.config("escape", false);

template.helper('dateFormat', function(data){
	return tmp_dateFormat(data,'yyyy-MM-dd');
});

template.helper('activeDateFormat', function(data){
	return tmp_dateFormat(data,'yyyy-MM-dd');
});

function tmp_dateFormat(date, format) {
	if(!date){
		return "";
	}
	date = date.replace("-","/").replace("-","/");
	date = new Date(date);
 
	var map = {
		"M" : date.getMonth() + 1, // 月份
		"d" : date.getDate(), // 日
		"h" : date.getHours(), // 小时
		"m" : date.getMinutes(), // 分
		"s" : date.getSeconds(), // 秒
		"q" : Math.floor((date.getMonth() + 3) / 3), // 季度
		"S" : date.getMilliseconds()
	// 毫秒
	};
	format = format.replace(/([yMdhmsqS])+/g, function(all, t) {
		var v = map[t];
		if (v !== undefined) {
			if (all.length > 1) {
				v = '0' + v;
				v = v.substr(v.length - 2);
			}
			return v;
		} else if (t === 'y') {
			return (date.getFullYear() + '').substr(4 - all.length);
		}
		return all;
	});
	return format;
}

template.helper('length', function(dataArray) {

	if (dataArray && dataArray.length) {
		return dataArray.length;
	}else{
		return 0;
	}
});
template.helper('in18', function(data) {
	   return $.i18n.prop(data);
	});
template.helper('dateCompare', function(date, date2) {

	if (!date || !date2) {
		return false;
	}

	var r = /^[0-9]+.?[0-9]*$/;

	if (r.test(date) == false) {
		return false;
	}
	
	if (r.test(date2) == false) {
		return false;
	}

	if (date > date2) {
		return true;
	}

	return false;
});

template.helper('numberFormat', function(number, form) {
	
	if(!number || !form){
		return "";
	}

	var forms = form.split('.'), number = '' + number, numbers = number
			.split('.'), leftnumber = numbers[0].split(''), exec = function(
			lastMatch) {
		if (lastMatch == '0' || lastMatch == '#') {
			if (leftnumber.length) {
				return leftnumber.pop();
			} else if (lastMatch == '0') {
				return lastMatch;
			} else {
				return '';
			}
		} else {
			return lastMatch;
		}
	}, string;

	string = forms[0].split('').reverse().join('').replace(/./g, exec)
			.split('').reverse().join('');
	string = leftnumber.join('') + string;

	if (forms[1] && forms[1].length) {
		leftnumber = (numbers[1] && numbers[1].length) ? numbers[1].split('')
				.reverse() : [];
		string += '.' + forms[1].replace(/./g, exec);
	}
	return string.replace(/ .$/, '');

});

template.helper('heigth', function(data, keyword) {
	//alert("data:"+data+"---keyword:"+keyword);
	if(keyword){
		data=data.replace(keyword,"<span class='c-f19b04'>"+keyword+"</span>");
	}
	return data;
});

template.helper('getButton',function(data){
	var result = "";
	if(data){
		var array = data.split(',');
		$.each(array,function(i,v){
			result += "<a onclick='openDeviceInfoModal("+'"'+ v +'"'+")'>"+v+"</a>,";
		});
	}
	return result;
});

template.helper('getContent',function(data,type){
	if(!data){
		data = 0;
	}
	var msg = "";
	if(type == "1"){
		msg = $.i18n.prop("msg.Yournamehas?devicesExpiring");
	}else{
		msg = $.i18n.prop("msg.Yournamehas?devicesOffline");
	}
	return msg.replace("?",data);
});
