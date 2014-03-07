angular.module('angularJs',['ui.bootstrap']);
var ModalDemoCtrl = function($scope,$modal){
	$scope.dataStorage = null;
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

	$scope.open = function (image) {
		var modalInstance = $modal.open({
			templateUrl: 'myModalContent.html',
			controller: ModalInstanceCtrl,
			resolve: {
				localParameter: function(){
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
var ModalInstanceCtrl = function ($scope, $modalInstance, localParameter) {
	
	$scope.dataStorage = { radioValue: 'No' };
	$scope.dataStorage.selectValue = 'serial';
	$scope.component = localParameter;
	$scope.properties = $scope.component.properties;
	console.log($scope.dataStorage);
	console.log($scope.properties);
	
	$scope.ok = function () {
		console.log($scope.dataStorage);
		$modalInstance.close(localParameter);
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