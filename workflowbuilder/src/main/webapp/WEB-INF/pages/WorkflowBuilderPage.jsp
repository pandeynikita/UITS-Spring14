<!doctype html>
<html ng-app="myApp" ng-controller="myCtrl" lang="en">
<head>
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1.0">
<title>Workflow Editor</title>
<link rel="stylesheet" href="./resources/css/jquery.ui.all.css">
<script src="./resources/static/jquery-1.10.2.js"></script>
<script src="./resources/static/jquery.ui.position.js"></script>
<script src="./resources/static/jquery.ui.core.js"></script>
<script src="./resources/static/jquery.ui.widget.js"></script>
<script src="./resources/static/jquery.ui.mouse.js"></script>
<script src="./resources/static/jquery.ui.draggable.js"></script>
<script src="./resources/static/jquery.ui.droppable.js"></script>
<script src="./resources/static/jquery.ui.resizable.js"></script>
<script src="./resources/static/jquery.ui.dialog.js"></script>
<script type="text/javascript" src="./resources/static/angular.min.js"></script>
<script type="text/javascript" src="./resources/static/angular-resource.min.js"></script>
<script src="./resources/static/custom.js"></script>
<script src="./resources/static/nodes.js"></script>
<script type="text/javascript" src="./resources/static/bootstrap.js"></script>
<script type="text/javascript" src="./resources/static/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/bootstrap.css">
<link rel="stylesheet" href="./resources/css/bootstrap-responsive.css">
<link rel="stylesheet" href="./resources/css/custom.css">
<script>
	$(function() {
		var original = false;
		

		//To Create single instances of cloned object
		$('.draggable').mousedown(function() {
			original = true;
		});

		$("#configure").click(function(event) {
			 if(saved ==0)
			  {
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
		}
			 else 
				 
				 {
				 
				 $scope.config =$scope.config;
				 }
				 
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
			tolerance : "fit", //The moveable object has to be inside the dropable object area
			activeClass : "ui-state-highlight", //	Highlight the drop area
			drop : function(event, ui) { //	when it is dropped, if it is original instance, clone a new instance of it 
				// 	and append it to drop-area and make original false to avoid multiple instance
				if (original) {
					var newDiv = $(ui.helper).clone();
					newDiv.draggable({
						containment : ".drop-area"
					});
					$(this).append(newDiv);
					original = false;
					$(newDiv).dblclick(function() {
						generateDynamicModal(newDiv);
					});

				}
			}
		});


	});
</script>
</head>
<body>

	<div class="wrapper">
		<div class="outer">
		<button class="btn btn-primary"  style="float: left" data-toggle="modal"
		data-target="#dialog-config" id="configure">Configure</button>
			<div class="container">
				<h1>WorkFlow Editor</h1>
			</div>
		</div>
		<div id="editor-window" class="container">
			<div class="tool-box ui-widget ui-helper-clearfix">
				<div class="draggable circle ui-corner-tr ui-widget-content">
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
	
	<div class="modal fade" id="dialog-config">
		<div class="modal-dialog">
			<div class="modal-content" >
				<div class="modal-header">
				
					<h4>Dialog page</h4>
				</div>
					<div class="modal-body">

						<form>
							<div ng-repeat="node in config">
								<label>{{node.label}}</label> 
								<input type="{{node.type}}" class="form-control" ng-model="node.defaultVal" min="0" max="4">
							</div>
						</form>
					</div>
					<div class="modal-footer">
					<a href="#" data-dismiss="modal" class="btn btn-primary" ng-click="save()" id="btn-save">Save</a>
					<a href="#" data-dismiss="modal" class="btn" id="btn-close">Close</a>
					 
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>