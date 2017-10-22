function orderinfo(baozhuangfangshi,createTime,
		fahuodanhao,beizhu,chanpinmingcheng,yunshuchehao,fahuoshuliang,quyuming,quyuma,chuchangriqi,yunshuchehao,
		chuchangbianhao,yunshudanwei,kehumingcheng){
	
	$("#showorder").modal();
	$("#baozhuangfangshi").val(baozhuangfangshi);
	$("#createTime").val(createTime);
	$("#fahuodanhao").val(fahuodanhao);
	$("#beizhu").val(beizhu);
	$("#chanpinmingcheng").val(chanpinmingcheng);
	$("#yunshuchehao").val(yunshuchehao);
	$("#fahuoshuliang").val(fahuoshuliang);
	$("#quyuming").val(quyuming);
	$("#quyuma").val(quyuma);
	$("#chuchangriqi").val(chuchangriqi);
	$("#yunshuchehao").val(yunshuchehao);
	$("#chuchangbianhao").val(chuchangbianhao);
	$("#yunshudanwei").val(yunshudanwei);
	$("#kehumingcheng").val(kehumingcheng);
}

function showException(id){
	

	$("#getExceptionTitle").html("订单异常详情");
	$("#exceptionIframe").contents().find('body').html("");
	$("#exceptionorder").modal();
	
	$("#exceptionIframe").attr("src","/zkvanet-hailuo/webpage/order/exceptionOrder.jsp?&id="+id);
	
	
}
var image='';
var imgname='';
var id='';
var picNo=""; //下一个图片的编号
//上传图片
function uploadimage(orderid,orderNo){
	
	id=orderid;
	$("#orderimage").modal();
	getImage(orderNo);
}

function showVerify(orderid,salesCheckStatus,salesCheckMsg,
		marketCheckStatus,marketCheckMsg,
		financialCheckStatus,financialCheckMsg){
	
	id=orderid;
	
	$("#showVerify").modal();
	
	//审核标签
	$('#verifyTitle').html("");
	var title="订单审核";
	
	$('#saleAdvise').attr("disabled",true);
	$('#marketAdvise').attr("disabled",true);
	$('#financeAdvise').attr("disabled",true);
	
	if($('.csrole').val()=='1'){
		title="订单审核-厂商管理员";
		$('#verifyStatusBtn').hide();
		$('#nverifyStatusBtn').hide();
	}else if($('.csrole').val()=='2'){
		title="订单审核-销售";
		$('#saleAdvise').attr("disabled",false);
	}else if($('.csrole').val()=='3'){
		title="订单审核-市场";
		$('#marketAdvise').attr("disabled",false);
	}else if($('.csrole').val()=='4'){
		title="订单审核-财务";
		$('#financeAdvise').attr("disabled",false);
	}else{
		//其他用户隐藏确定按钮
		$('#verifyStatusBtn').hide();
		$('#nverifyStatusBtn').hide();
	}
	$('#verifyTitle').html(title);
	
	//审核图表
	
	$('#marketAdvisetag').html("市场部审核");
	$('#financeAdvisetag').html("财务部审核");
	$('#saleAdvisetag').html("销售部审核");
	
	var htmlpass="<i class='fa  fa-check-square' style='color:#29de29;left:15px;position:relative'></i>";
	var htmlnopass="<i class='fa  fa-exclamation' style='color:#efa22c;left:15px;position:relative'></i>"
	var htmlno="<i class='fa  fa-circle' style='color:#96a296;left:15px;position:relative'></i>";
	
	
	if(salesCheckStatus==1){
		$('#saleAdvisetag').append(htmlpass);
	}else if(salesCheckStatus==2){
		$('#saleAdvisetag').append(htmlnopass);
	}else{
		$('#saleAdvisetag').append(htmlno);
	}
	
	if(marketCheckStatus==1){
		$('#marketAdvisetag').append(htmlpass);
	}else if(marketCheckStatus==2){
		$('#marketAdvisetag').append(htmlnopass);
	}else{
		$('#marketAdvisetag').append(htmlno);
	}
	
	if(financialCheckStatus==1){
		$('#financeAdvisetag').append(htmlpass);
	}else if(financialCheckStatus==2){
		$('#financeAdvisetag').append(htmlnopass);
	}else{
		$('#financeAdvisetag').append(htmlno);
	}
	
	$('#saleAdvise').val(salesCheckMsg);
	$('#marketAdvise').val(marketCheckMsg);
	$('#financeAdvise').val(financialCheckMsg);
	
	
	
}

function other_upload(file) { 
		
		if(!file.files || !file.files[0]){
				return;
		 }
		picNo=$("#orderimage").find(".orderimg").length+1;
		if(picNo>8){
			layer.msg("图片最多上传8张");
			return;
		}
		imgname=file.files[0].name
		var reader = new FileReader();
		reader.onload = function(evt){
		 	//document.getElementById('img').src = evt.target.result;
	 		image = evt.target.result;
	 		uploadImage();
	 	}
	 	reader.readAsDataURL(file.files[0]);
}	
function  verifyStatus(statusCode){
	var msg;
	var url='';
	if($('.csrole').val()=='2'){
		url='rest/Gps/salesCheck';
		msg=$('#saleAdvise').val();
	}else if($('.csrole').val()=='3'){
		url='rest/Gps/marketCheck';
		msg=$('#marketAdvise').val();
	}else if($('.csrole').val()=='4'){
		url='rest/Gps/financialCheck';
		msg=$('#financeAdvise').val();
	}
	
	$.ajax({
			type:'POST',
			url: url, 
			data: {"id": id,"statusCode":statusCode,"msg":msg},
			async: false,
			dataType: 'json',
			success: function(data){
					if(data.statusCode==0){
						layer.msg('审核成功');
						$("#showVerify").modal('hide');
						showorder(extId,extrole);
				}
			},
			error: function(err){
					layer.msg('网络故障');
				}
	});
} 
function  getImage(orderNo){
	
	$.ajax({
			type:'POST',
			url: 'rest/Gps/getimage', 
			data: {"orderNo": orderNo},
			async: false,
			dataType: 'json',
			success: function(data){
				    $("#imagearea").html("");
					if(data.statusCode==0){
						
						for(var i=0;i<data.data.length;i++){
							var name=data.data[i].substring(9);
							var	html="<img class='orderimg' style='margin:10px;border:8px #987cb9 double' title='"+name+"' id='img"+i+"'"+ "src='.."+data.data[i]+"' height='100' width='170' onclick='javascript:window.open(this.src)'/>"
							$("#imagearea").append(html);
						}
					
						}else{
							
						layer.msg(data.message);
						}
				},
			error: function(err){
					layer.msg('网络故障');

				}
	});
} 
function  uploadImage(){
	
		$.ajax({
				type:'POST',
				url: 'rest/Gps/uploadimage', 
				data: {"image": image,"name":imgname,'id':id,'picNo':picNo},
				async: false,
				dataType: 'json',
				success: function(data){
						if(data.statusCode==0){
							var name=data.data.substring(9);
							var html="<img class='orderimg' style='margin:10px;border:8px #987cb9 double' title='"+name+"' id='img"+picNo+"'"+ "src='.."+data.data+"' height='100' width='170' onclick='javascript:window.open(this.src)'/>"
							$("#imagearea").append(html);
							layer.msg("上传成功");
							}else{
							layer.msg(data.message);
							}
					},
				error: function(err){
						layer.msg('网络故障');
					}
		});
} 

//用户树加载
$(document).ready(function(){
	 $("#treeDemo").initCustomTree({
		 treeType : "stock_repertory",
		 head_userId : global_userId,
		 loadingSelector : "TreeLogindata",
		 onClick : ztreeOnClick,
		 onClickFlag : false,
		 searchAlert : true,
		 ajaxDataFilter : stock_ajaxDataFilter
	 });
	
	 var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	 if(treeObj==null)return;
	 ztreeOnClick(null,"treeDemo",treeObj.getNodes()[0]);
	 
	 initTime();
	$(".order_status").easyDropDown();
	
});

function initTime(){
	$("#startTime").focus(function(){
		var start = {
			    elem: '#startTime',
			    event: 'focus',
			    format: "YYYY-MM-DD hh:mm:ss",
			    //min: laydate.now(), //设定最小日期为当前日期
			    min: laydate.now(-90),
			    max: laydate.now(), //最大日期
			    istime: true,
			    istoday: true,
			};
		laydate(start);
	});
	$("#endTime").focus(function(){
		var end = {
		    elem: '#endTime',
		    event: 'focus',
		    format: "YYYY-MM-DD hh:mm:ss",
		    //min: laydate.now(),
		    min: laydate.now(-90),
		    max: laydate.now(), //最大日期
		    istime: true,
		    istoday: true,
		};
		laydate(end);
	});
}

var userId;
var extId=null;
var extrole=null;//订单审核菜单用 搜索时ID
function showorder(id,role){
	if(id==null||id==undefined){
		id=userId; 
	}
	if(role=='2'||role=='3'||role=='4'){
		extId=id;
		extrole=role;
	}
	
	var param ={"userId":id};
	param.pageCurrent=pageCurrent;
	param.pageSize=pageSize;
	if($("#customerName").val()!=""){
		param.customerName=$("#customerName").val()
	}
	if($("#carNo").val()!=""){
		param.carNo=$("#carNo").val();
	}
	if($("#areaName").val()!=""){
		param.areaName=$("#areaName").val();
	}
	if($("#orderNo").val()!=""){
		param.orderNo=$("#orderNo").val();
	}
	if($("#startTime").val()!=""){
		param.start_Time=$("#startTime").val();
	}
	if($("#endTime").val()!=""){
		param.end_Time=$("#endTime").val();
	}
	if($(".order_status").val()!="-1"){
		param.hasWaring=$(".order_status").val();
	}
	if(role=='1'){
		param.salesCheckStatus=$(".salesCheckStatus").val();
		param.marketCheckStatus=$(".marketCheckStatus").val();
		param.financialCheckStatus=$(".financialCheckStatus").val();
		
	}
	if(role=='3'){
		param.marketCheckStatus=0;
	}
	if(role=='2'){
		param.marketCheckStatus=$(".marketCheckStatus").val();
		param.salesCheckStatus=0;
	}
	if(role=='4'){
		param.salesCheckStatus=$(".salesCheckStatus").val();
		param.marketCheckStatus=$(".marketCheckStatus").val();
		param.financialCheckStatus=0;
	}
	$.ajax({
		type:"post",
		async: true,
	    cache: false,
	    dataType :"json",
		beforeSend:function(XHR){
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
			tableHeaderAutoWidth("#orderTableHeader","#orderTableContent")
		},
	    data:param,
	    url:_ctx+"rest/Gps/getOrderByPage",
		success:function(ret){
			if(ret.statusCode==0){
				if(ret.data.list!=null){
					//totalRow=Math.ceil(ret.data.totalRow/pageSize);
					totalRow=ret.data.totalRow;
					
					//统计图片数目
					for(var i=0;i<ret.data.list.length;i++){
						var totalPic=0;
						if(ret.data.list[i].pic1!=null){
							totalPic=totalPic+1;
						}
						if(ret.data.list[i].pic2!=null){
							totalPic=totalPic+1;
						}
						if(ret.data.list[i].pic3!=null){
							totalPic=totalPic+1;
						}
						if(ret.data.list[i].pic4!=null){
							totalPic=totalPic+1;
						}
						if(ret.data.list[i].pic5!=null){
							totalPic=totalPic+1;
						}
						if(ret.data.list[i].pic6!=null){
							totalPic=totalPic+1;
						}
						if(ret.data.list[i].pic7!=null){
							totalPic=totalPic+1;
						}
						if(ret.data.list[i].pic8!=null){
							totalPic=totalPic+1;
						}
						ret.data.list[i].totalP=totalPic;
					}
					
				}
				var data = {"result":ret.data.list};
				$("#run-tbody").html(template("run-tbody-json",data));
				$("tbody>tr:odd").css('background','#f2f7fb'); 
				$("tbody>tr:even").css('background','#ffffff');
				initRunPage(param);
			}
		},
		error:function(e){
			ajaxError("customer_search.jsp",e);
		}
	});
}

function ztreeOnClick(event,treeId, treeNode){
	var treeObj = $.fn.zTree.getZTreeObj(treeId);
	var customerNodes = treeObj.getNodes();
	userId=treeNode.id;
	pageCurrent = 1;
	pageSize =10;
	showorder(treeNode.id);

}
/**分页**/
var totalRow = 0;
var pageCurrent = 1;
var pageSize =10;



function initRunPage(param){
	$("#run-paging").pagination({
		prevText: $.i18n.prop("page.previous") ,
		nextText: $.i18n.prop("page.next"),
		items: totalRow,
     	itemsOnPage: pageSize,
     	param:param,
     	onPageClick: function(cpageNumber,cpageSize,param, event){
     		if(event && event.type=="click"){
     			pageCurrent = cpageNumber;
     			showorder(extId,extrole);
     		}
     		if(event && event.type=="change"){
     			pageSize = cpageSize;
     			showorder(extId,extrole);
     		}
     		
     	},
     	onInit : function (){
     		$("#run-paging").pagination("selectPage",pageCurrent);
     	}
	});
}

