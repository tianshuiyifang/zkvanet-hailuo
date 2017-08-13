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
import java.util.List;

import com.alibaba.fastjson.JSONObject;

/**
 * AjaxResultDto.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-2-26
 * 类调用特殊情况：无
 */
public class AjaxResult<T> {
	
	private boolean ok = true;// 是否成功
	private Integer code=0;//操作成功
	private T data = null;// 数据信息
	private String msg;
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public Object getData() {
		return data;
	}
	public void setData(T  data) {
		this.data = data;
	}

	public String getJsonStr(){
		JSONObject obj = new JSONObject();
		obj.put("ok", this.isOk());
		obj.put("code", this.getCode());
		obj.put("data", this.getData());
		return obj.toJSONString();
	}
}
