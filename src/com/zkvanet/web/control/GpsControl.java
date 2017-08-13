//*********************************************************************
//系统名称：NARI-AUTOPER 
//Copyright(C)2015-2017 NARI Information and Communication Technology 
//Branch. All rights reserved. 
//版本信息：NARI-AUTOPER-V1.0 
//#作者：feng 权重：100% 手机： 
//版本                                         日期                   作者              变更记录 
//NARI-AUTOPER-V1.0  2017-3-8  feng        新建 
//*********************************************************************
package com.zkvanet.web.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import sun.misc.BASE64Decoder;

import com.carnet.admin.api.DeviceService;
import com.carnet.admin.api.GpsDeviceService;
import com.carnet.admin.api.GpsMessageService;
import com.carnet.admin.api.LoginService;
import com.carnet.admin.api.OrderExceptionService;
import com.carnet.admin.api.OrderService;
import com.carnet.admin.common.ResultDto;
import com.carnet.admin.dto.DeviceDto;
import com.carnet.admin.dto.GpsMessage;
import com.carnet.admin.dto.OrderDto;
import com.carnet.admin.dto.OrderExceptionDto;
import com.carnet.admin.dto.UserInfoDto;
import com.carnet.admin.dto.query.DeviceQueryParms;
import com.carnet.admin.dto.query.GpsMessageQueryParms;
import com.carnet.admin.dto.query.OrderQueryParms;
import com.carnet.admin.util.DataGridVo;
import com.zkvanet.web.model.AjaxResult;
import com.zkvanet.web.model.DeviceListPojo;
import com.zkvanet.web.model.GpsInfoVO;
import com.zkvanet.web.model.gps.GgVo;
import com.zkvanet.web.model.gps.GpsVo;
import com.zkvanet.web.model.gps.HbVo;
import com.zkvanet.web.model.gps.Organizes;
import com.zkvanet.web.model.gps.StatusMap;
import com.zkvanet.web.model.gps.VehiclesVo;
import com.zkvanet.web.util.DateUtils;
import com.zkvanet.web.util.ResourceUtil;
import com.zkvanet.web.util.RestfulClientUtil;

/**
 * GpsControl.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-3-8
 * 类调用特殊情况：无
 */
@Scope("prototype")
@Controller
@RequestMapping("/Gps")
public class GpsControl {

	@Autowired
	private GpsDeviceService gpsDeviceManager;
	
	@Autowired
	private LoginService loginManager;
	
	@Autowired
	DeviceService deviceManager;
	
	@Autowired
	GpsMessageService gpsMessageManager;
	
	@Autowired
	private OrderService orderService;
	@Autowired
	OrderExceptionService  orderExceptionService;
	
	
	public static final  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public static final  SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	  @RequestMapping(value = "getOrder")
	   public @ResponseBody  ResultDto<List<OrderDto>> getOrder(Integer id){
		  OrderQueryParms orderParam=new OrderQueryParms();
		  orderParam.setUserId(id);
		  ResultDto<DataGridVo<OrderDto>> queryOrder = orderService.queryOrder(orderParam);
		  List<OrderDto> orderlist = queryOrder.getData().getList();
	    	//return  byCreatorId;
		  ResultDto<List<OrderDto>> re=new ResultDto<List<OrderDto>>();
		  re.setData(orderlist);
		  re.setStatusCode(0);
		  return re;
	    }
	
	  
	  @RequestMapping(value = "getOrderByPage")
	   public @ResponseBody  ResultDto<DataGridVo<OrderDto>> getOrderByPage(OrderQueryParms orderParam){
		  
		  
		  ResultDto<DataGridVo<OrderDto>> queryOrder = orderService.queryOrder(orderParam);
		  
		  
		  return queryOrder;
	    }
	  @RequestMapping(value = "getException")
	   public @ResponseBody  ResultDto<List<OrderExceptionDto>> getException(Integer id){
		  
		  
		   ResultDto<List<OrderExceptionDto>> listByOrderId = orderExceptionService.listByOrderId(id);
		  
		  return listByOrderId;
	    }
	  
	 /**
	  * 获取图片
	 * @throws SecurityException 
	 * @throws NoSuchMethodException 
	 * @throws InvocationTargetException 
	 * @throws IllegalArgumentException 
	 * @throws IllegalAccessException 
	  */
	  @RequestMapping(value = "getimage")
	  public @ResponseBody  ResultDto<List<String>> getimage(String orderNo) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		  
		  ResultDto<List<String>> r=new ResultDto<List<String>>();
		  
		  OrderQueryParms param =new OrderQueryParms();
		  
		  param.setOrderNo(orderNo);
		  
		  ResultDto<DataGridVo<OrderDto>> queryOrder = orderService.queryOrder(param);
		  
		  OrderDto dto=new OrderDto();
		  
		  if(queryOrder.getData()!=null&&queryOrder.getData().getList().size()>0){
			  dto=queryOrder.getData().getList().get(0);
		  }
		  List<String> picUrls=new ArrayList<String>();
		  //获取图片路径
		  for(int i=1;i<=12;i++){
			
			  Method getPic = OrderDto.class.getDeclaredMethod("getPic"+i);
			  
			  String invoke = (String)getPic.invoke(dto);
			  
			  if(invoke!=null&&!"".equals(invoke)){
				 
				  picUrls.add(invoke);
			  }
		  }
		  
		  if(picUrls.size()>0){
			  r.setData(picUrls);
			  r.setStatusCode(0);
		  }else{
			  r.setStatusCode(1);
			  r.setMessage("未上传图片");
		  }
		  
		  return r;
		  
	  }
	 /**
	  * 图片上传
	 * @throws SecurityException 
	 * @throws NoSuchMethodException 
	 * @throws InvocationTargetException 
	 * @throws IllegalArgumentException 
	 * @throws IllegalAccessException 
	 * @throws IOException 
	  */
	  @RequestMapping(value = "uploadimage")
	   public @ResponseBody  ResultDto uploadimage(HttpServletRequest request) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		  ResultDto r=new ResultDto();
		  String image = request.getParameter("image");
		  String name = request.getParameter("name");
		  String picNo = request.getParameter("picNo");
		  Integer id = Integer.parseInt(request.getParameter("id"));
		  String header="";
		  String PNG="data:image/png;base64,";
		  String JPEG ="data:image/jpeg;base64,"; 
		  if(image.contains(JPEG)){
			  header=JPEG;
		  }else if(image.contains(PNG)){
			  header=PNG;
		  }else {
			  r.setStatusCode(1);
			  r.setMessage("请选择JPG/PNG格式图片上传");
		  }
		  
		FileOutputStream out=null;
		try {
			  image = image.substring(header.length());  
			  
			  BASE64Decoder decoder = new BASE64Decoder();  
			  
			  byte[] decodedBytes = decoder.decodeBuffer(image);  
			  String imgFilePath= ResourceUtil.getConfigByName("imagePath")+name;
			 // imgFilePath =request.getSession().getServletContext().getRealPath("")+"\\webpage\\uimages\\"+name;  
			  
			  out = new FileOutputStream(imgFilePath);  
			  
			  out.write(decodedBytes);
			  
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			 try {
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
		}
		Method setPic = OrderDto.class.getDeclaredMethod("setPic"+picNo,String.class);
		OrderDto dto=new OrderDto();
		
		setPic.invoke(dto, "/uimages/"+name);
		
		orderService.updateOrderPic(id, dto);
		
		r.setStatusCode(0);
		r.setData("/uimages/"+name);
		return r;
	 }
	  
	  
	  
	  
	/**
	 * 获取gps信息
	 * 入参：userid
	 */
	  @RequestMapping(value = "getGpsInfo")
	    public @ResponseBody  AjaxResult<GpsInfoVO> getGpsInfo(HttpServletRequest request,UserInfoDto user){
			
		  
		  AjaxResult<GpsInfoVO> result =new AjaxResult<GpsInfoVO>();
		  ResultDto<UserInfoDto> userInfo = loginManager.getUserInfo(user.getId()); //由于前台参数不全，事先查好树对应用户信息
		  //根据用户查询自己及下级用户车辆
		  String deviceStatus = request.getParameter("deviceStatus");
		  DeviceQueryParms params =new DeviceQueryParms();
		 // params.setActivStatus(1);
		  params.setBelongUserId(user.getId());//暂时以userid查询 后续可添加其他条件
		  ResultDto<DataGridVo<DeviceDto>> res = deviceManager.list(params);
		  List<DeviceDto> list = res.getData().getList();
		  
		  //下级单位车辆信息 集团用户不查
//		  if(!"ADMIN".equals(userInfo.getData().getRole().getRoleKey())){
//			  ResultDto<List<UserInfoDto>> childUser = loginManager.listByParentId(user.getId());
//			  if(childUser.getData()!=null&&childUser.getData().size()>0){
//				  for(UserInfoDto ud:childUser.getData()){
//					  DeviceQueryParms childparam =new DeviceQueryParms();
//					  childparam.setActivStatus(1);
//					  childparam.setBelongUserId(ud.getId());
//					  childparam.setPageSize(50); //最多查50辆车
//					  ResultDto<DataGridVo<DeviceDto>> childdev = deviceManager.list(childparam);
//					  if(childdev.getData()!=null&&childdev.getData().getList().size()>0){
//						  list.addAll(childdev.getData().getList());
//					  }
//				  }
//			  }
//		  }
//		 		  
		  
	 

		  //根据车辆IMIE获取gps信息,拼装返回结果
		  GpsInfoVO info =new GpsInfoVO();
		  
		  info.setAll(String.valueOf(list.size()));          //库存总数
		  
		  int online=0;
		  int offline=0;
		  int running=0;
		  int idel=0;
		  int noActiveCount=0;
		  List<Organizes> l=new ArrayList<Organizes>();
 		  Organizes o=new Organizes();
		  o.setId("123456");
		  o.setOrganizeCount(String.valueOf(list.size()));
		  
		  
		  List<VehiclesVo> lv=new ArrayList<VehiclesVo>();
		  for(DeviceDto dd: list){
			  String stateShow="";
			  //查询订单
			  String order="noOrder";
			  OrderQueryParms orderParam=new OrderQueryParms();
			  orderParam.setDeviceId(dd.getId());
			  ResultDto<DataGridVo<OrderDto>> queryOrder = orderService.queryOrder(orderParam);
			  List<OrderDto> orderlist=new ArrayList<OrderDto>();
			  if(queryOrder.getData()!=null){
				  
				  orderlist = queryOrder.getData().getList();
			  }
			  OrderDto ordershow=new OrderDto();
			  if(orderlist.size()>0){
				  order="hasOrder";
				  ordershow=orderlist.get(0);
				  if(orderlist.get(0).getIsWaring()==1){
					  order="errorOrder";
				  }
			  }
			  
			  ResultDto<GpsMessage> lastMessage = gpsDeviceManager.getLastMessage(dd.getImei());//;
			  String stat="0";// 0,离线; 1,在线静止; 2,在线运动.
			  if(lastMessage.getStatusCode()	==1){  //防止查询结果有错误 直接跳过
				  continue ;
			  }
			  if(lastMessage.getData()!=null&&lastMessage.getData().getSpeed()==null&&!lastMessage.getData().getOnLine()){ //有返回数据 如果速度为空 即未激活
				  stateShow="离线";
				  noActiveCount++;
				  offline++;
				  if("online".equals(deviceStatus)){
					  continue ;
				  }
				  
			  
			  } //未取到sim卡对呀的设备信息继续下一个循环
			  if(lastMessage.getData()!=null&&lastMessage.getData().getOnLine()){
				  //在线
				  stat="1";
				  online++;
				  if(lastMessage.getData().getSpeed()>0){
					  //运行
					  stat="2";
					  running++;
					  stateShow="行驶中";
				  }else{
					  //静止
					  idel++;
					  stateShow="静止中";
				  }
				  
				  if("offline".equals(deviceStatus)){
					  continue ;
				  }
			  }
			  
			  //离线在线统计
			  
			  //GPS信息
			  GpsVo gps=new GpsVo();
			  GgVo gg=new GgVo();
			  HbVo hb=new HbVo();
			  //设备信息 
			  VehiclesVo v=new VehiclesVo();
			  v.setDeviceName(dd.getName());
			  v.setDriverPhone(dd.getSim());
			  v.setName(dd.getName());
			  v.setElectricity("100");
			  v.setIdleTime(stateShow);
			  v.setImei(dd.getImei());
			  v.setMcType("GT710");
			  v.setShow(stat);
			  if(lastMessage.getData().getWeight()!=null){
				  
				  v.setWeight(lastMessage.getData().getWeight().toString());
			  }
			  v.setOrdertype(order);
			  if(ordershow.getFahuodanhao()!=null){
				  v.setFahuodanhao(ordershow.getFahuodanhao().toString());
			  }
			  v.setKehumingcheng(ordershow.getKehumingcheng());
			  if(ordershow.getCreateTime()!=null){
				  v.setCreateTime(sdf1.format(ordershow.getCreateTime()));
			  }
			  v.setBaozhuangfangshi(ordershow.getBaozhuangfangshi());
			  GpsMessage  gpsmsg=lastMessage.getData();
			  if(gpsmsg!=null&&gpsmsg.getOnLine()){ //有GPS数据时 拼装GPS信息
				  
				  String lat=gpsmsg.getLat().toString();
				  String lon=gpsmsg.getLon().toString();
				 
				  
				  Map<String, String> changGpsInfo = changGpsInfo(lat,lon);
				  lon=changGpsInfo.get("lon");
				  lat=changGpsInfo.get("lat");
				  
				  gps.setDeviceImei(dd.getImei());
				  gps.setGpsTime(DateUtils.date2Str(gpsmsg.getReciveTime(),sdf));
				  gps.setLatitude(lat);
				  gps.setLongitude(lon);
				  gps.setGpsSpeed(gpsmsg.getSpeed());
				  hb.setDeviceImei(dd.getImei());
				  hb.setDeviceInfo("-128");
				  hb.setExt("AAE=");
				  hb.setOilEleStatus("1");
				  hb.setgPSSignal("4");
				  hb.setPowerLevel("298");
				  hb.setSeqNo("20");
				  
				  gg.setLat(lat);
				  gg.setLng(lon);
			  }
			  StatusMap sm =new StatusMap();
			 
			  sm.setBd(gg);
			  sm.setGg(gg);
			  sm.setGps(gps);
			  sm.setOrder(order);
			  sm.setHb(hb);
			  sm.setStatus(stat);  //该字段表示车辆是啥状态
			  if(gpsmsg.getOnLine()||gpsmsg.getLat()!=null){
				  v.setStatusMap(sm);
			  }
			  v.setVechleioc("other");
			  lv.add(v);
		  }
		  info.setOnlineCount(String.valueOf(online));  //在线车辆
		  info.setOfflineCount(String.valueOf(offline)); //离线车辆
		  info.setRuning(String.valueOf(running));  //行驶车辆
		  info.setIdel(String.valueOf(idel));//静止车辆
		  info.setNoActiveCount(String.valueOf(noActiveCount));//未激活
		  o.setVehicles(lv);
		  l.add(o);
		  info.setOrganizes(l);
		  
		  result.setCode(0);
		  result.setData(info);
		  result.setMsg("搜索成功");
		  result.setOk(true);
		  return result;
		  
		  
	  }
	
	  @RequestMapping(value = "getExceptionPoint")
	  public @ResponseBody  AjaxResult<List<Map<String, Object>>> getExceptionPoint(HttpServletRequest request) throws ParseException{
		  AjaxResult<List<Map<String, Object>>> result =new AjaxResult<List<Map<String, Object>>>();
		  String  imei= request.getParameter("imei");
		  String startTime = request.getParameter("startTime"); 
		  String  endTime= request.getParameter("endTime");
		  DeviceQueryParms params =new DeviceQueryParms();
			params.setImei(imei);
			ResultDto<DataGridVo<DeviceDto>> list2 = deviceManager.list(params);
			Integer deviceid=0;
			if(list2.getData()!=null&&list2.getData().getList().size()>0){
				deviceid=list2.getData().getList().get(0).getId();
			}
			List<Map<String, Object>> list=new ArrayList<Map<String, Object>>();
			
			
			//查询订单信息
		  	OrderQueryParms param =new OrderQueryParms();
		    param.setDeviceId(deviceid);
		    param.setPageSize(10000);
		    ResultDto<DataGridVo<OrderDto>> queryOrder = orderService.queryOrder(param);
			if(queryOrder.getData()!=null&&queryOrder.getData().getList().size()>0){
				
				//for(OrderDto orderDto:queryOrder.getData().getList()){
				     OrderDto orderDto=queryOrder.getData().getList().get(0);
					 ResultDto<List<OrderExceptionDto>> listByOrderId = orderExceptionService.listByOrderId(orderDto.getId());
					 if(listByOrderId.getData()!=null&&listByOrderId.getData().size()>0){
						for(OrderExceptionDto orderExceptionDto:listByOrderId.getData()){
							if(orderExceptionDto.getLat()==null)continue;
							Map<String, Object> map=new HashMap<String, Object>();
							Map<String, String> changGpsInfo = changGpsInfo(orderExceptionDto.getLat().toString(),orderExceptionDto.getLon().toString());
							map.put("startTime", orderExceptionDto.getMessage());
							map.put("lat", changGpsInfo.get("lat"));
							map.put("lng", changGpsInfo.get("lon"));
							list.add(map);
						}
						 
					 }
					 
				//}
				
			}
		 
	      result.setCode(0);
		  result.setData(list);
		  result.setOk(true);
		  return result;
	  }
	  
	  
	  @RequestMapping(value = "initPiont")
	  public @ResponseBody  AjaxResult<Map<String, Object>> initpoint(HttpServletRequest request){
		  //查询轨迹参数
		String startTime = request.getParameter("startTime"); 
		String  endTime= request.getParameter("endTime");
		String  imei= request.getParameter("imei");
		String  allMapType= request.getParameter("selectMap");
		String  startPoint = request.getParameter("startPoint");
		long initStartTime=System.currentTimeMillis();
		
	    
		System.out.println("开始日期"+startTime+"--->"+"结束日期"+endTime);
		AjaxResult<Map<String, Object>> ar=new AjaxResult<Map<String, Object>>();
		Map<String, Object> map=new HashMap<String, Object>();
		GpsMessageQueryParms queryParms=new GpsMessageQueryParms();   
		queryParms.setSid(imei);   //imei   
		queryParms.setPageSize(10000);
		try {
			queryParms.setStart(sdf.parse(startTime));   
			queryParms.setEnd(sdf.parse(endTime));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		//根据条件查询轨迹信息
		ResultDto<DataGridVo<GpsMessage>> resultDto=gpsMessageManager.history(queryParms);  
		List<GpsMessage> list = resultDto.getData().getList();
		System.out.println("本次查询总记录数:"+list.size());
		if(list.size()>0){
			List<String> lats=new ArrayList<String>();
			List<String> lngs=new ArrayList<String>();
			List<Double> weight=new ArrayList<Double>();
			List<Double> g=new ArrayList<Double>();
			List<GpsVo> gpsdata=new ArrayList<GpsVo>();
			//先把list里坐标进行批量转换100个一组
			int size=list.size();
			int group=size/100+(int)(size%100>0?1:0);
			for(int i=0;i<group;i++){
//				for(int j=0;j<100;j++){
//					 //list下标
//					int arr=i*100+j;
//					list.get(arr);
//					list. 199
//				}
				if((i+1)==group){
					changGpsInfos(list.subList(i*100, list.size()));
				}else{
					changGpsInfos(list.subList(i*100, (i+1)*100));
				}
			}
			//for(GpsMessage gps:list){
				for(int i=0;i<list.size();i++){ 
				GpsMessage gps=list.get(i);
				GpsVo gp=new GpsVo();
//				Map<String, String> changGpsInfo = changGpsInfo(gps.getLat().toString(),gps.getLon().toString());
//				gp.setLat(changGpsInfo.get("lat"));
//				gp.setLng(changGpsInfo.get("lon"));
				gp.setLat(gps.getLat().toString());
				gp.setLng(gps.getLon().toString());
				gp.setGpsTime(DateUtils.date2Str(gps.getReciveTime(),sdf));
				gp.setDirection(gps.getDirection().toString());
				gp.setGpsSpeed(gps.getSpeed());
				
				
				lats.add(gps.getLat().toString());
				lngs.add(gps.getLon().toString());
				if(gps.getWeight()==null||gps.getWeight()==0.0){
					if((i+5)<list.size()){
						if(list.get(i+1).getWeight()>0&&list.get(i-1).getWeight()>0){
							weight.add(list.get(i-1).getWeight());
						}
					}
					
				}
				weight.add(gps.getWeight());
				gpsdata.add(gp);
				
			}
			
			
			
			map.put("time", "");
			map.put("lats", lats);
			map.put("lngs", lngs);
			map.put("weight", weight);
			map.put("data", gpsdata);
		}
		ar.setCode(0);
		ar.setData(map);
		ar.setOk(true);
		System.out.println("查询结束系统花费时间："+(System.currentTimeMillis()-initStartTime)+"ms");
		return ar;
	  }
	  //String[] param={"coords","from","to","ak"};
	  //String[] value={"117.290944,31.845434","1","5","b55lMArV9Tg1uFOY980gzpkcMCKvVfI5"};
	 //坐标便宜计算
	 private Map<String, String> changGpsInfo(String lat,String lon){
		  
		  Map<String, String> map=new HashMap<String, String>();
		  String url="http://api.map.baidu.com/geoconv/v1/?coords="+lon+","+lat+"&from=1&to=5&ak=b55lMArV9Tg1uFOY980gzpkcMCKvVfI5";
		  String doGet = RestfulClientUtil.doGet(url);
		  JSONObject j = JSONObject.fromObject(doGet);
		  if(j!=null){
			  JSONArray ja = (JSONArray)j.get("result");
			  JSONObject locnew=JSONObject.fromObject(ja.get(0));
			  lat=locnew.get("y").toString();
			  lon=locnew.get("x").toString();
			  map.put("lat", lat);
			  map.put("lon", lon);
		  }
		 return map;
	 }
	  
	 //批量坐标便宜计算
	 //坐标便宜计算
	 private void changGpsInfos(List<GpsMessage> list){
		  
		 List<Map<String, String>> li=new ArrayList<Map<String,String>>();
		  StringBuffer coords=new StringBuffer();
		  for(int i=0;i<list.size();i++){
			  if(i!=0){
				 coords.append(";");
			  }
			  	 coords.append(list.get(i).getLon()+","+list.get(i).getLat());
		  }
		  String url="http://api.map.baidu.com/geoconv/v1/?coords="+coords+"&from=1&to=5&ak=b55lMArV9Tg1uFOY980gzpkcMCKvVfI5";
		  String doGet = RestfulClientUtil.doGet(url);
		  JSONObject j = JSONObject.fromObject(doGet);
		  if(j!=null){
			  JSONArray ja = (JSONArray)j.get("result");
			  for(int i=0;i<ja.size();i++){
				  Map<String, String> map=new HashMap<String, String>();
				  JSONObject locnew=JSONObject.fromObject(ja.get(i));
//				  map.put("lat", locnew.get("y").toString());
//				  map.put("lon", locnew.get("x").toString());
//				  li.add(map);
				  list.get(i).setLat(Double.valueOf(locnew.get("y").toString()));
				  list.get(i).setLon(Double.valueOf(locnew.get("x").toString()));
			  }
		  }
//		 return li;
	 }
	 
	 
	 public static String test(String point){
		 Random ran=new Random();
		 Double a= Double.parseDouble(point)+ran.nextInt(10)*0.01;
		 return a.toString();
	 }
	 
	public static void main(String[] args) {
		//String q=test("1234.11111");
		int size=101;
		int i=size/100+(int)(size%100>0?1:0);
		
		System.out.println(i);
	}
	
}
