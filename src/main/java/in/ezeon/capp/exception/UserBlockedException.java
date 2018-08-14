
package in.ezeon.capp.exception;

/**
 *
 * @Noman Ibrahim
 */
public class UserBlockedException extends Exception{
   
    /*
    Creats User object without error description
    */
    public UserBlockedException(){
    }
    
     /*
    Creats User object with error description
    */
    public UserBlockedException(String errDesc){
    super(errDesc);
    }
}
