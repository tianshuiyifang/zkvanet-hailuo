package com.zkvanet.core.interceptors;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.zkvanet.core.clientManager.ClientManager;
import com.zkvanet.core.pojo.Client;
import com.zkvanet.core.util.ContextHolderUtils;
import com.zkvanet.web.util.ResourceUtil;


/**
 * 权限拦截器
 * 
 * @author  administrator
 * 
 */
public class AuthInterceptor implements HandlerInterceptor {
	 
	private List<String> excludeUrls;


	public List<String> getExcludeUrls() {
		return excludeUrls;
	}

	public void setExcludeUrls(List<String> excludeUrls) {
		this.excludeUrls = excludeUrls;
	}


	/**
	 * 在controller后拦截
	 */
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception) throws Exception {
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView modelAndView) throws Exception {

	}

	/**
	 * 在controller前拦截
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		String requestPath = ResourceUtil.getRequestPath(request);// 用户访问的资源地址
		HttpSession session = ContextHolderUtils.getSession();
		
		Client client = ClientManager.getInstance().getClient(session.getId());
		if(client == null){ 
//			client = ClientManager.getInstance().getClient(
//					request.getParameter("sessionId"));
		}
		if (excludeUrls.contains(requestPath)) {
			//如果该请求不在拦截范围内，直接返回true
			return true;
		} else{
				if (client != null && client.getUserInfo()!=null ) {
					String uri= request.getRequestURI().substring(request.getContextPath().length() + 1);
					String realRequestPath = null;
					if(uri.endsWith(".do")||uri.endsWith(".action")){
						realRequestPath=requestPath;
					}else {
						realRequestPath=uri;
					}
					return true;
				} else {
					forward(request, response);
					return false;
				}
		}
	}
	
	/**
	 * 转发
	 * 
	 * @param user
	 * @param req
	 * @return
	 */
	@RequestMapping(params = "forword")
	public ModelAndView forword(HttpServletRequest request) {
		return new ModelAndView(new RedirectView("loginController.do?login"));
	}

	private void forward(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("webpage/timeout.jsp").forward(request, response);
	}

	
	

	 
}
