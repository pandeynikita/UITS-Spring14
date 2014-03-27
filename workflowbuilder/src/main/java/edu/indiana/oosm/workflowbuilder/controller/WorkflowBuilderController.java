package edu.indiana.oosm.workflowbuilder.controller;

import java.io.IOException;
import java.io.StringWriter;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value="/")
public class WorkflowBuilderController{
	
	@RequestMapping(value="editor",method = RequestMethod.GET)
	public ModelAndView helloWorld(){
		ModelAndView model = new ModelAndView("WorkflowBuilderPage");
		return model;
	}

	//Recieving input using @RequestBody
	@RequestMapping(value="export",method = RequestMethod.POST)
	public ModelAndView exportToXML(@RequestBody CircleConfiguration circle){
		System.out.println(circle.getActivationType());
		ModelAndView model = new ModelAndView("WorkflowBuilderPage");
		return model;
	}	
}