
package in.ezeon.capp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @Noman IBrahim
 */

@Controller
public class TestController {
    
    @RequestMapping("/test/hello")
    public String Helloworld(){
      return "hello";
    }

}
    
   
  
