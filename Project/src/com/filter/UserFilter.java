package com.filter;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet Filter implementation class UserFilter
 */
@WebFilter("/ListServlet")
public class UserFilter implements Filter {
	private static Logger logger = Logger.getLogger(UserFilter.class.getName());
	// 定义请求排除地址
	String[] exclude = new String[] {"/login"};
    /**
     * Default constructor. 
     */
    public UserFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		//logger.info(req.getContextPath());
		//logger.info(req.getServletPath());
		for (String e:exclude) {
			if (e.equals(req.getServletPath())) {
				chain.doFilter(request, response);
			} else {
				if (req.getSession().getAttribute("user") == null) {
					// 重定向发送请求 并非转到对应资源
					logger.info("未登录访问：" + req.getServletPath());
					res.sendRedirect(req.getContextPath() + "/NewsListServlet");
				} else {
					chain.doFilter(request, response);
				}
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
