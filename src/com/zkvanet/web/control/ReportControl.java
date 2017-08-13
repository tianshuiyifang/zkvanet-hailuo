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
import java.text.DecimalFormat;
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

import com.carnet.admin.api.GpsMessageService;
import com.carnet.admin.api.LoginService;
import com.carnet.admin.api.OrderStatisService;
import com.carnet.admin.common.ResultDto;
import com.carnet.admin.common.WarningCode;
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
import com.zkvanet.web.model.DeviceStatisExtendDto;
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
@RequestMapping("/reportControl")
public class ReportControl {

	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    dateFormat.setLenient(false);
	    webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@Autowired
	private OrderStatisService orderStatisService;
	
	@Autowired
	private LoginService loginManager;
	
	
	SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@RequestMapping("/runReport/export")
	public  void export(HttpServletResponse response,HttpServletRequest request,StatisQueryParms paramStatisQueryParms) throws IOException{
		
		ResultDto<UserInfoDto> userInfo = loginManager.getUserInfo(paramStatisQueryParms.getChangshangId());
		if(userInfo.getData()==null){
			return ;
		}
		
		request.setCharacterEncoding("UTF-8");
		response.addHeader("Content-Disposition",
				"attachment;filename=" +userInfo.getData().getLoginName()+"-"+System.currentTimeMillis() + ".xls");

		List<DeviceStatisExtendDto> l=new ArrayList<DeviceStatisExtendDto>();
				
		ResultDto<DataGridVo<DeviceStatisDto>> deviceStatis = orderStatisService.deviceStatis(paramStatisQueryParms);
		List<DeviceStatisDto> la=deviceStatis.getData().getList();
		
		for(DeviceStatisDto d:la){
			DeviceStatisExtendDto dto=new DeviceStatisExtendDto();
			dto.setDeviceId(d.getDeviceId());
			dto.setDuration(d.getDuration()/3600);
			dto.setOrderCount(d.getOrderCount());
			dto.setOrderMileage(d.getOrderMileage()/1000.0);
			dto.setOrderWaringCount(d.getOrderWaringCount());
			dto.setWeightSum(d.getWeightSum());
			dto.setYunshuchehao(d.getYunshuchehao());
			l.add(dto);
		}
		
		Workbook hs = ExcelExportUtil.exportExcel(new ExportParams("订单报表("+simpleDateFormat.format(paramStatisQueryParms.getStartTime())+"-"+simpleDateFormat.format(paramStatisQueryParms.getEndTime())+")", "导出人:"
				+ ResourceUtil.getSessionUserName().getRealName(), "导出信息"), DeviceStatisExtendDto.class,
				l);
		ServletOutputStream fo = response.getOutputStream();
		hs.write(fo);
		fo.close();
	}
	
	@RequestMapping(value = "/runReport/getList")
	public  @ResponseBody ResultDto<DataGridVo<DeviceStatisDto>> getList(StatisQueryParms paramStatisQueryParms) throws IOException{
		
		DecimalFormat df2  = new DecimalFormat("###.00");
		ResultDto<DataGridVo<DeviceStatisDto>> deviceStatis = orderStatisService.deviceStatis(paramStatisQueryParms);
		if(deviceStatis.getData()!=null&&deviceStatis.getData().getList().size()>0){
			List<DeviceStatisDto> list = deviceStatis.getData().getList();
			for(int i=0;i<list.size();i++){
				
				Long duration = deviceStatis.getData().getList().get(i).getDuration();
				
				deviceStatis.getData().getList().get(i).setDuration(duration/3600);
				
				Double orderMileage = deviceStatis.getData().getList().get(i).getOrderMileage();
				
				deviceStatis.getData().getList().get(i).setOrderMileage(new Double(df2.format(orderMileage/1000.0)));
			}
		}
		
		
		return deviceStatis;
		
	}
	
}
