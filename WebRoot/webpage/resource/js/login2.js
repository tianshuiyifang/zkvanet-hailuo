function send(){
	$("#logins").hide();
	$("#load").show();
	var pass=$("#password").val();
	$.ajax({
		 type:"get",
		 url:"loginController.do?checkuser",
		 dataType:'json',
		 data:{"loginName":$("#account").val(),"passWord":pass},
		 success:function(ret){
			if(ret && ret.statusCode == 0){
				 if(ret.data.role.id=='6'){  //厂商用户代码废弃
					 $(".js-select-changshangrole").easyDropDown();
					 $('#myModal').modal('show');
					 $('.login').hide();
					 userinfo=ret.data;
				 }else{
					// saveLogin(ret.data);
					 window.location.href='loginController.do?login';
				 }
			 }else{
				 $("#tipsmsg").show();
				 $("#logins").show();
				 $("#load").hide();
				 $("#tipsmsg").text(isError);
			 }
		 }
	 });
}
var userinfo={};
var changshangrole=null;
function saveLogin(data){
	if(data==null||data==undefined){
		data=userinfo;
		changshangrole=$('.js-select-changshangrole').val();
	}
	 $.ajax({
		 type:"get",
		 url:"loginController.do?saveloginInfo",
		 dataType:'json',
		 data:{'userinfo': JSON.stringify(data),'ChangShangRole':changshangrole},
		 success:function(ret){
			if(ret== 1){
				 window.location.href='loginController.do?login';
			 }else{
				
			 }
		 }
	 });
	
}
var oldAccount = "";
$(function() {
    $("#password").val("");
    $("#load").hide();
    $("#logins").show();
    $("#account").val($.cookie("account"));
    if ($.cookie("rmbUser") == "true") {
        $(".my-toggle-class").show();
        $("#checkbox").attr("checked", true);
        $("#checkbox").parent().addClass("checked");
        $("#password").val($.cookie("drowssap"));
        $("#ispassChang").val("0");
    } else {
        $("#checkbox").parent().removeClass("checked");
        $("#account,#password").each(function(){
    		if($(this).val() == ""){
    			$(this).focus();
    			return false;
    		}
    	});
    }
    $("#checkbox").click(function() {
        save();
    })
    oldAccount = $("#account").val();
});

function save() {
    if ($("#checkbox").prop("checked")) {
        var account = $("#account").val();
        var password =$("#password").val();
    	if($("#ispassChang").val()!=="0"){
    		password=$("#password").val();
    	}
        $.cookie("rmbUser", "true", {
            expires: 7
        });
        $.cookie("account", account, {
            expires: 7
        });
        $.cookie("drowssap", password, {
            expires: 7
        });
        $("#checkbox").parent().addClass("checked")
    } else {
        $.cookie("rmbUser", "false", {
            expire: -1
        });
        $.cookie("account", "", {
            expires: -1
        });
        $.cookie("drowssap", "", {
            expires: -1
        });
        $("#checkbox").parent().removeClass("checked")
    }
};

function login() {
    if (!validate()) {
        return
    }
    save();
    send();
}

function validate() {
    var account = $("#account").val();
    var password = $("#password").val();
    if(!account || !password){
    	$("#tipsmsg").show()
    	$("#tipsmsg").text(isNull);
    	return false;
    }else{
    	$("#tipsmsg").hide()
    }
  
    return true
}

function encodeSTR(str) {
    var t = "";
    for (var x = 0; x < str.length; x++) {
        a = str.charCodeAt(x);
        if (x != 0) {
            t += '|'
        }
        t += new Number(a).toString(10)
    }
    return t
}
/*体验用户登录*/
function iExperience(){
	//设置体验用户账号密码
	$("#account").val("taste");
	$("#password").val("888888");
	
	$("#ispassChang").val("1");
	send();
}