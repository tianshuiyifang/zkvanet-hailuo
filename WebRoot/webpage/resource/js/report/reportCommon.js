var switchMotionAlarm = 0;
	//页面高度自适应
	(function($) {
		var treeDefaultHeight;
		function sideTreeDefaultHeight() {
			if ($(window).height() <= 500) {
				treeDefaultHeight = 80;
			} else if ($(window).height() <= 700) {
				treeDefaultHeight = 150;
			} else {
				treeDefaultHeight = 200;
			}
			$(".js-side-tree-box .tree-scroll").css("height",treeDefaultHeight);
		}
		sideTreeDefaultHeight();
		var a,b,c,d,e,f,g, h, i, j, k, l, m, n, o, z;
		

		//计算容器高度
		function boxHeightCompute(obj){
			a = $(window).height();
			b = $(".header").outerHeight();
			c = $(".menu-seach").outerHeight();
			z = $(".footer").outerHeight();
			d = $(".customer-rightsidebar").outerHeight() - $(".customer-rightsidebar").height();
			e = $(obj).parent().outerHeight() - $(obj).parent().height();
			f = $(obj+" .rightside-header").outerHeight();
			g = $(obj+" .funcbar").outerHeight();
			h = $(obj+" .table-header").outerHeight();
			var table_h = a - b - c - z - d - e - f - g - h;
			$(obj+" .table-scrollbar").css("height",table_h);
			
		}
		//计算图表容器高度
		function chartBoxHeightCompute(obj){
			i = $(".device-statistical-box .rightside-header").outerHeight();
			j = $(".device-statistical-box .equipment-statistics").outerHeight();
			k = $(".device-statistical-box .funcbar").outerHeight();
			l = $(obj+" .func").outerHeight();
			var chart_h = a - b - c - z - d - i - j - k - l;
			$(obj+" .chart-scrollbar").css("height",chart_h);
		}

		//运动统计表格高度
		function rightSportTableHeight(){
			
			boxHeightCompute(".sport-statistical-box");
			boxHeightCompute(".mileage-statistical-box");
			boxHeightCompute(".overspeed-statistical-box");
			boxHeightCompute(".remain-statistical-box");
			boxHeightCompute(".not-extinguish-box");
			boxHeightCompute(".acc-statistical-box");

			//图表选项卡高度
			chartBoxHeightCompute(".activated-con-box");
			chartBoxHeightCompute(".sales-con-box");
			chartBoxHeightCompute(".devices-con-box");
		}
		//告警统计表格高度
		function rightAlarmTableHeight(){
			boxHeightCompute(".alarm-statistical-box");
			boxHeightCompute(".alarm-detail-box");
			boxHeightCompute(".fence-statistical-box");
		}
		//离线告警表格高度
		function rightOfflineTableHeight(){
			boxHeightCompute(".offline-statistical-box");
			boxHeightCompute(".online-statistical-box");
			
		}

		//运动表格头部自动宽度
		function sportTableHeaderAutoWidth(){
			tableHeaderAutoWidth("#sportTableHeader","#sportTableContent");//运动总览表格
			tableHeaderAutoWidth("#mileageTableHeader","#mileageTableContent");//里程统计表格
			tableHeaderAutoWidth("#dayTableHeader","#dayTableContent");//里程按天统计表格
			tableHeaderAutoWidth("#overspeedTableHeader","#overspeedTableContent");//超速统计表格
			tableHeaderAutoWidth("#remainTableHeader","#remainTableContent");//停留统计表格
			tableHeaderAutoWidth("#notExtinguishTableHeader","#notExtinguishTableContent");//停留统计表格
			tableHeaderAutoWidth("#accTableHeader","#accTableContent");//ACC统计表格
			tableHeaderAutoWidth("#deviceTableHeader","#deviceTableContent");//设备统计表格
		}

		//告警表格头部自动宽度
		function alarmTableHeaderAutoWidth(){
			tableHeaderAutoWidth("#alarmTableHeader","#alarmTableContent");//告警总览表格
			tableHeaderAutoWidth("#alarmDetailTableHeader","#alarmDetailTableContent");//告警详情表格
			tableHeaderAutoWidth("#fenceTableHeader","#fenceTableContent");//围栏告警统计表格
		}
		
		//离线统计表格头部自动宽度
		function offlineTableHeaderAutoWidth(){
			tableHeaderAutoWidth("#offlineTableHeader","#offlineTableContent");//离线统计表格
			tableHeaderAutoWidth("#onlineTableHeader","#onlineTableContent");//在线统计表格
		}
		
		//运动选项卡
		$(".motion-nav .tab-nav li").click(function(){
			$(".tab-con-alarm").hide();
			$(".tab-con-sport").show();

		});
		tabs(".motion-nav .tab-nav", "active",".tab-con-sport",function(){
			rightSportTableHeight();
			sportTableHeaderAutoWidth();
			query_history = "";
		});
		
		//告警选项卡
		$(".alarm-nav .tab-nav li").click(function(){
			$(".tab-con-sport").hide();
			$(".tab-con-alarm").show();

		});
		tabs(".alarm-nav .tab-nav", "active",".tab-con-alarm",function(){
			rightAlarmTableHeight();
			alarmTableHeaderAutoWidth();
			
			query_history = "";
		});
		
		
		//离线选项卡
		tabs(".offline-nav .tab-nav", "active",".tab-con-offline",function(){
			rightOfflineTableHeight();
			offlineTableHeaderAutoWidth();
		});
		
		
		
		tabs(".main-tab .equipment-statistics-list", "active",".main-tab .tab-con",function(){
			rightSportTableHeight();
			query_history = "";
		});
		
		//左侧高度
		function sideLeftHeight(){
			
			o = $(".customer-leftsidebar").outerHeight() - $(".customer-leftsidebar").height();
			var side_left_h = a - b - c - z - o;
			$(".side-left").css("height", side_left_h);
		}
		sideLeftHeight();
		
		
		//运动统计与告警统计点击切换显示
		$(".motion-alarm-list>li").click(function(){
			$(this).addClass("active").siblings().removeClass("active");
			var index = $(this).index();
			//var check = $(this).children("a").parent().siblings().find("a").text();
			if(index == 1){
				getAllAlarmType();
				showAlarmReportTab();
				$("#alarm-ReportTab>ul>li").eq(0).click();
				switchMotionAlarm = 1;
			}else if(index == 2){
				$("#StateStatistics-ReportTab>ul>li").eq(0).click();
				switchMotionAlarm = 2;
				cleanOffLineData();
			}else{
//				addActive('mileage');
//				initTime('mileage');
//				MileageTotalRecord=0;
//				MileagePageNo = 1;
//				MileagePageSize =10;
//				$("#queryDevice_select_mileage").val("");
//				$("#checkSegment").iCheck('check');
//				switchMotionAlarm = 0;
//				$("#motion-ReportTab>ul>li").eq(0).click();
//				showMileageTab();
				addActive('sport');
				initTime('sport');
				cleanRunData();
				$("#motion-ReportTab>ul>li").eq(0).click();
			}
			query_history = '';
			var array = [".motion-alarm-con",".customer-rightsidebar"];
			toggleStatistics(index,array);
			rightSportTableHeight();
			rightAlarmTableHeight();
			rightOfflineTableHeight();
		});
		
		function toggleStatistics(index,array){
			$.each(array,function(i,v){
				$(v).children(":eq("+index+")").show().siblings().hide();
			});
		}
		
		//浏览器窗口大小变化尺寸自适应
		$(window).resize(function() {
			if ($(window).height() > 500) {
				rightSportTableHeight();
				rightAlarmTableHeight();
				rightOfflineTableHeight();
			}
			sportTableHeaderAutoWidth();
			alarmTableHeaderAutoWidth();
			offlineTableHeaderAutoWidth();
			sideLeftHeight();
			
		});
	})(jQuery);

	 tabs(".js-tab", "btn-primary");
	//单选框、复选框
	 $("input[name = 'icheck'],input[name = 'status'],input[name = 'icheckContainSub']").iCheck();
	$("[name=type]").iCheck().on("ifChecked",function(){
		$("#queryDevice_select_mileage").removeClass("form-control-error");
		if(this.value=="segment"){
			MileageTotalRecord=0;
			MileagePageNo = 1;
			MileagePageSize =10;
			$("#Today_mileage").show();
			$("#qucikTime_mileage>button:first").trigger("click").addClass("btn-primary");
			$("#milage_day").hide();
			$(".segment-box").show();
			$(".day-box").hide();
			$("#paging-mileage").hide();
			//tableHeaderAutoWidth("#mileageTableHeader","#mileageTableContent");//里程统计表格
		}else{
			MileageTotalRecord=0;
			MileagePageNo = 1;
			MileagePageSize =10;
			$("#Today_mileage").hide();
			$("#qucikTime_mileage>button:eq(1)").trigger("click").addClass("btn-primary");
			$("#milage_day").show();
			$(".segment-box").hide();
			$("#paging-day").hide();
			$(".day-box").show();
			//tableHeaderAutoWidth("#dayTableHeader","#dayTableContent");
		}
	});
		
	//告警类型选择
	$(".js-btn-show-more-icheck").click(function(){
		$this = $(this);
		var $parent = $(this).parent();
		var flag = $parent.hasClass("open");
		$(document).on("click.open",function(event){
			if(!$(event.target).is(".icheck-group-box .icheck-group,.js-btn-show-more-icheck,.js-btn-show-more-icheck .fa")){
				
				$parent.removeClass("open");
				$this.find("i").attr("class",$this.find("i").attr("class").replace("up","down"));
				$(document).unbind("click.open");
			}else{
				if(flag){
					$parent.removeClass("open");
					$this.find("i").attr("class",$this.find("i").attr("class").replace("up","down"));
					$(document).unbind("click.open");
				}else{
					$parent.addClass("open");
					$this.find("i").attr("class",$this.find("i").attr("class").replace("down","up"));
				}
			} 
		});
	});