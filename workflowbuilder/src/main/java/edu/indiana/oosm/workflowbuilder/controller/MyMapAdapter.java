package edu.indiana.oosm.workflowbuilder.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import javax.xml.bind.annotation.adapters.XmlAdapter;
  
public final class MyMapAdapter extends
  
   XmlAdapter<Property,Map<String, String>> {
  
   @Override
   public Property marshal(Map<String, String> arg0) throws Exception {
      Property property = new Property();
      for(Entry<String, String> entry : arg0.entrySet()) {
         TestMap testMap =
            new TestMap();
         testMap.key = entry.getKey();
         testMap.value = entry.getValue();
         property.properties.add(testMap);
      }
      return property;
   }
  
   @Override
   public Map<String, String> unmarshal(Property arg0) throws Exception {
      HashMap<String, String> hashMap = new HashMap<String, String>();
      for(TestMap property : arg0.properties) {
         hashMap.put(property.key, property.value);
      }
      return hashMap;
   }
  
}