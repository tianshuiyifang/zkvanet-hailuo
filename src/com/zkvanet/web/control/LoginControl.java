//*********************************************************************
//系统名称：NARI-AUTOPER 
//Copyright(C)2015-2017 NARI Information and Communication Technology 
//Branch. All rights reserved. 
//版本信息：NARI-AUTOPER-V1.0 
//#作者：feng 权重：100% 手机： 
//版本                                         日期                   作者              变更记录 
//NARI-AUTOPER-V1.0  2017-2-10  feng        新建 
//*********************************************************************
package com.zkvanet.web.control;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONArray;  
import net.sf.json.JSONObject;  
  
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.carnet.admin.api.AgencyRailService;
import com.carnet.admin.api.AgencyService;
import com.carnet.admin.api.LoginService;
import com.carnet.admin.common.ResultDto;
import com.carnet.admin.common.RoleCode;
import com.carnet.admin.dto.AgencyDto;
import com.carnet.admin.dto.AgencyRailDto;
import com.carnet.admin.dto.OrderDto;
import com.carnet.admin.dto.RoleDto;
import com.carnet.admin.dto.UserInfoDto;
import com.carnet.admin.dto.query.AgencyQueryParms;
import com.carnet.admin.dto.query.DeviceQueryParms;
import com.carnet.admin.util.DataGridVo;
import com.zkvanet.core.clientManager.ClientManager;
import com.zkvanet.core.pojo.AjaxJson;
import com.zkvanet.core.pojo.Client;
import com.zkvanet.core.util.ContextHolderUtils;
import com.zkvanet.web.model.AgencyDtoExtend;
import com.zkvanet.web.model.AjaxResult;
import com.zkvanet.web.model.DeviceCount;
import com.zkvanet.web.model.UserTreeVo;
import com.zkvanet.web.util.ResourceUtil;

/**
 * LoginControl.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-2-10
 * 类调用特殊情况：无
 */
@Scope("prototype")
@Controller
@RequestMapping("/loginController")
public class LoginControl {
	
	
	@Autowired
	private LoginService loginManager;
	

	@Autowired
	private AgencyService agencyManager;

	@Autowired
	private AgencyRailService agencyRailManager;
	/**
	 * 检查用户名称
	 * 
	 * @param user
	 * @param req
	 * @return
	 */
	@SuppressWarnings("unused")
	@RequestMapping(params = "checkuser")
	@ResponseBody
	public ResultDto<UserInfoDto> checkuser(UserInfoDto user, HttpServletRequest req) {
//		HttpSession session = ContextHolderUtils.getSession();
//		//AjaxJson j = new AjaxJson();
//        if (req.getParameter("ChangShangRole")!=null) {
//        	req.getSession().setAttribute("ChangShangRole", req.getParameter("ChangShangRole"));
//        }
      //  ResultDto<UserInfoDto> result=loginManager.login(user.getLoginName(), user.getPassWord());
        ResultDto<UserInfoDto> result=loginManager.loginChild(user.getLoginName(), user.getPassWord());
        if(result.getData()==null)return result;
        ResultDto<UserInfoDto> userInfo = loginManager.getUserInfo(result.getData().getId());
            if(userInfo!=null){
            	result.getData().setRole(userInfo.getData().getRole());
        }
        saveLoginSuccessInfo(req, result.getData());    
		return result;
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(params = "saveloginInfo")
	@ResponseBody
	public int saveloginInfo(HttpServletRequest req) {
		HttpSession session = ContextHolderUtils.getSession();
        try {
			UserInfoDto u=(UserInfoDto)JSONObject.toBean(JSONObject.fromObject(req.getParameter("userinfo")),UserInfoDto.class);
			saveLoginSuccessInfo(req, u);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}  
		return 1;
	}
	  /**
		 * 用户登录
		 * 
		 * @param request
		 * @return
		 */
		@RequestMapping(params = "login")
		public ModelAndView login(ModelMap modelMap,HttpServletRequest request,HttpServletResponse response) {
			UserInfoDto user = ResourceUtil.getSessionUserName();
			if (user != null) {
				user=loginManager.getUserInfo(user.getId()).getData();//重新给user赋值
				Cookie zIndexCookie = new Cookie("ZINDEXNUMBER", "1990");
				zIndexCookie.setMaxAge(3600*24);//一天
				response.addCookie(zIndexCookie);
				modelMap.put("userName", user.getLoginName());
				modelMap.put("userId", user.getId());
				
				//首页统计信息
				modelMap.put("userTypeKey",user.getRole().getRoleKey());
				modelMap.put("stockCount",user.getStockCount());
				modelMap.put("DeviceCount",user.getDeviceCount());
				modelMap.put("OnlineCount",user.getOnlineCount());
				modelMap.put("OfflineCount",user.getOfflineCount());
				modelMap.put("ExpireCount",user.getExpireCount());
				modelMap.put("NearExpireCount",user.getNearExpireCount());
				modelMap.put("UnActivedCount",user.getUnActivedCount());
				modelMap.put("ActivedCount",user.getActivedCount());
				modelMap.put("userType",user.getRole().getRoleName());
				modelMap.put("userPhone",user.getMobile());
				return new ModelAndView("/iShow");
			} else {
				return new ModelAndView("/login");
			}

		}

		  /**
	     * 保存用户登录的信息
	     * @param req request
	     * @param user 当前登录用户
	     * @param orgId 组织主键
	     */
	    private void saveLoginSuccessInfo(HttpServletRequest req, UserInfoDto user) {

	        HttpSession session = ContextHolderUtils.getSession();
	        session.setAttribute(ResourceUtil.LOCAL_CLINET_USER, user);
	        if(user.getChildAccount()!=null){
	        	session.setAttribute("ChangShangRole",user.getChildAccount().getUserType());
	        }
	        if(user.getChildAccount()==null&&user.getUserType()==1){
	        	session.setAttribute("ChangShangRole",1);
	        }
	       //【基础权限】切换用户，用户分拥有不同的权限，切换用户权限错误问题
	        //当前session为空 或者 当前session的用户信息与刚输入的用户信息一致时，则更新Client信息
	        Client clientOld = ClientManager.getInstance().getClient(session.getId());
			if(clientOld == null || clientOld.getUserInfo() ==null ||user.getLoginName().equals(clientOld.getUserInfo().getLoginName())){
				Client client = new Client();
		        client.setLogindatetime(new Date());
		        client.setUserInfo(user);
		        ClientManager.getInstance().addClinet(session.getId(), client);
			} else {//如果不一致，则注销session并通过session=req.getSession(true)初始化session
				ClientManager.getInstance().removeClinet(session.getId());
				session.invalidate();
				session=req.getSession(true);//session初始化
				session.setAttribute(ResourceUtil.LOCAL_CLINET_USER, user);
				checkuser(user,req);
			}
	    }
	    
	    /**
	     * 注册用户
	     * 
	     */
	    @RequestMapping(value = "register")
	    public @ResponseBody  ResultDto<UserInfoDto> register(HttpServletRequest request,UserInfoDto user){
	    	  
	    	  ResultDto<UserInfoDto> result=null;
	    	  String roleKey=request.getParameter("roleKey");
	    	  RoleDto rd=new RoleDto();
	    	  if("8".equals(roleKey)){
	    		  rd.setRoleKey(RoleCode.AGENCY.getKey());	
	    	  }else if("9".equals(roleKey)){
	    		  rd.setRoleKey(RoleCode.NORMAL_USER.getKey());
	    	  }else if("1".equals(roleKey)){
	    		  rd.setRoleKey(RoleCode.ADMIN.getKey());
	    	  }else if("3".equals(roleKey)){
	    		  rd.setRoleKey(RoleCode.SALESPERSON.getKey());
	    	  }
	    	  
	    	  user.setRole(rd);
	    	  user.setCreateTime(new Date());
	    	  if(user.getId()!=null){
	    		  result=loginManager.update(user.getId(), user);
	    	  }else{
	    		  result =loginManager.register(user.getParentId(),user);
	    	  }
	    	  return result;
	    }
	    
	    /**
	     * 修改密码
	     * 
	     */
	    @RequestMapping(value = "chagPwd")
	    public @ResponseBody  ResultDto<UserInfoDto> chagPwd(HttpServletRequest request,String oldPwd,String newPwd){
	    	  
	    	  UserInfoDto user = ResourceUtil.getSessionUserName();
	    	  if(user.getChildAccount()!=null){
	    		  user=user.getChildAccount();
	    	  }
	    	  ResultDto<UserInfoDto> result=loginManager.login(user.getLoginName(), oldPwd);
	    	  if(result.getStatusCode()!=0){
	    		  result.setMessage("初始密码不正确");
	    		  return result;
	    	  }
	    	  user.setPassWord(newPwd);
	    	  ResultDto changePassWord = loginManager.changePassWord(user.getId(),newPwd );
	    	  if(changePassWord.getStatusCode()==0){
	    		  result.setStatusCode(0);
	    		  result.setMessage("修改成功");
	    	  }
	    	  return result;
	    }
	    /**
	     * 获取用户树
	     * 
	     */
	    @RequestMapping(value = "getUserTree")
	    public @ResponseBody  AjaxResult<List<UserTreeVo>> getUserTree(HttpServletRequest request){
	    	  
	    	  //ResultDto<UserInfoDto> result=loginManager.register(user);
	    	UserInfoDto user = ResourceUtil.getSessionUserName();
	    	List<UserTreeVo> li=new ArrayList<UserTreeVo>();
	    	Integer userId=user.getId();
	    	String parentId = request.getParameter("parentId");
	    	if(parentId!=null&&!"".equals(parentId)){
	    		userId=Integer.parseInt(parentId);
	    	}else{
	    		user=loginManager.getUserInfo(userId).getData();
	    		UserTreeVo u=new UserTreeVo();
	    		DeviceCount dc=new DeviceCount();//统计设备
	    		dc.setStock(user.getStockCount());
	    		dc.setRepertory(user.getDeviceCount());
	    		String rolekey="";
	    		if(user.getRole()!=null){
	    			rolekey=user.getRole().getRoleKey();
	    		}else{
	    			rolekey="NORMAL_USER";//默认为用户
	    		}
	    		if("AGENCY".equals(rolekey)){ //代理8 用户9 管理0  销售11
		    		u.setIconSkin("onepoxy");
		    		u.setType(8);
		    	}else if("NORMAL_USER".equals(rolekey)){
		    		u.setIconSkin("ptuser");
		    		u.setType(9);
		    	}else if("ADMIN".equals(rolekey)){
		    		u.setIconSkin("ptuser");
		    		u.setType(0);
		    	}else if("SALESPERSON".equals(rolekey)){
		    		u.setIconSkin("ptuser");
		    		u.setType(11);
		    	}
	    		
	    		u.setDeviceCount(dc);
	    		u.setAccount(user.getLoginName());
	    		u.setId(user.getId().toString());
	    		u.setName(user.getRealName());
	    		u.setNickName(user.getRealName());
	    		u.setPhone(user.getMobile());
	    		u.setIsParent(true);
	    		li.add(u);
	    	}
	    	//去除当前用户下组织
	    	ResultDto<List<UserInfoDto>> ul = loginManager.listByParentId(userId);
	    	for(UserInfoDto ui:ul.getData()){
	    		
	    		DeviceCount dc=new DeviceCount();//统计设备
	    		dc.setStock(ui.getStockCount());
	    		dc.setRepertory(ui.getDeviceCount());
	    		
	    		//mobile额外取值
	    		String mobile="";
	    		ResultDto<UserInfoDto> ufmobile = loginManager.getUserInfo(ui.getId());
	    		if(ufmobile!=null&&ufmobile.getData()!=null){
	    			mobile=ufmobile.getData().getMobile();
	    		}
	    		String rolekey="";
	    		if(ufmobile.getData().getRole()!=null){
	    			rolekey=ufmobile.getData().getRole().getRoleKey();
	    		}else{
	    			rolekey="NORMAL_USER";//默认为用户
	    		}
	    		UserTreeVo ut=new UserTreeVo();
	    		ut.setDeviceCount(dc);
	    		ut.setAccount(ui.getLoginName());
		    	ut.setId(ui.getId().toString());
		    	ut.setName(ui.getRealName());
		    	ut.setNickName(ui.getRealName());
		    	ut.setPhone(mobile);
		    	ut.setpId(ui.getParentId().toString());
		    	if("AGENCY".equals(rolekey)){ //经销商8 用户9 管理0  厂商11
		    		ut.setIconSkin("onepoxy");
		    		ut.setType(8);
		    		continue;
		    	}else if("NORMAL_USER".equals(rolekey)){
		    		ut.setIconSkin("ptuser");
		    		ut.setType(9);
		    	}else if("ADMIN".equals(rolekey)){
		    		ut.setIconSkin("ptuser");
		    		ut.setType(0);
		    	}else if("SALESPERSON".equals(rolekey)){
		    		ut.setIconSkin("ptuser");
		    		ut.setType(11);
		    	}
		    	
				if (loginManager.listByParentId(ui.getId()).getData().size() < 1) {
					ut.setIsParent(false);
				}else{
					ut.setIsParent(true); 
				}
		    	
		    	li.add(ut);
	    	}
	    	AjaxResult<List<UserTreeVo>> result =new AjaxResult<List<UserTreeVo>>();
	    	result.setData(li);
	    	return result;
	    }
	    
	    /**
	     * 获取用户信息
	     * 
	     */
	    @RequestMapping(value = "getUserInfo")
	    public @ResponseBody  AjaxResult<UserInfoDto> getUserInfo(HttpServletRequest request,String userId){
	    	AjaxResult<UserInfoDto> result=new AjaxResult<UserInfoDto>();
	    	
	    	ResultDto<UserInfoDto> userInfo = loginManager.getUserInfo(Integer.parseInt(userId));
	    	
	    	if(userInfo.getData()!=null){
	    		result.setCode(0);
	    		result.setData(userInfo.getData());
	    		result.setOk(true);
	    	}else{
	    		result.setCode(1);
	    		result.setOk(false);
	    	}
	    	return result;
	    	
	    }
	    
	    /**
	     * 获取用户信息
	     * 
	     */
	    @RequestMapping(value = "getUserSearch")
	    public @ResponseBody  AjaxResult<List<Map<String,Object>>> getUserSearch(HttpServletRequest request,String userId,String nickName){
	    	AjaxResult<List<Map<String,Object>>> re=new AjaxResult<List<Map<String,Object>>>();
	    	if(userId!=null){
	    		ResultDto<List<UserInfoDto>> result = loginManager.searchByParentIdAndKeys(Integer.parseInt(userId), nickName);
	    		
	    		if(result.getData().size()>0){
	    			List<Map<String,Object>> li=new ArrayList<Map<String,Object>>();
	    			for(UserInfoDto u:result.getData()){
	    				//查询父账号信息
	    				UserInfoDto pu=new UserInfoDto();
	    				ResultDto<UserInfoDto> rpu = loginManager.getUserInfo(u.getParentId());
	    				//u= loginManager.getUserInfo(u.getId()).getData();
	    				if(rpu.getData()!=null){
	    					pu=rpu.getData();
	    				}
	    				
	    				Map<String,Object> map=new HashMap<String, Object>();
	    				map.put("account", u.getLoginName());
	    				map.put("enabledFlag", "1");
	    				map.put("fullParentId", u.getParentId().toString());
	    				map.put("id", u.getId().toString());
	    				map.put("nickName", u.getLoginName());
	    				map.put("oppFlag", "0");
	    				map.put("parentAccount",pu.getLoginName());
	    				map.put("parentFlag", "1");
	    				map.put("parentId", pu.getId()==null?u.getParentId():pu.getId().toString());
	    				map.put("parentName", pu.getRealName());
	    				map.put("parentPhone", pu.getMobile());
	    				map.put("parentType","8");
	    				map.put("type", 8);
	    				map.put("userId", u.getId());
	    				li.add(map);
	    			}
	    			
	    			re.setData(li);
	    			re.setOk(true);
	    			re.setCode(0);
	    			return re;
	    			
	    		}
	    		
	    	}
	    		
	    
	    	return re;
	    	
	    }
	    
	   /**
	    * 经销商增删改
	    * @param agency
	    * @param parentId
	    * @return
	    */
	    @RequestMapping(value = "addAgency")
	    public @ResponseBody  ResultDto addAgency(AgencyDtoExtend agency,Integer id){
	    	    ResultDto add = agencyManager.add(id, agency);
	    	  	return add;
	    }
	    @RequestMapping(value = "updateAgency")
	    public @ResponseBody  ResultDto updateAgency(Integer agencyId,AgencyDtoExtend dAgencyDto){
	    		
	    	  ResultDto update = agencyManager.update(dAgencyDto.getId(), dAgencyDto);
	    		return  update;
	    }
	    @RequestMapping(value = "getSingleAgency")
	    public @ResponseBody  ResultDto<AgencyDto> getSingleAgency(Integer agencyId){
	    	
	    	ResultDto<AgencyDto> resultDto = agencyManager.get(agencyId);
	    	
	    	return resultDto;
	    }
	    @RequestMapping(value = "getAgencyPoint")
	    public @ResponseBody  ResultDto<List<AgencyRailDto>> getAgencyPoint(Integer agencyId){
	    	
	    	ResultDto<List<AgencyRailDto>> resultDto = agencyRailManager.listByAgencyId(agencyId);
	    	
	    	return resultDto;
	    }
	    
	    @RequestMapping(value = "deleteSingleAgency")
	    public @ResponseBody  ResultDto deleteSingleAgency(Integer agencyId){
	    		
	    	  	ResultDto resultDto = agencyManager.delete(agencyId);
	    	  	return  resultDto;
	    }
	    @RequestMapping(value = "getAgency")
	    public @ResponseBody  ResultDto<DataGridVo<AgencyDto>> getAgency(Integer id,AgencyQueryParms params){
	    	
	    	
	    	params.setCreatorId(id);
	    	ResultDto<DataGridVo<AgencyDto>> byCreatorId = agencyManager. getByCreatorId(params);
	    	
	    	return  byCreatorId;
	    }
	    
	 
	   
	    
	    /**
		 * 退出系统
		 * 
		 * @param request
		 * @return
		 */
		@RequestMapping(params = "logout")
		public ModelAndView logout(HttpServletRequest request) {
			HttpSession session = ContextHolderUtils.getSession();
			String logout = "loginController.do?login"; 
			UserInfoDto user = ResourceUtil.getSessionUserName();
			if (user != null)
			ClientManager.getInstance().removeClinet(session.getId());
			session.invalidate();
			ModelAndView modelAndView = new ModelAndView(new RedirectView(
					logout));
			return modelAndView;
		}


}
