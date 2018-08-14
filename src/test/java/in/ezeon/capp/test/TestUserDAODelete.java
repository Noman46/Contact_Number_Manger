
package in.ezeon.capp.test;

import in.ezeon.capp.config.SpringRootConfig;
import in.ezeon.capp.dao.UserDAO;
import in.ezeon.capp.dao.UserDAOImp;
import in.ezeon.capp.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 *
 * @Noman Ibrahim
 */
public class TestUserDAODelete {

   
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDAO = ctx.getBean(UserDAO.class);
        //TODO: The user information will be taken from User Regestration from
        // This one is only for testing
        
        userDAO.delete(36); // This delete operation will be done 
        //by delete method in UserDAOImp class having userId param
        
        
        
        /*User u=new User();
        u.setUserId(37);
        userDAO.delete(u);*/ // This delete operatipon will be done by delete method
        // in UserDAOImp class having User u object param
        
        
        System.out.println("Data Deleted");
        
        
    }
     
}
