<!doctype html>
<html lang="en" ng-app="workFlowBuilder">
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Workflow Editor</title>
<script type="text/javascript" src="./resources/static/jquery-1.10.2.js"></script>
<script type="text/javascript" src="./resources/static/jquery.ui.position.js"></script>
<script type="text/javascript" src="./resources/static/jquery.ui.core.js"></script>
<script type="text/javascript" src="./resources/static/jquery.ui.widget.js"></script>
<script type="text/javascript" src="./resources/static/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="./resources/static/jquery.ui.draggable.js"></script>
<script type="text/javascript" src="./resources/static/jquery.ui.droppable.js"></script>
<script type="text/javascript" src="./resources/static/jquery.ui.resizable.js"></script>
<script type="text/javascript" src="./resources/static/jquery.ui.dialog.js"></script>
<script type="text/javascript" src="./resources/static/angular.min.js"></script>
<script type="text/javascript" src="./resources/static/angular-route.min.js"></script>
<script type="text/javascript" src="./resources/static/controller/angularController.js"></script>
<script type="text/javascript" src="./resources/static/configuration.js"></script>
<script type="text/javascript" src="./resources/static/jquery.jsPlumb-1.5.5-min.js"></script>
<script type="text/javascript" src="./resources/static/demo-jquery.js"></script>
<script type="text/javascript" src="./resources/static/demo-list.js"></script>
<script type="text/javascript" src="./resources/static/bootstrap.js"></script>
<script type="text/javascript" src="./resources/static/ui-bootstrap-tpls-0.10.0.min.js"></script>
<script type="text/javascript" src="./resources/static/bootbox.js"></script>
<script type="text/javascript" src="./resources/static/custom.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/demo.css">
<link rel="stylesheet" type="text/css" href="./resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./resources/css/custom.css">

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
					<form>
						<label ng-repeat="option in property.options" for="{{option}}">
							<input 	type="radio"	 
								name="route"
								ng-model="dataStorage[property.label]" 
								ng-value="option"> 
							{{option}}
						</label>
					</form>
				</div>

				<div ng-if="isSelectType(property)">
					<select ng-model="dataStorage[property.label]" class="form-control"
							ng-options="option as option for option in property.options">
					</select>
				</div>

				<div ng-if="isTextType(property) && isEditable(property)">
								<input 	type="text" 
								ng-model="dataStorage[property.label]" 
								placeholder="Text" 
								class="form-control"> 
				</div>

				<div ng-if="isTextType(property) && !isEditable(property)">
								<input 	type="text" 
								ng-model="dataStorage[property.label]" 
								placeholder="Text" 
								class="form-control" readonly> 
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
			<button class="btn btn-primary configure" style="float: left"
				id="configurationId">Configure</button>
			<div class="container">
				<h1>WorkFlow Editor</h1>
			</div>
		</div>
		<div id="editor-window" class="container">
			<div class="tool-box ui-widget ui-helper-clearfix">
				<div class="panel-group" id="accordion">
  					<div class="panel panel-default">
    					<div class="panel-heading" data-toggle="collapse" data-parent="accordion" href="#collapseOne">
    						<h4 class="panel-title">
      							<a class="accordion-toggle">
        							Components
      							</a>
      							<i class="indicator glyphicon glyphicon-chevron-down  pull-right">
      							</i>
      						</h4>
    					</div>
    					<div id = "collapseOne" class="panel-collapse collapse in">
    						<div id = "row" class ="panel-body">
								<div class="draggable w circle ui-corner-tr ui-widget-content ">
									<font color="white">Start</font>
								</div>
								<div class="draggable w square ui-corner-tr ui-widget-content">
									<font color="white">Email</font>
								</div>
								<br><br>
								<div class="draggable w rectangle ui-corner-tr ui-widget-content">
									<font color="white">Request</font>
								</div>
								<div class="draggable w oval ui-corner-tr ui-widget-content">
									<font color="white">Simple</font>
								</div>
								<br><br>
								<div class="draggable w rectangleCoral r ui-corner-tr ui-widget-content">
									<font color="white">Role</font>
								</div>
								<div class="draggable w ovalMagenta r ui-corner-tr ui-widget-content">
									<font color="white">NoOp</font>
								</div>
							</div>
						</div>
					</div>
  				</div>
  			</div>			
			<div class="drop-area statemachine-demo ui-widget-content ui-state-default"></div>
		</div>
		<button class="btn btn-primary" id="exportId">Export</button>
	</div>
</body>
</html>