package com.zkvanet.web.control;

import com.carnet.admin.api.LoginService;
import com.carnet.admin.api.OrderStatisService;
import com.carnet.admin.common.ResultDto;
import com.carnet.admin.dto.UserInfoDto;
import com.zkvanet.web.model.AjaxResult;
import com.zkvanet.web.util.ResourceUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@Scope("prototype")
@Controller
@RequestMapping("/ishow")
public class IShow {
    @Autowired
    private OrderStatisService orderStatisService;
    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "show")
    public @ResponseBody
    AjaxResult<Map<String, Object>> show(HttpServletRequest request){
        AjaxResult<Map<String, Object>> ar=new AjaxResult<Map<String, Object>>();
        Map<String, Object> map=new HashMap<String,Object>();
        UserInfoDto user = ResourceUtil.getSessionUserName();
        //跑马表数据
        ResultDto<Map<String, String>> resultDto = this.orderStatisService.deviceOrderStatis(user.getId());
        map.put("resultDto",resultDto.getData());
        //订单趋势
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        Date date1 = cal.getTime();
        cal.setTime(date1);
        cal.add(Calendar.DAY_OF_MONTH, -8); //今天的时间加一天
        Date date = cal.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String str=sdf.format(date);
        ResultDto<List<Map<String, String>>> map2=this.orderStatisService.monthOrderStatis(user.getId(),sdf.format(date));
        map.put("map2",map2);
        //设备在线情况和在线车辆数据
        ResultDto<UserInfoDto> rdto=this.loginService.getUserInfo(user.getId());
        map.put("rdto",rdto);
        ar.setCode(0);
        ar.setData(map);
        ar.setOk(true);
        return ar;
    }

}
