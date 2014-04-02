package edu.indiana.oosm.workflowbuilder.controller;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement(name="data")
@XmlAccessorType(XmlAccessType.PROPERTY)
@XmlType(propOrder={
		"name",
		"parent",
		"description",
		"label",
		"postProcessorName",
		"superUserGroupName",
		"blanketApprovePolicy",
		"reportingGroupName",
		"defaultExceptionGroupName",
		"docHandler",
		"active",
		"routingVersion",
"routeNodes"})
public class Data{
	private String name;
	private String parent;
	private String description;
	private String label;
	private String postProcessorName;
	private String superUserGroupName;
	private String blanketApprovePolicy;
	private String reportingGroupName;
	private String defaultExceptionGroupName;
	private String docHandler;
	private String active;
	private int routingVersion;
	private RouteNodes routeNodes;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getPostProcessorName() {
		return postProcessorName;
	}
	public void setPostProcessorName(String postProcessorName) {
		this.postProcessorName = postProcessorName;
	}
	public String getSuperUserGroupName() {
		return superUserGroupName;
	}
	public void setSuperUserGroupName(String superUserGroupName) {
		this.superUserGroupName = superUserGroupName;
	}
	public String getBlanketApprovePolicy() {
		return blanketApprovePolicy;
	}
	public void setBlanketApprovePolicy(String blanketApprovePolicy) {
		this.blanketApprovePolicy = blanketApprovePolicy;
	}
	public String getReportingGroupName() {
		return reportingGroupName;
	}
	public void setReportingGroupName(String reportingGroupName) {
		this.reportingGroupName = reportingGroupName;
	}
	public String getDefaultExceptionGroupName() {
		return defaultExceptionGroupName;
	}
	public void setDefaultExceptionGroupName(String defaultExceptionGroupName) {
		this.defaultExceptionGroupName = defaultExceptionGroupName;
	}
	public String getDocHandler() {
		return docHandler;
	}
	public void setDocHandler(String docHandler) {
		this.docHandler = docHandler;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public int getRoutingVersion() {
		return routingVersion;
	}
	public void setRoutingVersion(int routingVersion) {
		this.routingVersion = routingVersion;
	}
	public RouteNodes getRouteNodes() {
		return routeNodes;
	}
	public void setRouteNodes(RouteNodes routeNodes) {
		this.routeNodes = routeNodes;
	}
}