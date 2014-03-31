package edu.indiana.oosm.workflowbuilder.controller;

import java.util.Map;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlValue;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

@XmlJavaTypeAdapter(MyMapAdapter.class)
public class TestMap {
//	Map<String,String> testMap;
//
//	public Map<String, String> getTestMap() {
//		return testMap;
//	}
//
//	public void setTestMap(Map<String, String> testMap) {
//		this.testMap = testMap;
//	}
	
	@XmlAttribute
	public String key;
	
	@XmlValue
	public String value;
}
