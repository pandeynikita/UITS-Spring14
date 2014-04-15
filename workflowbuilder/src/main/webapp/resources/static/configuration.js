var nodeConfigurationNotAddedError = "Error:Please define nodes configuration on configuration file for corresponding node type";

var nodesConfiguration = {
	"circle" : {
		"name" : "requests",
		"image" : "circle",
		"header" : "Action Configuration",
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
				"options" : [ "True", "False" ],
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
				"options" : [ "True", "False" ],
				"helpText" : "Define the final approval"
			}

		}
	},
	"rectangle" : {
		"name" : "requests",
		"image" : "rectangle",
		"header" : "Action Configuration",
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
				"options" : [ "True", "False" ],
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
				"options" : [ "True", "False" ],
				"helpText" : "Define the final approval"
			}

		}
	},
	"square" : {
		"name" : "requests",
		"image" : "square",
		"header" : "Test.Submission.Email",
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
				"defaultVal" : "jawbenne@iu.edu",
				"edit" : "Yes",
				"helpText" : "Define the senders email address"
			},
			"to" : {
				"label" : "To",
				"type" : "text",
				"defaultVal" : "pacharya@indiana.edu",
				"edit" : "Yes",
				"helpText" : "Define the recipients email address"
			},
			"testAddress" : {
				"label" : "Test Address",
				"type" : "text",
				"defaultVal" : "jawbenne@iu.edu",
				"edit" : "Yes",
				"helpText" : "Define the test email address"
			},
			"style" : {
				"label" : "Style",
				"type" : "text",
				"defaultVal" : "Test.Admin.Approval.Email",
				"edit" : "Yes",
				"helpText" : "Define the style"
			},
			"type" : {
				"label" : "Type",
				"type" : "text",
				"defaultVal" : "org.kuali.rice.kew.mail.EmailNode",
				"edit" : "No",
				"helpText" : "Defines the type"
			}
		}
	},

	"oval" : {
		"name" : "requests",
		"image" : "oval",
		"header" : "Simple Node",
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
				"defaultVal" : "jawbenne@iu.edu",
				"edit" : "Yes",
				"helpText" : "Define the senders email address"
			},
			"to" : {
				"label" : "To",
				"type" : "text",
				"defaultVal" : "npandey@indiana.edu",
				"edit" : "Yes",
				"helpText" : "Define the recipients email address"
			},
			"testAddress" : {
				"label" : "Test Address",
				"type" : "text",
				"defaultVal" : "jawbenne@iu.edu",
				"edit" : "Yes",
				"helpText" : "Define the test email address"
			},
			"style" : {
				"label" : "Style",
				"type" : "text",
				"defaultVal" : "Test.Admin.Approval.Email",
				"edit" : "Yes",
				"helpText" : "Define the style"
			},
			"type" : {
				"label" : "Type",
				"type" : "text",
				"defaultVal" : "org.kuali.rice.kew.mail.EmailNode",
				"edit" : "Yes",
				"helpText" : "Define the type"
			}
		}
	},

	"rectangleCoral" : {
		"name" : "requests",
		"image" : "rectangleCoral",
		"header" : "Role Based Routing",
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
		"name" : "requests",
		"image" : "ovalMagenta",
		"header" : "NoOp",
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
				"radioOptions" : [ "True", "False" ]				
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
