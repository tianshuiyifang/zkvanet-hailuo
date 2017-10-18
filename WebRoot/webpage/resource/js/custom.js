//sidebarscroll
function sideAutoHeight(){
	$(".js-sidebar-scroll").height($(window).height() - $(".alarm-sidebar .side-title").outerHeight() - $(".more-alarm").outerHeight());
}
sideAutoHeight();

$(window).resize(function(){
	sideAutoHeight();
});

$(function(){
	//alarm-sidebar
	$(".js-to-alarm-sidebar").click(function(){
		$("#alarmSidebar").addClass("open");
		$(document).bind("click",function(e){
	      var target = $(e.target);
	      if(!target.closest(".alarm-sidebar-box,.js-to-alarm-sidebar").length){
	    	  $("#alarmSidebar").removeClass("open");
	    	  $(document).unbind("click");
	      }
	    });
		$(".js-side-close").click(function(){
			$("#alarmSidebar").removeClass("open");
		});
	});
});

//告警面板切换
function alarmToggle(){
	//elementMove(".js-alarm-toggle-btn",getAlarmInfoList);
//	$(".js-alarm-toggle-btn").click(function(){
//		getAlarmInfoList(true,null);
//	});
    $("#alarmMessage .alarm-close").click(function(){
    	$("#alarmMessage").toggle(); 
	});
	$(".js-type-filter-btn").click(function(){
	  $("#alarmFilterModal").modal();
	   checkboxAllSelectToggle("#alarmAllSelect","input[name='alarm_item']");
	});
}
$("#alarmMessage .alarm-close ").click(function(){
	$("#alarmMessage").toggle(); 
});
$("#orderMessage .order-close-c ").click(function(){
	$("#orderMessage").css({"width":"900px","height":"250px","right":"15px","bottom":"15px"});
	$(".alarm-body .table-scrollbar").css({"height":"200px"});
	$("#orderMessage").toggle(); 
});
$("#orderMessage .order-close-e ").click(function(){
	var winWidth;
	var winHeight;
	// 获取窗口宽度
	if (window.innerWidth)
	winWidth = window.innerWidth;
	else if ((document.body) && (document.body.clientWidth))
	winWidth = document.body.clientWidth;
	// 获取窗口高度
	if (window.innerHeight)
	winHeight = window.innerHeight;
	else if ((document.body) && (document.body.clientHeight))
	winHeight = document.body.clientHeight;
	// 通过深入 Document 内部对 body 进行检测，获取窗口大小
	if (document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth)
	{
	winHeight = document.documentElement.clientHeight;
	winWidth = document.documentElement.clientWidth;
	}
	$("#orderMessage").css({"width":winWidth,"height":winHeight,"right":"0px","bottom":"0px"});
	var newwinHeight=winHeight*0.9;
	$(".alarm-body .table-scrollbar").css({"height":newwinHeight});
});
//告警面板消息切换
function alarmInfoToggle(){
	$("#alarmMessage").toggle();
}

//判断是否是ie浏览器
function isIE(){
	var userAgent = navigator.userAgent;
	if(userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1){
		return true;
	}
}

//创建音频元素
function soundPrompt(){
	var body = document.body || document.documentElement;
	var audio;
	
	if(isIE()){
		audio = document.createElement("bgsound");
		audio.autostart = "true";
		audio.loop = "-1";
	}else {
		audio = document.createElement("audio");
		audio.autoplay = "autoplay";
		audio.loop = "loop";
	}
	
	audio.id = "audio";
	body.appendChild(audio);
}
soundPrompt();

//播放控制
function audioPlay(url){
	var audio = document.getElementById("audio");
	audio.setAttribute("src",url);
}

$(function(){
	alarmToggle();
});


//全选切换
function checkboxAllSelectToggle(all,checkbox){
    $(all).iCheck().on("ifClicked",function(){
        if(this.checked){
            $(checkbox).iCheck('uncheck');
        }else{
            $(checkbox).iCheck('check');
        }
    });
    $(checkbox).iCheck().on("ifChecked",function(){
        var flag = true;
        $(checkbox).each(function(){
            if(!this.checked){
                flag = false;
            }
        });
        if(flag){
            $(all).iCheck('check');
        }
    }).on("ifUnchecked",function(){
        $(all).iCheck('uncheck');
    });
}



//复选选中行变色
function checkboxSelectLine(all,checkbox){
	$(all).iCheck().on("ifClicked",function(){
        if(this.checked){
            $(checkbox).iCheck('uncheck');
        }else{
        	$.each($(checkbox),function(i,v){
        		if(!$(v).attr("disabled")){
        			$(v).iCheck('check');
        		}
        	});
        }
    });
    $(checkbox).iCheck().on("ifChecked",function(){
        var flag = true;
        $(checkbox).each(function(){
            if(!this.checked){
                flag = false;
            }
        });
        if(flag){
            $(all).iCheck('check');
        }
        $(this).parents("tr").addClass("active");
    }).on("ifUnchecked",function(){
        $(all).iCheck('uncheck');
        $(this).parents("tr").removeClass("active");
    });
    
    $(checkbox).not('[disabled=disabled]').parents("tr").on("click", function() {
		$(this).toggleClass("active").find("input").iCheck('toggle');
	});
}

//表格头部自动宽度
function tableHeaderAutoWidth(tabtit,tabcon){
	if($(tabcon).is(":visible") && $(tabcon + " tbody>tr").length>0){
		$(tabtit + " thead tr:first th").each(function(index){
			var th_w = $(tabcon + " tr:first td").eq(index).outerWidth();
			$(this).css("width",th_w);
		});
		$(tabtit).css("width",$(tabcon).outerWidth());
	}
}

//清除表单错误提示
function clearFormError(form){
	$(form +" label[class='error']").remove();
}

//设置年份
$(".js-year").text(function(){
	var y = new Date().getFullYear();
	return y;
});


//元素可拖动
function elementMove(ele,click){
	var ele = $(ele);
	var  w,h,ww,wh,x,y,px,py,mx,my,sx,sy,ex,ey;
	w = ele.outerWidth();
	h = ele.outerHeight();
	ele.mousedown(function(event){
		ww = $(window).width();
		wh = $(window).height();
		x = ele.offset().left - $(document).scrollLeft();
		y = ele.offset().top - $(document).scrollTop();
		px = sx = event.pageX;
		py = sy = event.pageY;
		
		$(document).on("mousemove.move",function(event){
			mx = px - event.pageX;
			my = py - event.pageY;
			if(x-mx+w <= ww && x-mx>0){
				ele.css({"left":x-mx,"right":"auto"});
			}
			if(y-my+h <= wh && y-my>0){
				ele.css({"top":y-my,"bottom":"auto"});
			}
		}).mouseup(function(){
			$(document).unbind("mousemove.move");
		});
	}).mouseup(function(event){
		ex = event.pageX;
		ey = event.pageY;
		if(sx==ex && sy==ey){
			alarmInfoToggle();
			if(click && typeof(click) === "function"){
				click(true);
			}
		}else{
			x = ele.offset().left - $(document).scrollLeft();
			y = ele.offset().top - $(document).scrollTop();
			$(window).resize(function(){
				ww = $(window).width();
				wh = $(window).height();
				if(ww<x+w){
					ele.css({"left":ww-w});
				}else{
					ele.css({"left":x});
				}
				if(wh<y+h){
					ele.css({"top":wh-h});
				}else{
					ele.css({"top":y});
				}
			});
		}
	});
}


