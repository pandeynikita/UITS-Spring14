package edu.indiana.oosm.workflowbuilder.controller;

import java.io.StringWriter;
import java.util.List;
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
	public ModelAndView exportToXML(@RequestBody Map<String,List<Map<String,String>>> properties){
		System.out.println("After success");
		
//		System.out.println(object.getObject().get(0).getProperty());
//		PropertyClass property = new PropertyClass();
//		property.setProperty(object.getObject().get(0).getProperty());
//		System.out.println(property.getProperty());
//		try {
//			String x = pojo2Xml(property);
//			System.out.println(x);
//		} catch (JAXBException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		ModelAndView model = new ModelAndView("WorkflowBuilderPage");
		return model;
	}
		
		public String pojo2Xml(Property property) throws JAXBException{
			return "test";
		}
		

	
	
	
	//Recieving input using @RequestBody
//	@RequestMapping(value="export", method = RequestMethod.POST)
//	public ModelAndView exportToXML(@RequestBody Property property){
//		System.out.println("After success");
//		System.out.println(property.getProperty());
//		
////		System.out.println(object.getObject().get(0).getProperty());
////		PropertyClass property = new PropertyClass();
////		property.setProperty(object.getObject().get(0).getProperty());
////		System.out.println(property.getProperty());
//		try {
//			String x = pojo2Xml(property);
//			System.out.println(x);
//		} catch (JAXBException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		ModelAndView model = new ModelAndView("WorkflowBuilderPage");
//		return model;
//	}
//		
//		public String pojo2Xml(Property property) throws JAXBException{
//			JAXBContext jc = JAXBContext.newInstance(Property.class);
//			Marshaller marshaller = jc.createMarshaller();
//			marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
//			StringWriter writer = new StringWriter();
//	
//	        marshaller.marshal(property, writer);
//	        String xmlStringData = writer.toString();
//	
//	        return xmlStringData;
//		}
//		
		
}