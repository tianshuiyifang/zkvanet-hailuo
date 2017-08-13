//窗口定位
function funcBoxPosition(obj,box_id){
  var doc_w = $(document).width();//页面宽度
  var doc_h = $(document).height();//页面高度
  var scl_t = $(document).scrollTop();//竖向滚动条位置
  var scl_l = $(document).scrollLeft();//横向滚动条位置
  var box_w = $("#"+box_id).outerWidth();//列表菜单宽度
  var box_h = $("#"+box_id).outerHeight();//列表菜单高度
  var this_w = $(obj).outerWidth(); //被点击的元素宽度
  var this_h = $(obj).outerHeight(); //被点击的元素高度
  var set_t = $(obj).offset().top; //被点击的元素离原点的高度
  var set_l = $(obj).offset().left;//被点击的元素离原点的长度
  var set_w = set_l + this_w + box_w; //
  var set_h = set_t + this_h + box_h;
  var pos_t;
  var pos_l;

  //如果当前的位置坐标大于浏览器窗口的高度，功能框在上面，否则默认在下面
  if(set_h>doc_h){
    pos_t = set_t + this_h - box_h;
  }else{
    pos_t = set_t;
  }
  //如果当前的位置坐标大于浏览器窗口的宽度，功能框在右边，否则默认在左边
  if(set_w>doc_w){
    pos_l = set_l  - box_w;
  }else{
    pos_l = set_l + this_w;
  }


  //给窗口设置top和left值
  $("#"+box_id).css({
    top:pos_t - scl_t,
    left:pos_l - scl_l
  });


  //窗口拖动小于当前的位置时隐藏功能框
  $(window).resize(function(){
    if(set_t<=doc_h || set_l<=doc_w){
      $("#"+box_id).hide();
    }

  }).scroll(function(){
    $("#"+box_id).css({
      top:pos_t  - $(window).scrollTop(),
      left:pos_l  - $(window).scrollLeft()
    });
  });

}

//创建功能窗口
function createFuncBox(obj_id,obj,html){

  if(obj_id!=undefined && obj_id!=""){ //如果点击的元素未定义ID或者ID为空则不创建

    if($("#funcBox-"+obj_id).length==0){ //如果页面没有功能框就创建
      $("body").append(html);//创建功能框并添加到body节点下
      $("#funcBox-"+obj_id+" .func-list li a").click(function(){
       
        $("#funcBox-"+obj_id).hide();
      });

      //给文档绑定点击事件，如果没有点击在元素或功能框上，功能框隐藏
      $(document).bind("click",function(e){
        var target = $(e.target);
        if(target.closest("[data-id="+obj_id +"]").length == 0 && target.closest("#funcBox-"+obj_id).length == 0){
          $("#funcBox-"+obj_id).remove();//hide(); 可以设置隐藏或销毁

        }
      });
    }else{
      if($("#funcBox-"+obj_id).is(":hidden")){ //如果已经有功能框而且是隐藏的，重新计算样式并显示
        funcBoxPosition($(obj),"funcBox-"+obj_id);
        $("#funcBox-"+obj_id).show();
      }
    }/*已销毁 */
  }

}

//客户管理弹出设备更新窗口
function toUpdateDevice(imei,userId)
{	
	complex_buildDeviceInfoForm("customer",imei,"editDevice");
}











