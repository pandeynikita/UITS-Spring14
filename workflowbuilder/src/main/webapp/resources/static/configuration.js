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
				"options" : [ "Parallel", "serial" ],
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
				"options" : [ "Parallel", "serial" ],
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
				"options" : [ "Parallel", "serial" ],
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
					"message" : "Name is required."
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
				"policy" : {
					"label" : "Policy",
					"type" : "multiSelect",
					"options" : [ "Default_Approve", "Default_Request" ]
				},
				"routingVersion" : {
					"label" : "Routing Version",
					"type" : "text",
					"defaultVal" : "2",
					"edit" : "No"
				},
				"nameSpace" :{
					"label"	:	"Name Space*",
					"type"	:	"select",
					"options" : ["KUALI"],
					"required" : "Yes",
					"message" : "Name Space is required."
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
			"superUserGroup" : {
				"label" : "Super User Group",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Define the super User Group for the workspace"
			},
			"blanketApprovePolicy" : {
				"label" : "Blanket Approve Policy",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "blanket Approve Policy needs to be given"
			},
			"reportingGroup" : {
				"label" : "Reporting Group",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Reporting Group for the workspace"
			},
			"defaultExceptionGroup " : {
				"label" : "Default Exception Group",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "States the default Exception Group for the workspace"
			},
			"docHandler" : {
				"label" : "Doc Handler",
				"type" : "text",
				"edit" : "Yes",
				"helpText" : "Define the doc Handler for the workspace"
			},
			"active" : {
				"label" : "Active",
				"type" : "radio",
				"options" : [ "True", "False" ],
				"helpText" : "Choose the  the workspace to be active or not"
			},
			"routingVersion" : {
				"label" : "Routing Version",
				"type" : "text",
				"defaultVal" : "2",
				"edit" : "No",
				"helpText" : "This is a non editable field"
			},
			"nameSpace" : {
				"label" : "Name Space*",
				"type" : "select",
				"options" : [ "KUALI" ],
				"required" : "Yes",
				"message" : "Name Space is required.",
				"helpText" : "Define the namespace for the workspace"

			}
		}
	}
	

};
