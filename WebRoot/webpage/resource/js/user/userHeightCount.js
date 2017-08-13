(function($){
	var a,b,c,d,e,f,g,h,i,j,k,l,z,main_min_h,account_min_h,operation_iframe_h;
	//main最小高度
	function mainMinHeight(){
	  a = $(window).height();

	  b = $(".header").outerHeight();
	  c = $(".menu-seach").outerHeight();
	  z = $(".footer").outerHeight();
	  main_min_h = a - b - c - z;
	  $(".main").css("min-height",main_min_h);
	}
	mainMinHeight();
	
	//表格高度
    function tableHeight(ele){
        d = $(".customer-rightsidebar").outerHeight() - $(".customer-rightsidebar").height();
        e = $(ele+" .rightside-header").outerHeight();
        f = $(ele).outerHeight() - $(ele).height();
        g = $(ele+" .funcbar").outerHeight();
        h = $(ele+" .table-header").outerHeight();
        var table_h = a - b - c - z - d - e - f - g - h;
        $(ele+" .table-scrollbar").css("height",table_h);
    }
	
	//选项卡
    tabs(".side-busines>ul", "active",".customer-rightsidebar",function(){
    	tableHeight(".tab-con-notice");//消息表格
    	accountMinHeight();
    	operationHeight();
    	tableHeight(".tab-con-virtual");//虚拟账号
    	
    });
	
	//账户最小高度
	function accountMinHeight(){
		account_min_h =  a - b - c - d - z;
		$(".tab-con-account").css({"min-height":account_min_h});
	}
	
	//操作指引
	
	function operationHeight(){
		
		k = $(".tab-con-operation").outerHeight()- $(".tab-con-operation").height();
		l = $(".tab-con-operation .rightside-header").outerHeight();
		operation_iframe_h =  a - b - c - d - z - k - l;
		$("#operationIframe").css({"height":operation_iframe_h});
	}

	
	
	//账户销售选项卡切换
    tabs(".main-tab .tab-nav", "active",".main-tab .tab-con");
	
	$(window).resize(function(){
	  mainMinHeight();
	  tableHeight(".tab-con-notice");//消息表格
	  accountMinHeight();
	  operationHeight();
	  tableHeight(".tab-con-virtual");//虚拟账号
	  tableHeaderAutoWidth("#noticeTableHeader","#noticeTableContent"); //消息表头自动宽度
	  tableHeaderAutoWidth("#virtualTableHeader","#virtualTableContent"); //虚拟账号表头自动宽度
	});
})(jQuery);