 /**
 * 
 * @authors Lihefei
 * @date    2016-09-26 11:09:32
 * @version 0.1.0
 */
;(function($){

	var regexp_h_m = /^([0-1]?[0-9]|2[0-3]):([0-5][0-9])$/;
	var regexp_h_m_s = /^([0-1]?[0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/;

	$.fn.timePicker = function(options){
		var _this,_index=-1;
		var id = "timePicker";
		var defaults = {
			format: 'h:m',
			value:"",
			lang: "zh",
			setLang:$.extend({},{
				zh: {
					time: "时间",
					hour: "小时",
					minute: "分钟",
					second: "秒钟",
					now: "现在",
					clear: "清除",
					confirm: "确认"
				},
				en: {
					time: "Time",
					hour: "Hour",
					minute: "Minute",
					second: "Second",
					now: "Now",
					clear: "Clear",
					confirm: "Confirm"
				}
			}),
			create: function(){
				var lan = settings.setLang[settings.lang];
				var html='<div class="timepicker" id="'+id+'">'
				+'<div class="timepicker-body">'
					+'<div class="timepicker-sliderbar">'
						+'<div class="slider-name">'+lan.time+'</div>'
						+'<div class="slider-time-view">'+ (settings.format=="h:m" ? settings.value.substring(0,5) : settings.value) +'</div>'
					+'</div>'
					+'<div class="timepicker-sliderbar">'
						+'<div class="slider-name">'+lan.hour+'</div>'
						+'<div class="slider-bar">'
							+'<span class="slider-knob" data-hover="'+ settings.value.substring(0,2) +'"></span>'
						+'</div>'
					+'</div>'
					+'<div class="timepicker-sliderbar">'
						+'<div class="slider-name">'+lan.minute+'</div>'
						+'<div class="slider-bar">'
							+'<span class="slider-knob" data-hover="'+ settings.value.substring(3,5) +'"></span>'
						+'</div>'
					+'</div>';
					if(settings.format=="h:m:s"){
						html+='<div class="timepicker-sliderbar">'
							+'<div class="slider-name">'+lan.second+'</div>'
							+'<div class="slider-bar">'
								+'<span class="slider-knob" data-hover="'+ settings.value.substring(6,8) +'"></span>'
							+'</div>'
						+'</div>';
					}
					html+='</div>'
					+'<div class="timepicker-footer">'
						+'<button type="button" class="timepicker-btn-noly">'+lan.now+'</button>'
						+'<button type="button" class="timepicker-btn-confirm">'+lan.confirm+'</button>'
						+'<button type="button" class="timepicker-btn-clear">'+lan.clear+'</button>'
					+'</div>'
				+'</div>';
				$("body").append(html);
			    $("#"+id).css({
			    	"position": "absolute",
			    	"left": _this.offset().left,
			    	"top":_this.offset().top + _this.outerHeight(true)
			    }).show();
			},
			slider: function(){
				$("#"+id).find('[class="slider-knob"]').each(function(i){
					var knob = $(this);
					var bar = knob.parent();
					var bar_w = bar.outerWidth();
					var bar_ofs_l = bar.offset().left;


					var knob_w = knob.outerWidth();
					var avail_w = bar_w - knob_w;
					var index = i;
					var law = settings.format=="h:m" ? [23,59] :[23,59,59];
					var num = law[index];

					var view_arr = $("#"+id).find(".slider-time-view").text().split(":");

					knob.css({"left": avail_w/num*view_arr[index]}).attr("data-hover",view_arr[index]);
					knob.mousedown(function(event){
						var start_x = event.pageX;
						var pos_l = knob.position().left;
						knob.addClass("active");
						$(document).bind("mousemove",function(event){
							var move_x = event.pageX;
							var move_w = move_x - start_x;
							var left =pos_l+move_w;

							if(left>=0 && left<=avail_w){
								setChangeTime(left);
							}
						}).mouseup(function(){
							$(this).unbind("mousemove");
							knob.removeClass("active");
						});
					});

					/*knob.parent().click(function(event){
				        var offset = $(this).offset();
				        var left = (event.pageX - offset.left);
				        left>avail_w? left=avail_w : "";
				        setChangeTime(left);
				    });*/

				    function setChangeTime(left){
				    	knob.css({"left": left}).attr("data-hover",timeCompletion(percentageCount(left/avail_w*num)));
				    	var old_time = $("#"+id).find(".slider-time-view").text();
						var new_time = timeCompletion(percentageCount(left/avail_w*num));

						if(index==0){
							new_time+=old_time.substring(2);
						}else if(index==1){
							new_time = old_time.substring(0,3) + new_time + old_time.substring(5,8);
						}else{
							new_time = old_time.substring(0,6) + new_time;
						}
						$("#"+id).find(".slider-time-view").text(new_time);
						_this.val(new_time);
				    }
				});
			},
			nowTime: function(){
				var time_str,
				time_data = now(),
				time_arr = {
					hh: time_data.h,
					mm: time_data.m
				};
				if(settings.format=="h:m"){
					time_str = time_data.h+":"+time_data.m;
				}else{
					time_str = time_data.h+":"+time_data.m+":"+time_data.s;
					time_arr.ss = time_data.s;
				}
				var j = 0;
				for(i in time_arr){
					$("#"+id).find(".slider-knob").eq(j).attr("data-hover",time_arr[i]);
					j++;
				}
				$("#"+id).find(".slider-time-view").text(time_str);
			},
			clear: function(){
				$("#"+id).find(".slider-time-view").text(settings.format=="h:m" ? "00:00" : "00:00:00");
				$("#"+id).find(".slider-knob").each(function(){
					$(this).css({"left":0}).attr("data-hover","00");
				});
				_this.val("");
			},
			confirm: function(){
				_this.val($("#"+id).find(".slider-time-view").text());
			},
			btnClick: function(){
				$("#"+id).find('[class*="timepicker-btn-"]').on("click",function(){
					var cls = {
						noly: 'timepicker-btn-noly',
						clear: 'timepicker-btn-clear',
						confirm: 'timepicker-btn-confirm'
					}
					if($(this).hasClass(cls.noly)){
						settings.nowTime();
						_this.val($("#"+id).find(".slider-time-view").text());
					}else if($(this).hasClass(cls.clear)){
						settings.clear();
					}else if($(this).hasClass(cls.confirm)){
						settings.confirm();
					}

					$("#"+id).remove();
					$(document).unbind("click.hide");
				});
			},
			outareaRemove: function(){
				$(document).bind("click.hide",function(event){
					var target = $(event.target);
					if(!(target.closest("#"+id).length ||target[0]==_this[0])){
						$("#"+id).remove();
						$(document).unbind("click.hide");
					}
				});
			},
			init: function(){
				$("#"+id).remove();
				settings.create();

				if(_this.val() && regexp_h_m.test(_this.val()) || _this.val() && regexp_h_m_s.test(_this.val())){
					$("#"+id).find(".slider-time-view").text(settings.format=="h:m"? _this.val().substring(0,5) : _this.val());
				}else{
					settings.nowTime();
				}
				settings.slider();
				settings.btnClick();
				settings.outareaRemove();
			}
		};
		var settings = $.extend({},defaults,options);
		settings.value? this.val(settings.value) : "";
		return this.bind("click.create",function(event) {
			$(document).unbind("click.hide");
			_this = $(this);

			settings.init();
		});



		function now(){
			var now ={};
			var d = new Date();
			now.h = timeCompletion(d.getHours());
			now.m = timeCompletion(d.getMinutes());
			now.s = timeCompletion(d.getSeconds());
			return now;
		}

		//数字取整
		function percentageCount(num){
		   var number = Math.round(num);
		    return number;
		}

		//时分秒小于10前面加0
		function timeCompletion(num){
		    num<10? num = "0"+ num : "";
		    return num;
		}
	}
})(jQuery);


