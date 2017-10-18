package com.zkvanet.web.model;

import java.math.BigDecimal;
import java.util.Date;

import org.jeecgframework.poi.excel.annotation.Excel;

public class StaticOrderAlertExtendDto {
	
	 @Excel(name="订单报警总数") private Long exceptCount;   
     @Excel(name="载重异常报警总数") private Long weightExcepCount;   
     @Excel(name="滞留异常报警总数") private Long timeoutExcepCount;   
     @Excel(name="滞留次数") private Long timeoutExcepTimesSum;   
     @Excel(name="滞留总时长（秒）") private BigDecimal timeoutExcepDurationSum;   
     @Excel(name="平均车速") private Double avgSpeed;   
     @Excel(name="设备ID") private Integer deviceId;   
     @Excel(name="订单ID") private Integer orderId;   
     @Excel(name="运输总时长（毫秒））") private Long durationTime;  
     @Excel(name="最后一次gps数据时间") private Date gpsLastTime;   
     @Excel(name="最后一次gps吨位") private Double gpsLastWeight;   
     @Excel(name="最后一次gps经度") private BigDecimal gpsLastLon;   
     @Excel(name="最后一次gps维度") private BigDecimal gpsLastLat;   
     @Excel(name="运输总里程（米）") private Double mileage;   
     @Excel(name="是否有报警") private Integer isWaring;   
     @Excel(name="订单结束时间") private Date endTime;   
     @Excel(name="经销商名称") private String agencyName;
     @Excel(name="车牌号") private String plateNumber;   
     @Excel(name="发货单号") private Long orderNo;   
     @Excel(name="出厂日期") private String chuchangriqi;   
     @Excel(name="出厂编号") private String chuchangbianhao;   
     @Excel(name="区域名") private String quyuming;   
     @Excel(name="区域码") private String quyuma;   
     @Excel(name="运输单位") private String yunshudanwei;   
     @Excel(name="产品名称") private String chanpinmingcheng;   
     private Integer baozhuangfangshiid;   
     @Excel(name=" 包装方式") private String baozhuangfangshi;
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
	public Double getAvgSpeed() {
		return avgSpeed;
	}
	public void setAvgSpeed(Double avgSpeed) {
		this.avgSpeed = avgSpeed;
	}
	public Integer getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(Integer deviceId) {
		this.deviceId = deviceId;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Long getDurationTime() {
		return durationTime;
	}
	public void setDurationTime(Long durationTime) {
		this.durationTime = durationTime;
	}
	public Date getGpsLastTime() {
		return gpsLastTime;
	}
	public void setGpsLastTime(Date gpsLastTime) {
		this.gpsLastTime = gpsLastTime;
	}
	public Double getGpsLastWeight() {
		return gpsLastWeight;
	}
	public void setGpsLastWeight(Double gpsLastWeight) {
		this.gpsLastWeight = gpsLastWeight;
	}
	public BigDecimal getGpsLastLon() {
		return gpsLastLon;
	}
	public void setGpsLastLon(BigDecimal gpsLastLon) {
		this.gpsLastLon = gpsLastLon;
	}
	public BigDecimal getGpsLastLat() {
		return gpsLastLat;
	}
	public void setGpsLastLat(BigDecimal gpsLastLat) {
		this.gpsLastLat = gpsLastLat;
	}
	public Double getMileage() {
		return mileage;
	}
	public void setMileage(Double mileage) {
		this.mileage = mileage;
	}
	public Integer getIsWaring() {
		return isWaring;
	}
	public void setIsWaring(Integer isWaring) {
		this.isWaring = isWaring;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getAgencyName() {
		return agencyName;
	}
	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}
	public String getPlateNumber() {
		return plateNumber;
	}
	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}
	public Long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}
	public String getChuchangriqi() {
		return chuchangriqi;
	}
	public void setChuchangriqi(String chuchangriqi) {
		this.chuchangriqi = chuchangriqi;
	}
	public String getChuchangbianhao() {
		return chuchangbianhao;
	}
	public void setChuchangbianhao(String chuchangbianhao) {
		this.chuchangbianhao = chuchangbianhao;
	}
	public String getQuyuming() {
		return quyuming;
	}
	public void setQuyuming(String quyuming) {
		this.quyuming = quyuming;
	}
	public String getQuyuma() {
		return quyuma;
	}
	public void setQuyuma(String quyuma) {
		this.quyuma = quyuma;
	}
	public String getYunshudanwei() {
		return yunshudanwei;
	}
	public void setYunshudanwei(String yunshudanwei) {
		this.yunshudanwei = yunshudanwei;
	}
	public String getChanpinmingcheng() {
		return chanpinmingcheng;
	}
	public void setChanpinmingcheng(String chanpinmingcheng) {
		this.chanpinmingcheng = chanpinmingcheng;
	}
	public Integer getBaozhuangfangshiid() {
		return baozhuangfangshiid;
	}
	public void setBaozhuangfangshiid(Integer baozhuangfangshiid) {
		this.baozhuangfangshiid = baozhuangfangshiid;
	}
	public String getBaozhuangfangshi() {
		return baozhuangfangshi;
	}
	public void setBaozhuangfangshi(String baozhuangfangshi) {
		this.baozhuangfangshi = baozhuangfangshi;
	}  
	
	
}
