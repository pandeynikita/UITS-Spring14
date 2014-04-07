package edu.indiana.oosm.workflowbuilder.controller;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

@XmlType(propOrder={
		"name",
		"parent",
		"description",
		"label",
		"postProcessor",
		"superUserGroup",
		"blanketApprovePolicy",
		"reportingGroup",
		"defaultExceptionGroup",
		"docHandler",
		"active",
		"routingVersion",
		"routePaths",
"routeNodes"})
public class DocumentType{
	private String name;
	private String parent;
	private String description;
	private String label;
	private String postProcessor;
	private SuperUserGroup superUserGroup;
	private String blanketApprovePolicy;
	private ReportingGroup reportingGroup;
	private DefaultExceptionGroup defaultExceptionGroup;
	private String docHandler;
	private String active;
	private String routingVersion;
	private RoutePaths routePaths;
	private RouteNodes routeNodes;
	
	public RoutePaths getRoutePaths() {
		return routePaths;
	}
	public void setRoutePaths(RoutePaths routePaths) {
		this.routePaths = routePaths;
	}
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
	
	
	public String getBlanketApprovePolicy() {
		return blanketApprovePolicy;
	}
	public void setBlanketApprovePolicy(String blanketApprovePolicy) {
		this.blanketApprovePolicy = blanketApprovePolicy;
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
	public String getRoutingVersion() {
		return routingVersion;
	}
	public void setRoutingVersion(String routingVersion) {
		this.routingVersion = routingVersion;
	}
	public RouteNodes getRouteNodes() {
		return routeNodes;
	}
	public void setRouteNodes(RouteNodes routeNodes) {
		this.routeNodes = routeNodes;
	}
	@XmlElement(name="postProcessorName")
	public String getPostProcessor() {
		return postProcessor;
	}
	public void setPostProcessor(String postProcessor) {
		this.postProcessor = postProcessor;
	}
	@XmlElement(name="superUserGroupName")
	public SuperUserGroup getSuperUserGroup() {
		return superUserGroup;
	}
	public void setSuperUserGroup(SuperUserGroup superUserGroup) {
		this.superUserGroup = superUserGroup;
	}
	@XmlElement(name="repeatingGroupName")
	public ReportingGroup getReportingGroup() {
		return reportingGroup;
	}
	public void setReportingGroup(ReportingGroup reportingGroup) {
		this.reportingGroup = reportingGroup;
	}
	@XmlElement(name="defaultExceptionGroupName")
	public DefaultExceptionGroup getDefaultExceptionGroup() {
		return defaultExceptionGroup;
	}
	public void setDefaultExceptionGroup(DefaultExceptionGroup defaultExceptionGroup) {
		this.defaultExceptionGroup = defaultExceptionGroup;
	}

}