package com.zkvanet.core.pojo;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.carnet.admin.dto.UserInfoDto;

/**
 * 在线用户对象
 * 
 * @author zhangyafeng 
 * @date 2017-9-28
 * @version 1.0
 */
public class Client implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private UserInfoDto userInfo;
	
	public UserInfoDto getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfoDto userInfo) {
		this.userInfo = userInfo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/**
	 *登录时间
	 */
	private java.util.Date logindatetime;


	public java.util.Date getLogindatetime() {
		return logindatetime;
	}

	public void setLogindatetime(java.util.Date logindatetime) {
		this.logindatetime = logindatetime;
	}


}
