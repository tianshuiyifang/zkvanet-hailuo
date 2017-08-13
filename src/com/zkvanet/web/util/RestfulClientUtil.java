//*********************************************************************
//系统名称：SG-I6000 
//Copyright(C)2000-2008 NARI Information and Communication Technology 
//Branch. All rights reserved. 
//版本信息：SG-I6000-V1.000-001 
//#作者：张亚风    $权重：100%   $手机：13770568930#
//版本                                                    日期                     作者          变更记录
//SG-I6000-V1.000-001   2015-5-4     张亚风　   新建
//*********************************************************************
package com.zkvanet.web.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethodBase;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


/**
 * @author zyf
 */
public class RestfulClientUtil {

	private static final Log log = LogFactory.getLog(RestfulClientUtil.class);

	public static String doGet(String url) {
		return doGet(url, null, null);
	}

	public static String doGet(String url, String[] params, String[] values) {

		org.apache.commons.httpclient.HttpClient client = new org.apache.commons.httpclient.HttpClient();
		//设置条件参数
		GetMethod getMethod = new GetMethod(url);
		try {
			getMethod.addRequestHeader("Content-Type", "application/json");
			getMethod.addRequestHeader("Accept", "application/json");

			addNVPs(params, values, getMethod);

			int statusCode = client.executeMethod(getMethod);

			if (statusCode != HttpStatus.SC_OK) {
				// 打印服务器返回的状态
				//System.out.println("Method failed: " + method1.getStatusLine());
			}
			// 返回响应消息
			byte[] responseBody = getMethod.getResponseBodyAsString().getBytes(getMethod.getResponseCharSet());
			
			// 在返回响应消息使用编码(utf-8或gb2312)
			String response = new String(responseBody,"utf-8");
			//System.out.println("------------------response:" + response);
			return response;
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			/* 释放连接 */
			getMethod.releaseConnection();
		}
		return null;
	}

	public static String doPost(String url, String jsonParams) {
		return doPost(url, jsonParams, null, null);
	}

	public static String doPost(String url, String jsonParams, String[] params, String[] values) {
		StringBuffer response = new StringBuffer();

		org.apache.commons.httpclient.HttpClient client = new org.apache.commons.httpclient.HttpClient();
		PostMethod method =null; 
		InputStreamReader inputReader = null;
		BufferedReader reader = null;
		try {
			method=new PostMethod(url);
			method.addRequestHeader("Content-Type", "application/json");
			method.addRequestHeader("Accept", "application/json");
			// 设置Http Post数据
			addNVPs(params, values, method);
			method.setRequestEntity(new StringRequestEntity(jsonParams));

			client.executeMethod(method);
			if (method.getStatusCode() == HttpStatus.SC_OK) {

			}
			//method.getResponseBodyAsString();
			// 读取为 InputStream，在网页内容数据量大时候推荐使用
			inputReader = new InputStreamReader(method.getResponseBodyAsStream(),"gb2312");
			reader = new BufferedReader(inputReader);
			String line;
			while ((line = reader.readLine()) != null) {
				String lines = System.getProperty("line.separator");
				if(!"".equals(lines) && null != lines) {
					response.append(line).append(lines);
				}
			}
		} catch (IOException e) {
			log.error(e);
		} finally {
			if (null != reader)
			{
				try {
					reader.close();
				} catch (IOException e) {
					log.error(e);
				}
			}
			if (null != inputReader)
			{
				try {
					inputReader.close();
				} catch (IOException e) {
					log.error(e);
				}
			}
			if(null!= method){
				try {
					method.releaseConnection();
				} catch (Exception e) {
					log.error(e);
				}
			}
		}
		//System.out.println("--------------------" + response.toString());
		return response.toString();
	}

	private static void addNVPs(String[] params, String[] values, HttpMethodBase getMethod) {
		if(params == null || values == null)
			return;
		if(params.length != values.length)
			throw new RuntimeException("提交的参数与参数值不匹配");
		for(int i=0; i<params.length; i++) {
			getMethod.addRequestHeader(params[i], values[i]);
		}
	}
}
