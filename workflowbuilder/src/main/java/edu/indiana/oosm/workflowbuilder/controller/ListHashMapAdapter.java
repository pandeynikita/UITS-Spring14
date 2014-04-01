package edu.indiana.oosm.workflowbuilder.controller;

import java.util.*;
import java.util.Map.Entry;

import javax.xml.bind.annotation.*;
import javax.xml.bind.annotation.adapters.XmlAdapter;

import org.eclipse.persistence.oxm.annotations.XmlVariableNode;

public class ListHashMapAdapter extends
        XmlAdapter<ListHashMapAdapter.AdaptedMap, List<Map<String, String>>> {

    public static class AdaptedMap {
        @XmlVariableNode("key")
        List<AdaptedEntry> entries = new ArrayList<AdaptedEntry>();
    }

    public static class AdaptedEntry {
        @XmlTransient
        public String key;

        @XmlValue
        public String value;
    }

    @Override
    public AdaptedMap marshal(List<Map<String, String>> list) throws Exception {
		AdaptedMap adaptedMap = new AdaptedMap();
		for (Map<String, String> map : list) {
			for (Entry<String, String> entry : map.entrySet()) {
				AdaptedEntry adaptedEntry = new AdaptedEntry();
				adaptedEntry.key = entry.getKey();
				adaptedEntry.value = entry.getValue();
				adaptedMap.entries.add(adaptedEntry);
			}
		}
        return adaptedMap;
    }

    @Override
    public List<Map<String, String>> unmarshal(AdaptedMap adaptedMap)
            throws Exception {
        List<AdaptedEntry> adaptedEntries = adaptedMap.entries;
        List<Map<String, String>> listMap = new ArrayList<Map<String, String>>(
                adaptedEntries.size());
        for (AdaptedEntry adaptedEntry : adaptedEntries) {
            Map<String,String> map = new HashMap<String,String>();
        	map.put(adaptedEntry.key, adaptedEntry.value);
        	listMap.add(map);
        }
        return listMap;
    }

	
}
