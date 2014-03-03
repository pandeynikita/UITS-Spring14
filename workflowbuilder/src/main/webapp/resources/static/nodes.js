var nodes = [ {
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
		}
	}
},

{
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
			"type" : "text",
			"defaultVal" : "value default"
		}
	}
}

];

var configNodes = [ {
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
			"options" : [ "Yes", "No" ],
		},
		"routingVersion" : {
				"label" : "Routing Version",
				"type" : "text",
				"defaultVal" : "2"
		}
		}
	}
];
