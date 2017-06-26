package wwu.iss.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping(value = "/")
	public ModelAndView start() {
		
		return new ModelAndView("home");
	}
	
	@RequestMapping(value = "/confirm", method = RequestMethod.GET)
	public String confirm(Model model) {
		
	    String greetings = "Greetings, Spring MVC!";
	    model.addAttribute("message", greetings);
	 
	    return "confirm";
	}
	
	@RequestMapping(value = "/bootstrap")
	public ModelAndView bootstrap() {
		
		return new ModelAndView("bootstrap");
	}
	
	@RequestMapping(value = "/requestConfirm")
	public ModelAndView requestConfirm() {
		
		return new ModelAndView("requestConfirm");
	}
}