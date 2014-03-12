angular.module('workFlowBuilder',['ui.bootstrap']);
var ModalDemoCtrl = function($scope,$modal){
//	Master json storage, which will have unique div 
//	idOfDiv as key and its properties values
	//INITIALIZATION
	$scope.jsonData = {};
	/*	{ $scope.jsonData = {
	 * 			"divId1": object,
	 * 			"divId2": object};
	 */

//	Need to be stored in a seperate file and assign it to this variable
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
					"from": {
						"label": "From",
						"type": "email"
					},
					"to": {
						"label": "To",
						"type": "email"
					}
				}
			},
			"rectangle":{
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
	
	$scope.test = function(){
		
		alert("Inside Test");
		
	};

//	On double clicking on each components which are in drop-area
//	this function will be called
//	IMPORTANT UPDATE ORIGINAL condition to avoid tool box accessing
	$scope.open = function (image,event) {

//		Retrieve element of the invoking object through angular event
//		Get id attribute from the retrieved element
		//INITIALIZATION
		var element = angular.element(event.srcElement);
		var idOfDiv = ($(element).attr("id"));

//		the $modal service has only one method: open(options)
//		templateUrl - a path to a template representing modal's content
//		a controller for a modal instance - it can initialize scope used by modal.
//		A controller can be injected with $modalInstance
//		members that will be resolved and passed to the controller as locals;
		var modalInstance = $modal.open({
			templateUrl: 'myModalContent.html',
			controller: ModalInstanceCtrl,
			resolve: {
				localParameter: function(){
					//Checking whether current div element has stored data or not
					//If the id has some value then set the flag to true, else false
					if($scope.jsonData.hasOwnProperty(idOfDiv)){
						alreadyPresentFlag = true;
					} else {
						alreadyPresentFlag = false;
					}
					return {
						//Pass this four values as json to modal controller
						"selectedNode":$scope.nodes[image],	//Current Node which we are dealling
						"alreadyPresent":alreadyPresentFlag,//Data already present or not
						"data":$scope.jsonData,				//Master storage- jsonData
						"idOfDiv":idOfDiv								//Id of the current div element, which is the key for jsonData
					};
				}
			}
		});

		//On click of save or close button, result will be called
		//perform all house keeping tasks here
		modalInstance.result.then(function (objectNeedToBeStored) {
			//Called when, save is pressed
			$scope.jsonData[idOfDiv]= objectNeedToBeStored;
			console.log("Modal:Save has been pressed");
		}, function (string) {
			//Called when, cancel is pressed
			console.log("Modal:cancel has been pressed");
		});
	};

};

//ModalController will be called by modal with local parameter and $modalInstance
//$scope will be applicable only for this controller
var ModalInstanceCtrl = function ($scope, $modalInstance, localParameter) {
	//$scope.dataStorage will be two-way binding json, initially it will be empty 
	//but, will be populated by the dynamic modal with keys as property -> label
	//and value as the value we type.
	//INITIALIZATION
	$scope.dataStorage = {};
	$scope.component = localParameter.selectedNode;
	localJsonData = localParameter.data;//
	idOfDiv = localParameter.idOfDiv;
	$scope.properties = $scope.component.properties;

	//Check, whether the data is already present in the system
	//if so, please update those values through two way binding of angular
	//else leave those feild blank
	if(localParameter.alreadyPresent){
		$.each($scope.properties, function(key, value) {
			label = $scope.properties[key].label;
			$scope.dataStorage[label] = localJsonData[idOfDiv][label];
		});
	}

	//On click of save, this function will called and it returns with 
	//updated/new dataStorage field
	$scope.save = function () {
		$modalInstance.close($scope.dataStorage);
	};

	//On click of cancel, this function will called
	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	};

	//Checking whether the input type is radio, if so return true
	$scope.isRadioType= function(property) {
		if(property.type =="radio"){
			return true;
		} else {
			return false;
		}
	};

	//Checking whether the input type is text, if so return true
	$scope.isTextType= function(property) {
		if(property.type =="text"){
			return true;
		} else {
			return false;
		}
	};

	//Checking whether the input type is select, if so return true
	$scope.isSelectType= function(property) {
		if(property.type =="select"){
			return true;
		} else {
			return false;
		}
	};
	//Checking whether the input type is email, if so return true
	$scope.isEmailType= function(property) {
		if(property.type =="email"){
			return true;
		} else {
			return false;
		}
	};
};
