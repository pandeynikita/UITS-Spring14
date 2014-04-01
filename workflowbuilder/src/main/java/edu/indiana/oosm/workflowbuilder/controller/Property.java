package edu.indiana.oosm.workflowbuilder.controller;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Property {
	
	List<TestMap> properties = new ArrayList<TestMap>();

	public List<TestMap> getProperty() {
		return properties;
	}

	public void setProperty(List<TestMap> property) {
		this.properties = properties;
	}
	
}
