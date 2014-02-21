package edu.indiana.oosm.workflowbuilder.controller;

import java.io.Serializable;

public class Component implements Serializable{
	private String shape;
	private String subject;
	public String getShape() {
		return shape;
	}
	public void setShape(String shape) {
		this.shape = shape;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
}
