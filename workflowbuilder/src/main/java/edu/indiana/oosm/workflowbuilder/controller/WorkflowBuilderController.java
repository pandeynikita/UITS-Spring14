package edu.indiana.oosm.workflowbuilder.controller;

import java.io.StringReader;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

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
	public ModelAndView exportToXML(@RequestBody Properties properties) throws JAXBException{
		System.out.println("After success");
		System.out.println(properties.getProperty());
		jsonToXml(properties);
		
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
	
	public void moxyXml() throws JAXBException{
		JAXBContext jc = JAXBContext.newInstance(Foo.class);
		Foo f=new Foo();
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		Map<String,String> m= new HashMap<String,String>();
		f.setMap(m);
		m.put("Name","Prashanth");
		m.put("Address", "Info West");
		
		list.add(m);
		
		System.out.println(list.get(0));
		marshallUnmarshall(jc,f);
	}
		
		public String pojo2Xml(Property property) throws JAXBException{
			return "test";
		}
		

	
	public void jsonToXml(Properties properties) throws JAXBException{
		JAXBContext jc = JAXBContext.newInstance(ListHashMap.class);
		ListHashMap l=new ListHashMap();
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		Map<String,String> m= new HashMap<String,String>();
		
		Map<String,String> m1= new HashMap<String,String>();
		
		m.put("Address", "Info West");
		m1.put("Name","Prashanth");
		
		list.add(m);
		list.add(m1);
		
		l.setList(properties.getProperty());
		
		System.out.println(list.get(0));
		marshallUnmarshallForListMap(jc, l);
		
	}
	
	private void marshallUnmarshall(JAXBContext jaxbContext, Foo foo)throws JAXBException{
		Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
		jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		
		StringWriter result = new StringWriter();
		jaxbMarshaller.marshal(foo, result);
		
		String xml = result.toString();
		System.out.println(xml);
		
		
		/*
		Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
		StringReader*/
	}
	
	private void marshallUnmarshallForListMap(JAXBContext jaxbContext, ListHashMap lhm)throws JAXBException{
		Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
		jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		
		StringWriter result = new StringWriter();
		jaxbMarshaller.marshal(lhm, result);
		
		String xml = result.toString();
		System.out.println(xml);
		
		
		/*
		Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
		StringReader*/
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