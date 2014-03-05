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
}];


var app = angular.module('myApp', []);

/* $http ajax calls really belongs in a service, 
but I'll be using them inside the controller for this demo */ 

app.controller('myCtrl', function($scope, $http) {
  /*$http.get('path/to/json').then(function(data) {
    $scope.config = data;
  });*/
  //inputting json directly for this example
  $scope.config = [ 
			{"label" : "Name",	"type" : "text", "defaultVal" : "RoleBasedRoutingTest.Type"},
			{"label" : "Description","type" : "text","defaultVal" : "Role-based routing test document"},
			{"label" : "Label","type" : "text","defaultVal" : "Role-based Routing Test Document"},
			{"label" : "Post Processor Name","type" : "text","defaultVal" : "org.kuali.rice.edl.framework.workflow.EDocLitePostProcessor"},
			{"label" : "Super User Group Name","type" : "text","defaultVal" : "WorkflowAdmin"},
			{"label" : "Document Handler","type" : "text","defaultVal" : "${workflow.url}/EDocLite"},
			{"label" : "Active","type" : "radio","options" : [ "Yes", "No" ]},
			{"label" : "Routing Version","type" : "text","defaultVal" : "2"}
	];

  $scope.save = function() {
	alert(JSON.stringify($scope.config));
	  $scope.saveConfig = JSON.stringify($scope.config);
	  var config2 = JSON.stringify($scope.config);
	 
  };
});
