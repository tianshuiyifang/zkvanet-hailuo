//*********************************************************************
//系统名称：NARI-AUTOPER 
//Copyright(C)2015-2017 NARI Information and Communication Technology 
//Branch. All rights reserved. 
//版本信息：NARI-AUTOPER-V1.0 
//#作者：feng 权重：100% 手机： 
//版本                                         日期                   作者              变更记录 
//NARI-AUTOPER-V1.0  2017-3-6  feng        新建 
//*********************************************************************
package com.zkvanet.web.model;

import java.util.List;

import com.zkvanet.web.model.gps.Organizes;

/**
 * GpsInfoVO.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-3-6
 * 类调用特殊情况：无
 */
public class GpsInfoVO {
	private String all;
	private String attentions="0";
	private String idel="0";
	private String isShow="0";
	private String noActiveCount="0";
	private String offlineCount;
	private String onlineCount;
	private List<Organizes> organizes;
	private String runing;
	
	public String getRuning() {
		return runing;
	}
	public void setRuning(String runing) {
		this.runing = runing;
	}
	public String getAll() {
		return all;
	}
	public void setAll(String all) {
		this.all = all;
	}
	public String getAttentions() {
		return attentions;
	}
	public void setAttentions(String attentions) {
		this.attentions = attentions;
	}
	public String getIdel() {
		return idel;
	}
	public void setIdel(String idel) {
		this.idel = idel;
	}
	public String getIsShow() {
		return isShow;
	}
	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}
	public String getNoActiveCount() {
		return noActiveCount;
	}
	public void setNoActiveCount(String noActiveCount) {
		this.noActiveCount = noActiveCount;
	}
	public String getOfflineCount() {
		return offlineCount;
	}
	public void setOfflineCount(String offlineCount) {
		this.offlineCount = offlineCount;
	}
	public String getOnlineCount() {
		return onlineCount;
	}
	public void setOnlineCount(String onlineCount) {
		this.onlineCount = onlineCount;
	}
	public List<Organizes> getOrganizes() {
		return organizes;
	}
	public void setOrganizes(List<Organizes> organizes) {
		this.organizes = organizes;
	}
	

}
