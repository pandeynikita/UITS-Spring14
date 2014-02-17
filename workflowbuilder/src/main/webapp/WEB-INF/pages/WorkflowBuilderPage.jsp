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
<link rel="stylesheet" href="./resources/css/custom.css">
<link rel="stylesheet" type="text/css"
	href="./resources/css/bootstrap.css">
<link rel="stylesheet" href="./resources/css/bootstrap-responsive.css">
<script>
	$(function() {

		$(".draggable").draggable({
			revert : "invalid",
			containment: "#editor-window",
			helper : "clone",
			cursor : "move",
			scroll : false,
			appendTo: ".drop-area"
		});

		$(".drop-area").droppable({
			activeClass : "ui-state-highlight",
			drop : function(event, ui) {
			   	 $(this).append($(ui));
			}
		})
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
		<div id="editor-window">
			<div class="tool-box ui-widget ui-helper-clearfix">
				<div class="draggable circle ui-corner-tr ui-widget-content">
					<font color="white">Action</font>
				</div>


				<!-- 
				<div id="gall2" style="text-align: center;">
					<h5 id="square">
						<font color="white">Approval</font>
					</h5>
				</div>

				<div id="gall3" style="text-align: center;">
					<h5 id="oval">
						<font color="white">Cancel</font>
					</h5>
				</div> -->
			</div>
			<div class="drop-area ui-widget-content ui-state-default"></div>
		</div>
	</div>
</body>
</html>
