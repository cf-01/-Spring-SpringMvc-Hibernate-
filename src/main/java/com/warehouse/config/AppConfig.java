package com.warehouse.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.util.Properties;

@Configuration
@EnableTransactionManagement
@ComponentScan("com.warehouse")
@EnableWebMvc
@PropertySource("classpath:config.properties")
public class AppConfig implements WebMvcConfigurer {

    @Bean
    public DataSource dataSource() throws PropertyVetoException {
        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        dataSource.setDriverClass("${jdbc.driver}");
        dataSource.setJdbcUrl("${jdbc.url}");
        dataSource.setUser("${jdbc.username}");
        dataSource.setPassword("${jdbc.password}");
        dataSource.setMaxPoolSize(40);
        dataSource.setMinPoolSize(1);
        dataSource.setInitialPoolSize(10);
        dataSource.setMaxIdleTime(20);
        return dataSource;
    }

    @Bean
    public SessionFactory sessionFactory(DataSource dataSource) throws Exception {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
        sessionFactory.setPackagesToScan("com.oyzk.entity");

        Properties hibernateProperties = new Properties();
        hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "${hibernate.hbm2ddl.auto}");
        hibernateProperties.setProperty("hibernate.dialect", "${hibernate.dialect}");
        hibernateProperties.setProperty("hibernate.show_sql", "${hibernate.show_sql}");
        hibernateProperties.setProperty("hibernate.format_sql", "${hibernate.format_sql}");
        sessionFactory.setHibernateProperties(hibernateProperties);

        sessionFactory.afterPropertiesSet();

        return sessionFactory.getObject();
    }

    @Bean
    public PlatformTransactionManager transactionManager(SessionFactory sessionFactory) {
        return new HibernateTransactionManager(sessionFactory);
    }

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/js/**").addResourceLocations("/js/");
        registry.addResourceHandler("/css/**").addResourceLocations("/css/");
        registry.addResourceHandler("/img/**").addResourceLocations("/img/");
    }
}
