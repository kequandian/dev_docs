注意上面的默认值，默认有四个，优先级从高到低

* `/META-INF/resources/`
* `/resources/`
* `/static/`
* `/public/`

#### application.yml

```
spring:
  mvc:
    static-path-pattern: /**
  resources:
    static-locations: classpath:/static,classpath:/public,classpath:/resources,classpath:/META-INF,classpath:/META-INF/resources/dist
```

#### Application.java

```
package com.jfeat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


@SpringBootApplication
public class AmApplication extends WebMvcConfigurerAdapter  {

    protected final static Logger logger = LoggerFactory.getLogger(AmApplication.class);

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");
//        registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
        registry.addResourceHandler("/**").addResourceLocations("classpath:/META-INF/resources/dist/");
    }

    public static void main(String[] args) {
        SpringApplication.run(AmApplication.class, args);
        logger.info("Webjar run success!");
    }
}

```
