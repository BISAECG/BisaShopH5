package com.bisa.health.shop.filter;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.web.filter.PathMatchingFilter;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.bisa.health.basic.entity.SystemContext;

public class SystemContextFilter implements Filter  {
	
	private Integer pageSizeDefalut=10;
	private Integer pageSize=pageSizeDefalut;
	
	@Override
	public void destroy() {
		
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		
		Locale mlocale = null;
		if (!StringUtils.isEmpty(req.getParameter("lang"))) {
			String language = req.getParameter("lang");
			if (language.equals("zh_CN")) {
				mlocale = new Locale("zh", "CN");
			} else if (language.equals("zh_TW") || language.equals("zh_HK")) {
				mlocale = new Locale("zh", "HK");
			} else {
				mlocale = new Locale("en", "US");
			}
			req.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, mlocale);
		} else {
			mlocale = (Locale) req.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
			if (mlocale == null) {
				String lang = req.getLocale().toString();
				if (lang.equals("zh_CN")) {
					mlocale = new Locale("zh", "CN");
				} else if (lang.equals("zh_TW") || lang.equals("zh_HK")) {
					mlocale = new Locale("zh", "HK");
				} else {
					mlocale = new Locale("en", "US");
				}
				req.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, mlocale);
				
			}
		}
		

		Integer offset = 0;
		try {
			offset = Integer.parseInt(req.getParameter("page"));
			if(offset>0){
				offset=offset-1;
			}
			if(offset>0){
				offset=offset*pageSize;
			}
		} catch (NumberFormatException e) {}
		try {
			SystemContext.setOrder(req.getParameter("order"));
			SystemContext.setSort(req.getParameter("sort"));
			SystemContext.setPageOffset(offset);
			SystemContext.setPageSize(pageSize);
			SystemContext.setRealPath(((HttpServletRequest)req).getSession().getServletContext().getRealPath("/")+"/WEB-INF");
			chain.doFilter(req,resp);
		} finally {
			SystemContext.removeOrder();
			SystemContext.removeSort();
			SystemContext.removePageOffset();
			SystemContext.removePageSize();
			SystemContext.removeRealPath();
		}
	}

	@Override
	public void init(FilterConfig cfg) throws ServletException {
		try {
			pageSize = Integer.parseInt(cfg.getInitParameter("limit"));
		} catch (NumberFormatException e) {
			pageSize = pageSizeDefalut;
		}
	}
	
	

}
