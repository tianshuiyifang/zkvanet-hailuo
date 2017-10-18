package com.zkvanet.web.model;

import java.math.BigDecimal;

import org.jeecgframework.poi.excel.annotation.Excel;

import com.carnet.admin.dto.VDeviceStatisDto;

public class StatisDeviceExtendDto {
	
	  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Excel(name="设备编号")
	  private Integer deviceId;
	  
	  @Excel(name="车牌号")
	  private String plateNumber;
	  
	  @Excel(name="设备IMEI号")
	  private String imei;  
	  
	  @Excel(name="订单数量")
	  private Long orderCount;
	  
	  @Excel(name="平均车速(公里/小时)")
	  private Double avgSpeed; 
	  
	  @Excel(name="滞留次数")
	  private Long timeoutExcepTimesSum;
	  
	  @Excel(name="滞留总时长（秒）")
	  private BigDecimal timeoutExcepDurationSum;  
	  
	  @Excel(name="累计总载重（吨）")
	  private Double weightSum;
	  
	  @Excel(name="总运输时长(时)")
	  private BigDecimal duration;
	  
	  @Excel(name="总里程数(公里)")
	  private Double orderMileage;
	  
	  @Excel(name="平均运输时长（毫秒）")
	  private BigDecimal avgDuration;  
	  
	  @Excel(name="平均里程数（米）")
	  private Double avgMileage;

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

	public String getImei() {
		return imei;
	}

	public void setImei(String imei) {
		this.imei = imei;
	}

	public Long getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(Long orderCount) {
		this.orderCount = orderCount;
	}

	public Double getAvgSpeed() {
		return avgSpeed;
	}

	public void setAvgSpeed(Double avgSpeed) {
		this.avgSpeed = avgSpeed;
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

	public Double getWeightSum() {
		return weightSum;
	}

	public void setWeightSum(Double weightSum) {
		this.weightSum = weightSum;
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

	@Override
	public String toString() {
		return "StatisDeviceExtendDto [deviceId=" + deviceId + ", plateNumber="
				+ plateNumber + ", imei=" + imei + ", orderCount=" + orderCount
				+ ", avgSpeed=" + avgSpeed + ", timeoutExcepTimesSum="
				+ timeoutExcepTimesSum + ", timeoutExcepDurationSum="
				+ timeoutExcepDurationSum + ", weightSum=" + weightSum
				+ ", duration=" + duration + ", orderMileage=" + orderMileage
				+ ", avgDuration=" + avgDuration + ", avgMileage=" + avgMileage
				+ "]";
	}  
	  
	 
	  
	
	  
	  
}
