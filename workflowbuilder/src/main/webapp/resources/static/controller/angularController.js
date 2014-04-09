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
	var configureKey = "configure";

//	Error messages:
	var configurationMissingError		= "ERROR: We cant export workflow as configuration of your workflow node are missing, Please add configuration for all dropped nodes and try again";
	var nodesConnectivityMissingError 	= "ERROR: We cant export workflow as one or more nodes are not connected, Please connect all the nodes and try again";
	var nameSpaceNotFountError			= "ERROR: Please provide namespace in configure, if you are providing value for 'Default Exception Group' or 'Super User Group' or 'Repeating Group'";
	//This function is called 
	//by jquery event handler on click of any components
	//$apply is to access angular funciton from other functions
	$scope.angularOpenFunction = function(image,idOfDiv,nodesConfiguration){
		$scope.$apply(function(){
			$scope.open(image,idOfDiv,nodesConfiguration);
		});

	};

	$scope.angularExportFunction = function(routePath,droppedArray){

		$scope.$apply(function(){

			var tempArray = new Array();
			var i = 0;
			$.each(routePath, function(key, value){
				tempArray[i++] = key;
				tempArray[i++] = value;		
			});

			var found = false;
			for (var i = 1; i < droppedArray.length; i++) {
				if (tempArray.indexOf(droppedArray[i]) > -1){
					found = true;
				} else {
					found = false;
				}
			}
			if(found == false){
				bootbox.alert(nodesConnectivityMissingError);
			} else {
				if($scope.checkSavedNodeData(droppedArray)){
					$scope.angularExport(routePath);
				} else {
					bootbox.alert(configurationMissingError);
				}
			}
		});
	};

	$scope.checkSavedNodeData = function(droppedArray) {
		for(var i=1; i <= droppedArray.length-1 ; i++){
			if(($scope.jsonData.hasOwnProperty(droppedArray[i])) == false){
				return false;
			}
		}
		return true;
	};

	$scope.deleteSavedData = function(deleteId){
		delete $scope.jsonData[deleteId];
	};

//	On double clicking on each components which are in drop-area
//	this function will be called
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


	$scope.angularExport= function(routePath){
//		Write a validation function to check all the component in div area has some saved data
//		Write a validation function to check all the components in div area are connected. Using JsonData and routePath
//		Add next nodes to $scope.jsonData to process the server side object
//		We will receive a json object of attributes = error and data
//		if there was any error while processing client data, then error flag will be true and data will have error message
//		if there is no error flag set to false then the data will have serverSide data
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
			//Alert need to be added
		});
	};

//	Adding next node to each object if there is any and update 
//	the client side json object
	var addNextNodeToClientSideData = function(clientSideJsonData, routePath){
		var nameField 	= "Name*";
		var nextNode 	= "Next Node"; 
//		1. Traversing through each node object except configure as configure doesn't 
//		have next node.
//		2. Find key of each node object and use the same key onto routePath to find 
//		its next node.
//		3. if the next node is not empty, it has come next node, so proceed for those only
//		4. find the next nodes name from the client side json object
//		5. Create a new field called "Next Node" for each satisfying object and add it

		angular.forEach(clientSideJsonData, function(value, key){
			if(key != configureKey){
				next = routePath[key];
				if(next){
					nameOfNextNode = clientSideJsonData[next][nameField];
					$scope.jsonData[key][nextNode] = nameOfNextNode;
				}
			}
		});
	};



	var customizeTheJsonDataForServerSide = function(clientSideJsonData){
//		Defining server side pojo structure
//		{
//		configurationDetails : values,
//		routeNodes{
//		start : arrayOfStartObject,
//		request : arrayOfrequestsObject,
//		simple : arrayOfSimpleObject
//		}
//		}
		//
		var CIRCLE 			= "circle";
		var RECTANGLE 		= "rectangle";
		var OVAL 			= "oval";
		var SQUARE 			= "square";
		var RECTANGLECORAL  = "rectangleCoral";
		var OVALMAGENTA		= "ovalMagenta";


		var routePathKey 	= "routePath";
		var routeNodeKey 	= "routeNode";
		var routeNodes 		= {};
		var routePath 		= {};
		var routePaths 		= {"routePath":routePath};
		var generatedServerSideJsonData = {};
		var serverSideData = {"documentTypes":{"documentType":generatedServerSideJsonData}};

		//Nodes Array
		var startNodes 		= new Array();
		var requestsNodes 	= new Array();
		var simpleNodes 	= new Array();
		var emailNodes		= new Array();
		var roleNodes		= new Array();

		//Paths Array
		var startPaths 		= new Array();
		var requestsPaths 	= new Array();
		var simplePaths 	= new Array();
		var emailPaths		= new Array();
		var rolePaths		= new Array();

		//Assigning values to routeNodes
		routeNodes["start"] 	= startNodes;
		routeNodes["requests"] 	= requestsNodes;
		routeNodes["simple"] 	= simpleNodes;
		routeNodes["email"] 	= emailNodes;
		routeNodes["role"] 		= roleNodes;

		//Assigning values to routePaths
		routePath["start"] 		= startPaths;
		routePath["requests"] 	= requestsPaths;
		routePath["simple"] 	= simplePaths;
		routePath["email"] 		= emailPaths;
		routePath["role"] 		= rolePaths;

		generatedServerSideJsonData["routeNodes"]	= routeNodes;
		generatedServerSideJsonData["routePaths"]	= routePaths; 

		var imageKey = "image";
		angular.forEach(clientSideJsonData, function(value, key){
			var nodeType = clientSideJsonData[key][imageKey];
			var generatedObject = generateRouteNodesAndRoutePath(clientSideJsonData[key]);
			if(nodeType == configureKey){
				//Retrieve name space from the configuration and use it whenever required
				var nameSpaceKey = "nameSpace";
				angular.forEach(generatedObject[routeNodeKey], function(configureValue, configureKey){
					if(configureKey == "superUserGroup" || configureKey == "reportingGroup" || configureKey == "defaultExceptionGroup"){
						var nameSpace = generatedObject[routeNodeKey][nameSpaceKey];
						var newJsonObject = {};
						newJsonObject[nameSpaceKey]=nameSpace;
						newJsonObject["value"]=configureValue;
						generatedServerSideJsonData[configureKey] = newJsonObject;
					} else if(configureKey != nameSpaceKey){
						generatedServerSideJsonData[configureKey] = configureValue;
					}
				});
			} else if (nodeType == CIRCLE){
				startNodes.push(generatedObject[routeNodeKey]);
				startPaths.push(generatedObject[routePathKey]);
			} else if (nodeType == RECTANGLE){
				requestsNodes.push(generatedObject[routeNodeKey]);
				requestsPaths.push(generatedObject[routePathKey]);
			} else if (nodeType == OVAL || nodeType == OVALMAGENTA){
				simpleNodes.push(generatedObject[routeNodeKey]);
				simplePaths.push(generatedObject[routePathKey]);
			} else if (nodeType == SQUARE){
				emailNodes.push(generatedObject[routeNodeKey]);
				emailPaths.push(generatedObject[routePathKey]);
			} else if (nodeType == RECTANGLECORAL){
				roleNodes.push(generatedObject[routeNodeKey]);
				rolePaths.push(generatedObject[routePathKey]);
			} 

		});
		generatedServerSideJsonData["policies"]={"policy":[{"name":"policyOne","value":"false"}]};
		return serverSideData;
	};

//	This function generates the server required routeNodes and route Path
//	It takes json object as input and converts into 
//	server based pojo kind output
//	input :
//	{
//	"Name"				: "initial",
//	"Mandatory Route" 	: "true",
//	"Final Approval"	: "true",
//	"image"				: "circle"
//	"Next Node"			: "email node"
//	} 
//	and convert it into
//	output :
//	{
//	routeNode:{
//	"name"				: initial,
//	"mandatoryRoute" 	: "true",
//	"finalApproval"		: "true"
//	}
//	routePath:{
//	"name"				: "inital",
//	"nextNode"			: "email node"
//	}
//	}
//	Initialize routeNode and routePath object and assign it to new Json Object which we will returning
//	1. Traverse through each object
//	2. Except "image" process for all other key
//	a. 	Generate new key for all the input key by removing spaces and
//	making first letter small(Done by generateKey function)
//	i.	check whether the key is next node if so add it to routePath object
//	ii. check whether the key is name if so add it to both routePath and routeNode object
//	iii. For all other key, add it to routeNode Object itself
//	3. return the new Json Object
	var generateRouteNodesAndRoutePath = function(jsonObject){
		var routeNode 		= {};
		var routePath 		= {};
		var newJsonObject 	= {
				"routeNode" : routeNode,
				"routePath"	: routePath
		};
		var imageKey 		= "image";
		var nextNodeKey 	= "nextNode";
		var name			= "name";
		angular.forEach(jsonObject, function(value, key){
			if(key != imageKey){
				var newKey 	= generateKey(key);
				if(newKey == nextNodeKey){
					routePath[newKey] = value;
				} else if(newKey == name){
					routePath[newKey] = value;
					routeNode[newKey] = value;
				} else {
					routeNode[newKey] = value;
				}
			}
		});
		return newJsonObject;
	};

//	This funciton generates key by removing spaces between them
//	and makes the first letter of the key as small
//	input = "Mandatory Route"
//	output = "mandatoryRoute"
//	1. Split the key using space delimiter
//	2. Parse through each splitted key and make the first index 
//	alone lower case 
//	3. join all the splitted keys to make a new key

	var generateKey = function(key){
		var newKey ="";
		var firstIndex = 0;
		var newkey = key.replace("*",""); //Replacing * in mandatory fields with blank.
		var splitKey = newkey.split(" ");
		angular.forEach(splitKey, function(word,index){
			if(index == firstIndex){
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

	//Checking whether the input type is Editable, if so return true
	$scope.isEditable= function(property) {
		if(property.edit == "Yes"){
			return true;
		} else {
			return false;
		}
	};
	
	//Checking whether the input type is Mandatory, if so return true
	$scope.isMandatory= function(property) {
		if(property.required == "Yes"){
			return true;
		} else {
			return false;
		}
	};
};


//Predefined example for input values
//var serverSideJsonData ={};
//serverSideJsonData["parent"] = clientSideJsonData["configurationId"]["Parent"];
//serverSideJsonData["name"] = clientSideJsonData["configurationId"]["Name"];
//serverSideJsonData["description"] = clientSideJsonData["configurationId"]["Description"];
//serverSideJsonData["label"] = clientSideJsonData["configurationId"]["Label"];
//serverSideJsonData["postProcessorName"] = clientSideJsonData["configurationId"]["Post Processor Name"];
//serverSideJsonData["superUserGroupName"] = clientSideJsonData["configurationId"]["Super User Group Name"];
//serverSideJsonData["blanketApprovePolicy"] = clientSideJsonData["configurationId"]["Blanket Approve Policy"];
//serverSideJsonData["reportingGroupName"] = clientSideJsonData["configurationId"]["Reporting Group Name"];
//serverSideJsonData["defaultExceptionGroupName"] = clientSideJsonData["configurationId"]["Default Exception Group Name"];
//serverSideJsonData["docHandler"] = clientSideJsonData["configurationId"]["Document Handler"];
//serverSideJsonData["active"] = clientSideJsonData["configurationId"]["Active"];
//serverSideJsonData["routingVersion"] = clientSideJsonData["configurationId"]["Routing Version"];
//serverSideJsonData["routePaths"] = {routePath:{
//start:[{
//name:"Initiated",
//nextNode:"Test.Submission.Email"
//}],
//requests:[{
//name:"Test.NetId",
//nextNode:"Test.Supervisor.Approval.Email"
//},{
//name:"Test.Request.Supervisor",
//nextNode:"Test.Admin.Approval.Email"
//}],
//simple:[{
//name:"Test.Submission.Email",
//nextNode:"Test.NetId"
//},{
//name:"Test.Supervisor.Approval.Email",
//nextNode:"Test.Request.Supervisor"
//},{
//name:"Test.Admin.Approval.Email" 
//}]
//}};
//serverSideJsonData["routeNodes"] = {
//start:[{
//name:"Initiated",
//activationType:"P",
//mandatoryRoute:"false",
//finalApproval:"false"
//}],
//requests:[{
//name:"Test.NetId",
//activationType:"P",
//ruleTemplate:"Test.NetId",
//mandatoryRoute:"false",
//finalApproval:"false"
//},{
//name:"Test.Request.Supervisor",
//activationType:"P",
//ruleTemplate:"Test.Request.Supervisor",
//mandatoryRoute:"false",
//finalApproval:"true"
//}],
//simple:[{
//name:"Test.Submission.Email",
//from:"jawbenne@iu.edu",
//to:"initiator",
//testAddress:"jawbenne@iu.edu",
//style:"Test.Submission.Email",
//type:"org.kuali.rice.kew.mail.EmailNode"
//},{
//name:"Test.Supervisor.Approval.Email",
//from:"jawbenne@iu.edu",
//to:"initiator",
//testAddress:"jawbenne@iu.edu",
//style:"Test.Supervisor.Approval.Email",
//type:"org.kuali.rice.kew.mail.EmailNode"
//}]
//};


