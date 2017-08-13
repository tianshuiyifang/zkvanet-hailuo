//*********************************************************************
//系统名称：NARI-AUTOPER 
//Copyright(C)2015-2017 NARI Information and Communication Technology 
//Branch. All rights reserved. 
//版本信息：NARI-AUTOPER-V1.0 
//#作者：feng 权重：100% 手机： 
//版本                                         日期                   作者              变更记录 
//NARI-AUTOPER-V1.0  2017-2-25  feng        新建 
//*********************************************************************
package com.zkvanet.web.control;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carnet.admin.api.DeviceService;
import com.carnet.admin.api.GpsMessageService;
import com.carnet.admin.api.LoginService;
import com.carnet.admin.common.ResultDto;
import com.carnet.admin.common.WarningCode;
import com.carnet.admin.dto.CustomerInfoDto;
import com.carnet.admin.dto.DeviceDto;
import com.carnet.admin.dto.DeviceTypeDto;
import com.carnet.admin.dto.GpsWarningDto;
import com.carnet.admin.dto.UserInfoDto;
import com.carnet.admin.dto.query.DeviceQueryParms;
import com.carnet.admin.dto.query.DeviceTypeQueryParms;
import com.carnet.admin.dto.query.GpsMessageQueryParms;
import com.carnet.admin.util.DataGridVo;
import com.zkvanet.web.model.AjaxResult;
import com.zkvanet.web.model.AlertPojo;

/**
 * CustomControl.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-2-25
 * 类调用特殊情况：无
 */
@Scope("prototype")
@Controller
@RequestMapping("/customControl")
public class CustomControl {

	
	@Autowired
	private LoginService loginManager;
	@Autowired
	GpsMessageService gpsMessageManager;
	@Autowired
	DeviceService deviceManager;
	
	SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@RequestMapping("/alertInfo")
	public @ResponseBody AjaxResult test(Integer searchUserId){
		
		//根据用户ID 查询下级设备的告警信息
		DeviceQueryParms params =new DeviceQueryParms();
		params.setBindUserId(searchUserId);
		List<DeviceDto> ld=new ArrayList<DeviceDto>();
		ResultDto<DataGridVo<DeviceDto>> result=deviceManager.list(params);
		
		for(DeviceDto d:result.getData().getList()){
			ld.add(d);
		}
		
		ResultDto<List<UserInfoDto>> listByParentId = loginManager.listByParentId(searchUserId);
		if(listByParentId.getData()!=null){
			for(UserInfoDto ui:listByParentId.getData()){
				DeviceQueryParms pa =new DeviceQueryParms();
				pa.setBindUserId(ui.getId());
				ResultDto<DataGridVo<DeviceDto>> dl=deviceManager.list(pa);
				for(DeviceDto d:dl.getData().getList()){
					ld.add(d);
				}
			}
		}
		
		
		//查询下级设备 
		
		
		//根据设备遍历告警信息
		AjaxResult<List<AlertPojo>> a=new AjaxResult<List<AlertPojo>>();
		List<AlertPojo> lap=new ArrayList<AlertPojo>();
		
		
		for(DeviceDto dd:ld){
			GpsMessageQueryParms queryParms=new GpsMessageQueryParms(); 
			queryParms.setSid(dd.getImei());
			try {
				queryParms.setStart(simpleDateFormat.parse("2017-03-01 02:19:57"));
				queryParms.setEnd(simpleDateFormat.parse("2022-04-22 02:23:57"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}   
			
			ResultDto<DataGridVo<GpsWarningDto>> waringHistory = gpsMessageManager.waringHistory(queryParms);
			List<GpsWarningDto> list = waringHistory.getData().getList();
			
			for (GpsWarningDto gw:list){
				AlertPojo ap=new AlertPojo();
				ap.setStatusName(WarningCode.getDesc(gw.getCode()));
				ap.setImei(gw.getSid());
				lap.add(ap);
			}
		}
		
		a.setData(lap);
		return a;
		
	}
	
}
