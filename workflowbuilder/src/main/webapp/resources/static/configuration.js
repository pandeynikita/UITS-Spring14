var nodeConfigurationNotAddedError = "Error:Please define nodes configuration on configuration file for corresponding node type";

var nodesConfiguration = { 
		"circle" :{
			"name" : "requests",
			"image" : "circle",
			"header" : "Action Configuration",
			"properties" : {
				"mandatoryRoute" : {
					"label" : "Mandatory Route",
					"type" : "radio",
					"options" : [ "Yes", "No" ]
				},
				"activationType" : {
					"label" : "Activation Type",
					"type" : "select",
					"options" : [ "Parallel", "serial" ]
				},
				"finalApproval":{
					"label": "Final Approval",
					"type" : "radio",
					"options":["Yes", "No"]
				}
				
			}
		},
		"rectangle" :{
			"name" : "requests",
			"image" : "rectangle",
			"header" : "Action Configuration",
			"properties" : {
				
				"activationType" : {
					"label" : "Activation Type",
					"type" : "select",
					"options" : [ "Parallel", "serial" ]
				},
				"mandatoryRoute" : {
					"label" : "Mandatory Route",
					"type" : "radio",
					"options" : [ "Yes", "No" ]
				},
				"ruleTemplate":{
					"label":"Rule Template",
					"type":"text"
				},
				"finalApproval":{
					"label": "Final Approval",
					"type" : "radio",
					"options":["Yes", "No"]
				}
				
			}
		},
		"square":{
			"name" : "requests",
			"image" : "square",
			"header" : "Test.Submission.Email",
			"properties" : {
				"from" : {
					"label" : "From",
					"type" : "text",
					"defaultVal" : "jawbenne@iu.edu"
				},
				"to" : {
					"label" : "To",
					"type" : "text",
					"defaultVal" : "pnagaraj@indiana.edu"
				},
				"testAddress" : {
					"label" : "Test Address",
					"type" : "text"
				}
			}
		},
		"oval":{
			"name" : "requests",
			"image": "oval",
			"header":"Simple Node",
			"properties":{
				"activationType" : {
				"label" : "Activation Type",
				"type" : "select",
				"options" : [ "Parallel", "serial" ]
				},
				"type":{
					"label":"Type",
					"type":"text"
			}
			}
		},
		"rect":{
			"name" : "requests",
			"image": "rect",
			"header":"Role Based Routing",
			"properties":{
				"type":{
					"label":"Qualifier Resolver Class",
					"type":"text"
				},
				"activationType" : {
					"label" : "Activation Type",
					"type" : "select",
					"options" : [ "Parallel", "serial" ]
				}
		
			}
		},
		"configure" : {
			"image" : "configure",
			"header" : "Workflow Configuration",
			"properties" : {
				"name" : {
					"label" : "Name",
					"type" : "text",
					"defaultVal" : "RoleBasedRoutingTest.Type"
				},
				"description" : {
					"label" : "Description",
					"type" : "text",
					"defaultVal" : "Role-based routing test document"
				},
				"label" : {
					"label" : "Label",
					"type" : "text",
					"defaultVal" : "Role-based Routing Test Document"
				},
				"postProcessorName" : {
					"label" : "Post Processor Name",
					"type" : "text",
					"defaultVal" : "org.kuali.rice.edl.framework.workflow.EDocLitePostProcessor"
				},
				"superUserGroupName" : {
					"label" : "Super User Group Name",
					"type" : "text",
					"defaultVal" : "WorkflowAdmin"
				},
				"docHandler" : {
					"label" : "Document Handler",
					"type" : "text",
					"defaultVal" : "${workflow.url}/EDocLite"
				},
				"active" : {
					"label" : "Active",
					"type" : "radio",
					"options" : [ "Yes", "No" ]
				},
				"routingVersion" : {
					"label" : "Routing Version",
					"type" : "text",
					"defaultVal" : "2"
				}
			}
		}


};
