package edu.indiana.oosm.workflowbuilder.DAO;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlType;

@XmlType(propOrder={
		"xmlns",
		"schemaLocation",
		"documentType"})
public class DocumentTypes {
	private DocumentType documentType;
	private String xmlns = "ns:workflow/DocumentType";
	private String schemaLocation = "ns:workflow/DocumentType resource:DocumentType";
	
	@XmlAttribute
	public String getXmlns() {
		return xmlns;
	}
	
	public void setXmlns(String xmlns) {
		this.xmlns = xmlns ;
	}
		
	@XmlAttribute(name="xsi:schemaLocation")
	public String getSchemaLocation() {
		return schemaLocation;
	}

	public void setSchemaLocation(String schemaLocation) {
		this.schemaLocation = schemaLocation;
	}
	
	public DocumentType getDocumentType() {
		return documentType;
	}

	public void setDocumentType(DocumentType documentType) {
		this.documentType = documentType;
	}

}
