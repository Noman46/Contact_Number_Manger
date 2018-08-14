
package in.ezeon.capp.test;

import in.ezeon.capp.config.SpringRootConfig;
import in.ezeon.capp.dao.UserDAO;
import in.ezeon.capp.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 *
 * @Noman Ibrahim
 */
public class TestUserDAOUpdate {

   
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDAO = ctx.getBean(UserDAO.class);
        

        //TODO: The user information will be taken from User Profile Update page
        // This one is only for testing
        
        User u = new User();
        u.setUserId(33);
        u.setName("Amit sinha");
        u.setPhone("9303580884");
        u.setEmail("amitsinha@ezeon.net");
        u.setAddress("Mumbai");
        u.setRole(1);//Admin Role 
        u.setLoginStatus(1); //Active
        userDAO.update(u);
        System.out.println("Data Updated");
        
        
    }
     
}
