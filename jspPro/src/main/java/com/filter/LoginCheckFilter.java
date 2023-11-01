package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebFilter("/LoginCheckFilter")
public class LoginCheckFilter implements Filter {

    public LoginCheckFilter() {

    }

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("login doFilter");
		request.setCharacterEncoding("UTF-8");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String auth = null;
		boolean isLogon = false;								
		HttpSession session = req.getSession(false);
		if (session != null && (auth = (String) session.getAttribute("auth")) !=null ) {
			isLogon = true;
		}
		if (isLogon) {
		  chain.doFilter(request, response);		  
		}else {
			String uri = req.getRequestURI();
			session.setAttribute("uri", uri);
			String location = "/jspPro/days07/member/logon.jsp";
		  res.sendRedirect(location);	
		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
	
	}

}
