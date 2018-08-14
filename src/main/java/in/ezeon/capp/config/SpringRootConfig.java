
package in.ezeon.capp.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 *
 * @Noman Ibrahim
 */

@Configuration
@ComponentScan(basePackages = {"in.ezeon.capp.dao","in.ezeon.capp.service"})
public class SpringRootConfig {
    //TODO: Services, DAO, DataSource, Email Sender or some other business layer beans   
    @Bean
    public BasicDataSource getDataSource(){
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("org.h2.Driver");
        ds.setUrl("jdbc:h2:tcp://localhost/~/capp_db");
        ds.setUsername("sa");
        ds.setPassword("");
        ds.setMaxTotal(2);
        ds.setInitialSize(1);
        ds.setTestOnBorrow(true);
        ds.setValidationQuery("SELECT 1");
        ds.setDefaultAutoCommit(true);
        return ds;
    }
    
    
}
