<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="./resources/static/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="./resources/css/bootstrap.css">
<script type="text/javascript" src="./resources/static/configuration.js"></script>

<script type="text/javascript"> 
$(function(){
	
	//Variable to store the initial HTML of the modal
	var initialHTML = $("#dialog-example").html();
	
	//Get the index of the corresponding div element from configuration json
	function getIndex(divElement,jsonNodes){
		for(var index=0;index<jsonNodes.length;i++){
			if($(divElement).hasClass(jsonNodes[index].image)){
				return index;
			} else {
				return -1;
			}
		}
	}
	
	//Function to generate label type html
	function generateLabelHtml(value){
		return "<label>"+value+"</label>";
	}
	
	//Function to generate label type html
	function generateOptionHtml(value){
		return "<option>"+value+"</option>";
	}
	
	//Function to generate input type html
	function generateInputHtml(className){
		return "<input type='text' class="+ className + " placeholder='Text input'>";
	}
	
	
	//Function to set header details dynamically
	function setDynamicModalHeader(index,jsonNodes,divElement){
		$(divElement).html(generateLabelHtml(jsonNodes[index].header));
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
				typeHtml = generateInputHtml(className);
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

		
		/* This function is triggered when the modal is hidden - The modal can be hidden
		either by clicking on "close" or clicking outside the modal  */
		$('#dialog-example').on('hidden.bs.modal', function () {
			
			//restoring the Initial modal HTML when it is hidden
			 $("#dialog-example").html(initialHTML);
			}); 
		

		//On click of the button
		$("#buttonid")
				.click(
						function(event)
						{
							event.preventDefault();
							var jsonNodes = nodes;
							var index = getIndex($(this), jsonNodes);
							if (index > -1)
							{
								setDynamicModalHeader(index, jsonNodes,
										".modal-header");
								setDynamicModalBody(index, jsonNodes,
										".modal-body");
							$("#dialog-example").modal('show');
						
							} 
							else
								{
									alert("Corresponding configuration for the image need to be updated in the configuration file");
									//Hide dialog box here 
									$("#dialog-example").modal('hide');
								}
						});
	});
</script>
</head>
<body>
	<button class="btn btn-primary circle" data-toggle="modal"
		data-target="#dialog-example" id="buttonid">Small modal</button>

	<div class="modal fade bs-example-modal" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">...</div>
		</div>
	</div>
	<div class="modal fade" id="dialog-example">
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