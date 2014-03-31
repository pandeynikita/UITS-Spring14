package edu.indiana.oosm.workflowbuilder.controller;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Property {
	
	@XmlElement(name="property")
	List<TestMap> properties;

	public List<TestMap> getProperty() {
		return properties;
	}

	public void setProperty(List<TestMap> property) {
		this.properties = properties;
	}
	
}
