function tabs(tabTit,on,tabCon,callback){
    var $this = $(tabTit).children().eq(0);
	$(tabCon).each(function(){
	  $(this).children().eq(0).show();
	  });
	$(tabTit).each(function(){
	  $(this).children().eq(0).addClass(on);
	  });
    $(tabTit).children().click(function(){
        var $this = $(this);
        $(this).addClass(on).siblings().removeClass(on);
         var index = $(tabTit).children().index(this);
         $(tabCon).children().eq(index).show().siblings().hide();

        if(callback && typeof(callback) === "function"){
             callback($this);
         }
     });
    if(callback && typeof(callback) === "function"){
        callback($this);
    }

}