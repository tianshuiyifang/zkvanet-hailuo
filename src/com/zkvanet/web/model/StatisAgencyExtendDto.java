package com.zkvanet.web.model;

import java.math.BigDecimal;

import org.jeecgframework.poi.excel.annotation.Excel;

public class StatisAgencyExtendDto {
	 @Excel(name="平均车速")
	 private Double avgSpeed;  
	 @Excel(name="累计总载重（吨）")
     private Double weightSum; 
     @Excel(name="经销商ID")
     private Integer agencyId;  
     @Excel(name="经销商名称")
     private String agencyName;  
     @Excel(name="订单总数")
     private Long orderCount;  
     @Excel(name="运输总时长（毫秒）")
     private BigDecimal duration;   
     @Excel(name="订单总里程（米）")
     private Double orderMileage;  
     @Excel(name="平均运输时长（毫秒）")
     private BigDecimal avgDuration;  
     @Excel(name="平均里程数（米）")
     private Double avgMileage;  
     @Excel(name="厂商ID")
     private Integer changshangId;
     
	public Double getAvgSpeed() {
		return avgSpeed;
	}
	public void setAvgSpeed(Double avgSpeed) {
		this.avgSpeed = avgSpeed;
	}
	public Double getWeightSum() {
		return weightSum;
	}
	public void setWeightSum(Double weightSum) {
		this.weightSum = weightSum;
	}
	public Integer getAgencyId() {
		return agencyId;
	}
	public void setAgencyId(Integer agencyId) {
		this.agencyId = agencyId;
	}
	public String getAgencyName() {
		return agencyName;
	}
	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}
	public Long getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(Long orderCount) {
		this.orderCount = orderCount;
	}
	public BigDecimal getDuration() {
		return duration;
	}
	public void setDuration(BigDecimal duration) {
		this.duration = duration;
	}
	public Double getOrderMileage() {
		return orderMileage;
	}
	public void setOrderMileage(Double orderMileage) {
		this.orderMileage = orderMileage;
	}
	public BigDecimal getAvgDuration() {
		return avgDuration;
	}
	public void setAvgDuration(BigDecimal avgDuration) {
		this.avgDuration = avgDuration;
	}
	public Double getAvgMileage() {
		return avgMileage;
	}
	public void setAvgMileage(Double avgMileage) {
		this.avgMileage = avgMileage;
	}
	public Integer getChangshangId() {
		return changshangId;
	}
	public void setChangshangId(Integer changshangId) {
		this.changshangId = changshangId;
	}  
	
	
	
}
