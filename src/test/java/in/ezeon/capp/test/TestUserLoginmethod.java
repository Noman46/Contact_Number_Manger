
package in.ezeon.capp.test;

import in.ezeon.capp.config.SpringRootConfig;

import in.ezeon.capp.domain.User;
import in.ezeon.capp.exception.UserBlockedException;
import in.ezeon.capp.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 *
 * @Noman Ibrahim
 */
public class TestUserLoginmethod {

   
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserService us= ctx.getBean(UserService.class);
        //TODO: The user information will be taken from User Regestration from
        // This one is only for testing
        
        try {
           User u= us.login("nomu", "noman123");
            System.out.println("your information is correct");
            System.out.println(u.getAddress());
            System.out.println(u.getName());
       
        } catch (UserBlockedException ex) {
            System.out.println("your information is wrong");
        }
        
        
        
    }
     
}
