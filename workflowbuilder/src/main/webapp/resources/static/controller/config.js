angular.module('angularJs',['ui.bootstrap']);
var ModalDemoCtrl = function($scope,$modal){
	$scope.items = ['item1', 'item2', 'item3'];
	$scope.nodes = {
			"circle":{
				"image": "circle", 
				"name": "requests",
				"header": "Action Configuration",
				"properties": {
					"mandatoryRoute": {
						"label": "Mandatory Route",
						"type": "radio",
						"options": [
						            "Yes",
						            "No"
						            ]
					},
                  "activationType": {
                    "label": "Activation Type",
                    "type": "select",
                    "options": [
                      "Parallel",
                      "serial"
                    ]
                  },
                  "From": {
                      "label": "From",
                      "type": "email"
                  },
                  "To": {
                      "label": "To",
                      "type": "email"
                  }
				}
			}
	};

	$scope.setDynamicTest = function(image){
		$scope.test = $scope.nodes[image];
	};

	$scope.component = null;
	$scope.property = null;
	$scope.open = function (image) {
		var modalInstance = $modal.open({
			templateUrl: 'myModalContent.html',
			controller: ModalInstanceCtrl,
			resolve: {
				parameter: function(){
					return $scope.nodes[image];
				}
			}
		});

		modalInstance.result.then(function (string) {
			
			console.log("Modal:"+string+" has been pressed");
		}, function (string) {
			console.log("Modal:"+string+" has been pressed");
		});
	};

};
var ModalInstanceCtrl = function ($scope, $modalInstance, parameter) {
	
	$scope.test = "Yes";
	$scope.select = "serial";
	$scope.component = parameter;
	$scope.properties = $scope.component.properties;
	console.log($scope.properties);
	$scope.ok = function () {
		$modalInstance.close(parameter);
	};

	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	};
	
	$scope.isRadioType= function(property) {
		if(property.type =="radio"){
			return true;
		} else {
			return false;
		}
	};
	$scope.isTextType= function(property) {
		if(property.type =="text"){
			return true;
		} else {
			return false;
		}
	};
	$scope.isSelectType= function(property) {
		if(property.type =="select"){
			return true;
		} else {
			return false;
		}
	};
	$scope.isEmailType= function(property) {
		if(property.type =="email"){
			return true;
		} else {
			return false;
		}
	};
};