//页面高度自适应
(function($){
  var ul = $(".user-list"),
  u_st = $(".user-list .side-subtitle"),
  u_btn = $(".js-toggle-tree-btn"),
  u_ob = $(".user-list .overflow-box"),
  u_cb = $(".user-list .content-box"),
  u_ts = $(".user-list .tree-search"),
  u_ds = $(".user-list .default-scrollbar"),
  d_l = $(".drag-line"),
  vl = $(".vehicles-list"),
  v_st = $(".vehicles-list .side-subtitle"),
  v_btn = $(".js-toggle-accordion-btn"),
  v_ob = $(".vehicles-list .overflow-box"),
  v_cb = $(".vehicles-list .content-box"),
  v_ts = $(".vehicles-list .vehicles-input-group"),
  v_tab = $(".vehicles-list .js-device-status-tab"),
  v_tool = $(".vehicles-list .toolsbar"),
  v_ds = $(".vehicles-list .default-scrollbar");

  if(parentFlag == 'false'){
    u_btn.hide(),v_btn.hide(),d_l.hide();
    u_ob.css("height",0);
  }

  var a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,z,tree_h,vehicles_h,user_ob_h,vehicles_ob_h,map_h,treeDefaultHeight;

  //获取窗口高度
  function winSize(){
    a = $(window).height();
  }
  winSize();

  //左侧用户树默认高度
  function sideTreeDefaultHeight(){
    if(parentFlag == 'false'){
      treeDefaultHeight = 0;
    }else{
      if($(window).height()<=500){
        treeDefaultHeight = 80;
      }else if($(window).height()<=700){
        treeDefaultHeight = 150;
      }else{
        treeDefaultHeight = 200;
      }
    }
  }
  sideTreeDefaultHeight();

  //左侧用户、设备容器默认高度设置
  function leftSideHeight(){
    b = $(".header").outerHeight();
    c = $(".menu-seach").outerHeight();
    z = $(".footer").outerHeight();
    d = u_st.outerHeight();
    e = u_cb.outerHeight() - u_cb.height();
    f = u_ts.outerHeight(true);
    g = d_l.outerHeight(true);
    h = v_st.outerHeight(true);
    i = v_cb.outerHeight() - v_cb.height();
    j = v_ts.outerHeight();
    k = v_tab.outerHeight(true);
    l = v_tool.outerHeight();

    vtResize();

    //左侧客户树滚动条
    u_ds.css("height",treeDefaultHeight);

    //左侧设备树滚动条
    v_ds.css("height",vehicles_h);

  }
  leftSideHeight();


  //设备&树高度计算
  function vtResize(){
    if(parentFlag == 'false'){
      vehicles_h = a - b - c - z - d - h - i - j - k - l;
      tree_h = 0;
    }else{
      vehicles_h = a - b - c - z - d - e - treeDefaultHeight - f - g - h - i - j - k - l;
      tree_h = a - b - c - z - d - e - f - g - h - i - j -k - l - vehicles_h;
    }
  }

  //侧栏高度计算
  function sideResize(){
    m = u_ds.outerHeight();
    n = v_ds.outerHeight();

    if(m>0){
      var v_h = vl.outerHeight();
      var new_us_h = a - b - c - z - d - e - f - g - v_h;
      u_ds.css("height",new_us_h);
      u_ob.css("height",new_us_h + e + f);
    }else if(n>0){
      var u_h = ul.outerHeight();
      if(parentFlag == 'false'){
        var new_vs_h = a - b - c - z - h - i -j  - k - l - u_h;
      }else{
        var new_vs_h = a - b - c - z - g - h - i -j  - k - l - u_h;
      }
      v_ds.css("height",new_vs_h);
      v_ob.css("height",new_vs_h + i + j + k + l);
    }
  }

  //地图自动高度
  function mapAutoHeight() {
    o = $(".breadcrumb-func").outerHeight();
    map_h =  a - b - c - z - o;
    $("#allmap").css("height",map_h);
  }
  mapAutoHeight();

  //窗口变化宽度高度同步
  $(window).resize(function(){
    winSize();
    sideTreeDefaultHeight();
    sideResize();
    mapAutoHeight();
    vtResize();
    u_ob.css("height",user_ob_h);
    v_ob.css("height",vehicles_ob_h);
  });


  var btn_expansion_html = ''+$.i18n.prop("comm.Expansion")+'&nbsp;<i class="fa fa-angle-double-down"></i>';
  var btn_expansion_html2 = ''+$.i18n.prop("comm.Expansion")+'&nbsp;<i class="fa fa-angle-double-up"></i>';
  var btn_collapse_html = ''+$.i18n.prop("comm.Collapse")+'&nbsp;<i class="fa fa-angle-double-up"></i>';
  var btn_collapse_html2 = ''+$.i18n.prop("comm.Collapse")+'&nbsp;<i class="fa fa-angle-double-down"></i>';
  var btn_expansion_text = $.i18n.prop("comm.Expansion");
  var btn_collapse_text = $.i18n.prop("comm.Collapse");


  //客户树展开收起
  u_btn.click(function(){
    var u_ob_h = u_ob.outerHeight();
    var v_ob_h = v_ob.outerHeight();
    var v_ds_h = v_ds.outerHeight();

    if($(this).children("i").hasClass("fa-angle-double-up")){

      $(this).html(btn_expansion_html).attr("title",btn_expansion_text);
      v_btn.html(btn_collapse_html2).attr("title",btn_collapse_text);

      u_ob.css("height",0);
      u_ds.css("height",0);

      v_ds.css({"height":v_ds_h + (v_ob_h ==0 ? u_ob_h - (i + j + k +l) : u_ob_h) });
      v_ob.css("height",v_ob_h + u_ob_h);

    }else{

      $(this).html(btn_collapse_html).attr("title",btn_collapse_text);
      u_ob.css("height",treeDefaultHeight + e + f);
      u_ds.css("height",treeDefaultHeight);

      v_ds.css({"height":v_ds_h - (treeDefaultHeight + e + f)});
      v_ob.css("height",v_ob_h - (treeDefaultHeight + e + f));

    }
  });

  //设备树展开收起
  v_btn.click(function(){
    var u_ob_h = u_ob.outerHeight();
    var v_ob_h = v_ob.outerHeight();
    var u_ds_h = u_ds.outerHeight();

    if($(this).children("i").hasClass("fa-angle-double-down")){
      v_ds.css("height",0);
      v_ob.css("height",0);

      $(this).html(btn_expansion_html2).attr("title",btn_expansion_text);
      u_btn.html(btn_collapse_html).attr("title",btn_collapse_text);

      u_ds.css({"height": u_ds_h + (u_ob_h ==0 ? v_ob_h - (e + f) : v_ob_h) })
      u_ob.css("height",u_ob_h + v_ob_h);

    }else{

      $(this).html(btn_collapse_html2).attr("title",btn_collapse_text);

      v_ob.css("height",vehicles_h + i + j + k +l);
      v_ds.css("height",vehicles_h);

      u_ds.css({"height":treeDefaultHeight});
      u_ob.css("height",treeDefaultHeight+ e + f);
    }
  });

    var u_space_h = u_ob.outerHeight() - u_ds.outerHeight();
    var v_space_h = v_ob.outerHeight() - v_ds.outerHeight();
    d_l.mousedown(function(event) {
      $("body").addClass("us-n");
      var event = event || window.event;
      var start_y = event.pageY;
      var u_over_h = u_ob.outerHeight();
      var v_over_h = v_ob.outerHeight();
      var start_t_h = u_ds.outerHeight();
      var start_v_h = v_ds.outerHeight();

      $(document).bind("mousemove",function(event) {
        var event = event || window.event;
        var move_y = event.pageY;
        var move_h = move_y - start_y;

        if(u_over_h + move_h>=0 && v_over_h - move_h>=0){

          u_ob.css({"height":u_over_h + move_h});
          v_ob.css({"height":v_over_h - move_h});

          if(start_t_h + move_h>=0 && start_v_h - move_h>=0){

            if(u_over_h + move_h>u_space_h && u_over_h < u_space_h){
              u_ds.css("height",start_t_h + move_h + u_over_h - u_space_h);
            }else{
              u_ds.css("height",start_t_h + move_h);
            }

            if(v_over_h < v_space_h){
              v_ds.css("height",(move_h - v_over_h + v_space_h)*-1);
            }else{
              v_ds.css("height",start_v_h - move_h);
            }

          }else{

              if(u_over_h<u_space_h){
                u_ds.css("height",start_t_h + move_h - (u_over_h==0? u_space_h : u_space_h - u_over_h) );
              }else{
                u_ds.css("height",start_t_h + move_h);
              }
              if(v_over_h<v_space_h){
                v_ds.css("height",start_v_h - move_h - (v_over_h==0? v_space_h : v_space_h-v_over_h));
              }else{
                v_ds.css("height",start_v_h - move_h);
              }

          }

        }

        if(u_ob.height() ==0){
          u_btn.html(btn_expansion_html).attr("title",btn_expansion_text);
        }else{
          u_btn.html(btn_collapse_html).attr("title",btn_collapse_text);
        }
        if(v_ob.height() ==0){
          v_btn.html(btn_expansion_html2).attr("title",btn_expansion_text);
        }else{
          v_btn.html(btn_collapse_html2).attr("title",btn_collapse_text);
        }

      }).mouseup(function(event) {
        $(this).unbind("mousemove");
        $("body").removeClass("us-n");
      });
    });
})(jQuery);