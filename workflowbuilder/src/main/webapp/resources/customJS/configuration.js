var nodeConfigurationNotAddedError = "Error:Please define nodes configuration on configuration file for corresponding node type";

var nodesConfiguration = {
	"circle" : {
		"image" : "circle",
		"header" : "Action Configuration",
		"helpText" :"The Start node can have only one outgoing connection. This node is the initiator node",
		"properties" : {
			"name" : {
				"label" : "Name*",
				"type" : "text",
				"edit" : "Yes",
				"required" : "Yes",
				"message" : "Name is required.",
				"helpText" : "Define the name"
			},
			"mandatoryRoute" : {
				"label" : "Mandatory Route",
				"type" : "radio",
				"options" : [ "true", "false" ],
				"helpText" : "Define the mandatory Route"
			},
			"activationType" : {
				"label" : "Activation Type",
				"type" : "select",
				"options" : [ "Parallel", "Serial" ],
				"helpText" : "Define the activation Type"
			},
			"finalApproval" : {
				"label" : "Final Approval",
				"type" : "radio",
				"options" : [ "true", "false" ],
				"helpText" : "Define the final approval"
			}

		}
	},
	"rectangle" : {
		"image" : "rectangle",
		"header" : "Action Configuration",
		"helpText":"The Request node can have one incoming connection and one outgoing connection. This node contains the mandatory route and the target final approval",
		"properties" : {
			"name" : {
				"label" : "Name*",
				"type" : "text",
				"edit" : "Yes",
				"required" : "Yes",
				"message" : "Name is required.",
				"helpText" : "Define the name"
			},
			"activationType" : {
				"label" : "Activation Type",
				"type" : "select",
				"options" : [ "Parallel", "Serial" ],
				"helpText" : "Define the activation Type"
			},
			"mandatoryRoute" : {
				"label" : "Mandatory Route",
				"type" : "radio",
				"options" : [ "true", "false" ],
				"helpText" : "Define the mandatory route"
			},
			"ruleTemplate" : {
				"label" : "Rule Template",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Define the rule template"
			},
			"finalApproval" : {
				"label" : "Final Approval",
				"type" : "radio",
				"options" : [ "true", "false" ],
				"helpText" : "Define the final approval"
			}

		}
	},
	"square" : {
		"image" : "square",
		"header" : "Test.Submission.Email",
		"helpText":"The Email node can have one incoming connection and one outgoing connection. This node contains the source and the target email address",
		"properties" : {
			"name" : {
				"label" : "Name*",
				"type" : "text",
				"edit" : "Yes",
				"required" : "Yes",
				"message" : "Name is required.",
				"helpText" : "Define the name"
			},
			"from" : {
				"label" : "From",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Define the senders email address"
			},
			"to" : {
				"label" : "To",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Define the recipients email address"
			},
			"testAddress" : {
				"label" : "Test Address",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Define the test email address"
			},
			"style" : {
				"label" : "Style",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Define the style"
			},
			"type" : {
				"label" : "Type",
				"type" : "text",
				"edit" : "No",
				"helpText" : "Defines the type"
			}
		}
	},

	"oval" : {
		"image" : "oval",
		"header" : "Simple Node",
		"helpText":"The Simple node can have one incoming connection and one outgoing connection. This node contains the mandatory route and the target final approval",
		"properties" : {
			"name" : {
				"label" : "Name*",
				"type" : "text",
				"edit" : "Yes",
				"required" : "Yes",
				"message" : "Name is required.",
				"helpText" : "Define the name"
			},
			"type" : {
				"label" : "Type",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Define the type"
			}
		}
	},

	"rectangleCoral" : {
		"image" : "rectangleCoral",
		"header" : "Role Based Routing",
		"helpText":"The Role node can have one incoming connection and one outgoing connection. This node contains the type and style",
		"properties" : {
			"name" : {
				"label" : "Name*",
				"type" : "text",
				"edit" : "Yes",
				"required" : "Yes",
				"message" : "Name is required.",
				"helpText" : "Define the name"
			},
			"qualifierResolverClass" : {
				"label" : "Qualifier Resolver Class",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Define the Qualifier Resolver Class"
			},
			"activationType" : {
				"label" : "Activation Type",
				"type" : "select",
				"options" : [ "Parallel", "Serial" ],
				"helpText" : "Define the activation type"
				
			}

		}
	},
	"ovalMagenta" : {
		"image" : "ovalMagenta",
		"header" : "NoOp",
		"helpText":"The NoOp node can have one incoming connection and one outgoing connection. This node contains only a name and a type",
		"properties" : {
			"name" : {
				"label" : "Name*",
				"type" : "text",
				"edit" : "Yes",
				"required" : "Yes",
				"message" : "Name is required.",
				"helpText" : "Define the name"
			},
			"type" : {
				"label" : "Type",
				"type" : "text",
				"defaultVal" : "org.kuali.rice.kew.engine.node.NoOpNode",
				"edit" : "No",
				"helpText" : "Define the type"
			}
		}

	},
	
	"configure" : {
		"image" : "configure",
		"header" : "Workflow Configuration",
		"properties" : {
			"name" : {
				"label" : "Name*",
				"type" : "text",
				"edit" : "Yes",
				"required" : "Yes",
				"message" : "Name is required.",
				"helpText" : "Name is a mandatory field. It is required to be filled. This defines the name"
			},
			"parent" : {
				"label" : "Parent",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Define the parent for the workspace"
			},
			"description" : {
				"label" : "Description",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Give a description for your workspace"
			},
			"label" : {
				"label" : "Label",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Label is used to give a label for the configuration xml"
			},
			"postProcessor" : {
				"label" : "Post Processor",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Define the post Processor for the workspace"
			},
			"blanketApprovePolicy" : {
				"label" : "Blanket Approve Policy",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "blanket Approve Policy needs to be given"
			},
			"defaultExceptionGroup " : {
				"label" : "Default Exception Group",
				"label_group":"Default Exception Group",
				"label_nameSpace":"Default Exception Group Name Space",
				"type" : "textSelect",
				"options" : [ "KUALI" ],
				"helpText" : "States the default Exception Group for the workspace"
			},
			"reportingGroup " : {
				"label" : "Reporting Group",
				"label_group":"Reporting Group",
				"label_nameSpace":"Reporting Group Name Space",
				"type" : "textSelect",
				"options" : [ "KUALI" ],
				"helpText" : "States the Reporting Group for the workspace"
			},
			"superUserGroup " : {
				"label" : "Super User Group",
				"label_group":"Super User Group",
				"label_nameSpace":"Super User Group Name Space",
				"type" : "textSelect",
				"options" : [ "KUALI" ],
				"helpText" : "States the Super User Group for the workspace"
			},
			"docHandler" : {
				"label" : "Doc Handler",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Define the doc Handler for the workspace"
			},
			"policies" : {
				"label" : "Policies",
				"label_policy":"List Of Policy",
				"label_value":"Policy Flag",
				"type" : "selectRadio",
				"selectOptions" : [ "DEFAULT_APPROVE", "DEFAULT_REQUEST" ],
				"radioOptions" : [ "true", "false" ],
				"helpText" : "Select the policies and its flag for the workspace"
			},
			"active" : {

					"label" : "Active",
					"type" : "radio",
					"options" : [ "true", "false" ],
					"helpText" : "Define the active field for the workspace"

			},
			"routingVersion" : {
				"label" : "Routing Version",
				"type" : "text",
				"defaultVal" : "2",
				"edit" : "No",
				"helpText" : "This is a non editable field"
			}
		}
	}


};
