package edu.indiana.oosm.workflowbuilder.controller;

import java.util.HashMap;
import java.util.Map;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
 
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Foo {
	public final String test="test";
   @XmlJavaTypeAdapter(MapAdapter.class)
   @XmlElement(name=test)
   Map<String, String> map = 
    new HashMap<String, String>();
 
   public Map<String,String> getMap() {
      return map;
   }
 
   public void setMap(Map<String,String> map) {
      this.map = map;
   }
 
}