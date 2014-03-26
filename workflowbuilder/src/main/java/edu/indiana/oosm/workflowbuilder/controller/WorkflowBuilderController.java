package edu.indiana.oosm.workflowbuilder.controller;

import java.io.IOException;
import java.io.StringWriter;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import org.springframework.stereotype.Controller;
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
	public String jsonData = "{\"activationType\":\"Parallel\",\"mandatoryRoute\":\"Yes\"}";
	
	@RequestMapping(value="editor",method = RequestMethod.GET)
	public ModelAndView helloWorld(){

		ModelAndView model = new ModelAndView("WorkflowBuilderPage");

		return model;
	}

	@RequestMapping(value="export",method = RequestMethod.GET)
	public ModelAndView exportToXML() throws JAXBException, JsonParseException, JsonMappingException,
	IOException {
		JAXBContext context = null;
		WorkflowBuilderController converter = new WorkflowBuilderController();
		ModelAndView model = new ModelAndView("WorkflowBuilderPage");
		System.out.println("success");
		Object obj = json2Pojo(jsonData);
		System.out.println("after success");
		try{
			context = JAXBContext.newInstance(CircleConfiguration.class);
			String xmlStringData = converter.pojo2Xml(obj,
                    context);
			System.out.println(xmlStringData);
		} catch (Exception e) {
			System.out.println(e);
		}
		return model;
	}

	private String pojo2Xml(Object object, JAXBContext context)
			throws JAXBException {
		Marshaller marshaller = context.createMarshaller();
		marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		StringWriter writer = new StringWriter();
		marshaller.marshal(object, writer);
		String xmlStringData = writer.toString();
		return xmlStringData;
	}
	
	private Object json2Pojo(String jsonString) throws JAXBException,
	JsonParseException, JsonMappingException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		CircleConfiguration circleBeanList = objectMapper.readValue(jsonString,
				CircleConfiguration.class);
		Object object = (Object) circleBeanList;
		return object;
	}
	
}