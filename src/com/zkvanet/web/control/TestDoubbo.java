////*********************************************************************
////系统名称：NARI-AUTOPER 
////Copyright(C)2015-2017 NARI Information and Communication Technology 
////Branch. All rights reserved. 
////版本信息：NARI-AUTOPER-V1.0 
////#作者：feng 权重：100% 手机： 
////版本                                         日期                   作者              变更记录 
////NARI-AUTOPER-V1.0  2017-2-18  feng        新建 
////*********************************************************************
//package com.zkvanet.web.control;
//
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.carnet.admin.api.DeviceService;
//import com.carnet.admin.api.DeviceTypeService;
//import com.carnet.admin.api.FooService;
//import com.carnet.admin.api.GpsDeviceService;
//import com.carnet.admin.api.GpsMessageService;
//import com.carnet.admin.api.LoginService;
//import com.carnet.admin.common.ResultDto;
//import com.carnet.admin.dto.DeviceDto;
//import com.carnet.admin.dto.DeviceTypeDto;
//import com.carnet.admin.dto.GpsMessage;
//import com.carnet.admin.dto.GpsWarningDto;
//import com.carnet.admin.dto.UserInfoDto;
//import com.carnet.admin.dto.query.DeviceQueryParms;
//import com.carnet.admin.dto.query.DeviceTypeQueryParms;
//import com.carnet.admin.dto.query.GpsMessageQueryParms;
//import com.carnet.admin.util.DataGridVo;
//
///**
// * TestDoubbo.java
// * 概述：
// * 功能： 
// * 作者： feng
// * 创建时间：2017-2-18
// * 类调用特殊情况：无
// */
//@Controller
//@RequestMapping("/test")
//public class TestDoubbo {
//
//	
//	@Autowired
//	LoginService loginManager;
//	
//	@Autowired
//	DeviceService deviceManager;
//	
//	@Autowired
//	GpsDeviceService gpsDeviceManager;
//	
//	@Autowired
//	GpsMessageService gpsMessageManager;
//	
//	SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	
//	@Autowired
//	private DeviceTypeService deviceTypeManager;
//	@RequestMapping("/login")
//	public String login(Model model,String userid){
////		 FooDto hello = fooServiceImpl.hello();
////		 System.out.println(hello.getName());
////	     ResultDto<UserInfoDto> result=loginManager.login("zhao", "123456");
////	     System.out.println(result.getMessage());
//	     UserInfoDto u=new UserInfoDto();
//	     u.setLoginName("zhang");
//	     u.setPassWord("123456");
//	     ResultDto<GpsMessage> lastMessage=null;
//	     //ResultDto<UserInfoDto> register = loginManager.register(1,u);
//	     try {
//			lastMessage = gpsDeviceManager.getLastMessage("14530002292");
//			GpsMessageQueryParms queryParms=new GpsMessageQueryParms(); 
//			queryParms.setSid("IMIE000002");
//			queryParms.setStart(simpleDateFormat.parse("2017-03-01 02:19:57"));   
//			queryParms.setEnd(simpleDateFormat.parse("2022-04-22 02:23:57"));
//			ResultDto<DataGridVo<GpsWarningDto>> waringHistory = gpsMessageManager.waringHistory(queryParms);
//			System.out.println("test");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	     return null;
//	     
//	}
//	@RequestMapping("/test1")
//	public String test(Model model){
//		
//		DeviceTypeQueryParms  pa=new DeviceTypeQueryParms();
//		ResultDto<DataGridVo<DeviceTypeDto>> list = deviceTypeManager.list(pa);
//		return null;
//		
//	}
//	
////	@RequestMapping("/device")
////	public String device(Model model){
//////	    DeviceDto dev =new DeviceDto();
//////	    dev.setName("设备1");
//////	    dev.setImei("12345");
//////	    dev.setDeviceTypeId(32);
//////	    dev.setDeviceGroupId(12);
//////	    dev.setBelongUserId(1);
//////	    dev.setActivStatus(1);
//////		ResultDto<DeviceDto> insert = deviceManager.insert(dev);
//////		 DeviceDto dev2 =new DeviceDto();
//////	    dev2.setName("设备2");
//////	    dev2.setImei("12345");
//////	    dev2.setDeviceTypeId(32);
//////	    dev2.setDeviceGroupId(12);
//////	    dev2.setBelongUserId(1);
//////	    dev2.setActivStatus(1);
//////	    ResultDto<DeviceDto> insert2 = deviceManager.insert(dev2);
//////		DeviceQueryParms dp=new DeviceQueryParms();
//////		dp.setImei("12345");
//////		ResultDto<DataGridVo<DeviceDto>> list = deviceManager.list(dp);
////		/**
////		 * 查詢設備位置
////		 * 
////		 */
////		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");    
////		GpsMessageQueryParms queryParms=new GpsMessageQueryParms();   
////		queryParms.setSim("14530002292");   
////		ResultDto<GpsMessage> lastMessage = gpsDeviceManager.getLastMessage("14530002292");
////		try {
////			queryParms.setStart(simpleDateFormat.parse("2017-03-01 02:19:57"));   
////			queryParms.setEnd(simpleDateFormat.parse("2017-03-22 02:23:57"));
////		} catch (ParseException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		}  
////		queryParms.setPageCurrent(1);
////		queryParms.setPageSize(30);
////		System.out.println(lastMessage.getData().toString());
////		ResultDto<DataGridVo<GpsMessage>> resultDto=gpsMessageManager.history(queryParms);   
////		System.out.println(resultDto.getData());
////		
////		//deviceManager.listStatusByUid("");
////		
////		return null;
////	}
//}
