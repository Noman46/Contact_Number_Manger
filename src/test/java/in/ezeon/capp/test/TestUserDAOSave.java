
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
public class TestUserDAOSave {

   
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDAO = ctx.getBean(UserDAO.class);
        //TODO: The user information will be taken from User Regestration from
        // This one is only for testing
        
        User u = new User();
        u.setName("Arif");
        u.setPhone("0176789342");
        u.setEmail("Arif@ezeon.net");
        u.setAddress("Dhaka");
        u.setLoginName("Aru");
        u.setPassword("arif123");
        u.setRole(2);//Admin Role 
        u.setLoginStatus(1); //Active
        userDAO.save(u);
        System.out.println("Data Saved");
        
        
    }
     
}
