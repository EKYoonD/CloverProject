package com.clover.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.clover.spring.ckeditor.common.Consts;

@Configuration
public class boardFileConfig extends WebMvcConfigurationSupport {
	
	@Bean
	public CommonsMultipartResolver multipartResolver(){
	    CommonsMultipartResolver resolver = new CommonsMultipartResolver();
	    resolver.setMaxUploadSize(600000000);
	    resolver.setDefaultEncoding("UTF-8");
	    return resolver;
	}
	
	@Bean
    public ViewResolver jspViewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        viewResolver.setContentType("text/html");
        
        // Make sure > Thymeleaf order & FreeMarker order.
        viewResolver.setOrder(1000);
        
        return viewResolver;
    }

	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	    registry.addResourceHandler("/**")
	        .addResourceLocations("classpath:/static/")
	        .addResourceLocations("file:" + Consts.FILE_STORAGE_ROOT + "/file/board");
	    	
	    super.addResourceHandlers(registry);
	}
	
	@Bean
	public RequestContextListener requestContextListener() {
	    return new RequestContextListener();
	}

}
