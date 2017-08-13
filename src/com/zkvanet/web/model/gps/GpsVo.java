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
 * GgVo.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-3-6
 * 类调用特殊情况：无
 */
public class GpsVo {
		  private String acc  ="1"       ;                           
	      private String deviceImei  ;
	      private String direction ="110"  ;
	      private String gpsInfo   ="8"  ;
	      private String gpsMode    ="0" ;
	      private Double gpsSpeed   ;
	      private String gpsTime     ;
	      private String latitude    ;
	      private String lat    ;
	      private String locDesc     ;
          private String longitude   ;
          private String lng   ;
          private String posMethod ="3"  ;
          private String posType ="GPS"    ;
          private String weight;
          
          
		public String getWeight() {
			return weight;
		}
		public void setWeight(String weight) {
			this.weight = weight;
		}
		public String getLat() {
			return lat;
		}
		public void setLat(String lat) {
			this.lat = lat;
		}
		public String getLng() {
			return lng;
		}
		public void setLng(String lng) {
			this.lng = lng;
		}
		public String getAcc() {
			return acc;
		}
		public void setAcc(String acc) {
			this.acc = acc;
		}
		public String getDeviceImei() {
			return deviceImei;
		}
		public void setDeviceImei(String deviceImei) {
			this.deviceImei = deviceImei;
		}
		public String getDirection() {
			return direction;
		}
		public void setDirection(String direction) {
			this.direction = direction;
		}
		public String getGpsInfo() {
			return gpsInfo;
		}
		public void setGpsInfo(String gpsInfo) {
			this.gpsInfo = gpsInfo;
		}
		public String getGpsMode() {
			return gpsMode;
		}
		public void setGpsMode(String gpsMode) {
			this.gpsMode = gpsMode;
		}
		public Double getGpsSpeed() {
			return gpsSpeed;
		}
		public void setGpsSpeed(Double gpsSpeed) {
			this.gpsSpeed = gpsSpeed;
		}
		public String getGpsTime() {
			return gpsTime;
		}
		public void setGpsTime(String gpsTime) {
			this.gpsTime = gpsTime;
		}
		public String getLatitude() {
			return latitude;
		}
		public void setLatitude(String latitude) {
			this.latitude = latitude;
		}
		public String getLocDesc() {
			return locDesc;
		}
		public void setLocDesc(String locDesc) {
			this.locDesc = locDesc;
		}
		public String getLongitude() {
			return longitude;
		}
		public void setLongitude(String longitude) {
			this.longitude = longitude;
		}
		public String getPosMethod() {
			return posMethod;
		}
		public void setPosMethod(String posMethod) {
			this.posMethod = posMethod;
		}
		public String getPosType() {
			return posType;
		}
		public void setPosType(String posType) {
			this.posType = posType;
		}
          
}
