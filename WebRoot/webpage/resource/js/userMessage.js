var msg_pageSize = 10;
var msg_pageNo = 1;
var msg_totalRecord = "";

$(document).ready(function(){
	//getUnreadTotal();
});


/**
 * 全选
 * @param all
 * @param checkbox
 */
function checkboxAllSelect(all,checkbox){
    $(all).iCheck().on("ifClicked",function(){
        if(this.checked){
            $(checkbox).iCheck('uncheck');
        }else{
        	$.each(checkbox,function(i,v){
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
}


function initDevicePaging(param){
	$("#msg_paging").pagination({
		prevText: $.i18n.prop("page.previous") ,
		nextText: $.i18n.prop("page.next"),
		items: msg_totalRecord,
     	itemsOnPage: msg_pageSize,
     	param:param,
     	onPageClick: function(pageNumber,pageSize,param, event){
     		if(event && (event.type=="click" || event.type=="change")){
     			msg_pageNo = pageNumber;
     			msg_pageSize = pageSize;
     			getMessageList(msg_pageNo,param);
     		}
     	},
     	onInit : function (){
     		$("#msg_paging").pagination("selectPage",msg_pageNo);
     	}
	});
}

/**
 * 列表查询
 * @param pageNo
 */
function getMessageList(pageNo,param){
	if(pageNo){
		msg_pageNo = pageNo;
	}
	if(!param){
		param = {pageSize:msg_pageSize,imeis:$("#remainSearchDeviceInput").val(),type:$(".messageType").val(),readFlag:$(".msgStatus").val()};
	}
	param.pageNo = msg_pageNo;
	param.pageSize = msg_pageSize;
	$.ajax({
		type:"get",
		async: true,
	    cache: false,
		url : 'http://127.0.0.1/json/meglist.json',
		 dataType:'jsonp',
		 jsonp:"jsonpcall",
		 jsonpCallback:"jsonpCallback",
		beforeSend:function(XHR){
			$("#userMessage_logindata").show();
			$("#msg_tbody").hide();
			$("#msg_paging").hide();
			$("#msg_nodata").hide();
		},
		complete:function(XHR, TS){
			$("#msg_tbody").show();
			$("#userMessage_logindata").hide();
			tableHeaderAutoWidth("#noticeTableHeader","#noticeTableContent"); //消息表头自动宽度
		},
		success : function(ret) {
			if(ret && ret.code == 0){
				if(ret.data.result && ret.data.result.length > 0){
					$("#msg_tbody").html(template("msg_tbody_tmp",{data:ret.data.result,pageNo:msg_pageNo,pageSize:msg_pageSize}));
					msg_totalRecord = ret.data.totalRecord;
					if(msg_pageNo == 1){
						initDevicePaging(param);
					}
					$('.msg-all-check').iCheck("uncheck");
//					checkboxAllSelect($('.msg-all-check'),$('.msg-check'));
					$("#msg_paging").show();
					$("#msg_nodata").hide();
				}else{
					$("#msg_tbody").html(template("msg_tbody_tmp",null));
					$("#msg_paging").hide();
					$("#msg_nodata").show();
				}
			}else{
				$("#msg_tbody").html(template("msg_tbody_tmp",null));
				$("#msg_paging").hide();
				$("#msg_nodata").show();
			}
				checkboxSelectLine($('.msg-all-check'),$('.msg-check'));
			
			
		},
		error : function(e) {
			ajaxError("getMessageList()", e);
		}
	});
}

/**
 * 勾选已读
 */
function batchRead(){
	var ids = "";
	var allCheck = $(".msg-check");
	$.each(allCheck,function(i,v){
		if($(v).attr("checked")){
			ids+=$(v).val()+",";
		}
	});
	if(ids){
		ids = ids.substring(0, ids.length-1);
	}else{
		layer.msg($.i18n.prop("msg.PleaseselecteMessage"));
		return ;
	}
	$.post(_ctx+"/userMsg/readMessage",{id:ids},function(ret){
		if(ret && ret.code == 0){
			var readNum = ids.split(",").length;
			var unRead = Number($("#unReadTotal").html());
			if((unRead - readNum) > 0){
				$("#unReadTotal").html(unRead - readNum);
			}else{
				$("#unReadTotal").html(0);
			}
			layer.msg($.i18n.prop("comm.Operationdone"),{icon:1});
			getMessageList(1);
			$(".msg-all-check").iCheck("uncheck");
		}
	});
}


function readAll(){
	if($("#msg_tbody tr").length <= 0){
		layer.msg($.i18n.prop("msg.noMesaage"));
		return;
	}
	$.post(_ctx+"/userMsg/readAll",{imeis:$("#remainSearchDeviceInput").val(),type:$(".messageType").val(),readFlag:$(".msgStatus").val()},function(ret){
		if(ret && ret.code == 0){
			if(!ret.data){
				ret.data = 0;
			}
			$("#unReadTotal").html(Number($("#unReadTotal").html())-ret.data);
			layer.msg($.i18n.prop("comm.Operationdone"),{icon:1});
			getMessageList(1);
			$(".msg-all-check").iCheck("uncheck");
		}
	},"json");
}


/**
 * 过期延长
 */
function prolong(imei,msgId){
	readMessage(msgId);
	openAllotDevProlongModal(imei,"accountCenter");
}

function getUnreadTotal(){
	$.post(_ctx+"/userMsg/getUnreadTotal",{},function(ret){
		highlightColor(ret.data > 0,"#unReadTotal","c-red");
		if(ret && ret.code == 0){
			$("#unReadTotal").html(ret.data);
		}
	},"json");
}

//高亮颜色
function highlightColor(flag,ele,cla){
	flag ? $(ele).addClass(cla) : $(ele).removeClass(cla);
}
