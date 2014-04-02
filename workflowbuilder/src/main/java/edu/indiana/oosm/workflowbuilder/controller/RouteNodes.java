package edu.indiana.oosm.workflowbuilder.controller;

public class RouteNodes {
	private Start[] start;
	private Requests[] requests;
	private Simple[] simple;
	private Role[] role;
	private Email[] email;
	
	public Role[] getRole() {
		return role;
	}
	public void setRole(Role[] role) {
		this.role = role;
	}
	public Email[] getEmail() {
		return email;
	}
	public void setEmail(Email[] email) {
		this.email = email;
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
	public Start[] getStart() {
		return start;
	}
	public void setStart(Start[] start) {
		this.start = start;
	}
}