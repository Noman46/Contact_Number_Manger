package in.ezeon.capp.controller;

import in.ezeon.capp.command.LoginCommand;
import in.ezeon.capp.command.UserCommand;
import in.ezeon.capp.domain.User;
import in.ezeon.capp.exception.UserBlockedException;
import in.ezeon.capp.service.UserService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @Noman Ibrahim
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = {"/", "/index"})
    public String index(Model m) {
        m.addAttribute("command", new LoginCommand());
        return "index"; //JSp - /WEB-INF/view/index.jsp
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String handleLogin(@ModelAttribute("command") LoginCommand cmd, Model m, HttpSession session) {
        try {
            User loggedInuser = userService.login(cmd.getLoginName(), cmd.getPassword());
            if (loggedInuser == null) {
                //Failed part
                m.addAttribute("err", "You Entered Wrong Informations");
                return "index";
            } else {
                // SUCCESS PAERT
                if (loggedInuser.getRole().equals(UserService.ROLE_ADMIN)) { // Check the user role
                    // If the role is for Admin redirect the user to the Admin dashboard
                    addUserInSession(loggedInuser, session);
                    return "redirect:admin/dashboard";
                } else if (loggedInuser.getRole().equals(UserService.ROLE_USER)) {
                    addUserInSession(loggedInuser, session);
                    return "redirect:user/dashboard";
                } else {
                    m.addAttribute("err", "There is no such role");
                    return "index";
                }
            }
        } catch (UserBlockedException ex) {
            // Basically add error message to jsp file and return same index page
            // Because the user is blocked
            m.addAttribute("err", ex.getMessage());
            return "index";
        }
    }
    
    @RequestMapping(value = "/admin/userList")
    public String getUserList(Model m) {
      m.addAttribute("userList", userService.getUserList());
        return "userlist"; //JSp - /WEB-INF/view/index.jsp
    }
    
    @RequestMapping(value = {"/user/dashboard"})
    public String UserDashBoard() {
        return "dashboard_user"; // return JSP /WEB-INF/view/dashboard_user.jsp
    }

    @RequestMapping(value = {"/reg_form"})
    public String registrationForm(Model m) {
        UserCommand cmd = new UserCommand();
        m.addAttribute("command", cmd);

        return "reg_form"; // return JSP /WEB-INF/view/dashboard_user.jsp
    }

    @RequestMapping(value = {"/register"})
    public String handleRegister(@ModelAttribute("command") UserCommand cmd, Model m) {
        User user=cmd.getUser();
        user.setRole(UserService.ROLE_USER);
        user.setLoginStatus(UserService.LOGIN_STATUS_ACTIVE);
        userService.register(user);
        return "redirect:index?act=reg"; //After registration It will go back to the index page with aflag reg 
    }

    @RequestMapping(value = {"/admin/dashboard"})
    public String adminDashBoard() {
        return "dashboard_admin"; // return JSP /WEB-INF/view/dashboard_admin.jsp
    }

    @RequestMapping(value = {"/logout"})
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:index?act=lo"; // return JSP /WEB-INF/view/dashboard_user.jsp
    }

    private void addUserInSession(User u, HttpSession session) {
        session.setAttribute("user", u);
        session.setAttribute("userId", u.getUserId());
        session.setAttribute("role", u.getRole());
    }
}
 