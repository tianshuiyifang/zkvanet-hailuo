package com.zkvanet.web.model;

import java.math.BigDecimal;

import org.jeecgframework.poi.excel.annotation.Excel;

public class StatisAgencyAlertExtendDto {
	 @Excel(name="异常报警总数")
	 private Long exceptCount;  
	 @Excel(name="载重异常报警总数")
     private Long weightExcepCount;  
     @Excel(name="滞留异常报警总数")
     private Long timeoutExcepCount;  
     @Excel(name="滞留次数")
     private Long timeoutExcepTimesSum;  
     @Excel(name="滞留总时长（秒）")
     private BigDecimal timeoutExcepDurationSum; 
     @Excel(name="经销商ID")
	 private Integer agencyId;  
	 @Excel(name="经销商名称")
     private String agencyName;  
     @Excel(name="报警订单数")
	 private BigDecimal orderWaringCount;
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
	public BigDecimal getOrderWaringCount() {
		return orderWaringCount;
	}
	public void setOrderWaringCount(BigDecimal orderWaringCount) {
		this.orderWaringCount = orderWaringCount;
	}  
	  
     
     
}
