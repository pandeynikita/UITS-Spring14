angular.module('workFlowBuilder',['ui.bootstrap']);
var angularModalCtrl = function($scope,$modal,$http){
//	Master json storage, which will have unique div 
//	idOfDiv as key and its properties values
	//INITIALIZATION
	$scope.jsonData = {};
	/*	{ $scope.jsonData = {
	 * 			"divId1": object,
	 * 			"divId2": object};
	 */

//	Need to be stored in a seperate file and assign it to this variable
	$scope.nodes = null;

	//Testing to check how apply can be used in our project, Test will be called 
	//by jquery event handler.
	//$apply is to access angular funciton from other functions
	$scope.angularOpenFunction = function(image,idOfDiv,nodesConfiguration){
		$scope.$apply(function(){
			$scope.open(image,idOfDiv,nodesConfiguration);
		});

	};

	$scope.angularExportFunction = function(routePath){
		$scope.$apply(function(){
			$scope.angularExport(routePath);
		});
	};


//	On double clicking on each components which are in drop-area
//	this function will be called
//	IMPORTANT UPDATE ORIGINAL condition to avoid tool box accessing
	$scope.open = function (image,idOfDiv,nodesConfiguration) {
		$scope.nodes = nodesConfiguration;

//		the $modal service has only one method: open(options)
//		templateUrl - a path to a template representing modal's content
//		a controller for a modal instance - it can initialize scope used by modal.
//		A controller can be injected with $modalInstance
//		members that will be resolved and passed to the controller as locals;
		var modalInstance = $modal.open({
			templateUrl: 'dynamicModalContent.html',
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
						"idOfDiv":idOfDiv,					//Id of the current div element, which is the key for jsonData
						"image":image						//Used to customize the input for server
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
	//Example for Ajax post for JSON
	$scope.angularExport= function(routePath){
		console.log(routePath);
//		Add next nodes to $scope.jsonData to process the server side object
		addNextNodeToClientSideData($scope.jsonData,routePath);
		var serverSideInputData = customizeTheJsonDataForServerSide($scope.jsonData);
		var responsePromise = $http.post(
				"export.htm",
				JSON.stringify(
						serverSideInputData
				));
		responsePromise.success(function(data,status,headers,config){
			console.log(status);
		});
		responsePromise.error(function(data,status,headers,config){
			console.log(status+" "+data);
		});
	};
	
	var addNextNodeToClientSideData = function(clientSideJsonData){
		angular.forEach(clientSideJsonData, function(value, key){
			console.log(key);
		});
	};
	
	
	
	
	var customizeTheJsonDataForServerSide = function(clientSideJsonData){
//		Defining server side pojo structure
//		{
//			configurationDetails : values,
//			routeNodes{
//				start : arrayOfStartObject,
//				request : arrayOfrequestsObject,
//				simple : arrayOfSimpleObject
//			}
//		}
		
		var generatedServerSideJsonData = {};
		var routeNodes 	= {};
		var routePath 	= {};
		var routePaths = {"routePath":routePath};
		
		//Nodes Array
		var startNodes = new Array();
		var requestsNodes = new Array();
		var simpleNodes = new Array();
		
		//Paths Array
		var startPaths = new Array();
		var requestsPaths = new Array();
		var simplePaths = new Array();
		
		//Assigning values to routeNodes
		routeNodes["start"] = startNodes;
		routeNodes["requests"] = requestsNodes;
		routeNodes["simple"] = simpleNodes;
		
		//Assigning values to routePaths
		routePath["start"] = startPaths;
		routePath["requests"] = requestsPaths;
		routePath["simple"] = simplePaths;
		
		generatedServerSideJsonData["routeNodes"]= routeNodes;
		generatedServerSideJsonData["routePaths"]= routePaths;
		
		//Predefined example for input values
		var serverSideJsonData ={};
		if(clientSideJsonData["configurationId"]){
			serverSideJsonData["parent"] = clientSideJsonData["configurationId"]["Parent"];
			serverSideJsonData["name"] = clientSideJsonData["configurationId"]["Name"];
			serverSideJsonData["description"] = clientSideJsonData["configurationId"]["Description"];
			serverSideJsonData["label"] = clientSideJsonData["configurationId"]["Label"];
			serverSideJsonData["postProcessorName"] = clientSideJsonData["configurationId"]["Post Processor Name"];
			serverSideJsonData["superUserGroupName"] = clientSideJsonData["configurationId"]["Super User Group Name"];
			serverSideJsonData["blanketApprovePolicy"] = clientSideJsonData["configurationId"]["Blanket Approve Policy"];
			serverSideJsonData["reportingGroupName"] = clientSideJsonData["configurationId"]["Reporting Group Name"];
			serverSideJsonData["defaultExceptionGroupName"] = clientSideJsonData["configurationId"]["Default Exception Group Name"];
			serverSideJsonData["docHandler"] = clientSideJsonData["configurationId"]["Document Handler"];
			serverSideJsonData["active"] = clientSideJsonData["configurationId"]["Active"];
			serverSideJsonData["routingVersion"] = clientSideJsonData["configurationId"]["Routing Version"];
			serverSideJsonData["routePaths"] = {routePath:{
					start:[{
						name:"Initiated",
						nextNode:"Test.Submission.Email"
					}],
					requests:[{
						name:"Test.NetId",
						nextNode:"Test.Supervisor.Approval.Email"
					},{
						name:"Test.Request.Supervisor",
						nextNode:"Test.Admin.Approval.Email"
					}],
					simple:[{
						name:"Test.Submission.Email",
						nextNode:"Test.NetId"
					},{
						name:"Test.Supervisor.Approval.Email",
						nextNode:"Test.Request.Supervisor"
					},{
						name:"Test.Admin.Approval.Email" 
					}]
			}};
			serverSideJsonData["routeNodes"] = {
					start:[{
						name:"Initiated",
						activationType:"P",
						mandatoryRoute:"false",
						finalApproval:"false"
					}],
					requests:[{
						name:"Test.NetId",
						activationType:"P",
						ruleTemplate:"Test.NetId",
						mandatoryRoute:"false",
						finalApproval:"false"
					},{
						name:"Test.Request.Supervisor",
						activationType:"P",
						ruleTemplate:"Test.Request.Supervisor",
						mandatoryRoute:"false",
						finalApproval:"true"
					}],
					simple:[{
						name:"Test.Submission.Email",
						from:"jawbenne@iu.edu",
						to:"initiator",
						testAddress:"jawbenne@iu.edu",
						style:"Test.Submission.Email",
						type:"org.kuali.rice.kew.mail.EmailNode"
					},{
						name:"Test.Supervisor.Approval.Email",
						from:"jawbenne@iu.edu",
						to:"initiator",
						testAddress:"jawbenne@iu.edu",
						style:"Test.Supervisor.Approval.Email",
						type:"org.kuali.rice.kew.mail.EmailNode"
					}]
			};
		} else {
			console.log("ERROR:Configure need to added before pressing export");
		}
		angular.forEach(clientSideJsonData, function(value, key){
			var nodeType = clientSideJsonData[key]["image"];
			var generatedObject = generateServerSideObject(clientSideJsonData[key]);
			if(nodeType == "configure"){
				angular.forEach(generatedObject, function(configureValue, configureKey){
					generatedServerSideJsonData[configureKey] = configureValue;
				});
			} else if (nodeType == "circle"){
				startNodes.push(generatedObject);
			} else if (nodeType == "rectangle"){
				requestsNodes.push(generatedObject);
			} 
		});
//		generatedObject = generateServerSideObject({"Test Test":"value", "Mandatory Route":"excape"});
//		console.log(generatedObject);
		console.log("Need to be like this");
		console.log(serverSideJsonData);
		console.log("Currently, like this");
		console.log(generatedServerSideJsonData);
		return serverSideJsonData;
	};
	
//	This function generates the server required object
//	This function takes json object as input and converts into 
//	pojo based input
//	input :{
//		"Mandatory Route" 	: "true",
//		"Final Approval"	: "true",
//		"image"				: "circle"
//	} and convert it into
//	output :{
//		"mandatoryRoute" 	: "true",
//		"finalApproval"		: "true"
//	}
	var generateServerSideObject = function(jsonObject){
		var newJsonObject = {};
		angular.forEach(jsonObject, function(value, key){
			if(key != "image"){
				var newKey = generateKey(key);
				newJsonObject[newKey] = value;
			}
		});
		return newJsonObject;
	};
	
//	This funciton generates key by removing spaces between them
//	and makes the first letter of the key as small
//	input = "Mandatory Route"
//	output = "mandatoryRoute"
	var generateKey = function(key){
		var newKey ="";
		var splitKey = key.split(" ");
		angular.forEach(splitKey, function(word,index){
			if(index == 0){
				word = word.toLowerCase();
			}
			newKey = newKey + word;
		});
		return newKey;
	};
};

//ModalController will be called by modal with local parameter and $modalInstance
//$scope will be applicable only for this controller
var ModalInstanceCtrl = function ($scope, $modalInstance, localParameter) {
	//$scope.dataStorage will be two-way binding json, initially it will be empty 
	//but, will be populated by the dynamic modal with keys as property -> label
	//and value as the value we type.
	//INITIALIZATION
	$scope.dataStorage 	= {};
	$scope.component 	= localParameter.selectedNode;
	localJsonData 		= localParameter.data;
	idOfDiv 			= localParameter.idOfDiv;
	image 				= localParameter.image; 
	$scope.properties = $scope.component.properties;


	//Check, whether the data is already present in the system
	//if so, please update those values through two way binding of angular
	//else check if it has any default values display those else leave those field blank
	if(localParameter.alreadyPresent){
		$.each($scope.properties, function(key, value) {
			label = $scope.properties[key].label;
			$scope.dataStorage[label] = localJsonData[idOfDiv][label];
		});
	} else {
		$scope.dataStorage["image"] = image;
		$.each($scope.properties, function(key, value) {
			if($scope.properties[key].defaultVal){
				label = $scope.properties[key].label;
				$scope.dataStorage[label]=$scope.properties[key].defaultVal;
			}
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

	//Checking whether the input type is email, if so return true
	$scope.isEditable= function(property) {
		if(property.edit =="Yes"){
			return true;
		} else {
			return false;
		}
	};
};


