package edu.indiana.oosm.workflowbuilder.controller;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlValue;
import javax.xml.bind.annotation.XmlAttribute;
 
public class MyMapEntryType {
 
   @XmlAttribute
   public String key;
 
   @XmlValue
   public String value;
 
}