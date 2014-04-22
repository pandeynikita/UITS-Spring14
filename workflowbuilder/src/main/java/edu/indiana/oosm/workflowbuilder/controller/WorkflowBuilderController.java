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

import edu.indiana.oosm.workflowbuilder.DAO.Data;

@Controller
@RequestMapping(value="/")
public class WorkflowBuilderController{
	static Logger log = Logger.getLogger(
			WorkflowBuilderController.class.getName());
	static int lastLine = 0;

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
		String orderedXml 	= reorderingRoutePath(convertedXml);
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

	//Function to Swap the given lines
	private void swap(String[] items, int i, int j) {
		if(i==j)
			return;
		String temp = items[i];
		items[i] = items[j];
		items[j] = temp;
	}
	//	Function to re order the routePath
	//	1. Find the line of "<routePath>" tag line and "</routePath>" tag line and 
	//	name them as start and end
	//	2. Find the last line of the path in findLastNode function and 
	//	swap it with the current last line
	//	3. Recurse though each line in reverse order
	//		in each line find the node name and find the name in nextNode field of other line
	//		whichever line is found, should be swapped with previous line of the current line

	private String reorderingRoutePath(String xml){
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
		if(!(routePathStart == 0)){
			findLastNode(items,routePathStart+1,routePathEnd-1);
			swap(items, lastLine, routePathEnd-1);
			for(int i=routePathEnd-1;i>routePathStart;i--){
				String[] words = items[i].split("\\s");
				for(String word : words) {
					if(word.startsWith("name")) {
						String node = word.substring(word.indexOf('=')+2);
						if(node.contains("/>")){
							node = node.substring(0,node.indexOf("/")-1);
						} else {
							node = node.substring(0,node.length()-1);
						}
						for(int j=i-1;j>routePathStart;j--) {
							String nextNode = "nextNode=\""+node+"\"";
							if(items[j].contains(nextNode)) {
								swap(items,i-1,j);
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
	private void findLastNode(String[] items, int routePathStart,int routePathEnd) {
		int diff = (routePathEnd - routePathStart);
		if(diff == 0){
			if(!(items[routePathStart].contains("nextNode"))){
				lastLine = routePathStart;
			}
		} else if(diff == 1){
			findLastNode(items, routePathStart, routePathStart);
			findLastNode(items, routePathEnd, routePathEnd);
		} else {
			int mid = diff/2 + routePathStart;
			if(!(items[mid].contains("nextNode"))){
				lastLine = mid;
			} else {
				findLastNode(items, routePathStart, mid-1);
				findLastNode(items, mid+1, routePathEnd);
			}
		}
	}
}