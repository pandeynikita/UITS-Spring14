$(function() {

		var counter = flag = fire_check = fire_check_click = 0;
		var i = 0, id_circle = null,  source = [], target = [], original = false;
		
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
		};

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
		
		//configuring the draggable components in the page
		$(".draggable").draggable({
			revert : "invalid", 			//	To revert to the same position when dropped on to toolbox
			containment : "#editor-window", // 	contain the components inside editor window
			helper : "clone", 				// 	Clone a new instance
			cursor : "move",
			scroll : false,
			appendTo : ".drop-area"
		});

		//Configuring the drop area
		$(".drop-area")
				.droppable(
						{
							accept : ".draggable",
							containment : ".drop-area",
							tolerance : "fit", 					//The moveable object has to be inside the dropable object area
							activeClass : "ui-state-highlight", //	Highlight the drop area
							drop : function(event, ui) { 		//	when it is dropped, if it is original instance, clone a new instance of it 
								if (original) {					// 	and append it to drop-area and make original false to avoid multiple instance
									var newDiv = $(ui.helper).clone();
									newDiv.draggable({
										containment : ".drop-area"
									});
									counter++;
									$(newDiv).attr("id", "dragged" + counter);
									var divID = "dragged" + counter;
									$(this).append(newDiv);
									$(newDiv).removeClass("ui-draggable");  //removing jQuery draggable for the jsPlumb draggable to work
									//}
									jsPlumb.draggable("dragged" + counter);
									var endpointOptions = {					// setting the parameters for the connectors.
										isSource : true,
										isTarget : true,
										uuid : divID,						// A unique ID for each connector - for future use(delete functionality)
										anchor : "Continuous",
										endpoint : [ "Dot", {
											radius : 8,
											cssClass : "connectorEndPoint"
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
										maxConnections : 2,			//limit the total number of connections to a component.
									
									onMaxConnections:function(info, e) {
					  					alert("Maximum connections (" + info.maxConnections + ") reached");
					  				}
									};
									if (id_circle == "circle") {	//ensuring that the Start component is never a target and always a source
										endpointOptions.isTarget = false;
										endpointOptions.maxConnections = 1;
									}
									jsPlumb.addEndpoint("dragged" + counter,endpointOptions); //adding a connection point to each component
									//beforeDrop is fired every time a connection is dropped for 
									//as many number of divs dropped onto the screen
									jsPlumb.bind(
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
															for (var k = 0; k < target.length; k++) {
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

									jsPlumb.bind("click", function(c) {		//Binding the click function of a connector to detach it
										fire_check_click++;
										//To control the firing of this event
										if (fire_check_click == counter) {
											for (var k = 0; k < source.length; k++) {
												if (c.sourceId == source[k]) {
													source.splice(k,1);
													fire_check = 0;	
													break;
												}
											}
											for (var k = 0; k < target.length; k++) {
												if (c.targetId == target[k]) {
													target.splice(k,1);
													fire_check = 0;
													break;
												}
											}
											fire_check_click = 0;
										}
										jsPlumb.detach(c);
									});

									jsPlumb.repaintEverything();

									original = false;
									$(newDiv).dblclick(						//double click function to open the configuration for each component
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

								}
							}
						});
	});