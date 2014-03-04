<!doctype html>
<html lang="en">
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
		
		//Variable to store the initial HTML of the Config modal
		var initialConfigHTML = $("#dialog-config").html();
		
		//Get the index of the corresponding div element from configuration json
		function getIndex(divElement,jsonNodes){
			for(var index=0 ; index<jsonNodes.length ; index++){
				if($(divElement).hasClass(jsonNodes[index].image)){
					return index;
				}
			}
			return -1;
		}
		
		//Function to generate label type html
		function generateLabelHtml(value){
			return "<label>"+value+"</label>";
		}
		
		//Function to generate select type html
		function generateOptionHtml(value){
			return "<option>"+value+"</option>";
		}
		
		//Function to generate input type html
		function generateInputHtml(className, defaultValue){
			return "<input type='text' class=' form-control "  + className  + "' value=" +defaultValue+ " placeholder='Text input'><br>";
		}
		
		function generateCloseButton(){
			return "<button class='close' data-dismiss='modal'>×</button>";
		}
		
		//Function to set header details dynamically
		function setDynamicModalHeader(index,jsonNodes,divElement){
			$(divElement).html(generateLabelHtml(jsonNodes[index].header));
			$(divElement).append(generateCloseButton());
		}

		//Generate radio input type html
		function generateRadioHtml(className,value){
			return "<div class='radio'><label><input type='radio' name=" + className + "value=" + value + ">"+value+"</label></div>";
			
		}
		/*Fucntion to generate modal body for property
		Property should have values for label and type and based on that we are generating 
		modal body
		*/
		
		function generateModalBodyforProperty(object, divElement) {
				var labelHtml = generateLabelHtml(object.label);
				$(divElement).append(labelHtml);

				var typeHtml = "";
				//Creating unique class name for each input type
				var className = object.label;
				className = className.replace(/ /g, "");
				//Switching to find the appropriate html type element

				switch (object.type) {
				case "text": {
					typeHtml = generateInputHtml(className,object.defaultVal);
					break;
				}
				case "radio": {
					//Creating radio button for each option
					$.each(object.options, function(index, value) {
						typeHtml += generateRadioHtml(className, value);
					});
					break;
				}
				case "select": {
					typeHtml = "<select class="+className+">";
					$.each(object.options, function(index, value) {
						typeHtml += generateOptionHtml(value);
					});
					typeHtml += "</select>";
					break;
				}
				}
				//Appending Html to the modal body
				$(divElement).append(typeHtml);
			}
			
			//Function to set body details dynamically
			function setDynamicModalBody(index, jsonNodes, divElement) {
				//Access each property and generate the html
				$.each(jsonNodes[index].properties, function(key, value) {
					//Send the property object to below function and append the html to the modal body
					generateModalBodyforProperty(value, divElement);
				});
			}

			
		
		//To Create single instances of cloned object
		$('.draggable').mousedown(function() {
			original = true;

		});
		
		$("#configure").click(function(event) {
		generateModalHeaderBody(configNodes, 0);
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
					$(this).append(newDiv);
					original = false;
					$(newDiv).dblclick(function() {
						generateConfigModal(newDiv);
						});

				}
			}
		});
		
		/* This function is triggered when the modal is hidden - The modal can be hidden
		either by clicking on "close" or clicking outside the modal  */
		$('#dialog-config').on('hidden.bs.modal', function () {
			
			//restoring the Initial modal HTML when it is hidden
			 $("#dialog-config").html(initialConfigHTML);
			}); 
		
		function generateModalHeaderBody(jsonNodes,indexConfig)
		{
			setDynamicModalHeader(indexConfig, jsonNodes,".modal-header");
			setDynamicModalBody(indexConfig, jsonNodes,".modal-body");
			$("#dialog-config").modal('show');
		}
		
		function generateConfigModal(newDiv)
		{
			//event.preventDefault();
			var jsonNodes = nodes;
			var index = getIndex($(newDiv), jsonNodes);
			
			if (index > -1)
			{
				generateModalHeaderBody(jsonNodes, index);
		
			} 
			else
				{
					alert("Corresponding configuration for the image need to be updated in the configuration file");
					//Hide dialog box here 
					$("#dialog-example").modal('hide');
				}
		}
	
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
			<div class="modal-content">
				<div class="modal-header">
				
					<h4>Dialog page</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<a href="#" data-dismiss="modal" class="btn" id="btn-close">Close</a>
					 <a href="#" class="btn btn-primary" id="btn-save">Save</a>
				</div>
			</div>
		</div>
		</div>
</body>
</html>