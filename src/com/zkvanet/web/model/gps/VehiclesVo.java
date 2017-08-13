//*********************************************************************
//系统名称：NARI-AUTOPER 
//Copyright(C)2015-2017 NARI Information and Communication Technology 
//Branch. All rights reserved. 
//版本信息：NARI-AUTOPER-V1.0 
//#作者：feng 权重：100% 手机： 
//版本                                         日期                   作者              变更记录 
//NARI-AUTOPER-V1.0  2017-3-6  feng        新建 
//*********************************************************************
package com.zkvanet.web.model.gps;

/**
 * VehiclesVo.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-3-6
 * 类调用特殊情况：无
 */
public class VehiclesVo {
	
	    private String accFlag    ="0"  ;     
		private String deviceName       ;     
		private String driverPhone      ;     
		private String electricity      ;     
		private String idleTime         ;     
		private String imei             ;     
		private String isSupportFence  ="0" ;     //isSupportFence 是否支持电子围栏
		private String keyword          ;     
		private String mcType           ;     
		private String name             ;     
		private String postType      ="GPS"   ;     
		private String show       ="0"      ;     
		private StatusMap statusMap      ;     
		private String vechleioc        ;
		private String weight        ;
		private String ordertype        ;
		private String chuchangriqi;
		private String fahuodanhao;
		private String kehumingcheng;
		private String createTime;
		private String baozhuangfangshi;
		
		public String getBaozhuangfangshi() {
			return baozhuangfangshi;
		}
		public void setBaozhuangfangshi(String baozhuangfangshi) {
			this.baozhuangfangshi = baozhuangfangshi;
		}
		public String getCreateTime() {
			return createTime;
		}
		public void setCreateTime(String createTime) {
			this.createTime = createTime;
		}
		public String getChuchangriqi() {
			return chuchangriqi;
		}
		public void setChuchangriqi(String chuchangriqi) {
			this.chuchangriqi = chuchangriqi;
		}
		public String getFahuodanhao() {
			return fahuodanhao;
		}
		public void setFahuodanhao(String fahuodanhao) {
			this.fahuodanhao = fahuodanhao;
		}
		public String getKehumingcheng() {
			return kehumingcheng;
		}
		public void setKehumingcheng(String kehumingcheng) {
			this.kehumingcheng = kehumingcheng;
		}
		public String getOrdertype() {
			return ordertype;
		}
		public void setOrdertype(String ordertype) {
			this.ordertype = ordertype;
		}
		public String getWeight() {
			return weight;
		}
		public void setWeight(String weight) {
			this.weight = weight;
		}
		public String getAccFlag() {
			return accFlag;
		}
		public void setAccFlag(String accFlag) {
			this.accFlag = accFlag;
		}
		public String getDeviceName() {
			return deviceName;
		}
		public void setDeviceName(String deviceName) {
			this.deviceName = deviceName;
		}
		public String getDriverPhone() {
			return driverPhone;
		}
		public void setDriverPhone(String driverPhone) {
			this.driverPhone = driverPhone;
		}
		public String getElectricity() {
			return electricity;
		}
		public void setElectricity(String electricity) {
			this.electricity = electricity;
		}
		public String getIdleTime() {
			return idleTime;
		}
		public void setIdleTime(String idleTime) {
			this.idleTime = idleTime;
		}
		public String getImei() {
			return imei;
		}
		public void setImei(String imei) {
			this.imei = imei;
		}
		public String getIsSupportFence() {
			return isSupportFence;
		}
		public void setIsSupportFence(String isSupportFence) {
			this.isSupportFence = isSupportFence;
		}
		public String getKeyword() {
			return keyword;
		}
		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}
		public String getMcType() {
			return mcType;
		}
		public void setMcType(String mcType) {
			this.mcType = mcType;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getPostType() {
			return postType;
		}
		public void setPostType(String postType) {
			this.postType = postType;
		}
		public String getShow() {
			return show;
		}
		public void setShow(String show) {
			this.show = show;
		}
		public StatusMap getStatusMap() {
			return statusMap;
		}
		public void setStatusMap(StatusMap statusMap) {
			this.statusMap = statusMap;
		}
		public String getVechleioc() {
			return vechleioc;
		}
		public void setVechleioc(String vechleioc) {
			this.vechleioc = vechleioc;
		}    
        
}
