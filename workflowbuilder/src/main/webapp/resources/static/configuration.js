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
				}
			}
		},
		"rectangle" :{
			"name" : "requests",
			"image" : "rectangle",
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
		"square":{
			"name" : "requests",
			"image" : "square",
			"header" : "Action Configuration",
			"properties" : {
				"from": {
					"label": "From",
					"type": "email"
				},
				"to": {
					"label": "To",
					"type": "email"
				}
			}
		}
};
