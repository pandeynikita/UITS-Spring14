<!doctype html>
<html lang="en" ng-app="workFlowBuilder">
<head>
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1.0">
<title>Workflow Editor</title>
<script src="./resources/static/jquery-1.10.2.js"></script>
<script src="./resources/static/jquery.ui.position.js"></script>
<script src="./resources/static/jquery.ui.core.js"></script>
<script src="./resources/static/jquery.ui.widget.js"></script>
<script src="./resources/static/jquery.ui.mouse.js"></script>
<script src="./resources/static/jquery.ui.draggable.js"></script>
<script src="./resources/static/jquery.ui.droppable.js"></script>
<script src="./resources/static/jquery.ui.resizable.js"></script>
<script src="./resources/static/jquery.ui.dialog.js"></script>
<script src="./resources/static/custom.js"></script>
<script type="text/javascript" src="./resources/static/angular.min.js"></script>
<script type="text/javascript" src="./resources/static/angular-route.min.js"></script>
<script type="text/javascript" src="./resources/static/controller/angularController.js"></script>
<script type="text/javascript" src="./resources/static/configuration.js"></script>
<script type="text/javascript" src="./resources/static/bootstrap.js"></script>
<script type="text/javascript" src="./resources/static/ui-bootstrap-tpls-0.10.0.min.js"></script>
<link rel="stylesheet" type="text/css"	href="./resources/css/bootstrap.css">
<link rel="stylesheet" href="./resources/css/custom.css">

<script>
	$(function() {
		
		var counter=0;
		var original = false;
		//Get the angular scope for the mentioned controller
		var _scope = angular.element($('.container')).scope();
		
		//Retrieve nodes type for the selected div element through 
		//recursively looping through allNodesType which is mentioned in configuration
		function getNodeType(element){
			for(var node in nodesConfiguration ){
				if((element).hasClass(node)){
					return node;
				}
			}
			return -1;
		};
		
		//To Create single instances of cloned object
		$('.draggable').mousedown(function() {
			original = true;
		});

		$(".draggable").draggable({
			revert : "invalid", //	To revert back to the same position when dropped on to toolbox
			containment : "#editor-window", // 	contain the components inside editor window
			helper : "clone", // 	Clone a new instance
			cursor : "move",
			scroll : false,
			appendTo : ".drop-area"
		});

		$(".drop-area").droppable({
			accept : ".draggable",
			containment : ".drop-area",
			tolerance : "fit",	//The moveable object has to be inside the dropable object area
			activeClass : "ui-state-highlight", //	Highlight the drop area
			drop : function(event, ui) { //	when it is dropped, if it is original instance, clone a new instance of it 
				// 	and append it to drop-area and make original false to avoid multiple instance
				if (original) {
					var newDiv = $(ui.helper).clone();
					newDiv.draggable({
						containment : ".drop-area"
					});
					counter++;
					$(newDiv).attr("id", "dragged" + counter);
					$(this).append(newDiv);
					original = false;
					$(newDiv).dblclick(function(){
						var nodeType 	= getNodeType($(this));
						if(nodeType == -1){
							alert(nodeConfigurationNotAddedError);
						} else {
							var divId 		= $(this).attr("id");	
							//Call the angular function from jquery event handler
 							_scope.angularOpenFunction(nodeType,divId,nodesConfiguration);
						}
					});
				}
			}
		});
	});
</script>
</head>
<body>
	<div class="wrapper" ng-controller="angularModalCtrl">
		<!-- 		Template of angular modal -->
		<script type="text/ng-template" id="dynamicModalContent.html">
		<div class="modal-header">
			<button class="close" ng-click="cancel()">x</button>
            <label>{{component.header}}</label> 
        </div>
        <div class="modal-body">
			<div ng-repeat="property in properties">
				<label>{{property.label}}</label> 

				<div ng-if="isRadioType(property)">
					<label ng-repeat="option in property.options" for="{{option}}">
						<input 	type="radio"	 
								name="route" 
								ng-model="dataStorage[property.label]" 
								ng-value="option"> 
						{{option}}
					</label>
				</div>

				<div ng-if="isSelectType(property)">
					<select ng-model="dataStorage[property.label]" 
							ng-options="option as option for option in property.options">
					</select>
				</div>

				<div ng-if="isTextType(property)">
					<label>
						<input 	type="text" 
								ng-model="dataStorage[property.label]" 
								placeholder="Text"> 
						{{option}} 
					</label>
				</div>
				
				<div ng-if="isEmailType(property)">
					<form name="myForm">
						<label><input name="input" type="email" ng-model="dataStorage[property.label]" placeholder="example@domain.com"> {{option}} </label>
						<span class="error" ng-show="myForm.input.$error.email">Not valid email!</span>
					</form>
				</div>				
			</div>
			
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" ng-click="save()">Save</button>
            <button class="btn btn-warning" ng-click="cancel()">Cancel</button>
        </div>
    	</script>
		<div class="outer">
			<div class="container">
				<h1>WorkFlow Editor</h1>
			</div>
		</div>
		<div id="editor-window" class="container" >
			<div class="tool-box ui-widget ui-helper-clearfix">
				<div class="draggable circle ui-corner-tr ui-widget-content ">
					<font color="white">Start</font>
				</div>
				<br>
				<div class="draggable square ui-corner-tr ui-widget-content">
					<font color="white">Request</font>
				</div>
				<br>
				<div class="draggable rectangle ui-corner-tr ui-widget-content">
					<font color="white">Approve</font>
				</div>
				<br>
				<div class="draggable oval ui-corner-tr ui-widget-content">
					<font color="white">Processed</font>
				</div>
			</div>
			<div class="drop-area ui-widget-content ui-state-default"></div>
		</div>
	</div>
</body>
</html>