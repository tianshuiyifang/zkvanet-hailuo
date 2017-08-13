//*********************************************************************
//系统名称：NARI-AUTOPER 
//Copyright(C)2015-2017 NARI Information and Communication Technology 
//Branch. All rights reserved. 
//版本信息：NARI-AUTOPER-V1.0 
//#作者：feng 权重：100% 手机： 
//版本                                         日期                   作者              变更记录 
//NARI-AUTOPER-V1.0  2017-2-26  feng        新建 
//*********************************************************************
package com.zkvanet.web.model;

import java.util.Date;

import org.jeecgframework.poi.excel.annotation.Excel;

/**
 * DeviceListPojo.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-2-26
 * 类调用特殊情况：无
 */
public class DeviceListPojo {
	 
	       
            private String account  ;         
			private String activationTime  ;   
			private String carFrame        ;   
			private String creationDate    ;   
			@Excel(name = "设备名称", orderNum = "2", needMerge = true)
			private String devName         ;   
			private String deviceAlias     ;   
			private String deviceName      ;   
			private String driverName      ;   
			private String driverPhone     ;   
			private String email           ;   
			private Integer enabledFlag =1    ;  
			private String engineNumber    ;   
			private String expiration      ;   
			private String fullParent      ;   
			private String id              ;   
			private String idCard          ;
			@Excel(name = "IMEI", orderNum = "1", needMerge = true)  
			private String imei            ;   
			private String installAddress  ;   
			private String installCompany  ;   
			private String installImage    ;   
			private String installPersonnel;   
			private String installPosition ;   
			private String language   ="zh"     ;
			@Excel(name = "设备型号", orderNum = "3", needMerge = true)   
			private String mcType          ;   
			private String mcTypeUseScope  ;   
			private Integer online   = 0      ;   
			private String orgId           ;   
			private String orgName   ="默认组"     ;   
			private String parentId        ;   
			@Excel(name = "备注", orderNum = "12", needMerge = true)  
			private String reMark          ;   
			private String relationId      ;   
			@Excel(name = "SIM卡号", orderNum = "4", needMerge = true)  
			private String sim             ;   
			@Excel(name = "SN", orderNum = "5", needMerge = true)  
			private String sn              ;   
			private String updationDate    ;   
			private String userExpiration  ;   
			private String userExpirationStr;   
			private String userId          ;   
			private String userName        ;   
			private String vehicleIcon     ;  
			@Excel(name = "车牌号", orderNum = "6", needMerge = true)  
			private String vehicleNumber   ;
			private String	activTime;
			private String platformEndDate;
			
			
			public String getActivTime() {
				return activTime;
			}
			public void setActivTime(String activTime) {
				this.activTime = activTime;
			}
			public String getPlatformEndDate() {
				return platformEndDate;
			}
			public void setPlatformEndDate(String platformEndDate) {
				this.platformEndDate = platformEndDate;
			}
			public String getAccount() {
				return account;
			}
			public void setAccount(String account) {
				this.account = account;
			}
			public String getActivationTime() {
				return activationTime;
			}
			public void setActivationTime(String activationTime) {
				this.activationTime = activationTime;
			}
			public String getCarFrame() {
				return carFrame;
			}
			public void setCarFrame(String carFrame) {
				this.carFrame = carFrame;
			}
			public String getCreationDate() {
				return creationDate;
			}
			public void setCreationDate(String creationDate) {
				this.creationDate = creationDate;
			}
			public String getDevName() {
				return devName;
			}
			public void setDevName(String devName) {
				this.devName = devName;
			}
			public String getDeviceAlias() {
				return deviceAlias;
			}
			public void setDeviceAlias(String deviceAlias) {
				this.deviceAlias = deviceAlias;
			}
			public String getDeviceName() {
				return deviceName;
			}
			public void setDeviceName(String deviceName) {
				this.deviceName = deviceName;
			}
			public String getDriverName() {
				return driverName;
			}
			public void setDriverName(String driverName) {
				this.driverName = driverName;
			}
			public String getDriverPhone() {
				return driverPhone;
			}
			public void setDriverPhone(String driverPhone) {
				this.driverPhone = driverPhone;
			}
			public String getEmail() {
				return email;
			}
			public void setEmail(String email) {
				this.email = email;
			}
			public Integer getEnabledFlag() {
				return enabledFlag;
			}
			public void setEnabledFlag(Integer enabledFlag) {
				this.enabledFlag = enabledFlag;
			}
			public String getEngineNumber() {
				return engineNumber;
			}
			public void setEngineNumber(String engineNumber) {
				this.engineNumber = engineNumber;
			}
			public String getExpiration() {
				return expiration;
			}
			public void setExpiration(String expiration) {
				this.expiration = expiration;
			}
			public String getFullParent() {
				return fullParent;
			}
			public void setFullParent(String fullParent) {
				this.fullParent = fullParent;
			}
			public String getId() {
				return id;
			}
			public void setId(String id) {
				this.id = id;
			}
			public String getIdCard() {
				return idCard;
			}
			public void setIdCard(String idCard) {
				this.idCard = idCard;
			}
			public String getImei() {
				return imei;
			}
			public void setImei(String imei) {
				this.imei = imei;
			}
			public String getInstallAddress() {
				return installAddress;
			}
			public void setInstallAddress(String installAddress) {
				this.installAddress = installAddress;
			}
			public String getInstallCompany() {
				return installCompany;
			}
			public void setInstallCompany(String installCompany) {
				this.installCompany = installCompany;
			}
			public String getInstallImage() {
				return installImage;
			}
			public void setInstallImage(String installImage) {
				this.installImage = installImage;
			}
			public String getInstallPersonnel() {
				return installPersonnel;
			}
			public void setInstallPersonnel(String installPersonnel) {
				this.installPersonnel = installPersonnel;
			}
			public String getInstallPosition() {
				return installPosition;
			}
			public void setInstallPosition(String installPosition) {
				this.installPosition = installPosition;
			}
			public String getLanguage() {
				return language;
			}
			public void setLanguage(String language) {
				this.language = language;
			}
			public String getMcType() {
				return mcType;
			}
			public void setMcType(String mcType) {
				this.mcType = mcType;
			}
			public String getMcTypeUseScope() {
				return mcTypeUseScope;
			}
			public void setMcTypeUseScope(String mcTypeUseScope) {
				this.mcTypeUseScope = mcTypeUseScope;
			}
			public Integer getOnline() {
				return online;
			}
			public void setOnline(Integer online) {
				this.online = online;
			}
			public String getOrgId() {
				return orgId;
			}
			public void setOrgId(String orgId) {
				this.orgId = orgId;
			}
			public String getOrgName() {
				return orgName;
			}
			public void setOrgName(String orgName) {
				this.orgName = orgName;
			}
			public String getParentId() {
				return parentId;
			}
			public void setParentId(String parentId) {
				this.parentId = parentId;
			}
			public String getReMark() {
				return reMark;
			}
			public void setReMark(String reMark) {
				this.reMark = reMark;
			}
			public String getRelationId() {
				return relationId;
			}
			public void setRelationId(String relationId) {
				this.relationId = relationId;
			}
			public String getSim() {
				return sim;
			}
			public void setSim(String sim) {
				this.sim = sim;
			}
			public String getSn() {
				return sn;
			}
			public void setSn(String sn) {
				this.sn = sn;
			}
			public String getUpdationDate() {
				return updationDate;
			}
			public void setUpdationDate(String updationDate) {
				this.updationDate = updationDate;
			}
			public String getUserExpiration() {
				return userExpiration;
			}
			public void setUserExpiration(String userExpiration) {
				this.userExpiration = userExpiration;
			}
			public String getUserExpirationStr() {
				return userExpirationStr;
			}
			public void setUserExpirationStr(String userExpirationStr) {
				this.userExpirationStr = userExpirationStr;
			}
			public String getUserId() {
				return userId;
			}
			public void setUserId(String userId) {
				this.userId = userId;
			}
			public String getUserName() {
				return userName;
			}
			public void setUserName(String userName) {
				this.userName = userName;
			}
			public String getVehicleIcon() {
				return vehicleIcon;
			}
			public void setVehicleIcon(String vehicleIcon) {
				this.vehicleIcon = vehicleIcon;
			}
			public String getVehicleNumber() {
				return vehicleNumber;
			}
			public void setVehicleNumber(String vehicleNumber) {
				this.vehicleNumber = vehicleNumber;
			}  
			
			
}
