package edu.indiana.oosm.workflowbuilder.controller;

import java.io.StringWriter;
import java.util.Map;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/")
public class WorkflowBuilderController{

	@RequestMapping(value="editor", method = RequestMethod.GET)
	public ModelAndView helloWorld(){

		ModelAndView model = new ModelAndView("WorkflowBuilderPage");

		return model;
	}
	//Recieving input using @RequestBody
	@RequestMapping(value="export", method = RequestMethod.POST)
	public ModelAndView exportToXml(@RequestBody Data data) throws JAXBException{
		System.out.println("Success");
		System.out.println(pojo2Xml(data));
		ModelAndView model = new ModelAndView("WorkflowBuilderPage");
		return model;
	}
	public String pojo2Xml(Data data) throws JAXBException{
		JAXBContext jc = JAXBContext.newInstance(Data.class);
		Marshaller marshaller = jc.createMarshaller();
		marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		StringWriter writer = new StringWriter();

		marshaller.marshal(data, writer);
		String xmlStringData = writer.toString();

		return xmlStringData;
	}
}