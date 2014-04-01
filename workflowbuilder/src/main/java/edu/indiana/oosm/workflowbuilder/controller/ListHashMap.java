package edu.indiana.oosm.workflowbuilder.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
 
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class ListHashMap {
 
   @XmlJavaTypeAdapter(ListHashMapAdapter.class)
   @XmlElement(name="test")
   List<Map<String, String>> list = 
 new ArrayList<Map<String, String>>();

	public List<Map<String, String>> getList() {
		return list;
	}

	public void setList(List<Map<String, String>> list) {
		this.list = list;
	}
 
   
}