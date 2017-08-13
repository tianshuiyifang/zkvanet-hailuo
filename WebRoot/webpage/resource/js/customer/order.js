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
	 ztreeOnClick(null,"treeDemo",treeObj.getNodes()[0]);
});
var userId;
function showorder(id){
	if(id==null||id==undefined){
		id=userId;
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
	$.ajax({
		type:"post",
		async: true,
	    cache: false,
	    dataType :"json",
		beforeSend:function(XHR){
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		},
	    data:param,
	    url:_ctx+"rest/Gps/getOrderByPage",
		success:function(ret){
			if(ret.statusCode==0){
				var data = {"result":ret.data.list};
				if(ret.data.list!=null){
					//totalRow=Math.ceil(ret.data.totalRow/pageSize);
					totalRow=ret.data.totalRow;
				}
				$("#run-tbody").html(template("run-tbody-json",data));
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
     			showorder();
     		}
     		if(event && event.type=="change"){
     			pageSize = cpageSize;
     			showorder();
     		}
     		
     	},
     	onInit : function (){
     		$("#run-paging").pagination("selectPage",pageCurrent);
     	}
	});
}

