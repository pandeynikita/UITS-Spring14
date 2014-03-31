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
<script type="text/javascript"
	src="./resources/static/angular-route.min.js"></script>
<script type="text/javascript"
	src="./resources/static/controller/angularController.js"></script>
<script type="text/javascript" src="./resources/static/configuration.js"></script>
<script src="./resources/static/jquery.jsPlumb-1.5.5-min.js"></script>
<script src="./resources/static/demo-jquery.js"></script>
<script src="./resources/static/demo-list.js"></script>
<link rel="stylesheet" href="./resources/css/demo.css">
<script type="text/javascript" src="./resources/static/bootstrap.js"></script>
<script type="text/javascript"
	src="./resources/static/ui-bootstrap-tpls-0.10.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="./resources/css/bootstrap.css">
<link rel="stylesheet" href="./resources/css/custom.css">

<script>
	$(function() {

		var counter = flag = fire_check = 0;
		var i = 0;
		var source = [];
		var target = [];
		var original = false;
		var id_circle;
		//Get the angular scope for the mentioned controller
		var _scope = angular.element($('.container')).scope();

		//Retrieve nodes type for the selected div element through 
		//recursively looping through allNodesType which is mentioned in configuration
		function getNodeType(element) {
			for ( var node in nodesConfiguration) {
				if ((element).hasClass(node)) {
					return node;
				}
			}
			return -1;
		}
		;

		//on click event handler for configuration node 
		$('#configurationId').click(
				function() {
					var nodeType = getNodeType($(this));
					//Check whether the configuration is available, else report an error
					if (nodeType == -1) {
						alert(nodeConfigurationNotAddedError);
					} else {
						var divId = $(this).attr("id");
						//Call the angular function from jquery event handler
						_scope.angularOpenFunction(nodeType, divId,
								nodesConfiguration);
					}
				});
		//To Create single instances of cloned object

		$('.draggable').mousedown(function() {
			id_circle = getNodeType($(this));
			if ((flag == 1) && (id_circle == "circle")) {
				alert("Only one Start per Workflow is allowed");
				exit;
			}
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

		$(".drop-area")
				.droppable(
						{
							accept : ".draggable",
							containment : ".drop-area",
							tolerance : "fit", //The moveable object has to be inside the dropable object area
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
									var divID = "dragged" + counter;
									$(this).append(newDiv);
									$(newDiv).removeClass("ui-draggable");
									//}
									jsPlumb.draggable("dragged" + counter);
									var endpointOptions = {
										isSource : true,
										isTarget : true,
										uuid : divID,
										anchor : "Continuous",
										endpoint : [ "Dot", {
											radius : 8,
											cssClass : "connectorTrans"
										} ],
										HoverPaintStyle : {
											strokeStyle : "#1e8151",
											lineWidth : 2
										},
										connector : [ "StateMachine", {
											curviness : 20
										} ],
										connectorOverlays : [ [ "Arrow", {
											width : 10,
											length : 20,
											location : 1,
											id : "arrow"
										} ] ],
										connectorStyle : {
											strokeStyle : "#5c96bc",
											lineWidth : 2
										},
										maxConnections : 2,
									
									onMaxConnections:function(info, e) {
					  					alert("Maximum connections (" + info.maxConnections + ") reached");
					  				}
									};
									if (id_circle == "circle") {
										endpointOptions.isTarget = false;
										endpointOptions.maxConnections = 1;
									}
									jsPlumb.addEndpoint("dragged" + counter,
											endpointOptions);
									//beforeDrop is fired every time a connection is dropped for 
									//as many number of divs dropped onto the screen
									jsPlumb
											.bind(
													"beforeDrop",
													function(c) {
														fire_check++;
														//To control the firing of this event
														if (fire_check == counter) {
															for (var k = 0; k < source.length; k++) {
																if (c.sourceId == source[k]) {
																	alert("Only one outgoing connection per node is allowed");
																	fire_check = 0;
																	return false;
																}
															}
															for (var k = 0; k < source.length; k++) {
																if (c.targetId == target[k]) {
																	alert("Only one incoming connection per node is allowed");
																	fire_check = 0;
																	return false;
																}
															}
															source[i] = c.sourceId;
															target[i] = c.targetId;
															i++;
															fire_check = 0;
														}
														return true;
													});

									jsPlumb.bind("click", function(c) {
										jsPlumb.detach(c);
									});

									$(newDiv).bind("click", function() {
										$(newDiv).remove();
										jsPlumb.deleteEndpoint(divID);
									});
									jsPlumb.repaintEverything();

									original = false;
									$(newDiv)
											.dblclick(
													function() {
														var nodeType = getNodeType($(this));
														if (nodeType == -1) {
															alert(nodeConfigurationNotAddedError);
														} else {
															var divId = $(this)
																	.attr("id");
															//Call the angular function from jquery event handler
															_scope
																	.angularOpenFunction(
																			nodeType,
																			divId,
																			nodesConfiguration);
														}
													});
									if (id_circle == "circle")
										flag = 1;
									//insert js plumb here

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
					<select ng-model="dataStorage[property.label]" class="form-control"
							ng-options="option as option for option in property.options">
					</select>
				</div>

				<div ng-if="isTextType(property)">
					<label>
						<input 	type="text" 
								ng-model="dataStorage[property.label]" 
								placeholder="Text" 
								class="form-control"> 
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
1        </div>
    	</script>
		<div class="outer">
			<button class="btn btn-primary configure" style="float: left"
				id="configurationId")">Configure</button>
			<div class="container">
				<h1>WorkFlow Editor</h1>
			</div>
		</div>
		<div id="editor-window" class="container">
			<div class="tool-box ui-widget ui-helper-clearfix">
				<div class="draggable w circle ui-corner-tr ui-widget-content ">
					<font color="white">Start</font>
				</div>
				<br>
				<div class="draggable w square ui-corner-tr ui-widget-content">
					<font color="white">Email</font>
				</div>
				<br>
				<div class="draggable w rectangle ui-corner-tr ui-widget-content">
					<font color="white">Request</font>
				</div>
				<br>
				<div class="draggable w oval ui-corner-tr ui-widget-content">
					<font color="white">Simple</font>
				</div>
				<br>
				<div class="draggable w rect r ui-corner-tr ui-widget-content">
					<font color="white">Role</font>
				</div>
			</div>
			<div
				class="drop-area statemachine-demo ui-widget-content ui-state-default"></div>
		</div>
	</div>
</body>
</html>