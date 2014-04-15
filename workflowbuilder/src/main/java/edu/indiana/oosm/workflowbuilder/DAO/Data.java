package edu.indiana.oosm.workflowbuilder.DAO;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


@XmlRootElement(name="data")
@XmlAccessorType(XmlAccessType.PROPERTY)
@XmlType(propOrder={
		"xmlns",
		"xsi",
		"schemaLocation",
		"documentTypes"})
public class Data{
	private DocumentTypes documentTypes;
	private String xmlns = "ns:workflow";
	private String xsi = "http://www.w3.org/2001/XMLSchema-instance";
	private String schemaLocation = "ns:workflow resource:WorkflowData";
	
	@XmlAttribute
	public String getXmlns() {
		return xmlns;
	}
	
	public void setXmlns(String xmlns) {
		this.xmlns = xmlns ;
	}

	public DocumentTypes getDocumentTypes() {
		return documentTypes;
	}

	public void setDocumentTypes(DocumentTypes documentTypes) {
		this.documentTypes = documentTypes;
	}
	
	@XmlAttribute(name="xmlns:xsi")
	public String getXsi() {
		return xsi;
	}

	public void setXsi(String xsi) {
		this.xsi = xsi;
	}
	
	@XmlAttribute(name="xsi:schemaLocation")
	public String getSchemaLocation() {
		return schemaLocation;
	}

	public void setSchemaLocation(String schemaLocation) {
		this.schemaLocation = schemaLocation;
	}
}