package edu.indiana.oosm.workflowbuilder.controller;

import java.util.List;
import java.util.Map;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="properties")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class PropertyClass {
	
	@XmlElement(name = "property")
	List<Map<String,String>> property;

	public List<Map<String, String>> getProperty() {
		return property;
	}

	public void setProperty(List<Map<String, String>> property) {
		this.property = property;
	}

}
