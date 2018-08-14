package in.ezeon.capp.controller;

import in.ezeon.capp.domain.Contact;
import in.ezeon.capp.service.ContactService;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Noman Ibrahim
 */
@Controller
public class ContactController {

    @Autowired
    private ContactService contactService;

    @RequestMapping(value = "/addContact")
    public String addControllerjasp(Model m) {
        Contact contact = new Contact();
        m.addAttribute("command", contact);

        return "addContact"; //JSP If I click Add Contact Link It wll take me to the addContact.jsp page
    }

    @RequestMapping(value = "/user/savecontact")
    public String addContact(@ModelAttribute("command") Contact contact, Model m, HttpSession session) {
        Integer contactId = (Integer) session.getAttribute("aContactId");
        if(contactId==null){
            try {
            Integer userId = (Integer) session.getAttribute("userId");
            contact.setUserId(userId);
            contactService.save(contact);

            return "redirect:clist?act=sv"; //JSP If I click Add Contact Link It wll take me to the addContact.jsp page
        } catch (Exception e) {

            e.printStackTrace();
            m.addAttribute("err", "Failed To Save Contact");
            return "redirect:clist?act=sv";
        }
        }else{
        try {
            //update operation
            contact.setContactId(contactId);
            contactService.update(contact);

            return "redirect:clist?act=ed"; //JSP If I click Add Contact Link It wll take me to the addContact.jsp page
        } catch (Exception e) {

            e.printStackTrace();
            m.addAttribute("err", "Failed To Edit Contact");
            return "redirect:clist?act=sv";
        }
        }
    }

    @RequestMapping(value = "/user/clist")
    public String contactList(Model m, HttpSession session) {

        Integer userId = (Integer) session.getAttribute("userId");
        m.addAttribute("contactList", contactService.findUserContact(userId));
        
        
        /*List<Contact> l = contactService.findUserContact(userId);
        m.addAttribute("contactList", l);*/

        return "clist"; //JSP If I click Add Contact Link It wll take me to the addContact.jsp page
    }
    
    
    @RequestMapping(value = "/user/delete")
    public String deleteContact(@RequestParam("cid") Integer contactId ) {
      contactService.delete(contactId);

        return "redirect:clist?act=del"; //JSP If I click Add Contact Link It wll take me to the addContact.jsp page
    }
    
    // BULK DELETETION
    
     @RequestMapping(value = "/user/bulk_cDelete")
    public String bulkDeleteContact(@RequestParam("cid") Integer [] contactIds ) {
      contactService.delete(contactIds);

        return "redirect:clist?act=del"; //JSP If I click Add Contact Link It wll take me to the addContact.jsp page
    }
    
    
    @RequestMapping(value = "/user/edit_contact")
    public String prepareEditForm(Model m, HttpSession session, @RequestParam("cid") Integer contactId) {
        session.setAttribute("aContactId", contactId);
        Contact c =contactService.findById(contactId);
        m.addAttribute("command", c);
      

        return "editContact"; //JSP If I click Add Contact Link It wll take me to the addContact.jsp page
    }
    @RequestMapping(value = "/user/contact_search")
    public String searchContact(Model model, HttpSession session, @RequestParam("freeText") String freeText ) {
        Integer userId = (Integer) session.getAttribute("userId");
        model.addAttribute("contactList", contactService.findUserContact(userId, freeText));

        return "clist"; //JSP If I click Add Contact Link It wll take me to the addContact.jsp page
    }
    
    

}
