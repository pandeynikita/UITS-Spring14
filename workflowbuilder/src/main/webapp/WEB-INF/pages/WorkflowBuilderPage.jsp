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
<link rel="stylesheet" type="text/css"
	href="./resources/css/bootstrap.css">
<link rel="stylesheet" href="./resources/css/bootstrap-responsive.css">
<link rel="stylesheet" href="./resources/css/custom.css">
<script>
	$(function() {
		//To Create single instances of cloned object
		var original = false;
		//To find the shape of the component
		function getShape(divElement) {
			return $(divElement).hasClass("circle") ? "circle" : $(divElement)
					.hasClass("square") ? "square" : $(divElement).hasClass(
					"rectangle") ? "rectangle" : "oval";
		}
		
		//Iterate through the whole div to retrieve each component's data
		function getComponentData(divElement) {
			var componentData = [];
			$.each($(divElement).children(), function(index, value) {
				
				shape = getShape(value);					
				subject = $($(value).children()).text();	//Traverse through its child element to get subject line
				xTop = $(value).children().position().top;	//Find the top co-ordinate value
				yLeft = $(value).children().position().left;//Find teh left co-ordinate value
				
				componentData.push({
					shape : shape,
					subject : subject,
					position : {
						top : xTop,
						left : yLeft
					}
				});											//Push the set of values together to form a JSON object
			});
			return componentData;
		};

		$('.draggable').mousedown(function() {
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

		$(".drop-area").droppable({
			accept : ".draggable",
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

				}
			}
		});
		
		$("#save").click(function() {
			//Get the div and recurse through the div
			var exportedData = getComponentData(".drop-area");
			console.log(JSON.stringify(exportedData));
			$.ajax({
				type : 'POST',
				url : 'save',
				dataType : 'json',
				contentType : 'application/json',
				data : JSON.stringify(exportedData),
				

				success : function(data, textStatus) {
					console.log(data);
				},
				error : function(xhr, textStatus, errorThrown) {
					console.log(xhr, textStatus, errorThrown);
				}
			});

		});
	});
</script>
</head>
<body>
	<div class="wrapper">
		<div class="outer">
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
	</div>
	<input type="button" id="save" value="Save" />
	<input type="button" id="load" value="Load" />
	<input type="button" id="export" value="Export" />
</body>
</html>