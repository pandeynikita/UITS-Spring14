<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1.0">
<title>Workflow Editor</title>
<link rel="stylesheet" href="./css/jquery.ui.all.css">
<script src="./static/jquery-1.10.2.js"></script>
<script src="./static/jquery.ui.position.js"></script>
<script src="./static/jquery.ui.core.js"></script>
<script src="./static/jquery.ui.widget.js"></script>
<script src="./static/jquery.ui.mouse.js"></script>
<script src="./static/jquery.ui.draggable.js"></script>
<script src="./static/jquery.ui.droppable.js"></script>
<script src="./static/jquery.ui.resizable.js"></script>
<script src="./static/jquery.ui.dialog.js"></script>
<script src="./static/custom.js"></script>
<link rel="stylesheet" href="./css/test.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/bootstrap-responsive.css">
<script>
$(function(){

$( "#draggable" ).draggable({
		 revert: "invalid", 
	 	 //appendTo: ".drop-area",
		 helper: 'clone',
		 cursor: "auto",
		 scroll: false
});

$( ".drop-area" ).droppable({
	activeClass: "ui-state-highlight",
	drop: function( event, ui ){
		deleteImage( ui.draggable );
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
		<div class="tool-box ui-widget ui-helper-clearfix">
			<div id="draggable" class="circle ui-corner-tr ui-widget-content">
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
		<div class="drop-area ui-widget-content ui-state-default">
			<div id="droppable" class="container"></div>
		</div>
	</div>
</body>
</html>
