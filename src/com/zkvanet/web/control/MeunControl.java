//*********************************************************************
//系统名称：NARI-AUTOPER 
//Copyright(C)2015-2017 NARI Information and Communication Technology 
//Branch. All rights reserved. 
//版本信息：NARI-AUTOPER-V1.0 
//#作者：feng 权重：100% 手机： 
//版本                                         日期                   作者              变更记录 
//NARI-AUTOPER-V1.0  2016-9-18  feng        新建 
//*********************************************************************
package com.zkvanet.web.control;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.carnet.admin.api.DeviceService;
import com.carnet.admin.api.LoginService;
import com.carnet.admin.api.OrderService;
import com.carnet.admin.common.ResultDto;
import com.carnet.admin.dto.DeviceDto;
import com.carnet.admin.dto.OrderDto;
import com.carnet.admin.dto.UserInfoDto;
import com.carnet.admin.dto.query.DeviceQueryParms;
import com.carnet.admin.dto.query.OrderQueryParms;
import com.carnet.admin.util.DataGridVo;
import com.zkvanet.core.util.ContextHolderUtils;
import com.zkvanet.web.util.ResourceUtil;



/**
 * MeunControl.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2016-9-18
 * 类调用特殊情况：无
 */
@Scope("prototype")
@Controller
@RequestMapping("/meunController")
public class MeunControl  {
	
	@Autowired
	private LoginService loginManager;
	
	@Autowired
	DeviceService deviceManager;
	
	@Autowired
	private OrderService orderService;
	/**
	 * 获取中间部分
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getMiddle")
	public ModelAndView getMiddle(HttpServletRequest request) {
		String middleUrl=request.getParameter("url");
		if("index2".endsWith(middleUrl)){
			return new ModelAndView("/index2");
		}else if("customer".endsWith(middleUrl)){
			return new ModelAndView("/customer/customer");
		}
		return new ModelAndView("/login");
	}
	
	@RequestMapping(params = "login")
	public ModelAndView test(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView("/login");
		return mv;
	}
	@RequestMapping(params = "main")
	public ModelAndView main(HttpServletRequest request,ModelMap modelMap) {
		UserInfoDto user = ResourceUtil.getSessionUserName();
		if(user==null){
			return new ModelAndView("/login");
		}
		user=loginManager.getUserInfo(user.getId()).getData();//重新给user赋值
		modelMap.put("userName", user.getLoginName());
		modelMap.put("userId", user.getId());
		modelMap.put("stockCount",user.getStockCount());
		modelMap.put("DeviceCount",user.getDeviceCount());
		modelMap.put("userType",user.getRole().getRoleName());
		modelMap.put("userPhone",user.getMobile());
		modelMap.put("userTypeKey",user.getRole().getRoleKey());
		modelMap.put("OnlineCount",user.getOnlineCount());
		modelMap.put("OfflineCount",user.getOfflineCount());
		modelMap.put("ExpireCount",user.getExpireCount());
		modelMap.put("NearExpireCount",user.getNearExpireCount());
		modelMap.put("UnActivedCount",user.getUnActivedCount());
		modelMap.put("ActivedCount",user.getActivedCount());
		modelMap.put("userTypeKey",user.getRole().getRoleKey());
		return new ModelAndView("/iShow");
	}
	@RequestMapping(params = "index")
	public ModelAndView maintabs(HttpServletRequest request,ModelMap modelMap) {
		UserInfoDto user = ResourceUtil.getSessionUserName();
		if(user==null){
			return new ModelAndView("/login");
		}
		user=loginManager.getUserInfo(user.getId()).getData();//重新给user赋值
		modelMap.put("userName", user.getLoginName());
		modelMap.put("userId", user.getId());
		modelMap.put("userTypeKey",user.getRole().getRoleKey());
		return new ModelAndView("/index");
	}
	@RequestMapping(params = "customer")
	public ModelAndView userlist(HttpServletRequest request) {
		
		return new ModelAndView("/customer/customer");
	}
	
	@RequestMapping(params = "report")
	public ModelAndView toreport(HttpServletRequest request,ModelMap modelMap) {
		UserInfoDto user = ResourceUtil.getSessionUserName();
		if(user==null){
			return new ModelAndView("/login");
		}
		modelMap.put("userName", user.getLoginName());
		modelMap.put("userId", user.getId());
		return new ModelAndView("runReport/toReports");
	}
	@RequestMapping(params = "order")
	public ModelAndView toorder(HttpServletRequest request,ModelMap modelMap) {
		UserInfoDto user = ResourceUtil.getSessionUserName();
		if(user==null){
			return new ModelAndView("/login");
		}
		HttpSession session = ContextHolderUtils.getSession();
	
		modelMap.put("userName", user.getLoginName());
		modelMap.put("userId", user.getId());
		modelMap.put("ChangShangRole",session.getAttribute("ChangShangRole"));
		if(session.getAttribute("ChangShangRole")!=null){
			if("2".equals(session.getAttribute("ChangShangRole").toString())){
				modelMap.put("ChangShangRoleName","-销售部");
			}
			if("3".equals(session.getAttribute("ChangShangRole").toString())){
				modelMap.put("ChangShangRoleName","-市场部");
			}
			if("4".equals(session.getAttribute("ChangShangRole").toString())){
				modelMap.put("ChangShangRoleName","-财务部");
			}
			if("1".equals(session.getAttribute("ChangShangRole").toString())){
				modelMap.put("ChangShangRoleName","-管理员");
			}
		}
		
		return new ModelAndView("order/toOrders");
	}
	
	@RequestMapping(params = "orderext")
	public ModelAndView toorderext(HttpServletRequest request,ModelMap modelMap) {
		UserInfoDto user = ResourceUtil.getSessionUserName();
		if(user==null){
			return new ModelAndView("/login");
		}
		modelMap.put("userName", user.getLoginName());
		modelMap.put("userId", user.getId());
		HttpSession session = ContextHolderUtils.getSession();
		modelMap.put("ChangShangRole",session.getAttribute("ChangShangRole"));
		return new ModelAndView("order/toOrdersExtends");
	}
	
	@RequestMapping(params = "setUp")
	public ModelAndView toSetUp(HttpServletRequest request,ModelMap modelMap) {
		UserInfoDto user = ResourceUtil.getSessionUserName();
		if(user==null){
			return new ModelAndView("/login");
		}
		modelMap.put("userName", user.getLoginName());
		modelMap.put("userId", user.getId());
		return new ModelAndView("setup/toSetUp");
	}
	@RequestMapping(params = "landMarkMap")
	public ModelAndView landMarkMap(HttpServletRequest request,ModelMap modelMap) {
		UserInfoDto user = ResourceUtil.getSessionUserName();
		if(user==null){
			return new ModelAndView("/login");
		}
		modelMap.put("userName", user.getLoginName());
		modelMap.put("userId", user.getId());
		return new ModelAndView("geozone/landMarkMap");
	}
	@RequestMapping(params = "businessLog")
	public ModelAndView toBusinessLog(HttpServletRequest request,ModelMap modelMap) {
		UserInfoDto user = ResourceUtil.getSessionUserName();
		if(user==null){
			return new ModelAndView("/login");
		}
		modelMap.put("userName", user.getLoginName());
		modelMap.put("userId", user.getId());
		return new ModelAndView("businessLogs/BusinessLog");
	}
	@RequestMapping(params = "template")
	public ModelAndView toTemplate(HttpServletRequest request,ModelMap modelMap) {
		UserInfoDto user = ResourceUtil.getSessionUserName();
		if(user==null){
			return new ModelAndView("/login");
		}
		modelMap.put("userName", user.getLoginName());
		modelMap.put("userId", user.getId());
		return new ModelAndView("customer/template");
	}

	@RequestMapping(params = "search")
	public ModelAndView search(HttpServletRequest request,ModelMap modelMap) {
		UserInfoDto user = ResourceUtil.getSessionUserName();
		if(user==null){
			return new ModelAndView("/login");
		}
		user=loginManager.getUserInfo(user.getId()).getData();
		modelMap.put("userType", user.getRole().getRoleKey());
		modelMap.put("userName", user.getLoginName());
		modelMap.put("userId", user.getId());
		return new ModelAndView("customer/toSearch");
	}
	@RequestMapping(params = "device")
	public ModelAndView device(HttpServletRequest request,ModelMap modelMap) {
		UserInfoDto user = ResourceUtil.getSessionUserName();
		if(user==null){
			return new ModelAndView("/login");
		}
		modelMap.put("userName", user.getLoginName());
		modelMap.put("userId", user.getId());
		return new ModelAndView("device/toDevices");
	}
	@RequestMapping(value="/trackreplay")
	public ModelAndView track(HttpServletRequest request,ModelMap modelMap) {
		UserInfoDto user = ResourceUtil.getSessionUserName();
		String imei = request.getParameter("imei");
		 DeviceQueryParms params =new DeviceQueryParms();
		 params.setImei(imei);
		 ResultDto<DataGridVo<DeviceDto>> list2 = deviceManager.list(params);
		 String devicename="";
		 if(list2.getData()!=null&&list2.getData().getList().size()>0){
			 devicename=list2.getData().getList().get(0).getName();
		 }
		if(user==null){
			return new ModelAndView(new RedirectView(
					"../../loginController.do?login"));
		}
		modelMap.put("userName", user.getLoginName());
		modelMap.put("userId", user.getId());
		modelMap.put("devicename", devicename);
		return new ModelAndView("trackreplay/track");
	}
	@RequestMapping(value="/ordertrackreplay")
	public ModelAndView ordertrackreplay(HttpServletRequest request,ModelMap modelMap) {
		UserInfoDto user = ResourceUtil.getSessionUserName();
		String imei = request.getParameter("imei");
		String createtime = request.getParameter("createtime");
		 DeviceQueryParms params =new DeviceQueryParms();
		 params.setImei(imei);
		 ResultDto<DataGridVo<DeviceDto>> list2 = deviceManager.list(params);
		 String devicename="";
		 Integer deviceId=0;
		 if(list2.getData()!=null&&list2.getData().getList().size()>0){
			 devicename=list2.getData().getList().get(0).getName();
			 deviceId=list2.getData().getList().get(0).getId();
		 }
		String endtime = request.getParameter("endtime");
		if(user==null){
			return new ModelAndView(new RedirectView(
							"loginController.do?login"));
		}
		if(endtime!=null){
			modelMap.put("createtime", stampToDate(createtime));
			modelMap.put("endtime", stampToDate(endtime));
		}else{
			modelMap.put("createtime", createtime);
		}
		//订单详情
		  OrderQueryParms orderParam=new OrderQueryParms();
		  orderParam.setDeviceId(deviceId);
		  ResultDto<DataGridVo<OrderDto>> queryOrder = orderService.queryOrder(orderParam);
		  List<OrderDto> orderlist=new ArrayList<OrderDto>();
		  if(queryOrder.getData()!=null){
			  
			  orderlist = queryOrder.getData().getList();
		  }
		  OrderDto ordershow=new OrderDto();
		  if(orderlist.size()>0){
			  ordershow=orderlist.get(0);
		  }
		modelMap.put("ordershow", ordershow);
		modelMap.put("devicename", devicename);
		System.out.println("开始时间"+createtime);
		modelMap.put("userName", user.getLoginName());
		modelMap.put("userId", user.getId());
		return new ModelAndView("trackreplay/ordertrack");
	}
	@RequestMapping("/trackreset")
	public ModelAndView trackrest(HttpServletRequest request,ModelMap modelMap) {
		UserInfoDto user = ResourceUtil.getSessionUserName();
		String imei = request.getParameter("imei");
		if(user==null){
			return new ModelAndView("/login");
		}
		modelMap.put("userName", user.getLoginName());
		modelMap.put("userId", user.getId());
		return new ModelAndView("trackpreset/track");
	}
	@RequestMapping(params = "devlist",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody JSONObject list(HttpServletRequest request) {
	
		JSONObject r=new JSONObject();
		JSONObject re=new JSONObject();
		JSONArray ja=new JSONArray();
		for(int a=0;a<3;a++){
		JSONObject j=new JSONObject();
		j.put("account", "yanshi");
		j.put("activationTime", "2016-08-18 17:00:30");
		j.put("creationDate", "2016-08-09 09:24:50");
		j.put("devName", a);
		j.put("deviceAlias", "GT710");
		j.put("deviceName", "设备"+a);
		j.put("driverName", "1");
		j.put("email", "ahzk@ah-zk.com");
		j.put("enabledFlag", 1);
		j.put("expiration", "2036-08-18 17:00:30");
		j.put("fullParent", "1);12871);13366);12876);12997);16303);");
		j.put("id", "fce51ab9c4a242eb8a2f26dfba3eadbe");
		j.put("imei", "868120143074430");
		j.put("language", "zh");
		j.put("mcType", "GT710");
		j.put("mcTypeUseScope", "personal");
		j.put("online", 0);
		j.put("orgId", "6c5bee52126f4072a91a3179b0a0f3ba");
		j.put("orgName", "默认组"+a);
		j.put("relationId", "e4acebaa716c41398f5adc1831326892");
		j.put("updationDate", "2016-08-18 17:22:08");
		j.put("userExpiration", "2036-08-18 17:00:30");
		j.put("userExpirationStr", "2036-08-18");
		j.put("userId", "16341");
		j.put("userName", "演示账户");
		j.put("vehicleIcon", "automobile");
		j.put("vehicleNumber", "1");
		ja.add(j);
		}
		r.put("result", ja);
		r.put("currentPage", "1");
		r.put("endRow", "10");
		r.put("pageSize", "10");
		r.put("startRow", "0");
		r.put("totalPage", "1");
		r.put("totalRecord", "3");
		re.put("data", r);
		re.put("code", "0");
		re.put("ok", "true");
		
		return re;
	}
	
	public static String stampToDate(String s){
        String res;
        if(s==""){
        	return "";
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        long lt = new Long(s);
        Date date = new Date(lt);
        res = simpleDateFormat.format(date);
        return res;
    }
	public static final  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	public static void main(String[] args) throws ParseException {
		String ss="12345533";
		JSONObject js=new JSONObject();
		js.put("aa", "12");
		js.put("bb", "34");
		 long lt = new Long("1500962880000");
		 Date date = new Date(lt);
		System.out.println(sdf.format(date));
//		System.out.println((Serializable)ss);
//		System.out.println((Serializable)js.toString());
	}
}
