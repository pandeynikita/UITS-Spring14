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
					"type":"text",
					"edit" : "Yes"
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
					"defaultVal" : "jawbenne@iu.edu",
					"edit" : "Yes"
				},
				"to" : {
					"label" : "To",
					"type" : "text",
					"defaultVal" : "pacharya@indiana.edu",
					"edit" : "Yes"
				},
				"testAddress" : {
					"label" : "Test Address",
					"type" : "text",
					"edit" : "Yes"
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
					"type":"text",
					"edit" : "Yes"
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
					"type":"text",
					"edit" : "Yes"
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
					"defaultVal" : "Test.RequestDoctype",
					"edit" : "Yes"
				},
				"parent" : {
					"label" : "Parent",
					"type" : "text",
					"defaultVal" : "Test.ParentDoctype",
					"edit" : "Yes"
				},
				"description" : {
					"label" : "Description",
					"type" : "text",
					"defaultVal" : "Test.Request DocumentType",
					"edit" : "Yes"
				},
				"label" : {
					"label" : "Label",
					"type" : "text",
					"defaultVal" : "Test.Request DocumentType",
					"edit" : "Yes"
				},
				"postProcessorName" : {
					"label" : "Post Processor Name",
					"type" : "text",
					"defaultVal" : "org.kuali.rice.edl.framework.workflow.EDocLitePostProcessor",
					"edit" : "Yes"
				},
				"superUserGroupName" : {
					"label" : "Super User Group Name",
					"type" : "text",
					"defaultVal" : "Test.Superusers",
					"edit" : "Yes"
				},
				"blanketApprovePolicy" : {
					"label" : "Blanket Approve Policy",
					"type" : "text",
					"defaultVal" : "NONE",
					"edit" : "Yes"
				},
				"reportingGroupName" : {
					"label" : "Reporting Group Name",
					"type" : "text",
					"defaultVal" : "Test.Reporting.Workgroup",
					"edit" : "Yes"
				},
				"defaultExceptionGroupName " : {
					"label" : "Default Exception Group Name ",
					"type" : "text",
					"defaultVal" : "Test.Superusers",
					"edit" : "Yes"
				},
				"docHandler" : {
					"label" : "Document Handler",
					"type" : "text",
					"defaultVal" : "${workflow.url}/EDocLite",
					"edit" : "Yes"
				},
				"active" : {
					"label" : "Active",
					"type" : "radio",
					"options" : [ "True", "False" ]
				},
				"routingVersion" : {
					"label" : "Routing Version",
					"type" : "text",
					"defaultVal" : "2",
					"edit" : "No"
				}
			}
		}


};
