//*********************************************************************
//系统名称：NARI-AUTOPER 
//Copyright(C)2015-2017 NARI Information and Communication Technology 
//Branch. All rights reserved. 
//版本信息：NARI-AUTOPER-V1.0 
//#作者：feng 权重：100% 手机： 
//版本                                         日期                   作者              变更记录 
//NARI-AUTOPER-V1.0  2017-2-10  feng        新建 
//*********************************************************************
package com.zkvanet.web.model;

/**
 * Tuser.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-2-10
 * 类调用特殊情况：无
 */
public class TSUser implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private String signatureFile;// 用户名称
	private String mobilePhone;// 
	private String officePhone;// 办公电话
	private String email;// 邮箱
	/**创建时间*/
	private java.util.Date createDate;
	/**创建人ID*/
	private java.lang.String createBy;
	/**创建人名称*/
	private java.lang.String createName;
	/**修改时间*/
	private java.util.Date updateDate;
	/**修改人*/
	private java.lang.String updateBy;
	/**修改人名称*/
	private java.lang.String updateName;

}
