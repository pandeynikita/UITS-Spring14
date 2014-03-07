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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="./resources/static/bootstrap.js"></script>
<script type="text/javascript"
	src="./resources/static/ui-bootstrap-tpls-0.10.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="./resources/css/bootstrap.css">
</head>
<body>
	<div class="container" ng-controller="ModalDemoCtrl">
		<h1>Configuration</h1>
		<ul ng-repeat="node in nodes">
			<li>{{node.image}} <a href=""
				ng-click="setDynamicTest('circle')"> Edit</a>
			</li>
			<li>{{test.image}}</li>
		</ul>
		<button class="btn btn-primary id="
			buttonid" ng-dblclick="testFunction('circle',false)">Test</button>
		<script type="text/ng-template" id="myModalContent.html">
        
		<div class="modal-header">
			<button class="close" ng-click="cancel()">x</button>
            <label>{{component.header}}</label> 
        </div>
        <div class="modal-body">
			<div ng-repeat="property in properties">
				<label>{{property.label}}</label> 
				<div ng-if="isRadioType(property)">
					<label ng-repeat="option in property.options"><input type="radio" name="sth" ng-model="test" value="{{option}}"> {{option}} </label>
				</div>
				<div ng-if="isTextType(property)">
					<label><input type="text" ng-model="test" placeholder="Text"> {{option}} </label>
				</div>
				<div ng-if="isSelectType(property)">
					<select ng-model="select" ng-options="option as option for option in property.options"></select>
				</div>
				<div ng-if="isEmailType(property)">
					<label><input class="form-control" type="email" ng-model="test" placeholder="Email"> {{option}} </label>
				</div>
			</div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" ng-click="ok()">OK</button>
            <button class="btn btn-warning" ng-click="cancel()">Cancel</button>
        </div>
    	</script>
		<button class="btn btn-default" ng-click="open('circle')">Open me!</button>
	</div>
</body>
</html>