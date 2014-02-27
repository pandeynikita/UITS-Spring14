package edu.indiana.oosm.workflowbuilder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class WorkflowBuilderController{
 
	@RequestMapping(value="/editor",method = RequestMethod.GET)
	public ModelAndView helloWorld(){
 
		ModelAndView model = new ModelAndView("WorkflowBuilderPage");
 
		return model;
	}
	@RequestMapping(value="/testing",method = RequestMethod.GET)
	public ModelAndView helloTesting(){
 
		ModelAndView model = new ModelAndView("TestingPage");
 
		return model;
	}

}