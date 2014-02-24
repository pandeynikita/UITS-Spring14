package edu.indiana.oosm.workflowbuilder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
@RequestMapping(value="/")
public class WorkflowBuilderController{
	@RequestMapping(value="editor",method = RequestMethod.GET)
	public ModelAndView helloWorld(){ 
		ModelAndView model = new ModelAndView("WorkflowBuilderPage");
		return model;
	}
	
	@RequestMapping(value="save",method = RequestMethod.POST)
	public void createComponent(@RequestBody Component[] components){
		System.out.println("testing :"+ components[0].getPosition().getLeft());
	}
}