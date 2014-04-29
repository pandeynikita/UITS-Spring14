$(function() {

	var count = counter = flag = fire_check = fire_check_click = save_flag = 0;
	var i = 0, id_circle = null, source = [], target = [], original = false;

	// Get the angular scope for the mentioned controller
	var _scope = angular.element($('.container')).scope();

	//To save all the connected elements.
	var routePath={}; 

	//To save all the dropped elements.
	var droppedArray= [];
	
	// Retrieve nodes type for the selected div element through
	// recursively looping through allNodesType which is mentioned in
	// configuration
	function getNodeType(element) {
		for ( var node in nodesConfiguration) {
			if ((element).hasClass(node)) {
				return node;
			}
		}
		return -1;
	};
	
	//To toggle between the up and down arrow on the accordion 
	$('.collapse').on('hidden.bs.collapse', function(){
		$(this).parent().find(".glyphicon-chevron-down").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
		}).on('shown.bs.collapse', function(){
		$(this).parent().find(".glyphicon-chevron-up").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
		});
	
	// on click event handler for export button
	$('#exportId').click(function() {
		// Call the angular function from jQuery event handler
		_scope.angularExportFunction(routePath, droppedArray);
	});

	// on click event handler for configuration node
	$('#configurationId').click(function() {
		var nodeType = getNodeType($(this));
		// Check whether the configuration is available, else report an error
		if (nodeType == -1) {
			bootbox.alert(nodeConfigurationNotAddedError);
		} else {
			var divId = $(this).attr("id");
			// Call the angular function from jQuery event handler
			_scope.angularOpenFunction(nodeType, divId, nodesConfiguration);
		}
	});
	// To Create single instances of cloned object
	$('.draggable').mousedown(function() {
		id_circle = getNodeType($(this));
		if ((flag == 1) && (id_circle == "circle")) {
			bootbox.alert("Only one Start per Workflow is allowed");
			exit;
		}
		original = true;
	});

	// configuring the draggable components in the page
	$(".draggable").draggable({
		revert : "invalid", // To revert to the same position when dropped on to
		// toolbox
		containment : "#editor-window", // contain the components inside editor
		// window
		helper : "clone", // Clone a new instance
		cursor : "move",
		scroll : false,
		appendTo : ".drop-area"
	});

	// Configuring the drop area
	$(".drop-area")
	.droppable(
			{
				accept : ".draggable",
				containment : ".drop-area",
				tolerance : "fit", // The moveable object has to be
				// inside the dropable object area
				activeClass : "ui-state-highlight", // Highlight the
				// drop area
				drop : function(event, ui) { // when it is dropped,
					// if it is original
					// instance, clone a new
					// instance of it
					if (original) { // and append it to drop-area and
						// make original false to avoid
						// multiple instance
						var newDiv = $(ui.helper).clone();
						newDiv.draggable({
							containment : ".drop-area"
						});
						counter++;
						$(newDiv).attr("id", "dragged" + counter);
						var divID = "dragged" + counter;
						droppedArray[count++]=divID;
						$(this).append(newDiv);
						$(newDiv).removeClass("ui-draggable"); // removing
						// jQuery draggable for the jsPlumb draggable to work }
						jsPlumb.draggable("dragged" + counter);
						//Changing the CSS to indicate the configuration is not filled
						$(newDiv).addClass("orangeBg");
						var endpointOptions = { // setting the
								// parameters for the
								// connectors.
								isSource : true,
								isTarget : true,
								uuid : divID, // A unique ID for each
								// connector - for future
								// use(delete functionality)
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
								maxConnections : 2, // limit the total
								// number of connections
								// to a component.

								onMaxConnections : function(info, e) {
									bootbox.alert("Maximum connections ("
											+ info.maxConnections
											+ ") reached");
								}
						};
						if (id_circle == "circle") { // ensuring that
							// the Start
							// component is
							// never a
							// target and
							// always a
							// source
							endpointOptions.isTarget = false;
							endpointOptions.maxConnections = 1;
						}
						jsPlumb.addEndpoint("dragged" + counter,
								endpointOptions); // adding a
						// connection point
						// to each component
						// beforeDrop is fired every time a connection
						// is dropped for
						// as many number of divs dropped onto the
						// screen
						jsPlumb
						.bind(
								"beforeDrop",
								function(c) {

									fire_check++;
									// To control the firing of
									// this event
									if (fire_check == counter) {
										for (var k = 0; k < source.length; k++) {
											if (c.sourceId == source[k]) {
												bootbox.alert("Only one outgoing connection per node is allowed");
												fire_check = 0;
												return false;
											}
										}
										for (var k = 0; k < source.length; k++) {
											if (c.targetId == target[k]) {
												bootbox.alert("Only one incoming connection per node is allowed");
												fire_check = 0;
												return false;
											}
										}
										source[i] = c.sourceId;
										target[i] = c.targetId;
										var sid=c.sourceId;
										var did=c.targetId;
										routePath[sid]=did;
										i++;
										fire_check = 0;
									}
									return true;
								});

						jsPlumb
						.bind(
								"click",
								function(c) { // Binding the
									// click
									// function of a
									// connector to
									// detach it
									fire_check_click++;
									// To control the firing of
									// this event
									if (fire_check_click == counter) {
										for (var k = 0; k < source.length; k++) {
											if (c.sourceId == source[k]) {
												source.splice(
														k, 1);
												fire_check = 0;
												break;
											}
										}
										for (var k = 0; k < target.length; k++) {
											if (c.targetId == target[k]) {
												target.splice(
														k, 1);
												fire_check = 0;
												break;
											}
										}
										fire_check_click = 0;
									}
									jsPlumb.detach(c);
									delete routePath[c.sourceId];
								});

						//Each component is checked on click if it has the 'deleteNode' attached to it
						//The node is marked for deletion in the below function
						$(newDiv).bind("click", function() {
							if ($(this).hasClass("deleteNode")) {
								$(this).removeClass("deleteNode");
							} else
								$(this).addClass("deleteNode");

						});
						
						//Checks for the key event after a node is marked for deletion
						//If the key pressed is the "Delete" button, then the node is removed from the Editor area
						$(document)
						.on(
								"keyup",
								function(e) {
									if (e.which === 46) {
										var divType = getNodeType($(".deleteNode"));
										if (divType == "circle")
											flag = 0;
										var deleteId = $('.deleteNode').attr('id');
										$.each(routePath,function(key,value){
											if(key == deleteId || value == deleteId){
												delete routePath[key];
											}
										});	
										
										
										// Removing the node which has the css class : 'deleteNode'  
										$('.deleteNode').each(function() {

													var currentElement = $(this);
													var divId = $(currentElement).attr("id");
													
													for (var x = 0; x <= source.length; x++) {

														if (deleteId == source[x]) {
															source[x] = null;
															target[x] = null;
														}
														if (deleteId == target[x]) {
															source[x] = null;
															target[x] = null;
															
														}
													}
													jsPlumb.deleteEndpoint(divId);
												});
										$(".deleteNode").remove();
										for(var j=0; j < droppedArray.length; j++){
											if (deleteId == droppedArray[j]) {
												droppedArray.splice(
														j, 1);
												count--;
												break;
											}
										}
										_scope.deleteSavedData(deleteId);

									} else {
										$("div").removeClass(
										"deleteNode");
									}
								});
						
						// Removes the "marked for deletion" color for a node 
						//clicking anywhere on the document removes the red color styling from the node marked for deletion
						$(document)
						.mouseup(
								function(e) {
									$('.deleteNode')
									.each(
											function() {
												var currentElement = $(this);
												currentElement
												.removeClass("deleteNode");
											});
								});

						jsPlumb.repaintEverything();

						original = false;
						$(newDiv)
						.dblclick(
								// double click function to open
								// the configuration for each
								// component
								function() {
									var nodeType = getNodeType($(this));
									if (nodeType == -1) {
										bootbox.alert(nodeConfigurationNotAddedError);
									} else {
										var divId = $(this)
										.attr("id");
										// Call the angular
										// function from jQuery
										// event handler
										_scope
										.angularOpenFunction(
												nodeType,
												divId,
												nodesConfiguration
												);
										}
								});
						if (id_circle == "circle")
							flag = 1;	
					}
				}
			});
});
