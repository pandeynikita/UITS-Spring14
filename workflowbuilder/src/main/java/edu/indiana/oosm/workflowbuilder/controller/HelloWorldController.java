package edu.indiana.oosm.workflowbuilder.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/welcome")
public class HelloWorldController{
 
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView helloWorld(){
 
		ModelAndView model = new ModelAndView("HelloWorldPage");
		model.addObject("msg", "Under construction");
 
		return model;
	}
}