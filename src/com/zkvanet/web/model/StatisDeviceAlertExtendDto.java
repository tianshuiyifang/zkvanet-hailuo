package com.zkvanet.web.model;

import java.math.BigDecimal;

import org.jeecgframework.poi.excel.annotation.Excel;

public class StatisDeviceAlertExtendDto {
	
	
	 @Excel(name="设备ID") private Integer deviceId;  
	 @Excel(name="车牌号") private String plateNumber;  
	 @Excel(name="异常报警总数") private Long exceptCount;   
     @Excel(name="吨位异常报警总数") private Long weightExcepCount;  
     @Excel(name="滞留异常报警总数") private Long timeoutExcepCount;  
     @Excel(name="滞留次数") private Long timeoutExcepTimesSum;  
	 @Excel(name="滞留总时长（秒）") private BigDecimal timeoutExcepDurationSum;
	 
	public Integer getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(Integer deviceId) {
		this.deviceId = deviceId;
	}
	public String getPlateNumber() {
		return plateNumber;
	}
	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}
	public Long getExceptCount() {
		return exceptCount;
	}
	public void setExceptCount(Long exceptCount) {
		this.exceptCount = exceptCount;
	}
	public Long getWeightExcepCount() {
		return weightExcepCount;
	}
	public void setWeightExcepCount(Long weightExcepCount) {
		this.weightExcepCount = weightExcepCount;
	}
	public Long getTimeoutExcepCount() {
		return timeoutExcepCount;
	}
	public void setTimeoutExcepCount(Long timeoutExcepCount) {
		this.timeoutExcepCount = timeoutExcepCount;
	}
	public Long getTimeoutExcepTimesSum() {
		return timeoutExcepTimesSum;
	}
	public void setTimeoutExcepTimesSum(Long timeoutExcepTimesSum) {
		this.timeoutExcepTimesSum = timeoutExcepTimesSum;
	}
	public BigDecimal getTimeoutExcepDurationSum() {
		return timeoutExcepDurationSum;
	}
	public void setTimeoutExcepDurationSum(BigDecimal timeoutExcepDurationSum) {
		this.timeoutExcepDurationSum = timeoutExcepDurationSum;
	}  
	
	
}
