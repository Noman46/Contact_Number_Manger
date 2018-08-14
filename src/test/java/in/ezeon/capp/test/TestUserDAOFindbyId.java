
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
public class TestUserDAOFindbyId {

   
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDAO = ctx.getBean(UserDAO.class);
        //TODO: The user information will be taken from User Regestration from
        // This one is only for testing
        
        User u=userDAO.findById(39);
        System.out.println("______ User Details_____");
         System.out.println(u.toString());
        
        
    }
     
}
