package edu.indiana.oosm.workflowbuilder.controller;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class CircleConfiguration {
	private String activationType;
	private String mandatoryRoute;

	public String getActivationType() {
		return activationType;
	}

	public void setActivationType(String activationType) {
		this.activationType = activationType;
	}

	public String getMandatoryRoute() {
		return mandatoryRoute;
	}

	public void setMandatoryRoute(String mandatoryRoute) {
		this.mandatoryRoute = mandatoryRoute;
	}


}
