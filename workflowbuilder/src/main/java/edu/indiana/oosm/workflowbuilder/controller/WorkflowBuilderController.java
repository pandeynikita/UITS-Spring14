package edu.indiana.oosm.workflowbuilder.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class WorkflowBuilderController{
	@RequestMapping(value="/editor",method = RequestMethod.GET)
	public ModelAndView helloWorld(){
 
		ModelAndView model = new ModelAndView("WorkflowBuilderPage");
 
		return model;
	}
	
	@RequestMapping(value="/export",method = RequestMethod.POST,consumes="application/json")
	@ResponseBody
	public void createComponent(@RequestBody Component[] components){
		System.out.println("testing");
	}
}