package edu.indiana.oosm.workflowbuilder.controller;

public class RouteNodes {
	public Start[] start;
	public Requests[] requests;
	public Simple[] simple;
	public Start[] getStart() {
		return start;
	}
	public void setStart(Start[] start) {
		this.start = start;
	}
	public Requests[] getRequests() {
		return requests;
	}
	public void setRequests(Requests[] requests) {
		this.requests = requests;
	}
	public Simple[] getSimple() {
		return simple;
	}
	public void setSimple(Simple[] simple) {
		this.simple = simple;
	}
}
