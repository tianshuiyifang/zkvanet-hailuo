//*********************************************************************
//系统名称：NARI-AUTOPER 
//Copyright(C)2015-2017 NARI Information and Communication Technology 
//Branch. All rights reserved. 
//版本信息：NARI-AUTOPER-V1.0 
//#作者：feng 权重：100% 手机： 
//版本                                         日期                   作者              变更记录 
//NARI-AUTOPER-V1.0  2017-2-21  feng        新建 
//*********************************************************************
package com.zkvanet.web.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.jeecgframework.poi.excel.ExcelExportUtil;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.carnet.admin.api.DeviceService;
import com.carnet.admin.api.DeviceTypeService;
import com.carnet.admin.api.GpsIssusdService;
import com.carnet.admin.api.LoginService;
import com.carnet.admin.common.ResultDto;
import com.carnet.admin.dto.CustomerInfoDto;
import com.carnet.admin.dto.DeviceDto;
import com.carnet.admin.dto.DeviceTypeDto;
import com.carnet.admin.dto.GpsIssusdDto;
import com.carnet.admin.dto.UserInfoDto;
import com.carnet.admin.dto.query.DeviceQueryParms;
import com.carnet.admin.dto.query.DeviceTypeQueryParms;
import com.carnet.admin.util.DataGridVo;
import com.zkvanet.web.model.AjaxResult;
import com.zkvanet.web.model.DevCustomInfoPojo;
import com.zkvanet.web.model.DataGridResult;
import com.zkvanet.web.model.DeviceListPojo;
import com.zkvanet.web.util.DateUtils;
import com.zkvanet.web.util.ResourceUtil;

/**
 * DeviceControl.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-2-21
 * 类调用特殊情况：无
 */
@Scope("prototype")
@Controller
@RequestMapping("/deviceControl")
public class DeviceControl {
	
	@Autowired
	DeviceService deviceManager;
	@Autowired
	private LoginService loginManager;
	@Autowired
	private DeviceTypeService deviceTypeManager;
	@Autowired
	private GpsIssusdService gpsIssusdService;
	
	private static final Logger logger = Logger.getLogger(DeviceControl.class);
	
	public static final  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	//查询列表,根据用户ID 查询设备列表
	@RequestMapping(value = "list")
	public @ResponseBody AjaxResult<DataGridResult<DeviceListPojo>> list(HttpServletRequest request,DeviceQueryParms params){
		
		
		
		ResultDto<DataGridVo<DeviceDto>> result=deviceManager.list(params);
		//dubbo取出的数据进行转换
		List<DeviceDto> list = result.getData().getList();
	
		 //下级单位车辆信息 集团用户不查
//		  if(85!=params.getBelongUserId()){
//			  ResultDto<List<UserInfoDto>> childUser = loginManager.listByParentId(params.getBelongUserId());
//			  if(childUser.getData()!=null&&childUser.getData().size()>0){
//				  for(UserInfoDto ud:childUser.getData()){
//					  DeviceQueryParms childparam =new DeviceQueryParms();
//					  childparam.setActivStatus(1);
//					  childparam.setBelongUserId(ud.getId());
//					  childparam.setPageSize(50); //最多查50辆车
//					  ResultDto<DataGridVo<DeviceDto>> childdev = deviceManager.list(childparam);
//					  if(childdev.getData()!=null&&childdev.getData().getList().size()>0){
//						  list.addAll(childdev.getData().getList());
//					  }
//				  }
//			  }
//		  }
		
		List<DeviceListPojo> li=new ArrayList<DeviceListPojo>();	
		for(DeviceDto dd:list){
			ResultDto<CustomerInfoDto> customerInfo = deviceManager.getCustomerInfo(dd.getId());
			String sn="";
			if(customerInfo.getStatusCode()==0&&customerInfo.getData()!=null){
				//包含客户信息需要提取
				sn=customerInfo.getData().getSn();
			}
			DeviceListPojo dp=new DeviceListPojo();
			dp.setId(dd.getId().toString());
			dp.setAccount(loginManager.getUserInfo(dd.getBelongUserId()).getData().getLoginName());
			dp.setDevName(dd.getName());
			dp.setDeviceName(dd.getName());
			dp.setImei(dd.getImei());
			dp.setSn(sn);
			dp.setSim(dd.getSim());
			if(dd.getActivTime()!=null){
				dp.setActivationTime(sdf.format(dd.getActivTime()));
			}
			if(dd.getPlatformEndDate()!=null){
				dp.setUserExpiration(sdf.format(dd.getPlatformEndDate()));
			}
			dp.setUserExpirationStr("正常使用");
			
			dp.setMcType((String) getType(dd.getDeviceTypeId()));
			li.add(dp);
		}
		DataGridResult<DeviceListPojo> dg=new DataGridResult<DeviceListPojo>();
		dg.setCurrentPage(result.getData().getPageCurrent());
		dg.setEndRow(result.getData().getTotal());
		dg.setPageSize(result.getData().getPageSize());
		dg.setTotalPage(result.getData().getTotalRow()%result.getData().getPageSize()+1);
		dg.setTotalRecord(result.getData().getTotalRow());
		dg.setStartRow(result.getData().getTotalRow()%result.getData().getPageSize()-1);
		dg.setResult(li);
		AjaxResult<DataGridResult<DeviceListPojo>> res =new AjaxResult<DataGridResult<DeviceListPojo>>();
		res.setData(dg);
		return res;
		
	}
	/**
	 * 获取设备详细信息
	 */
	@RequestMapping(value = "detail")
	public @ResponseBody AjaxResult<DevCustomInfoPojo> detail(HttpServletRequest request,String devId){
		AjaxResult<DevCustomInfoPojo> res=new AjaxResult<DevCustomInfoPojo>();
		DevCustomInfoPojo dp=new DevCustomInfoPojo();
		DeviceQueryParms param=new DeviceQueryParms();
		if(devId!=null){
			param.setId(Integer.parseInt(devId));
			ResultDto<DataGridVo<DeviceDto>> result=deviceManager.list(param);
			DeviceDto dd = result.getData().getList().get(0);
			dp.setId(dd.getId().toString());
			dp.setAccount(loginManager.getUserInfo(dd.getBelongUserId()).getData().getLoginName());
			dp.setDevName(dd.getName());
			dp.setDeviceName(dd.getName());
			dp.setImei(dd.getImei());
			dp.setSim(dd.getSim());
			dp.setUserId(dd.getBelongUserId().toString());
			if(dd.getActivTime()!=null){
				dp.setActivationTime(sdf.format(dd.getActivTime()));
			}
			if(dd.getPlatformEndDate()!=null){
				dp.setUserExpiration(sdf.format(dd.getPlatformEndDate()));
			}
			dp.setUserExpirationStr("正常使用");
			String mctype=(String) getType(dd.getDeviceTypeId());
			dp.setMcType(mctype);
			
			//客户信息
			
			ResultDto<CustomerInfoDto> customerInfo = deviceManager.getCustomerInfo(Integer.parseInt(devId));
            CustomerInfoDto cip=customerInfo.getData();
            if(cip!=null){
            	dp.setDriverName(cip.getDriverName());
            	dp.setUserExpiration(DateUtils.date2Str(cip.getUserExpiration(), DateUtils.date_sdf));
            	dp.setDriverPhone(cip.getDriverPhone());
            	dp.setVehicleNumber(cip.getVehicleNumber());
            	dp.setIdCard(cip.getIdCard());
            	dp.setSn(cip.getSn());
            	dp.setCarFrame(cip.getCarFrame());
            	dp.setEngineNumber(cip.getEngineNumber());
            	dp.setInstallPosition(cip.getInstallPosition());
            	dp.setInstallPersonnel(cip.getInstallPersonnel());
            	dp.setInstallCompany(cip.getInstallCompany());
            	dp.setInstallAddress(cip.getInstallAddress());
            	dp.setInstallTime(DateUtils.date2Str(cip.getInstallTime(), DateUtils.date_sdf));
            	
            }
			
			
			res.setData(dp);
			res.setCode(0);
			res.setMsg("获取设备详情成功");
			res.setOk(true);
		}else{
			res.setCode(1);
			res.setOk(false);
		}
		return res;
	}
	 
	
	 /**
     * 添加设备
	 * @throws ParseException 
     * 
     */
    @RequestMapping(value = "insert")
    public @ResponseBody  ResultDto<DeviceDto> insert(HttpServletRequest request,DeviceListPojo dev,String devuserId,DevCustomInfoPojo cip){
    	
    	  
    	  DeviceDto devdto=new DeviceDto();
    	  if(dev.getId()!=null){//更新设备
    		  devdto.setName(dev.getDeviceName());
        	  devdto.setImei(dev.getImei());
        	  devdto.setSim(dev.getSim());
        	  devdto.setCreateTime(new Date());
        	 
	  		  //获取设备类型
	  		  Object mctype = getType(dev.getMcType());
	  	     
        	  devdto.setDeviceTypeId((Integer)mctype);
        	  devdto.setDeviceGroupId(10);
        	  devdto.setActivTime(str2Date(dev.getActivTime(),sdf));
        	  devdto.setPlatformEndDate(str2Date(dev.getPlatformEndDate(),sdf));
        	  devdto.setRemark(dev.getReMark());
        	  if(dev.getActivTime()!=null){ //如果有激活时间 设备状态表明已激活
        		  devdto.setActivStatus(1);  
        	  }
        	  if(dev.getUserId()!=null){
        		  devdto.setBelongUserId(Integer.parseInt(dev.getUserId()));
        	  }
			  ResultDto<DeviceDto>	result = deviceManager.update(Integer.parseInt(dev.getId()),devdto);
			  //同时添加客户信息
			  CustomerInfoDto cid=new CustomerInfoDto();
			  cid.setDeviceId(Integer.parseInt(dev.getId()));
			  cid.setDriverName(cip.getDriverName());
			  cid.setUserExpiration(DateUtils.str2Date(cip.getUserExpiration(), DateUtils.date_sdf));
			  cid.setDriverPhone(cip.getDriverPhone());
			  cid.setVehicleNumber(cip.getVehicleNumber());
			  cid.setIdCard(cip.getIdCard());
			  cid.setSn(cip.getSn());
			  cid.setCarFrame(cip.getCarFrame());
			  cid.setEngineNumber(cip.getEngineNumber());
			  cid.setInstallPosition(cip.getInstallPosition());
			  cid.setInstallPersonnel(cip.getInstallPersonnel());
			  cid.setInstallCompany(cip.getInstallCompany());
			  cid.setInstallAddress(cip.getInstallAddress());
			  cid.setInstallTime(DateUtils.str2Date(cip.getInstallTime(), DateUtils.date_sdf));
			  
			  ResultDto rescus = deviceManager.updateCustomerInfo(Integer.parseInt(dev.getId()),cid);
        	  if(rescus.getStatusCode()!=0){
        		  result.setMessage("更新客戶信息失敗");
        	  }
			  
			  return result;
    	  }
    	  devdto.setName(dev.getDeviceName());
    	  devdto.setBelongUserId(Integer.parseInt(devuserId));
    	  devdto.setImei(dev.getImei());
    	  devdto.setSim(dev.getSim());
    	  devdto.setCreateTime(new Date());
    	  devdto.setDeviceTypeId(Integer.parseInt(dev.getMcType()));
    	  devdto.setDeviceGroupId(10);
    	  devdto.setActivTime(str2Date(dev.getActivTime(),sdf));
    	  devdto.setPlatformEndDate(str2Date(dev.getPlatformEndDate(),sdf));
    	  devdto.setRemark(dev.getReMark());
    	  devdto.setActivStatus(0);
    	  ResultDto<DeviceDto> result=deviceManager.insert(devdto);
    	  return result;
    }
    
    @Transactional
    private ResultDto<DeviceDto> insertDev(Integer devuserId,DevCustomInfoPojo cip){
    	ResultDto<DeviceDto> re=new ResultDto<DeviceDto>();
    	 DeviceDto devdto=new DeviceDto();
    	 
    	 
    	 //导入设备初始化校验
    	  if(cip.getMcType()==null){
    		 re.setStatusCode(1);
 			 re.setMessage("导入失败，设备类型不能为空");
 			 return re;
    	  }else if("".equals(getType(cip.getMcType()))){   //这个判断可以修改为新增设备类型
    		 re.setStatusCode(1);
  			 re.setMessage("导入失败，设备类型和数据库不能匹配");
  			 return re;
    	  }
	      if(cip.getDevName()==null||"".equals(cip.getDevName())){ //名称未填的情况下用型号+imei后六位作为名称
	    		 if(cip.getImei()!=null&&cip.getMcType()!=null){
	    			 devdto.setName(cip.getMcType()+"-"+cip.getImei().substring(cip.getImei().length()-6, cip.getImei().length()));
	    		 }else{
	    			 re.setStatusCode(1);
	    			 re.setMessage("导入失败，名称不能为空");
	    			 return re;
	    		 }
	    		 
	      }else{
	    	  devdto.setName(cip.getDevName());
	      }
	   	  devdto.setBelongUserId(devuserId);
	   	  devdto.setImei(cip.getImei());
	   	  devdto.setSim(cip.getSim());
	   	  devdto.setCreateTime(new Date());
	   	  //devdto.setDeviceTypeId(cip.getMcType()==null?1:Integer.parseInt(cip.getMcType()));
	   	  devdto.setDeviceTypeId(Integer.parseInt(getType(cip.getMcType()).toString()));
	   	  devdto.setDeviceGroupId(10);
	   	  devdto.setActivTime(str2Date(cip.getActivTime(),sdf));
	   	  devdto.setPlatformEndDate(str2Date(cip.getPlatformEndDate(),sdf));
	   	  devdto.setRemark(cip.getReMark());
	   	  devdto.setActivStatus(0);
    	
	     ResultDto<DeviceDto> result=deviceManager.insert(devdto); //新增设备 根据设备ID再新增客户
	     logger.info(devdto.getImei()+"--->"+result.getMessage());
	     if(result.getData()!=null){
	    	   CustomerInfoDto cid=new CustomerInfoDto();
			  cid.setDeviceId(result.getData().getId());
			  cid.setDriverName(cip.getDriverName());
			  cid.setUserExpiration(DateUtils.str2Date(cip.getUserExpiration(), DateUtils.date_sdf));
			  cid.setDriverPhone(cip.getDriverPhone());
			  cid.setVehicleNumber(cip.getVehicleNumber());
			  cid.setIdCard(cip.getIdCard());
			  cid.setSn(cip.getSn());
			  cid.setCarFrame(cip.getCarFrame());
			  cid.setEngineNumber(cip.getEngineNumber());
			  cid.setInstallPosition(cip.getInstallPosition());
			  cid.setInstallPersonnel(cip.getInstallPersonnel());
			  cid.setInstallCompany(cip.getInstallCompany());
			  cid.setInstallAddress(cip.getInstallAddress());
			  cid.setInstallTime(DateUtils.str2Date(cip.getInstallTime(), DateUtils.date_sdf));
			  
			  ResultDto rescus = deviceManager.updateCustomerInfo(result.getData().getId(),cid);
	    		
	    	  if(rescus.getStatusCode()==0){
	    		 
	    		 re.setStatusCode(0);
	    	 }
	     
	     }
	    	
    	
        return re;
    	
    	
    	
    }
    /**
     * 1新增设备型号
     * 2查询设备型号 根据ID查询设备对应型号 根据型号查询对应ID
     * 设备型号转换
     * @return 
     */
    public  Object getType(Object param){
    	DeviceTypeQueryParms  pa=new DeviceTypeQueryParms();
    	ResultDto<DataGridVo<DeviceTypeDto>> list = deviceTypeManager.list(pa);
    	if(list.getData()!=null){
    		List<DeviceTypeDto> dts = list.getData().getList();
    		if(param instanceof Integer){
        		return dts.get((Integer)param).getName();
        	}else{
        		for(int i=0;i<dts.size();i++){
        			if(param.equals(dts.get(i).getName())){
        				
        				return i;
        			}
        		}
        	}
    	}
    	return "";
    }
    
    /**
     * 获取设备类型
     * 
     */
    @RequestMapping(value = "getDevMcType")
    public @ResponseBody  AjaxResult<List<Map<String,String>>> getDevMcType(HttpServletRequest request){
    	
          AjaxResult<List<Map<String,String>>>  result=new  AjaxResult<List<Map<String,String>>>();
          List<Map<String,String>> li=new ArrayList<Map<String,String>>();
         
	      DeviceTypeQueryParms  pa=new DeviceTypeQueryParms();
	      ResultDto<DataGridVo<DeviceTypeDto>> list = deviceTypeManager.list(pa);
	      if(list.getData()!=null){
	    		List<DeviceTypeDto> dts = list.getData().getList();
	    		
        		for(int i=0;i<dts.size();i++){
        			Map<String,String> map=new HashMap<String, String>();
        			map.put("key", ""+i+"");
        			map.put("title", dts.get(i).getName());
        			li.add(map);
        		}
	        	
	    	}
	      
	      result.setData(li);
    	  return result;
    }
    
    /**
     * 获取设备类型
     * 
     */
    @RequestMapping(value = "getdevList")
    public @ResponseBody  AjaxResult<List<Map<String,String>>> getdevList(Integer userId){
    	
          AjaxResult<List<Map<String,String>>>  result=new  AjaxResult<List<Map<String,String>>>();
          List<Map<String,String>> li=new ArrayList<Map<String,String>>();
          DeviceQueryParms param=new DeviceQueryParms();
          param.setBelongUserId(userId);
          param.setPageSize(500);//最多列表查500条记录
          ResultDto<DataGridVo<DeviceDto>> list = deviceManager.list(param);
	      if(list.getData()!=null&&list.getData().getList()!=null&&list.getData().getList().size()>0){
	    		List<DeviceDto> dts = list.getData().getList();
	    		
        		for(int i=0;i<dts.size();i++){
        			Map<String,String> map=new HashMap<String, String>();
        			map.put("key", ""+dts.get(i).getImei()+"");
        			map.put("title", dts.get(i).getName());
        			li.add(map);
        		}
	        	
	    	}
	      
	      result.setData(li);
    	  return result;
    }
    
    /**
     * 发送命令
     */
    @RequestMapping(value = "sendorder")
    public @ResponseBody  ResultDto<Integer> sendorder(String imei,Integer userId,String order){
    	  ResultDto<Integer> re=new ResultDto<Integer>();
    	  int send = gpsIssusdService.send(imei, userId, order.getBytes());
    	  re.setStatusCode(send);
    	  return re;
    }
    
    @RequestMapping(value = "queryOrder")
    public @ResponseBody  ResultDto<List<GpsIssusdDto>> queryOrder(String imei,Integer userId){
    	  ResultDto<List<GpsIssusdDto>> re=new ResultDto<List<GpsIssusdDto>>();
    	  List<GpsIssusdDto> queryResult = gpsIssusdService.queryResult(imei, userId);
    	  if(queryResult.size()>0){
    		  re.setStatusCode(1);
    		  re.setData(queryResult);
    	  }else{
    		  re.setStatusCode(0);
    	  }
    	  return re;
    }
    /**
     * 删除设备
     * 
     */
    @RequestMapping(value = "delete")
    public @ResponseBody  ResultDto<Integer> delete(HttpServletRequest request,String id){
    	  
    	  ResultDto<Integer> result=deviceManager.delete(Integer.parseInt(id));
    	  return result;
    }
    
    @RequestMapping(value = "getUserAndDevNum")
    public @ResponseBody  AjaxResult<Map<String,Object>> getUserAndDevNum(HttpServletRequest request,String userId){
    	AjaxResult<Map<String,Object>> res =new AjaxResult<Map<String,Object>>();
    	ResultDto<UserInfoDto> userInfo=null;
    	if(userId!=null){
    		
    		userInfo = loginManager.getUserInfo(Integer.parseInt(userId));
    	}
    	Map<String,Object> map=new HashMap<String, Object>();
    	
    	Integer  aboutToExpire=0;
    	Integer  expired=0;
    	Integer  onLineNum=0;
    	Integer  active=0;
    	Integer  noactive=0;
    	Integer  offLineNum=0;
    	
//    	 if(!"ADMIN".equals(userInfo.getData().getRole().getRoleKey())){
//			  ResultDto<List<UserInfoDto>> childUser = loginManager.listByParentId(userInfo.getData().getId());
//			  if(childUser.getData()!=null&&childUser.getData().size()>0){
//				  //下级用户的统计数据
//				  for(UserInfoDto ud:childUser.getData()){
//					  ud = loginManager.getUserInfo(ud.getId()).getData();
//					  aboutToExpire+=ud.getNearExpireCount();
//					  expired+=ud.getExpireCount();
//					  onLineNum+=ud.getOnlineCount();
//					  active+=ud.getActivedCount();
//					  noactive+=ud.getUnActivedCount();
//					  offLineNum+=ud.getOfflineCount();
//				  }
//			  }
//		  }
    	
    	if(userInfo!=null&&userInfo.getData()!=null){
    		map.put("aboutToExpire",userInfo.getData().getNearExpireCount()+aboutToExpire);
			map.put("userNum",userInfo.getData().getDeviceCount()); 
			map.put("expired",userInfo.getData().getExpireCount()+expired);  
			map.put("stock",userInfo.getData().getStockCount());
			map.put("onLineNum",userInfo.getData().getOnlineCount()+onLineNum); 
			map.put("active",userInfo.getData().getActivedCount()+active);
			map.put("noactive",userInfo.getData().getUnActivedCount()+noactive);
			map.put("offLineNum",userInfo.getData().getOfflineCount()+offLineNum);
			map.put("receiving",userInfo.getData().getDeviceCount());
    		
    	}
    	res.setData(map);
    	res.setCode(0);
    	res.setOk(true);
    	return res;
    }
    /**
     * 导入excel
     * 
     */
    @RequestMapping(value = "batchUpdate")
    public   ModelAndView batchUpdate(HttpServletRequest request, HttpServletResponse response){
    	  UserInfoDto user = ResourceUtil.getSessionUserName(); //获取登陆用户信息 导入设备只能属于当前用户
    	  ResultDto<Integer>  r=new ResultDto<Integer>();
    	  MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
  		  Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
	  	  List<DevCustomInfoPojo> allRecords = new ArrayList<DevCustomInfoPojo>();
			
	  		
	  		
	  		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet())
			{
				MultipartFile file = entity.getValue();// 获取上传文件对象
				
			
				ImportParams params = new ImportParams();
				params.setTitleRows(0);
				params.setHeadRows(1);
				params.setNeedSave(true);
				try
				{
					
					List<DevCustomInfoPojo> list = ExcelImportUtil.importExcel(file.getInputStream(),
							DevCustomInfoPojo.class, params);
					allRecords.addAll(list);
				}
				catch (Exception e)
				{
					logger.error("文件导入失败："+e);
				}
				finally
				{
					try
					{
						file.getInputStream().close();
					}
					catch (IOException e)
					{
						logger.error("流关闭失败");
						e.printStackTrace();
					}
				}
			}
	  		//循环为excel赋值，新增设备
	  		for(DevCustomInfoPojo dci:allRecords){
	  			
	  			ResultDto<DeviceDto> insertDev = insertDev(user.getId(),dci);
	  			if(insertDev.getStatusCode()==0){
	  				r.setStatusCode(0);
	  				r.setMessage("导入成功");
	  				logger.info("导入成功");
	  			}
	  		}
	  	 ModelAndView modelAndView = new ModelAndView(new RedirectView("/zkvanet/meunController.do?search"));
    	 return modelAndView;
    }
    /**
     * 根据imei查询设备 用于设备销售查询
     */
    @RequestMapping(value = "putDevice")
    public @ResponseBody  AjaxResult<Map> putDevice(HttpServletRequest request,String imeis){
    	  
    	  AjaxResult<Map> aj=new AjaxResult<Map>();
    	  DeviceQueryParms qp=new DeviceQueryParms();
    	  qp.setImei(imeis);
    	  ResultDto<DataGridVo<DeviceDto>> result=deviceManager.list(qp);
    	  if(result.getData()!=null){
    		  List<DeviceDto> ld = result.getData().getList();
    		  Map map=new HashMap<String, Object>();
    		  List<DeviceListPojo> li=new ArrayList<DeviceListPojo>();
    		  for(DeviceDto dd:ld){
    			  DeviceListPojo dp =new DeviceListPojo();
    			  dp.setDeviceName(dd.getName());
    			  dp.setUserId(dd.getBelongUserId().toString());
    			  dp.setImei(dd.getImei());
    			  dp.setId(dd.getId().toString());
    			  //根据id查询用户名称
    			  dp.setUserName(loginManager.getUserInfo(dd.getBelongUserId()).getData().getLoginName());
    			  dp.setMcType((String) getType(dd.getDeviceTypeId()));
    			  li.add(dp);
    		  }
    		  map.put("failCount", 0);
			  map.put("failImeisList", "");
			  map.put("succCount", 1);
			  map.put("succDeviceList", li);
    		  aj.setData(map);
    		  aj.setCode(0);
    		  aj.setOk(true);
    	  }
    	  
    	  
    	  return aj;
    }
    
    /**
     * 
     * 设备销售
     */
    
    @RequestMapping(value = "fastSale")
    public @ResponseBody  ResultDto fastSale(HttpServletRequest request,String imeis,String userId){
    
    	ResultDto sell = null;
    	DeviceQueryParms qp=new DeviceQueryParms();
	   	qp.setImei(imeis);
	   	ResultDto<DataGridVo<DeviceDto>> result=deviceManager.list(qp);
	   	if(result.getStatusCode()!=0){
	   		sell.setStatusCode(1);
	   		sell.setMessage("根据IMEIS无法查到对应设备 请确认数据是否正确");
	   		return sell;
	   	}
	   	DeviceDto deviceDto = result.getData().getList().get(0);
	   	Integer belongU=deviceDto.getBelongUserId();
	   	
	  //ResultDto<DeviceDto> update = deviceManager.update(deviceDto.getId(), deviceDto);
	   	
	   	sell = deviceManager.sell(deviceDto.getId(),belongU, Integer.parseInt(userId));
	   	if(sell.getStatusCode()==1){
	   		sell.setMessage("销售失败");
	   	}
    	return sell;
    }
    
    
	/**
	 * 保存并关联用户
	 * click树节点的时候保存临时数据传入新增客户弹出框
	 */
    
    /**
	 * 字符串转换成日期
	 * @param str
	 * @param sdf
	 * @return
	 */
	public static Date str2Date(String str, SimpleDateFormat sdf) {
		if (null == str || "".equals(str)) {
			return null;
		}
		Date date = null;
		try {
			date = sdf.parse(str);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) {
//	     String da="2017-01-02";
//	     Date ss=str2Date(da,sdf);
//	     
//	     System.out.println(ss);
		//去摸
		int a=11;
		int b=10;
		
		System.out.println(a%b);
   	}
}
