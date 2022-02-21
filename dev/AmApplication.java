package com.jfeat;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * SpringBoot CG Test Application
 *
 * @author Admin
 * @Date 2017/5/21 12:06
 */
@Slf4j
@SpringBootApplication
@EnableScheduling
@EnableSwagger2
public class AmApplication extends WebMvcConfigurerAdapter {

   //private static Logger log = LoggerFactory.getLogger(AmApplication.class.getSimpleName());
   
     /**
      * 增加swagger的支持
      */
     @Override
     public void addResourceHandlers(ResourceHandlerRegistry registry) {
         registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");
         registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
        
//         registry.addResourceHandler("dependency-ui.html").addResourceLocations("classpath:/META-INF/resources/");
//         registry.addResourceHandler("/dependency-ui/**").addResourceLocations("classpath:/META-INF/resources/dependency-ui/");
     }

    public static void main(String[] args) {
        SpringApplication.run(AmApplication.class, args);
        log.info("App standalone run success!");
    }
}
