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

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.jeecgframework.poi.excel.ExcelExportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carnet.admin.api.AgencyAreaService;
import com.carnet.admin.api.AgencyRailService;
import com.carnet.admin.api.AgencyService;
import com.carnet.admin.api.GpsMessageService;
import com.carnet.admin.api.LoginService;
import com.carnet.admin.api.OrderStatisService;
import com.carnet.admin.common.ResultDto;
import com.carnet.admin.common.WarningCode;
import com.carnet.admin.dto.AgencyAreaDto;
import com.carnet.admin.dto.AgencyDto;
import com.carnet.admin.dto.AgencyRailDto;
import com.carnet.admin.dto.DeviceStatisDto;
import com.carnet.admin.dto.DeviceTypeDto;
import com.carnet.admin.dto.GpsWarningDto;
import com.carnet.admin.dto.UserInfoDto;
import com.carnet.admin.dto.query.DeviceTypeQueryParms;
import com.carnet.admin.dto.query.GpsMessageQueryParms;
import com.carnet.admin.dto.query.StatisQueryParms;
import com.carnet.admin.util.DataGridVo;
import com.zkvanet.web.model.AjaxResult;
import com.zkvanet.web.model.AlertPojo;
import com.zkvanet.web.model.StatisDeviceExtendDto;
import com.zkvanet.web.util.ResourceUtil;

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
@RequestMapping("/geozoneControl")
public class GeozoneControl {

	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    dateFormat.setLenient(false);
	    webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	

	@Autowired
	private AgencyService agencyService;
	
	@Autowired
	private AgencyAreaService agencyAreaService;
	
	@Autowired
	private AgencyRailService agencyRailManager;
	
	
	SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	
	
	@RequestMapping(value = "/geozone/addgeozone")
	public  @ResponseBody ResultDto addgeozone(String agencyId,String... geom) throws IOException{
		AgencyRailDto  agencyRailDto =new AgencyRailDto();
		ResultDto<Integer> resultDto =null;
		for(int i=0;i<geom.length;i++){
			agencyRailDto.setRailData(geom[i]);
			resultDto=	agencyRailManager.add(Integer.parseInt(agencyId),agencyRailDto);
		}
		return resultDto;
		
	}
	@RequestMapping(value = "/geozone/delgeozone")
	public  @ResponseBody ResultDto delgeozone(Integer id) throws IOException{
		ResultDto<Integer> delete = agencyRailManager.delete(id);
		return delete;
		
	}
	
	@RequestMapping(value = "areainsert")
	public  @ResponseBody ResultDto<Integer> insert(Integer changshagnUserId,AgencyAreaDto agencyDto) throws IOException{
		ResultDto<Integer> insert = agencyAreaService.insert(changshagnUserId, agencyDto);
		return insert;
		
	}
	@RequestMapping(value = "areadelete")
	public  @ResponseBody ResultDto<Integer> delete(Integer areaId) throws IOException{
		ResultDto<Integer> delete = agencyAreaService.delete(areaId);
		return delete;
		
	}
	
	@RequestMapping(value = "arealist")
	public  @ResponseBody ResultDto<List<AgencyAreaDto>> list(Integer id) throws IOException{
		ResultDto<List<AgencyAreaDto>> list = agencyAreaService.listByChangshangid(id);
		return list;
		
	}
	@RequestMapping(value = "areaupdate")
	public  @ResponseBody ResultDto<Integer> update(Integer areaId, AgencyAreaDto agencyAreaDto) throws IOException{
		ResultDto<Integer> list = agencyAreaService.update(areaId,agencyAreaDto);
		return list;
		
	}
}
