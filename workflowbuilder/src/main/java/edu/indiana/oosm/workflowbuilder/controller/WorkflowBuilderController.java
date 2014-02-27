package edu.indiana.oosm.workflowbuilder.controller;

import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
 
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
		for(int i=0;i<components.length;i++){
			System.out.println("Shape -> "+ components[i].getShape());
		}
		try {
			 
			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
			// root elements
			Document doc = docBuilder.newDocument();
			Element rootElement = doc.createElement("documentType");
			doc.appendChild(rootElement);
			
			Element nameElement = doc.createElement("name");
			nameElement.appendChild(doc.createTextNode("Name of the file"));
			rootElement.appendChild(nameElement);
			for(int i=0;i<components.length;i++){
				System.out.println("Shape -> "+ components[i].getShape());
			}
			
			
			// write the content into xml file
			// write the content into xml file
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			DOMSource source = new DOMSource(doc);
			StreamResult result = new StreamResult(new File("/Users/Gokul/test.xml"));
			
			// Output to console for testing
			// StreamResult result = new StreamResult(System.out);
			transformer.transform(source, result);
	 
			System.out.println("File saved!");

		} catch (ParserConfigurationException pce) {
			pce.printStackTrace();
		} catch (TransformerConfigurationException e) {
			e.printStackTrace();
		} catch (TransformerException e) {
			e.printStackTrace();
		}
	}
}