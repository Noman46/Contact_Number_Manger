package in.ezeon.capp.service;

import in.ezeon.capp.domain.User;
import in.ezeon.capp.exception.UserBlockedException;
import java.util.List;

/**
 *
 * @Noman Ibrahim
 */
public interface UserService {

    public static final Integer LOGIN_STATUS_ACTIVE = 1;
    public static final Integer LOGIN_STATUS_BLOCKED = 2;
    
     public static final Integer ROLE_ADMIN=1;
      public static final Integer ROLE_USER=2;
      

    /*
    *This method handles User registration works.
    * This methode takes User U object from Doamin package
    * From User object It will get Data then save the data using Save method from DAOImpl class 
     */
    public void register(User u);

    /* 
    *This method handles login operation (authentication)
    * If Login is successfull then the method will return User object otherwise null
    * throws UserBlocked exception when User Account is blocked.
    * User loginName and Password will be taken from HTML from
     */
    public User login(String loginName, String password) throws UserBlockedException;

    /*
    *Call this method in order to get All the User List. Only 
    * Admin have This previlaze
     */
    public List<User> getUserList();

    /*
    *This method will help to change User loginstatus.
    *1= ACTIVE
    *2= bLOCKED
     */
    public void changeLoginStatus(Integer userId, Integer loginStatus);

}
