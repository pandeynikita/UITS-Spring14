package edu.indiana.oosm.workflowbuilder.controller;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringWriter;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/")
public class WorkflowBuilderController{
	static Logger log = Logger.getLogger(
			WorkflowBuilderController.class.getName());
	
	private String fileName = "/Users/Gokul/workflow.xml";

	@RequestMapping(value="editor", method = RequestMethod.GET)
	public ModelAndView editorPage(){
		ModelAndView model = new ModelAndView("WorkflowBuilderPage");
		return model;
	}
	//Receiving input using @RequestBody
	@RequestMapping(value="export", method = RequestMethod.POST)
//	@RequestMapping(value="export", method = RequestMethod.POST, produces="application/xml")
//	public String exportToXml(@RequestBody Data dataObject){
	public ModelAndView exportToXml(@RequestBody Data dataObject){
		String xml = convertPojoToXml(dataObject);
		ModelAndView model = new ModelAndView("WorkflowBuilderPage");
		System.out.println(xml);
		return model;
//		return xml;
	}
	//Function converts the Pojo to Xml using the root class
	public String convertPojoToXml(Data dataObject){
		JAXBContext jc;
		String xmlStringData = null;
		try {
			jc = JAXBContext.newInstance(Data.class);
			Marshaller marshaller = jc.createMarshaller();
			marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			StringWriter writer = new StringWriter();
			marshaller.marshal(dataObject, writer);
			xmlStringData = writer.toString();
		} catch (JAXBException exception) {
			String message = "[ERROR]:Jaxb context failed to marshal. Exception:"+exception;
			log.error(message);
		}
		return xmlStringData;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}