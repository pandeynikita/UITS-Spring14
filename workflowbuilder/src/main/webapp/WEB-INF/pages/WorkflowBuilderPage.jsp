<!doctype html>
<html lang="en" ng-app="workFlowBuilder">
<head>
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1.0">
<title>Workflow Editor</title>
<script type="text/javascript" src="./resources/static/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="./resources/static/jquery.ui.position.js"></script>
<script type="text/javascript"
	src="./resources/static/jquery.ui.core.js"></script>
<script type="text/javascript"
	src="./resources/static/jquery.ui.widget.js"></script>
<script type="text/javascript"
	src="./resources/static/jquery.ui.mouse.js"></script>
<script type="text/javascript"
	src="./resources/static/jquery.ui.draggable.js"></script>
<script type="text/javascript"
	src="./resources/static/jquery.ui.droppable.js"></script>
<script type="text/javascript"
	src="./resources/static/jquery.ui.resizable.js"></script>
<script type="text/javascript"
	src="./resources/static/jquery.ui.dialog.js"></script>
<script type="text/javascript" src="./resources/static/angular.min.js"></script>
<script type="text/javascript"
	src="./resources/static/angular-route.min.js"></script>
<script type="text/javascript"
	src="./resources/customJS/controller/angularController.js"></script>
<script type="text/javascript" src="./resources/customJS/configuration.js"></script>
<script type="text/javascript"
	src="./resources/static/jquery.jsPlumb-1.5.5-min.js"></script>
<script type="text/javascript" src="./resources/static/demo-jquery.js"></script>
<script type="text/javascript" src="./resources/static/demo-list.js"></script>
<script type="text/javascript" src="./resources/static/bootstrap.js"></script>
<script type="text/javascript"
	src="./resources/static/ui-bootstrap-tpls-0.10.0.min.js"></script>
<script type="text/javascript" src="./resources/static/bootbox.js"></script>
<script type="text/javascript" src="./resources/customJS/jsPlumbImpl.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/demo.css">
<link rel="stylesheet" type="text/css"
	href="./resources/css/bootstrap.css">
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
        <div class="modal-body" style="margin-left:0px;padding-left:10px">
			<form name="form" novalidate>
				<div ng-repeat="property in properties">
					<div id=helpBtn style="position:relative;float:left;padding-right:150px">{{property.label}}
				<button class="helpFormButton" 
					id="propertyHelpId" popover= {{property.helpText}}
					popover-trigger="focus" popover-placement="right" >
					<i class=" glyphicon glyphicon-question-sign"
					style="font-size:15px;"> </i>
					</button>
				</div>
							
					<div ng-if="isRadioType(property)">
							<label ng-repeat="option in property.options">
								<input 	type="radio"	 
								name={{property.label}}
								ng-model="dataStorage[property.label]" 
								ng-value="option" > 
								{{option}}
							</label>
					</div>

					<div ng-if="isSelectType(property) && isMandatory(property)" >
						<select ng-model="dataStorage[property.label]" class="form-control" name="selectType" style="float:left"  
								ng-options="option as option for option in property.options" required>
						</select>
						<p  class="error" ng-show="form.selectType.$error.required">{{property.message}}</p>
					</div>

					<div ng-if="isSelectType(property) && !isMandatory(property)">
						<select ng-model="dataStorage[property.label]" class="form-control" style="float:left"
								ng-options="option as option for option in property.options">
						</select>
					</div>

					<br>
					<div ng-if="isTextSelectType(property)" >
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<div class="col-sm-6" >	
									<label>NameSpace</label>				
									<select ng-model="dataStorage[property.label_nameSpace]" class="form-control" style="float:left"
										ng-options="option as option for option in property.options">
									</select>
								</div>
								<div class="col-sm-6">
									<label>Name</label>
									<input type="text"  
										ng-model="dataStorage[property.label_group]"
										placeholder="Text" class="form-control" />
								</div>					
			
							
							</div>	
						</form>
					</div>

					<div ng-if="isSelectRadioType(property)" >
						<form class="form-horizontal" role="form"  >
								<div class="form-group" style="float:left">
									<div class="col-sm-6" style="float:left">		
									<select ng-model="dataStorage[property.label_policy]" class="form-control" 
									ng-options="option as option for option in property.selectOptions">
									</select>
									</div>
									
									<div class="col-sm-4" >			
										<label ng-repeat="option in property.radioOptions">
											<input type="radio"	 
												name={{property.label}}
											ng-model="dataStorage[property.label_value]" 
											ng-value="option" > 
											{{option}}
									</label>
									</div>

									<div class="col-sm-2">
										<a href ng-click="add()" class="addSign" style="float: right; display:inline" >
											<i class=" glyphicon glyphicon-plus-sign pull-left"
											style="font-size: 20px"> </i>
										</a>
								    </div>
									
							</div>
						</form>
    					<div ng-repeat="policy in policies" style="float:left;padding-right:150px">
      							<span>{{policy}}&nbsp&nbsp[<a href ng-click="policies.splice($index, 1)">X</a>]</span>
    					</div>
    
					</div>

					<div ng-if="isMultiSelectType(property)">
						<select multiple="true" ng-model="dataStorage[property.label]"  class="form-control" style="float:left" 
								ng-options="option as option for option in property.options">
						</select>
					<br>
					</div>
			
					<div ng-if="isTextType(property) && isEditable(property) && isMandatory(property)" ng-class="{ 'has-error' : form.mtext.$invalid && !form.mtext.$pristine }" >
									<input 	type="text" 
									name="mtext" style="float:left"
									ng-model="dataStorage[property.label]" 
									placeholder="Text" 
									class="form-control" required /> 
									<span ng-show="form.mtext.$invalid && !form.mtext.$pristine" style="float:left;padding-right:350px" class="help-block">{{property.message}}</span>
					
					</div>
					
					<div ng-if="isTextType(property) && isEditable(property) && !isMandatory(property)" >
									<input 	type="text" style="float:left"
									name="itext"
									ng-model="dataStorage[property.label]" 
									placeholder="Text" 
									class="form-control" /> 
			
					</div>

					<div ng-if="isTextType(property) && !isEditable(property)">
									<input 	type="text" style="float:left"
									ng-model="dataStorage[property.label]" 
									placeholder="Text" 
									class="form-control" readonly> 
					</div>
				
					<div ng-if="isEmailType(property)">
						<form name="myForm">
							<label><input name="input" style="float:left" type="email" ng-model="dataStorage[property.label]" placeholder="example@domain.com"> {{option}} </label>
							<span class="error" ng-show="myForm.input.$error.email">Not valid email!</span>
						</form>
					</div>				
				</form>		
			</div>
			</div>
		
        	<div class="modal-footer">
				<div style="float: left">* Fill in Mandatory fields</div>
           		<button class="btn btn-primary" ng-click="save()" ng-disabled="form.$invalid">Save</button>
            	<button class="btn btn-warning" ng-click="cancel()">Cancel</button>
        	</div>
    	</script>
		<div class="outer">
			<button class="btn btn-primary configure" style="float: right;background: orange;border:2px solid black;"
				id="configurationId">Configure</button>
			<header>
				<div id="header-content">
					<h1>
						<img src="./resources/images/kuali-logo.png" alt="Image cannot be loaded" style="float:left"></img>
						
					</h1>
					
				</div>
			</header>
			<div class="container">
				<h1>WorkFlow Editor</h1>
			</div>
		</div>
		<div id="editor-window" class="container">
			<div class="tool-box ui-widget ui-helper-clearfix">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse"
							data-parent="accordion" href="#collapseOne" style="background: #E1D8B7">
							<h4 class="panel-title">
								<a class="accordion-toggle" style="text-decoration: none !important;"> Components </a> <i
									class="indicator glyphicon glyphicon-chevron-down  pull-right">
								</i>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div id="row" class="panel-body">
									<div class="draggable w circle ui-corner-tr ui-widget-content ">
										<font color="white">Start</font>
									</div>
									<button class="helpButton " style="float: right; display:inline"
										id="startHelpId"
										popover="The Start node can have only one outgoing connection. This node is the initiator node"
										popover-trigger="focus">
										<i class=" glyphicon glyphicon-question-sign pull-left"
											style="font-size: 20px"> </i>
									</button>
									<br>
									<br>
								
									<div class="draggable w square ui-corner-tr ui-widget-content">
										<font color="white">Email</font>
									</div>
									<button class="helpButton " style="float: right"
										id="emailHelpId"
										popover="The Email node can have one incoming connection and one outgoing connection. This node contains the source and the target email address"
										popover-trigger="focus">
										<i class=" glyphicon glyphicon-question-sign pull-left"
											style="font-size: 20px"> </i>
									</button>
								<br>
								<br>
								<div
									class="draggable w rectangle ui-corner-tr ui-widget-content">
									<font color="white">Request</font>
								</div>
								<button class="helpButton " style="float: right"
									id="requestHelpId"
									popover="The Request node can have one incoming connection and one outgoing connection. This node contains the mandatory route and the target final approval"
									popover-trigger="focus">
									<i class=" glyphicon glyphicon-question-sign pull-left"
										style="font-size: 20px"> </i>
								</button>
								<br>
								<br>
								
								<div class="draggable w oval ui-corner-tr ui-widget-content">
									<font color="white">Simple</font>
								</div>
								<button class="helpButton " style="float: right"
									id="simpleHelpId"
									popover="The Simple node can have one incoming connection and one outgoing connection. This node contains the mandatory route and the target final approval"
									popover-trigger="focus" container: 'body'>
									<i class=" glyphicon glyphicon-question-sign pull-left"
										style="font-size: 20px"> </i>
								</button>
								<br>
								<br>
								<div
									class="draggable w rectangleCoral r ui-corner-tr ui-widget-content">
									<font color="white">Role</font>
								</div>
								<button class="helpButton " style="float: right"
									id="roletHelpId"
									popover="The Role node can have one incoming connection and one outgoing connection. This node contains the type and style"
									popover-trigger="focus"popover-container: "body">
									<i class=" glyphicon glyphicon-question-sign pull-left"
										style="font-size: 20px"> </i>
								</button>
								<br>
								<br>
								
								<div
									class="draggable w ovalMagenta r ui-corner-tr ui-widget-content">
									<font color="white">NoOp</font>
								</div>
								<button class="helpButton " style="float: right" id="noOpHelpId"
									popover="The NoOp node can have one incoming connection and one outgoing connection. This node contains only a name and a type"
									popover-trigger="focus">
									<i class=" glyphicon glyphicon-question-sign pull-left"
										style="font-size: 20px"> </i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div
				class="drop-area statemachine-demo ui-widget-content ui-state-default"></div>
		</div>
		<button class="btn btn-primary" id="exportId" style="background:#7D110C;border:2px solid black">Export</button>
	</div>
</body>
</html>