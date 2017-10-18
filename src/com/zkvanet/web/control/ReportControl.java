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
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
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
import com.carnet.admin.dto.VAgencyStatisDto;
import com.carnet.admin.dto.VDeviceStatisDto;
import com.carnet.admin.dto.VOrderStatisDto;
import com.carnet.admin.dto.query.DeviceTypeQueryParms;
import com.carnet.admin.dto.query.GpsMessageQueryParms;
import com.carnet.admin.dto.query.StatisQueryParms;
import com.carnet.admin.util.DataGridVo;
import com.zkvanet.web.model.AjaxResult;
import com.zkvanet.web.model.AlertPojo;
import com.zkvanet.web.model.StaticOrderAlertExtendDto;
import com.zkvanet.web.model.StatisAgencyAlertExtendDto;
import com.zkvanet.web.model.StatisAgencyExtendDto;
import com.zkvanet.web.model.StatisDeviceAlertExtendDto;
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

		List<StatisDeviceExtendDto> l=new ArrayList<StatisDeviceExtendDto>();
				
		ResultDto<DataGridVo<VDeviceStatisDto>> deviceStatis = orderStatisService.deviceStatis(paramStatisQueryParms);
		List<VDeviceStatisDto> la=deviceStatis.getData().getList();
		
		for(VDeviceStatisDto d:la){
			StatisDeviceExtendDto dto=new StatisDeviceExtendDto();
			dto.setDeviceId(d.getDeviceId());
			dto.setPlateNumber(d.getPlateNumber());
			dto.setOrderCount(d.getOrderCount());
			dto.setAvgSpeed(d.getAvgSpeed());
			dto.setTimeoutExcepTimesSum(d.getTimeoutExcepTimesSum());
			dto.setTimeoutExcepDurationSum(d.getTimeoutExcepDurationSum());
			dto.setWeightSum(d.getWeightSum());
			dto.setDuration(d.getDuration());
			dto.setOrderMileage(d.getOrderMileage());
			dto.setImei(d.getImei());
			dto.setAvgDuration(d.getAvgDuration());
			dto.setAvgMileage(d.getAvgMileage());
			l.add(dto);
		}
		
		Workbook hs = ExcelExportUtil.exportExcel(new ExportParams("车辆订单报表("+simpleDateFormat.format(paramStatisQueryParms.getStartTime())+"-"+simpleDateFormat.format(paramStatisQueryParms.getEndTime())+")", "导出人:"
				+ ResourceUtil.getSessionUserName().getRealName(), "导出信息"), StatisDeviceExtendDto.class,
				l);
		ServletOutputStream fo = response.getOutputStream();
		hs.write(fo);
		fo.close();
	}
	
	
	@RequestMapping("/runReport/devexportalert")
	public  void devexportalert(HttpServletResponse response,HttpServletRequest request,StatisQueryParms paramStatisQueryParms) throws IOException{
		
		ResultDto<UserInfoDto> userInfo = loginManager.getUserInfo(paramStatisQueryParms.getChangshangId());
		if(userInfo.getData()==null){
			return ;
		}
		paramStatisQueryParms.setPageSize(1000);
		paramStatisQueryParms.setPageCurrent(1);
		request.setCharacterEncoding("UTF-8");
		response.addHeader("Content-Disposition",
				"attachment;filename=" +userInfo.getData().getLoginName()+"-"+System.currentTimeMillis() + ".xls");

		List<StatisDeviceAlertExtendDto> l=new ArrayList<StatisDeviceAlertExtendDto>();
				
		ResultDto<DataGridVo<VDeviceStatisDto>> deviceStatis = orderStatisService.deviceStatis(paramStatisQueryParms);
		List<VDeviceStatisDto> la=deviceStatis.getData().getList();
		
		for(VDeviceStatisDto d:la){
			StatisDeviceAlertExtendDto dto=new StatisDeviceAlertExtendDto();
			dto.setDeviceId(d.getDeviceId());
			dto.setPlateNumber(d.getPlateNumber());
			dto.setExceptCount(d.getExceptCount());
			dto.setWeightExcepCount(d.getWeightExcepCount()); 
			dto.setTimeoutExcepTimesSum(d.getTimeoutExcepTimesSum());
			dto.setTimeoutExcepDurationSum(d.getTimeoutExcepDurationSum());
			dto.setTimeoutExcepCount(d.getTimeoutExcepCount());
			l.add(dto);
		}
		
		Workbook hs = ExcelExportUtil.exportExcel(new ExportParams("车辆订单报警统计("+simpleDateFormat.format(paramStatisQueryParms.getStartTime())+"-"+simpleDateFormat.format(paramStatisQueryParms.getEndTime())+")", "导出人:"
				+ ResourceUtil.getSessionUserName().getRealName(), "导出信息"), StatisDeviceAlertExtendDto.class,
				l);
		ServletOutputStream fo = response.getOutputStream();
		hs.write(fo);
		fo.close();
	}
	
	@RequestMapping("/runReport/agencyexport")
	public  void agencyexport(HttpServletResponse response,HttpServletRequest request,StatisQueryParms paramStatisQueryParms) throws IOException{
		
		ResultDto<UserInfoDto> userInfo = loginManager.getUserInfo(paramStatisQueryParms.getChangshangId());
		if(userInfo.getData()==null){
			return ;
		}
		
		request.setCharacterEncoding("UTF-8");
		response.addHeader("Content-Disposition",
				"attachment;filename=" +userInfo.getData().getLoginName()+"-"+System.currentTimeMillis() + ".xls");

		List<StatisAgencyExtendDto> l=new ArrayList<StatisAgencyExtendDto>();
				
		ResultDto<DataGridVo<VAgencyStatisDto>> deviceStatis = orderStatisService.agencyStatis(paramStatisQueryParms);
		List<VAgencyStatisDto> la=deviceStatis.getData().getList();
		
		for(VAgencyStatisDto d:la){
			StatisAgencyExtendDto dto=new StatisAgencyExtendDto();
			dto.setAvgSpeed(d.getAvgSpeed());
			dto.setWeightSum(d.getWeightSum());
			dto.setAgencyId(d.getAgencyId());
			dto.setAgencyName(d.getAgencyName());
			dto.setOrderCount(d.getOrderCount());
			dto.setDuration(d.getDuration());
			dto.setOrderMileage(d.getOrderMileage());
			dto.setAvgMileage(d.getAvgMileage());
			dto.setAvgDuration(d.getAvgDuration());
			dto.setChangshangId(d.getChangshangId());
			l.add(dto);
		}
		
		Workbook hs = ExcelExportUtil.exportExcel(new ExportParams("经销商订单统计("+simpleDateFormat.format(paramStatisQueryParms.getStartTime())+"-"+simpleDateFormat.format(paramStatisQueryParms.getEndTime())+")", "导出人:"
				+ ResourceUtil.getSessionUserName().getRealName(), "导出信息"), StatisAgencyExtendDto.class,
				l);
		ServletOutputStream fo = response.getOutputStream();
		hs.write(fo);
		fo.close();
	}
	
	@RequestMapping("/runReport/agencyalertexport")
	public  void agencyalertexport(HttpServletResponse response,HttpServletRequest request,StatisQueryParms paramStatisQueryParms) throws IOException{
		
		ResultDto<UserInfoDto> userInfo = loginManager.getUserInfo(paramStatisQueryParms.getChangshangId());
		if(userInfo.getData()==null){
			return ;
		}
		
		request.setCharacterEncoding("UTF-8");
		response.addHeader("Content-Disposition",
				"attachment;filename=" +userInfo.getData().getLoginName()+"-"+System.currentTimeMillis() + ".xls");

		List<StatisAgencyAlertExtendDto> l=new ArrayList<StatisAgencyAlertExtendDto>();
				
		ResultDto<DataGridVo<VAgencyStatisDto>> deviceStatis = orderStatisService.agencyStatis(paramStatisQueryParms);
		List<VAgencyStatisDto> la=deviceStatis.getData().getList();
		
		for(VAgencyStatisDto d:la){
			StatisAgencyAlertExtendDto dto=new StatisAgencyAlertExtendDto();
			
			dto.setExceptCount(d.getExceptCount());
			dto.setWeightExcepCount(d.getWeightExcepCount());
			dto.setTimeoutExcepCount(d.getTimeoutExcepCount());
			dto.setTimeoutExcepTimesSum(d.getTimeoutExcepTimesSum());
			dto.setTimeoutExcepDurationSum(d.getTimeoutExcepDurationSum()); 
			dto.setAgencyId(d.getAgencyId());
			dto.setAgencyName(d.getAgencyName());
			dto.setOrderWaringCount(d.getOrderWaringCount());
			l.add(dto);
		}
		
		Workbook hs = ExcelExportUtil.exportExcel(new ExportParams("经销商订单报警统计("+simpleDateFormat.format(paramStatisQueryParms.getStartTime())+"-"+simpleDateFormat.format(paramStatisQueryParms.getEndTime())+")", "导出人:"
				+ ResourceUtil.getSessionUserName().getRealName(), "导出信息"), StatisAgencyAlertExtendDto.class,
				l);
		ServletOutputStream fo = response.getOutputStream();
		hs.write(fo);
		fo.close();
	}
	
	@RequestMapping("/runReport/orderexception")
	public  void orderexception(HttpServletResponse response,HttpServletRequest request,StatisQueryParms paramStatisQueryParms) throws IOException, NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		
		ResultDto<UserInfoDto> userInfo = loginManager.getUserInfo(paramStatisQueryParms.getChangshangId());
		if(userInfo.getData()==null){
			return ;
		}
		
		request.setCharacterEncoding("UTF-8");
		response.addHeader("Content-Disposition",
				"attachment;filename=" +userInfo.getData().getLoginName()+"-"+System.currentTimeMillis() + ".xls");

		List<StaticOrderAlertExtendDto> l=new ArrayList<StaticOrderAlertExtendDto>();
				
		ResultDto<DataGridVo<VOrderStatisDto>> deviceStatis = orderStatisService.orderStatis(paramStatisQueryParms);
		List<VOrderStatisDto> la=deviceStatis.getData().getList();
		
		for(VOrderStatisDto d:la){
			StaticOrderAlertExtendDto dto=new StaticOrderAlertExtendDto();
			
			Field[] fields = StaticOrderAlertExtendDto.class.getDeclaredFields();
			
			for(Field f:fields){
				
				Method method = StaticOrderAlertExtendDto.class.getDeclaredMethod("set"+upperCase(f.getName()), f.getType());
				Method vmethod = VOrderStatisDto.class.getDeclaredMethod("get"+upperCase(f.getName()));
				method.invoke(dto,vmethod.invoke(d));
			}
			
			l.add(dto);
		}
		
		Workbook hs = ExcelExportUtil.exportExcel(new ExportParams("订单异常统计("+simpleDateFormat.format(paramStatisQueryParms.getStartTime())+"-"+simpleDateFormat.format(paramStatisQueryParms.getEndTime())+")", "导出人:"
				+ ResourceUtil.getSessionUserName().getRealName(), "导出信息"), StaticOrderAlertExtendDto.class,
				l);
		ServletOutputStream fo = response.getOutputStream();
		hs.write(fo);
		fo.close();
	}
	
	 private String upperCase(String str) {  
		    return str.substring(0, 1).toUpperCase() + str.substring(1);  
		}  
	
	@RequestMapping(value = "/runReport/getList")
	public  @ResponseBody ResultDto<DataGridVo<VDeviceStatisDto>> getAgencyList(StatisQueryParms paramStatisQueryParms) throws IOException{
		
		DecimalFormat df2  = new DecimalFormat("###.00");
		if(paramStatisQueryParms.getChangshangId()==85){
			paramStatisQueryParms.setChangshangId(null);//Admin账户查所有
		}
		ResultDto<DataGridVo<VDeviceStatisDto>> deviceStatis = orderStatisService.deviceStatis(paramStatisQueryParms);
		if(deviceStatis.getData()!=null&&deviceStatis.getData().getList().size()>0){
			List<VDeviceStatisDto> list = deviceStatis.getData().getList();
			for(int i=0;i<list.size();i++){
				
				Double orderMileage = deviceStatis.getData().getList().get(i).getOrderMileage();//#订单总里程（米）
				BigDecimal timeoutExcepDurationSum = deviceStatis.getData().getList().get(i).getTimeoutExcepDurationSum();// #滞留总时长（秒）
				BigDecimal duration = deviceStatis.getData().getList().get(i).getDuration();//#运输总时长（毫秒）
				BigDecimal avgDuration = deviceStatis.getData().getList().get(i).getAvgDuration();//#平均运输时长（毫秒）
				Double avgMileage = deviceStatis.getData().getList().get(i).getAvgMileage();//#平均里程数（米）
				deviceStatis.getData().getList().get(i).setTimeoutExcepDurationSum(timeoutExcepDurationSum.divide(new BigDecimal(3600),2,BigDecimal.ROUND_HALF_EVEN));
				deviceStatis.getData().getList().get(i).setDuration(duration.divide(new BigDecimal(3600000),2,BigDecimal.ROUND_HALF_EVEN));
				deviceStatis.getData().getList().get(i).setAvgDuration(avgDuration.divide(new BigDecimal(3600000),2,BigDecimal.ROUND_HALF_EVEN));
				deviceStatis.getData().getList().get(i).setAvgMileage(new Double(df2.format(avgMileage/1000.0)));
				deviceStatis.getData().getList().get(i).setOrderMileage(new Double(df2.format(orderMileage/1000.0)));
			}
		}
		return deviceStatis;
		
	}
	  
	@RequestMapping(value = "/runReport/getListagency")
	public  @ResponseBody ResultDto<DataGridVo<VAgencyStatisDto>> getListagency(StatisQueryParms paramStatisQueryParms) throws IOException{
		if(paramStatisQueryParms.getChangshangId()==85){
			paramStatisQueryParms.setChangshangId(null);//Admin账户查所有
		}
		DecimalFormat df2  = new DecimalFormat("###.00");
		ResultDto<DataGridVo<VAgencyStatisDto>> deviceStatis = orderStatisService.agencyStatis(paramStatisQueryParms);
		if(deviceStatis.getData()!=null&&deviceStatis.getData().getList().size()>0){
			List<VAgencyStatisDto> list = deviceStatis.getData().getList();
			for(int i=0;i<list.size();i++){
				
				BigDecimal timeoutExcepDurationSum = deviceStatis.getData().getList().get(i).getTimeoutExcepDurationSum();// #滞留总时长（秒）
				BigDecimal duration = deviceStatis.getData().getList().get(i).getDuration();//#运输总时长（毫秒）
				BigDecimal avgDuration = deviceStatis.getData().getList().get(i).getAvgDuration();//#平均运输时长（毫秒）
				Double avgMileage = deviceStatis.getData().getList().get(i).getAvgMileage();//#平均里程数（米）
				deviceStatis.getData().getList().get(i).setTimeoutExcepDurationSum(timeoutExcepDurationSum.divide(new BigDecimal(3600),2,BigDecimal.ROUND_HALF_EVEN));
				deviceStatis.getData().getList().get(i).setDuration(duration.divide(new BigDecimal(3600000),2,BigDecimal.ROUND_HALF_EVEN));
				deviceStatis.getData().getList().get(i).setAvgDuration(avgDuration.divide(new BigDecimal(3600000),2,BigDecimal.ROUND_HALF_EVEN));
				deviceStatis.getData().getList().get(i).setAvgMileage(new Double(df2.format(avgMileage/1000.0)));
			}
			
		}
		
		return deviceStatis;
		
	}
	
	@RequestMapping(value = "/runReport/getListOrder")
	public  @ResponseBody ResultDto<DataGridVo<VOrderStatisDto>> getListOrder(StatisQueryParms paramStatisQueryParms) throws IOException{
		if(paramStatisQueryParms.getChangshangId()==85){
			paramStatisQueryParms.setChangshangId(null);//Admin账户查所有
		}
		DecimalFormat df2  = new DecimalFormat("###.00");
		ResultDto<DataGridVo<VOrderStatisDto>> deviceStatis = orderStatisService.orderStatis(paramStatisQueryParms);
		
		if(deviceStatis.getData()!=null&&deviceStatis.getData().getList().size()>0){
			List<VOrderStatisDto> list = deviceStatis.getData().getList();
			for(int i=0;i<list.size();i++){
				
				BigDecimal timeoutExcepDurationSum = deviceStatis.getData().getList().get(i).getTimeoutExcepDurationSum();// #滞留总时长（秒）
				deviceStatis.getData().getList().get(i).setTimeoutExcepDurationSum(timeoutExcepDurationSum.divide(new BigDecimal(3600),2,BigDecimal.ROUND_HALF_EVEN));
			}
			
		}
		return deviceStatis;
		
	}
}
