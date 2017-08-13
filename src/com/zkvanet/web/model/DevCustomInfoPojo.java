//*********************************************************************
//系统名称：NARI-AUTOPER 
//Copyright(C)2015-2017 NARI Information and Communication Technology 
//Branch. All rights reserved. 
//版本信息：NARI-AUTOPER-V1.0 
//#作者：feng 权重：100% 手机： 
//版本                                         日期                   作者              变更记录 
//NARI-AUTOPER-V1.0  2017-3-24  feng        新建 
//*********************************************************************
package com.zkvanet.web.model;

import java.util.List;

import org.jeecgframework.poi.excel.annotation.Excel;

/**
 * CustomInfoPojo.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-3-24
 * 类调用特殊情况：无
 */
public class DevCustomInfoPojo extends DeviceListPojo{
	  @Excel(name = "司机名称", orderNum = "8", needMerge = true)  
	  private String driverName;
	  private String userExpiration;
	  @Excel(name = "电话", orderNum = "9", needMerge = true)  
	  private String driverPhone;
	  private String vehicleNumber;
	  @Excel(name = "身份证号", orderNum = "10", needMerge = true)  
	  private String idCard;
	  private String sn;
	  @Excel(name = "车架号", orderNum = "7", needMerge = true)  
	  private String carFrame;
	  @Excel(name = "电机发动机号", orderNum = "11", needMerge = true)  
	  private String engineNumber;
	  @Excel(name = "安装地址", orderNum = "17", needMerge = true)  
	  private String installPosition;
	  @Excel(name = "安装人员", orderNum = "13", needMerge = true)  
	  private String installPersonnel;
	  @Excel(name = "安装公司", orderNum = "14", needMerge = true)  
	  private String installCompany;
	  @Excel(name = "安装地址", orderNum = "15", needMerge = true)  
	  private String installAddress;
	  @Excel(name = "安装时间", orderNum = "16", needMerge = true)  
	  private String installTime;
	  private List<String> installPicList;
	  
	  
		public String getDriverName() {
			return driverName;
		}
		public void setDriverName(String driverName) {
			this.driverName = driverName;
		}
		public String getUserExpiration() {
			return userExpiration;
		}
		public void setUserExpiration(String userExpiration) {
			this.userExpiration = userExpiration;
		}
		public String getDriverPhone() {
			return driverPhone;
		}
		public void setDriverPhone(String driverPhone) {
			this.driverPhone = driverPhone;
		}
		public String getVehicleNumber() {
			return vehicleNumber;
		}
		public void setVehicleNumber(String vehicleNumber) {
			this.vehicleNumber = vehicleNumber;
		}
		public String getIdCard() {
			return idCard;
		}
		public void setIdCard(String idCard) {
			this.idCard = idCard;
		}
		public String getSn() {
			return sn;
		}
		public void setSn(String sn) {
			this.sn = sn;
		}
		public String getCarFrame() {
			return carFrame;
		}
		public void setCarFrame(String carFrame) {
			this.carFrame = carFrame;
		}
		public String getEngineNumber() {
			return engineNumber;
		}
		public void setEngineNumber(String engineNumber) {
			this.engineNumber = engineNumber;
		}
		public String getInstallPosition() {
			return installPosition;
		}
		public void setInstallPosition(String installPosition) {
			this.installPosition = installPosition;
		}
		public String getInstallPersonnel() {
			return installPersonnel;
		}
		public void setInstallPersonnel(String installPersonnel) {
			this.installPersonnel = installPersonnel;
		}
		public String getInstallCompany() {
			return installCompany;
		}
		public void setInstallCompany(String installCompany) {
			this.installCompany = installCompany;
		}
		public String getInstallAddress() {
			return installAddress;
		}
		public void setInstallAddress(String installAddress) {
			this.installAddress = installAddress;
		}
		public String getInstallTime() {
			return installTime;
		}
		public void setInstallTime(String installTime) {
			this.installTime = installTime;
		}
		public List<String> getInstallPicList() {
			return installPicList;
		}
		public void setInstallPicList(List<String> installPicList) {
			this.installPicList = installPicList;
		}

}
