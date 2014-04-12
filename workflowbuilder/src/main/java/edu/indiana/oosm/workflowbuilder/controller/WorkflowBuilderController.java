package edu.indiana.oosm.workflowbuilder.controller;


import java.io.StringWriter;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@ResponseBody
	public String exportToXml(@RequestBody Data dataObject){
		String convertedXml = convertPojoToXml(dataObject);
		String orderedXml 	= orderRoutePath(convertedXml);
		return orderedXml;
	}
	//Function converts the Pojo to Xml using the root class
	private String convertPojoToXml(Data dataObject){
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

//	Function to order the routePath
	private String orderRoutePath(String xml){
		String finalXml = "";
		String[] items  = xml.split("\\n");
		int routePathEnd = 0;
		int routePathStart = 0;
		
		for(int k=0;k<items.length;k++) {
			if(items[k].contains("</routePath>")){
				routePathEnd = k;
				break;
			} else if(items[k].contains("<routePath>")){
				routePathStart = k;
			}
		}
		for(int i=(routePathStart+1);i<routePathEnd;i++) {
			if(items[i].contains("nextNode")) {
				String[] words = items[i].split("\\s");
				for(String word : words) {
					if(word.startsWith("nextNode")) {
						String node = word.substring(word.indexOf('=')+2, word.indexOf("/")-1);
						for(int j=i+1;j<routePathEnd;j++) {
							String nextNode = "name=\""+node+"\"";
							if(items[j].contains(nextNode)) {
								swap(items,i+1,j);
								break;
							}
						}
					}
				}
			}
		}
		for(int i=0;i<items.length;i++){
			finalXml += items[i];
			finalXml += "\n";
		}
		return finalXml;
	}
	//Function to Swap the given lines
	private void swap(String[] items, int i, int j) {
		if(i==j)
			return;
		String temp = items[i];
		items[i] = items[j];
		items[j] = temp;
	}
}