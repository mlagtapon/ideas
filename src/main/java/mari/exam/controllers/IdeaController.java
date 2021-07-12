package mari.exam.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mari.exam.models.Ideas;
import mari.exam.models.User;
import mari.exam.models.UserIdea;
import mari.exam.services.IdeaService;
import mari.exam.services.UserService;

@Controller
@RequestMapping("/ideas")
public class IdeaController {
	private final IdeaService iServ;
	private final UserService uServ;
	
	public IdeaController(IdeaService iServ, UserService uServ) {
		this.iServ = iServ;
		this.uServ = uServ;
	}
	
    @RequestMapping("")
    public String home(@ModelAttribute("idea") Ideas idea, HttpSession session, Model model) {
    	
    	//user from session
        Long uID = (Long) session.getAttribute("user_id");
        User u = uServ.findUserById(uID);
        model.addAttribute("user", u);
        
		List<UserIdea> uc = iServ.findUserIdea(uID);
		model.addAttribute("userIdea", uc);
        
		model.addAttribute("allidea", iServ.allIdea());
        return "ideas.jsp";
    }
    
    @RequestMapping("/new")
    public String newCourse(@ModelAttribute("idea") Ideas idea, HttpSession session, Model model) {
    	
    	//user from session
        Long uID = (Long) session.getAttribute("user_id");
        User u = uServ.findUserById(uID);
        model.addAttribute("user", u);
        
        model.addAttribute("allidea", iServ.allIdea());
        return "newIdea.jsp";
        
    }
    
    @RequestMapping(value="/newIdea", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("idea") Ideas idea, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
        	System.out.println(result.getAllErrors());
            return "newIdea.jsp";
        } else {
        	iServ.createIdea(idea);
            return "redirect:/ideas";
        }
    }
    
    //Edit page
	@RequestMapping("/{id}/edit")
	public String showOne(@PathVariable("id") Long id, @ModelAttribute("idea") Ideas idea, HttpSession session, HttpServletRequest request, Model model) {

        Long uID = (Long) session.getAttribute("user_id");
        User u = uServ.findUserById(uID);
        model.addAttribute("user", u);
        
	    Ideas anIdea = iServ.findOne(id);
	    model.addAttribute("anIdea", anIdea);
	    
	    if (anIdea.getCreator().getId() != uID) {
	    	return "redirect:/ideas";
	    } else {
	    	model.addAttribute("oneIdea", anIdea);
	    	return "editIdea.jsp";
	    }
	 }
	
	//Edit fx
    @RequestMapping("/edit/{id}")
	public String update(@Valid @ModelAttribute("idea") Ideas idea, BindingResult result, @PathVariable("id") Long id) {
    if (result.hasErrors()) {
    	System.out.println(result.getAllErrors());
    	System.out.println("didnt edit");
        return "editIdea.jsp";
    } else {
    	System.out.println("edited");
        iServ.update(idea);
        return "redirect:/ideas";
    	}
    }
    
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttrs, @ModelAttribute("idea") Ideas idea, HttpSession session, HttpServletRequest request, Model model) {
    	
        Long uID = (Long) session.getAttribute("user_id");
        User u = uServ.findUserById(uID);
        model.addAttribute("user", u);
        
	    Ideas anIdea = iServ.findOne(id);
	    model.addAttribute("anIdea", anIdea);
	    
	    if (anIdea.getCreator().getId() != uID) {
	    	redirectAttrs.addFlashAttribute("not_user_error", "Can't delete idea, you are not the user that created this!");
	    	return "redirect:/ideas/{id}";
	    } else {
			iServ.delete(id);
			return "redirect:/ideas";
	    }

    }
    
    @PostMapping("/like/{id}")
	public String like(@PathVariable("id") Long id, @RequestParam("user")User u, Model model) {
		iServ.like(id, u);
			return "redirect:/ideas";
	}
	
	@PostMapping("/unlike/{id}")
	public String removeU(@PathVariable("id") Long id, @RequestParam("user")User u) {
		iServ.unlike(id, u);
			return "redirect:/ideas";
	}
	
	@RequestMapping("/{id}")
	public String showOne(@PathVariable("id") Long id, HttpSession session, @ModelAttribute("idea") Ideas idea, @ModelAttribute("user") User user, HttpServletRequest request, Model model) {
		
        Long uID = (Long) session.getAttribute("user_id");
        User u = uServ.findUserById(uID);
        model.addAttribute("user", u);

	    Ideas oneIdea = iServ.findOne(id);
	   
	    model.addAttribute("alluser", uServ.allUser());
		model.addAttribute("allidea", iServ.allIdea());

		model.addAttribute("oneIdea", oneIdea);
	    return "show.jsp";
	 }
}
