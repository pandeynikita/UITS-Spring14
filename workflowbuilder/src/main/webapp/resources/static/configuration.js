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
					"options" : [ "True", "False" ]
				},
				"activationType" : {
					"label" : "Activation Type",
					"type" : "select",
					"options" : [ "Parallel", "serial" ]
				},
				"finalApproval":{
					"label": "Final Approval",
					"type" : "radio",
					"options":["True", "False"]
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
					"options" : [ "True", "False" ]
				},
				"ruleTemplate":{
					"label":"Rule Template",
					"type":"text",
					"edit" : "Yes"
				},
				"finalApproval":{
					"label": "Final Approval",
					"type" : "radio",
					"options":["True", "False"]
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
				"from" : {
					"label" : "From",
					"type" : "text",
					"defaultVal" : "jawbenne@iu.edu",
					"edit" : "Yes"
				},
				"to" : {
					"label" : "From",
					"type" : "text",
					"defaultVal" : "npandey@indiana.edu",
					"edit" : "Yes"
				},
				"testAddress" : {
					"label" : "Test Address",
					"type" : "text",
					"defaultVal" : "jawbenne@iu.edu",
					"edit" : "Yes"
				},
				"style" : {
					"label" : "Style",
					"type" : "text",
					"defaultVal" : "Test.Admin.Approval.Email",
					"edit" : "Yes"
				},
				"type":{
					"label":"Type",
					"type":"text",
					"defaultVal": "org.kuali.rice.kew.mail.EmailNode",
					"edit" : "Yes"
				}
			}
		},
		
		"rectangleCoral":{
			"name" : "requests",
			"image": "rect",
			"header":"Role Based Routing",
			"properties":{
				"qualifierResolverClass":{
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
					"edit" : "Yes"
				},
				"parent" : {
					"label" : "Parent",
					"type" : "text",
					"edit" : "Yes"
				},
				"description" : {
					"label" : "Description",
					"type" : "text",
					"edit" : "Yes"
				},
				"label" : {
					"label" : "Label",
					"type" : "text",
					"edit" : "Yes"
				},
				"postProcessorName" : {
					"label" : "Post Processor Name",
					"type" : "text",
					"edit" : "Yes"
				},
				"superUserGroupName" : {
					"label" : "Super User Group Name",
					"type" : "text",
					"edit" : "Yes"
				},
				"blanketApprovePolicy" : {
					"label" : "Blanket Approve Policy",
					"type" : "text",
					"edit" : "Yes"
				},
				"reportingGroupName" : {
					"label" : "Reporting Group Name",
					"type" : "text",
					"edit" : "Yes"
				},
				"defaultExceptionGroupName " : {
					"label" : "Default Exception Group Name",
					"type" : "text",
					"edit" : "Yes"
				},
				"docHandler" : {
					"label" : "Document Handler",
					"type" : "text",
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
