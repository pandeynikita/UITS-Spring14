package edu.indiana.oosm.workflowbuilder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
@RequestMapping(value="/")
public class WorkflowBuilderController{
 
	@RequestMapping(value="editor",method = RequestMethod.GET)
	public ModelAndView helloWorld(){
 
		ModelAndView model = new ModelAndView("WorkflowBuilderPage");
 
		return model;
	}
	
	@RequestMapping(value="export",method = RequestMethod.GET)
	public ModelAndView exportToXML(){
		ModelAndView model = new ModelAndView("WorkflowBuilderPage");
		System.out.println("success");
		return model;
	}
}