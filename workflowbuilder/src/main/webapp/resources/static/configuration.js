var nodeConfigurationNotAddedError = "Error:Please define nodes configuration on configuration file for corresponding node type";

var nodesConfiguration = {
		"circle" : {
			"name" : "requests",
			"image" : "circle",
			"header" : "Action Configuration",
			"properties" : {
				"name" : {
					"label" : "Name",
					"type" : "text",
					"edit" : "Yes"
				},
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
				"finalApproval" : {
					"label" : "Final Approval",
					"type" : "radio",
					"options" : [ "True", "False" ]
				}

			}
		},
		"rectangle" : {
			"name" : "requests",
			"image" : "rectangle",
			"header" : "Action Configuration",
			"properties" : {
				"name" : {
					"label" : "Name",
					"type" : "text",
					"edit" : "Yes"
				},

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
				"ruleTemplate" : {
					"label" : "Rule Template",
					"type" : "text",
					"edit" : "Yes"
				},
				"finalApproval" : {
					"label" : "Final Approval",
					"type" : "radio",
					"options" : [ "True", "False" ]
				}

			}
		},
		"square" : {
			"name" : "requests",
			"image" : "square",
			"header" : "Test.Submission.Email",
			"properties" : {
				"name" : {
					"label" : "Name",
					"type" : "text",
					"edit" : "Yes"
				},
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
					"defaultVal" : "jawbenne@iu.edu",
					"edit" : "Yes"
				},
				"style" : {
					"label" : "Style",
					"type" : "text",
					"defaultVal" : "Test.Admin.Approval.Email",
					"edit" : "Yes"
				},
				"type" : {
					"label" : "Type",
					"type" : "text",
					"defaultVal" : "org.kuali.rice.kew.mail.EmailNode",
					"edit" : "No"
				}
			}
		},

		"oval" : {
			"name" : "requests",
			"image" : "oval",
			"header" : "Simple Node",
			"properties" : {
				"name":{
					"label": "Name",
					"type":"text",
					"edit" : "Yes"
				},
				"from" : {
					"label" : "From",
					"type" : "text",
					"defaultVal" : "jawbenne@iu.edu",
					"edit" : "Yes"
				},
				"to" : {
					"label" : "To",
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
				"type" : {
					"label" : "Type",
					"type" : "text",
					"defaultVal" : "org.kuali.rice.kew.mail.EmailNode",
					"edit" : "Yes"
				}
			}
		},

		"rectangleCoral" : {
			"name" : "requests",
			"image" : "rectangleCoral",
			"header" : "Role Based Routing",
			"properties" : {
				"name":{
					"label": "Name",
					"type":"text",
					"edit" : "Yes"
				},
				"qualifierResolverClass" : {
					"label" : "Qualifier Resolver Class",
					"type" : "text",
					"edit" : "Yes"
				},
				"activationType" : {
					"label" : "Activation Type",
					"type" : "select",
					"options" : [ "Parallel", "serial" ]
				}

			}
		},
		"ovalMagenta":{
			"name" : "requests",
			"image" : "ovalMagenta",
			"header" : "NoOp",
			"properties" : {
				"name" : {
					"label" : "Name",
					"type" : "text",
					"edit" : "Yes"
				},
				"type" : {
					"label" : "Type",
					"type" : "text",
					"defaultVal" : "org.kuali.rice.kew.engine.node.NoOpNode",
					"edit" : "No"
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
				"postProcessor" : {
					"label" : "Post Processor",
					"type" : "text",
					"edit" : "Yes"
				},
				"superUserGroup" : {
					"label" : "Super User Group",
					"type" : "text",
					"edit" : "Yes"
				},
				"blanketApprovePolicy" : {
					"label" : "Blanket Approve Policy",
					"type" : "text",
					"edit" : "Yes"
				},
				"reportingGroup" : {
					"label" : "Reporting Group",
					"type" : "text",
					"edit" : "Yes"
				},
				"defaultExceptionGroup " : {
					"label" : "Default Exception Group",
					"type" : "text",
					"edit" : "Yes"
				},
				"docHandler" : {
					"label" : "Doc Handler",
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
				},
				"nameSpace" :{
					"label"	:	"Name Space",
					"type"	:	"select",
					"options" : ["KAULI"]
				}
			}
		}

};
