package com.zkvanet.web.model;

import org.jeecgframework.poi.excel.annotation.Excel;

public class DeviceStatisExtendDto {
	
	  @Excel(name="设备编号")
	  private Integer deviceId;
	  
	  @Excel(name="车牌号")
	  private String yunshuchehao;
	  
	  @Excel(name="订单数量")
	  private Integer orderCount;
	  
	  @Excel(name="总载重")
	  private Double weightSum;
	  
	  @Excel(name="总运输时长(时)")
	  private Long duration;
	  
	  @Excel(name="报警订单数")
	  private Integer orderWaringCount;
	  
	  @Excel(name="总里程数(公里)")
	  private Double orderMileage;
	  
	public Integer getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(Integer deviceId) {
		this.deviceId = deviceId;
	}
	public String getYunshuchehao() {
		return yunshuchehao;
	}
	public void setYunshuchehao(String yunshuchehao) {
		this.yunshuchehao = yunshuchehao;
	}
	public Integer getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(Integer orderCount) {
		this.orderCount = orderCount;
	}
	public Double getWeightSum() {
		return weightSum;
	}
	public void setWeightSum(Double weightSum) {
		this.weightSum = weightSum;
	}
	public Long getDuration() {
		return duration;
	}
	public void setDuration(Long duration) {
		this.duration = duration;
	}
	public Integer getOrderWaringCount() {
		return orderWaringCount;
	}
	public void setOrderWaringCount(Integer orderWaringCount) {
		this.orderWaringCount = orderWaringCount;
	}
	public Double getOrderMileage() {
		return orderMileage;
	}
	public void setOrderMileage(Double orderMileage) {
		this.orderMileage = orderMileage;
	}
	  
	  
	  
}
