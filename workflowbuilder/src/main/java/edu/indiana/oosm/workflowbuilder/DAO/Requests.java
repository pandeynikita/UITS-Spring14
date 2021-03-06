package edu.indiana.oosm.workflowbuilder.DAO;

import javax.xml.bind.annotation.XmlAttribute;


public class Requests {
	private String name;
	private String nextNode;
	private String activationType;
	private String ruleTemplate;
	private String mandatoryRoute;
	private String finalApproval;
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
	public String getActivationType() {
		return activationType;
	}
	public void setActivationType(String activationType) {
		this.activationType = activationType;
	}
	public String getRuleTemplate() {
		return ruleTemplate;
	}
	public void setRuleTemplate(String ruleTemplate) {
		this.ruleTemplate = ruleTemplate;
	}
	public String getMandatoryRoute() {
		return mandatoryRoute;
	}
	public void setMandatoryRoute(String mandatoryRoute) {
		this.mandatoryRoute = mandatoryRoute;
	}
	public String getFinalApproval() {
		return finalApproval;
	}
	public void setFinalApproval(String finalApproval) {
		this.finalApproval = finalApproval;
	}
}