
package in.ezeon.capp.test;

import in.ezeon.capp.config.SpringRootConfig;

import in.ezeon.capp.domain.User;
import in.ezeon.capp.service.UserService;
import in.ezeon.capp.service.UserServiceImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 *
 * @Noman Ibrahim
 */
public class TestUserService {

   
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserService userService=ctx.getBean(UserServiceImpl.class);
        User u = new User();
        u.setName("Imon");
        u.setPhone("01789298774");
        u.setEmail("Imonilu@ezeon.net");
        u.setAddress("Dhaka");
        u.setLoginName("Ilu");
        u.setPassword("ilu123");
        u.setRole(UserService.ROLE_ADMIN);//Admin Role 
        u.setLoginStatus(UserService.LOGIN_STATUS_ACTIVE); //Active
        userService.register(u);
        System.out.println("Data Saved");
        
        
    }
       
     
}
