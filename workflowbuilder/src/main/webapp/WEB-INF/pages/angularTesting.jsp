<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="angularJs">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
<script type="text/javascript" src="./resources/static/angular.min.js"></script>
<script type="text/javascript"
	src="./resources/static/angular-route.min.js"></script>
<script type="text/javascript"
	src="./resources/static/controller/config.js"></script>
<script type="text/javascript" src="./resources/static/jquery.min.js"></script>
<script type="text/javascript" src="./resources/static/bootstrap.js"></script>
<script type="text/javascript"
	src="./resources/static/ui-bootstrap-tpls-0.10.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="./resources/css/bootstrap.css">
<script src="./resources/static/configuration.js"></script>
</head>
<body>
	<!-- 	Adding whole modal content inside a container -->
	<div class="container" ng-controller="ModalDemoCtrl">
		<!-- 		Template of angular modal -->
		<script type="text/ng-template" id="myModalContent.html">
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
		<button class="btn btn-default circle" id="circleButton"
			ng-dblclick="open('circle',$event)">Circle</button>
		<button class="btn btn-default rectangle" id="rectangleButton"
			ng-dblclick="open('rectangle',$event)">Rectangle</button>
	</div>
</body>
</html>