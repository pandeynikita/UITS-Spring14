package edu.indiana.oosm.workflowbuilder.DAO;

import javax.xml.bind.annotation.XmlAttribute;

public class Role {
	private String name;
	private String nextNode;
	private String qualifierResolverClass;
	private String activationType;
	@XmlAttribute
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@XmlAttribute
	public String getNextNode() {
		return nextNode;
	}
	public void setNextNode(String nextNode) {
		this.nextNode = nextNode;
	}
	public String getQualifierResolverClass() {
		return qualifierResolverClass;
	}
	public void setQualifierResolverClass(String qualifierResolverClass) {
		this.qualifierResolverClass = qualifierResolverClass;
	}
	public String getActivationType() {
		return activationType;
	}
	public void setActivationType(String activationType) {
		this.activationType = activationType;
	}

}
