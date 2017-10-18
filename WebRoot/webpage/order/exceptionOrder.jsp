<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=uf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<link rel="icon" href="../../webpage/resource/images/favicon.ico" type="image/x-icon"/> 
<link rel="tracker icon" href="../../webpage/resource/images/favicon.ico" type="image/x-icon"/> 
<link rel="stylesheet" href="../../webpage/resource/css/normalize.css">
<link rel="stylesheet" href="../../webpage/resource/css/base.css">
<link rel="stylesheet" href="../../webpage/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="../../webpage/resource/css/non-responsive.css">
<link rel="stylesheet" href="../../webpage/resource/css/font-awesome.min.css">
<link rel="stylesheet" href="../../webpage/resource/css/iconfont.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/autocompleter/jquery.autocompleter.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/mCustomScrollbar/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/simplPagination/simplePagination.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/easydropdown/easydropdown.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/zTree/css/zTreeStyle.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/nstSlider/jquery.nstSlider.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/datetimepicker/jquery.datetimepicker.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/timePicker/jquery.timePicker.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/icheck/icheck.css">
<link rel="stylesheet" href="../../webpage/resource/plugins/ciTy/css/city.css">
<link rel="stylesheet" href="../../webpage/resource/css/site.css">


<!--CSS3 Media Queries (for IE 6-8)-->
<!--[if lte IE 8]><script src="../../webpage/resource/js/respond.min.js"></script><![endif]-->
 <script src="../../webpage/resource/js/jquery-1.8.3.min.js"></script>
<!-- Compatible with HTML5 tags -->
<script src="../../webpage/resource/js/modernizr-2.8.3.js"></script>
<!-- 模板渲染 --> 
<script src="../../webpage/resource/plugins/artTemplate/template.js"></script> 
<script src="../../webpage/resource/plugins/artTemplate/template-plugin.js"></script>
<!-- page --> 
<script src="../../webpage/resource/plugins/layer/layer.js"></script>
<!-- message --> 
<!-- easydropdown --> 
<script src="../../webpage/resource/plugins/easydropdown/jquery.easydropdown.min.js"></script> 
<!-- modal --> 
<script src="../../webpage/resource/js/modal.js"></script>
<script src="../../webpage/resource/plugins/autocompleter/jquery.autocompleter.js"></script>
<script src="../../webpage/resource/js/tooltip.js"></script>
<script src="../../webpage/resource/js/popover.js"></script>
<script src="../../webpage/resource/plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

<!-- datetimepicker --> 
<script src="../../webpage/resource/plugins/datetimepicker/jquery.datetimepicker.js"></script>

<!-- laydate -->

<!-- tab --> 
<script src="../../webpage/resource/js/tab.js"></script>
<!-- icheck -->
<script src="../../webpage/resource/plugins/icheck/icheck.min.js"></script>

<!-- ztree --> 
<script src="../../webpage/resource/plugins/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script src="../../webpage/resource/plugins/zTree/js/jquery.ztree.exhide-3.5.js"></script>
<!-- validate -->
<script src="../../webpage/resource/plugins/validate/jquery.validate.js"></script>
<script src="../../webpage/resource/plugins/nstSlider/jquery.nstSlider.min.js"></script>

<script src="../../webpage/resource/js/index/devices.js"></script>
<!--timePicker-->
<script src="../../webpage/resource/plugins/timePicker/jquery.timePicker.js"></script>
<!--[if lte IE 9]>
<script src="../../webpage/resource/js/jquery.placeholder.min.js"></script>
<!-- 国际化 -->

<!-- 主题切换
<script src="../../webpage/resource/js/themes.js"></script> -->
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=b55lMArV9Tg1uFOY980gzpkcMCKvVfI5"></script>
   
	<style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";font-family:"微软雅黑";}
		#allmap{width:100%;height:500px;}
		p{margin-left:5px; font-size:14px;}
	</style>
</head>
<body>
<input type="text" class="id" style="display:none" value="<%=request.getParameter("id") %>" />
<div class="exception_info" id="exception_info">
	  <div class="alarm-header clearfix">
	    <h5 class="fl m-0"><span class="fs-18 c-df7312"><i class="fa fa-bell-o"></i></span>&nbsp;订单异常管理</h5>
	    <!-- <a  class="alarm-close fr fs-18 cp" title="缩小"><i class="fa fa-compress" ></i></a> -->
	   <!--  <div class="alarm-tools fr ws-n">
	      <span>
	      	告警时间：
	      <input type="text" id="alarm_startTime" readonly="readonly" class="form-control form-control-xs form-control-inline" size="12" placeholder="开始时间">
	      <input type="text" id="alarm_endTime" readonly="readonly" class="form-control form-control-xs  form-control-inline" size="12" placeholder="结束时间">
	      &emsp;
	      </span>
	       <a class="cp" onclick="javascript:readAlarm('');">全部标为已读</a>
	      <a class="cp js-type-filter-btn" onclick="javascript:alarmFilter();">报警内容筛选</a>
	      <span id="lowerLevelSpan" class="icheck-min"><label class="m-b0"><input type="checkbox" id="lowerLevel" onchange="getAlarmInfoList(true,1)">&nbsp;下级设备告警&nbsp;&nbsp;&nbsp;&nbsp;</label></span>
	      <span class="icheck-min"><label class="m-b0"><input type="checkbox" id="alarmSound">&nbsp;开启报警声音</label></span>
	    </div> -->
	  </div>
	  <div class="alarm-body">
	    <div class="table-header">
	      <table class="table table-condensed table-hover table-ellipsis m-b0" id="alarmMessageTableHeader">
	        <thead>
	        <tr>
	          <th title="id" width="8%">id</th>
	          <th title="deviceId" width="8%">deviceId</th>
	          <th title="订单ID" width="10%">订单ID</th>
	          <th title="异常消息" width="14%">异常消息</th>
	          <th title="生成时间" width="12%">生成时间</th>
	          <th title="处理意见" width="12%">处理意见</th>
	          <th title="异常状态" width="10%">异常状态</th>
	          <th title="操作" width="22%">操作</th>
	        </tr>
	        </thead>
	      </table>
	    </div>
	    <div class="table-scrollbar oy-a h200">
	      <table class="table table-condensed table-normal-a table-hover table-ellipsis m-b0" id="alarmMessageTableContent">
	        <colgroup>
	          <col width="8%">
	          <col width="8%">
	          <col width="10%">
	          <col width="14%">
	          <col width="12%">
	          <col width="12%">
	          <col width="10%">
	          <col width="26%">
	          
	        </colgroup>
	        <tbody id="exceptiontable">
	        	<script type="text/html" id="alarmInfoList">
				{{each data as row i}}
					<tr>
          				<td title="{{row.id}}">{{row.id}}</td>
						<td title="{{row.deviceId}}">{{row.deviceId}}</td>
          				<td  title="{{row.orderId}}">{{row.orderId}}</td>
          				<td  title="{{row.message}}">{{row.message}}</td>
						<td  title="{{row.createTime}}">{{row.createTime}}</td>
						<td  title="{{row.processResult}}">{{row.processResult}}</td>
          				<td  title="{{row.status}}">
						{{if row.status==0}}未处理{{/if}}
					    {{if row.status==1}}已处理{{/if}}
						</td>
						<td  title="{{row.status}}">
                        <input  {{if row.status==1}}disabled{{/if}} id="{{row.id}}" placeholder='请输入处理意见'></input>
                        <button {{if row.status==1}}disabled{{/if}} type="button" style='height: 20px;padding-top: 0px;top: -2px;position: relative;' onclick="handleexception('{{row.id}}')" class="btn btn-primary btn-sm">处理</button>
                        </td>
						
        			</tr>
				{{/each}}
        	</script>
	        </tbody>
	      </table>
	    </div>
	  </div>
	
	</div>


</body>
</html>


<script type="text/javascript">	
$(document).ready(function(){
		var id =$(".id").val(); 
	    showexception(id)
})
Date.prototype.format = function(fmt) { 
     var o = { 
        "M+" : this.getMonth()+1,                 //月份 
        "d+" : this.getDate(),                    //日 
        "h+" : this.getHours(),                   //小时 
        "m+" : this.getMinutes(),                 //分 
        "s+" : this.getSeconds(),                 //秒 
        "q+" : Math.floor((this.getMonth()+3)/3), //季度 
        "S"  : this.getMilliseconds()             //毫秒 
    }; 
    if(/(y+)/.test(fmt)) {
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
    }
     for(var k in o) {
        if(new RegExp("("+ k +")").test(fmt)){
             fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
         }
     }
    return fmt; 
}        

    function showexception(id){
	
	var param ={"id":id};
	
	$.ajax({
		type:"post",
		async: true,
	    cache: false,
	    dataType :"json",
		beforeSend:function(XHR){
		},
		complete:function(XMLHttpRequest, textStatus){
		},
	    data:param,
	    url:"../../rest/Gps/getException",
		success:function(ret){
			if(ret.statusCode==0){
				var data = {"result":ret.data};
				
				if(ret.data!=null){
				    for(var i=0;i<ret.data.length;i++){
				     var date=new Date(ret.data[i].createTime);
				     ret.data[i].createTime= date.format("yyyy-MM-dd hh:mm:ss");
				    }
				}
				$("#exceptiontable").html(template("alarmInfoList",ret));
			}
		},
		error:function(e){
			ajaxError("customer_search.jsp",e);
		}
	});
}
function handleexception(id){

	var desc=$("#"+id+"").val();
	
	if(desc==""){
	
          layer.msg("未填写处理意见");
          
 	}
 	
	var param ={"id":id,"desc":desc};
	
	$.ajax({
		type:"post",
		async: true,
	    cache: false,
	    dataType :"json",
		beforeSend:function(XHR){
		},
		complete:function(XMLHttpRequest, textStatus){
		},
	    data:param,
	    url:"../../rest/Gps/handleException",
		success:function(ret){
			if(ret.statusCode==0){
					var id =$(".id").val(); 
	                showexception(id);
			}
		},
		error:function(e){
			ajaxError("customer_search.jsp",e);
		}
	});
}
</script>


