package com.dongmyo.example;

import com.dongmyo.example.configuration.RootAppContextConfiguration;
import com.dongmyo.example.configuration.WebAppContextConfiguration;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

public class ApplicationInitializer implements WebApplicationInitializer {
    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        /* root context */
        AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
        rootContext.register(RootAppContextConfiguration.class);

        /* listener */
        servletContext.addListener(new ContextLoaderListener(rootContext));

        /* servlet context */
        AnnotationConfigWebApplicationContext mvcApplicationContext = new AnnotationConfigWebApplicationContext();
        mvcApplicationContext.register(WebAppContextConfiguration.class);

        /* dispatcher servlet */
        DispatcherServlet dispatcherServlet = new DispatcherServlet(mvcApplicationContext);
        ServletRegistration.Dynamic dispatcher = servletContext.addServlet("dispatcher", dispatcherServlet);
        dispatcher.addMapping("/");
    }

}
