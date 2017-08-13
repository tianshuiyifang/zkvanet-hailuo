
function queryFictitiousAccountList(){
	$("#fictitiousAccount_tbody").empty();
	$("#fictitiousAccount_loadingdata").show();
	$.ajax({
		type:"post",
		async: true,
	    cache: false,
	    dataType:"json",
		data: {"parent":complex_loginUserId},
		url:_ctx+"/fictitiousAccount/search",
		success:function(ret){
			$("#fictitiousAccount_loadingdata").hide();
			if(ret && ret.code == 0){
				if(ret.data && ret.data.length>0){
					$("#fictitiousAccount_nodata").hide();
					$("#fictitiousAccount_tbody").html(template("fictitiousAccount_tbody_tmp", ret));
				}else{
					$("#fictitiousAccount_nodata").show();
					$("#fictitiousAccount_tbody").html(template("fictitiousAccount_tbody_tmp", null));
				}
			}else{
				$("#fictitiousAccount_nodata").show();
			}
		},
		complete: function(){
			tableHeaderAutoWidth("#virtualTableHeader","#virtualTableContent"); //虚拟账号表头自动宽度
		}
	});
}


function addFictitiousAccount(){
	var param = {};
	param.loginName = $("#fictitiousAccountForm").find("input[name='fictitious_account']").val();
	param.passWord = $("#fictitiousAccountForm").find("input[name='fictitious_password']").val();
	param.updateFlag = $("#fictitiousAccountForm").find("input[name='fictitious_updateFlag']").val();
	param.instructionsFlag = $("#fictitiousAccountForm").find("input[name='fictitious_instructionsFlag']").val();
	if(!$("#fictitiousAccountForm").valid()){
		return false;
	}
	$.ajax({
		type:"post",
		async: true,
	    cache: false,
	    dataType:"json",
		data: param,
		url:_ctx+"rest/loginController/register",
		success:function(ret){
			
			if(ret && ret.statusCode == 0){
				$("#addVirtualAccountModal").modal('hide');
				layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});
				//queryFictitiousAccountList();
			}else{
				layer.msg(ret.message,{icon:2});	
			}
		},
		complete:function(XMLHttpRequest, textStatus){
			authorityValide(XMLHttpRequest);
		}
	});
}

var ly = null;
function deleteFictitiousAccount(id,obj){
ly = layer.confirm($.i18n.prop('Asset.Suredeleterecord'), {icon: 3, title:$.i18n.prop('comm.Operationtips'),btn: [$.i18n.prop('comm.Confirm'),$.i18n.prop('comm.Cancel')],shade: false}, function(){
		$.ajax({
			url: _ctx+"/fictitiousAccount/delete? ="+new Date().valueOf(), 
			data:{"ids":id},
		    async: false,
		    cache: false,
		    dataType: 'json',
		    success: function (ret) {
		    	if(ret && ret.code == 0){
		    		$(obj).parent().parent().remove();
					layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});	
				}else{
					layer.msg($.i18n.prop('comm.Failed'),{icon:2});	
				}
		    },
			complete:function(XMLHttpRequest, textStatus){
				authorityValide(XMLHttpRequest);
			}
		});
		layer.close(ly);
	});
}

function openUpdateFictitiousAccountModal(id){
	$.post(_ctx+"/fictitiousAccount/select",{id:id},function(ret){
		if(ret && ret.code == 0){
			var data = ret.data;
			$("#fictitiousAccountForm").find("input[name='fictitious_account']").val(data.account).attr("readonly","readonly");
			$("#fictitiousAccountForm").find("input[name='fictitious_id']").val(data.id);
			if(data.updateFlag == 1){
				$("#fictitiousAccountForm").find("input[name='fictitious_updateFlag']").iCheck('check');
			}else{
				$("#fictitiousAccountForm").find("input[name='fictitious_updateFlag']").iCheck('uncheck');
			}
			if(data.instructionsFlag == 1){
				$("#fictitiousAccountForm").find("input[name='fictitious_instructionsFlag']").iCheck('check');
			}else{
				$("#fictitiousAccountForm").find("input[name='fictitious_instructionsFlag']").iCheck('uncheck');
			}
			$("#fictitiousAccountForm").find("input[name='fictitious_password']").val("");
			$("#fictitiousAccountForm").find("input[name='fictitious_passwordAgain']").val("");
			$(".addFictitious").hide();
			$(".updateFictitious").show();
			clearFormMsg();
			$("#addVirtualAccountModal").modal();
		}
	},"json");
}

function updateFictitiousAccount(){
	var param = {};
	param.id = $("#fictitiousAccountForm").find("input[name='fictitious_id']").val();
	param.account = $("#fictitiousAccountForm").find("input[name='fictitious_account']").val();
	param.password = $("#fictitiousAccountForm").find("input[name='fictitious_password']").val();
	param.updateFlag = $("#fictitiousAccountForm").find("input[name='fictitious_updateFlag']").val();
	param.instructionsFlag = $("#fictitiousAccountForm").find("input[name='fictitious_instructionsFlag']").val();
	if(!$("#fictitiousAccountForm").valid()){
		return false;
	}
	$.ajax({
		type:"post",
		async: true,
	    cache: false,
	    dataType:"json",
		data: param,
		url:_ctx+"/fictitiousAccount/update",
		success:function(ret){
			if(ret && ret.code == 0){
				$("#addVirtualAccountModal").modal('hide');
				layer.msg($.i18n.prop('comm.Operationdone'),{icon:1});
				queryFictitiousAccountList();
			}else{
				layer.msg($.i18n.prop('comm.Failed'),{icon:2});	
			}
		}
	});
}

$.validator.addMethod("validFictitiousPwd",function(value,element){
	var result=false;
	var fictitiousUserId = $("#fictitiousAccountForm input[name='fictitious_id']").val();
	if(fictitiousUserId){
		if(value){
			if(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/.test(value)){
				result = true;
			}
		}else{
			result = true;
		}
	}else{
		if(value && /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/.test(value)){
			result = true;
		}
	}
	return result;
});

$.validator.addMethod("equalToPsw",function(value,element){
	var result=false;
	var fictitiousUserId = $("#fictitiousAccountForm input[name='fictitious_id']").val();
	var inputPwd = $("#fictitiousAccountForm").find("input[name='fictitious_password']").val(); 
	if(fictitiousUserId){
		if(inputPwd || value){
			if(value == inputPwd){
				result = true;
			}
		}else{
			result = true;
		}
	}else{
		if(inputPwd && value == inputPwd){
			result = true;
		}
	}
	return result;
});

$("#fictitiousAccountForm").validate({
	onkeyup:false,
	rules:{
		fictitious_account:{
			required: true,
			minlength:3,
			maxlength:30,
			accountValid:true
		},
		fictitious_password:{
			minlength:6,
			validFictitiousPwd:true
		},
		fictitious_passwordAgain:{
			equalToPsw:true,
			minlength:6
		}
	},
	messages:{
		fictitious_account:{
			required: $.i18n.prop("cust.Accountcannotbeempty"),
			minlength: $.i18n.prop("cust.AccountLength"),
			maxlength: $.i18n.prop("cust.AccountLength"),
			accountValid : $.i18n.prop("cust.accountValid")
		},
		fictitious_password:{
			minlength:$.i18n.prop("user.passwordLength"),
			validFictitiousPwd:$.i18n.prop("user.passwordFormat")
		},
		fictitious_passwordAgain:{
			minlength:$.i18n.prop("user.passwordLength"),
			equalToPsw:$.i18n.prop("System.ChangePassword.Inconsistentpassword"),
		}
	},
	errorPlacement: function(error, element) {  
		error.appendTo(element.parent());  
	} 
});

function clearFormMsg(){
	$("#addVirtualAccountModal").find("label[for^='fictitious_']").remove();
   	$("#addVirtualAccountModal").find("label[for='password']").remove();
   	$("#addVirtualAccountModal").find("input[name^='fictitious_']").removeClass("error");
}