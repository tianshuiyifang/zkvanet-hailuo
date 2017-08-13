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

import java.io.Serializable;

/**
 * 
 * 返回的树结构 前端可识别的结构
 * CustomerTree.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-2-26
 * 类调用特殊情况：无
 */
public class UserTreeVo implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String account;
	private Boolean checked=false;
	private Boolean chkDisabled=false;
	private DeviceCount deviceCount=new DeviceCount();
	private String fullParentId;
	private String iconSkin="onepoxy";
	private String id;
	private Boolean isParent=true;
	private String name;
	private String nickName;
	private Boolean open=true;
	private String pId;
	private String phone;
	private Integer type=8;
	
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	public Boolean getChkDisabled() {
		return chkDisabled;
	}
	public void setChkDisabled(Boolean chkDisabled) {
		this.chkDisabled = chkDisabled;
	}
	public DeviceCount getDeviceCount() {
		return deviceCount;
	}
	public void setDeviceCount(DeviceCount deviceCount) {
		this.deviceCount = deviceCount;
	}
	public String getFullParentId() {
		return fullParentId;
	}
	public void setFullParentId(String fullParentId) {
		this.fullParentId = fullParentId;
	}
	public String getIconSkin() {
		return iconSkin;
	}
	public void setIconSkin(String iconSkin) {
		this.iconSkin = iconSkin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Boolean getIsParent() {
		return isParent;
	}
	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Boolean getOpen() {
		return open;
	}
	public void setOpen(Boolean open) {
		this.open = open;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
	

	
	

}
