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
<script src="./resources/static/jquery.jsPlumb-1.5.5-min.js"></script>
<script src="./resources/static/demo-jquery.js"></script>
<script src="./resources/static/demo-list.js"></script>
<script type="text/javascript" src="./resources/static/bootstrap.js"></script>
<script type="text/javascript" src="./resources/static/bootstrap.min.js"></script>
 <link rel="stylesheet" href="./resources/css/demo.css">
<link rel="stylesheet" type="text/css" href="./resources/css/bootstrap.css">
<link rel="stylesheet" href="./resources/css/bootstrap-responsive.css">
<link rel="stylesheet" href="./resources/css/custom.css">

<script>
	$(function() {
		var idCount = 1;
		//To Create single instances of cloned object
		$('.w').mousedown(function() {
			original = true;
		});



		$(".w").draggable({
			revert : "invalid", //	To revert back to the same position when dropped on to toolbox
			containment : "#editor-window", //
			helper : "clone", // 	Clone a new instance
			cursor : "move",
			scroll : false,
			appendTo : ".statemachine-demo"
		});

		$(".statemachine-demo").droppable({
			cept : ".w",
			containment : "#statemachine-demo",
			tolerance : "fit", //The moveable object has to be inside the dropable object area
			activeClass : "ui-state-highlight", //	Highlight the drop area
			drop : function(event, ui) { //	when it is dropped, if it is original instance, clone a new instance of it 
				// 	and append it to drop-area and make original false to avoid multiple instance		
					   
				if (original) {
					var newDiv = $(ui.helper).clone();
					newDiv.draggable({
						containment : ".statemachine-demo"
					});
					$(newDiv).attr('id', 'jsPlumb_2_' + idCount);
					   idCount++;
					$(this).append(newDiv);
					
					original = false;
				}
			}
		});


	});
</script>
</head>
<body>

	<div class="wrapper">
		<div class="outer">
			<div class="container">				<h1>WorkFlow Editor</h1>
			</div>
		</div>
		<div id="editor-window" class="container">
			<div class="tool-box ui-widget ui-helper-clearfix">
				<div class="circle w  ui-droppable ">
					<font color="white">Start</font><div class="ep"></div>
				</div>
				<br>
				<div  class="square ui-corner-tr  ui-droppable ui-widget-content w">
					<font color="white">Request</font><div class="ep"></div>
				</div>
				<br>
				<div class="rectangle ui-corner-tr ui-droppable ui-widget-content w">
					<font color="white">Approve</font><div class="ep"></div>
				</div>
				<br>
				<div class="oval ui-corner-tr  ui-droppable ui-widget-content w">
					<font color="white">Processed</font><div class="ep"></div>
				</div>
			</div>
		
			<div id="statemachine-demo" class="statemachine-demo drop-area ui-widget-content ui-state-default  ui-droppable"></div>
		
		</div>
</div>
</body>
</html>