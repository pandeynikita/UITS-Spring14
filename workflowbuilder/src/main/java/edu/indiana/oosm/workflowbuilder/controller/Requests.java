package edu.indiana.oosm.workflowbuilder.controller;


public class Requests {
	private String activationType;
	private String ruleTemplate;
	private String mandatoryRoute;
	private String finalApproval;
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