package edu.indiana.oosm.workflowbuilder.controller;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

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
	//Recieving input using @RequestBody
	@RequestMapping(value="export", method = RequestMethod.POST)
	public ModelAndView exportToXml(@RequestBody Data dataObject){
		convertPojoToXml(dataObject);
		ModelAndView model = new ModelAndView("WorkflowBuilderPage");
		return model;
	}
	//Function converts the Pojo to Xml using the root class
	public void convertPojoToXml(Data dataObject){
		JAXBContext jc;
		try {
			jc = JAXBContext.newInstance(Data.class);
			Marshaller marshaller = jc.createMarshaller();
			marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			writeIntoFile(marshaller,dataObject);
		} catch (JAXBException exception) {
			String message = "[ERROR]:Jaxb context failed to marshal. Exception:"+exception;
			log.error(message);
		}
		
	}
	//Write the marshalled Xml to an external file
	public void writeIntoFile(Marshaller marshaller, Data dataObject) throws JAXBException{
		File file = new File(getFileName());
		OutputStream outputStream;
		try {
			outputStream = new FileOutputStream(file);
			marshaller.marshal(dataObject, outputStream);
			outputStream.close();
		} catch (FileNotFoundException exception) {
			String message = "[ERROR]:File not Found at "+file+". Exception:"+exception;
			log.error(message);
		} catch (IOException exception) {
			String message = "[ERROR]:Input/Output operation failed while marshalling onto file. Exception:"+exception;
			log.error(message);
		}
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}