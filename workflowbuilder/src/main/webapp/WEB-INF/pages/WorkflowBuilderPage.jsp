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
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="./resources/css/bootstrap.css">
<link rel="stylesheet" href="./resources/css/bootstrap-responsive.css">
<link rel="stylesheet" href="./resources/css/custom.css">

<script>
	$(function() {

		var original = false;
		var atype=null;
		var mroute=null;
		var fapproval=null;
		//To Create single instances of cloned object
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
			containment : ".drop-area",
			tolerance : "fit", //The moveable object has to be inside the dropable object area
			activeClass : "ui-state-highlight", //	Highlight the drop area
			drop : function(event, ui) { //	when it is dropped, if it is original instance, clone a new instance of it 
				// 	and append it to drop-area and make original false to avoid multiple instance
					
				var newDiv = $(ui.helper).clone();
				
				if($(newDiv).hasClass("circle")){
				$("#dialog1").dialog("open");
				}
				
				 if ($(newDiv).hasClass("square")) {
					 
					 $("#dialog2").dialog("open");
				 }
				
				if (original) {
					
				
					newDiv.draggable({
						containment : ".drop-area"
					});
					
				/* 	$('.draggable').mousedown(function() {
						
						
					});
					 */
					
					if($(newDiv).hasClass("circle")){
						$(this).append(newDiv);
						//alert("Circle");
						$(newDiv).addClass("dragged-circle");
						original = false;
						$(".dragged-circle").dblclick(function() {
							//atype = $("#atype").val();
							//alert("circle");
							if(atype)
								{
									$("#atype").val(atype);
								}
							if(mroute)
								{
									$("#mroute").val(mroute);
								
								}
							if(fapproval)
								{
									$("#fapproval").val(fapproval);
								}
							$("#dialog1").dialog("open");
						});
					}
					 if ($(newDiv).hasClass("square")) {
							$(this).append(newDiv);
						//	alert("Square");
							$(newDiv).addClass("dragged-square");
							original = false;
							$(newDiv).dblclick(function() {
								$("#dialog2").dialog("open");
							}); 
					}
				}
			}
		});
		$("#dialog1").dialog({
			autoOpen : false,
			modal : true,
			maxHeight : 400,
			maxWidth : 400,
			//show : "slideDown",
			buttons : {
				"Save" : function() {

					 atype = $("#atype").val();
					 mroute = $("#mroute").val();
					 fapproval = $("#fapproval").val();
					$(".dragged-circle").data("atype", atype);
					$(".dragged-circle").data("mroute", mroute);
					$(".dragged-circle").data("fapproval", fapproval);
					//alert($(".dragged-circle").data("atype"));
					$(this).dialog("close");
				},
				"Cancel" : function() {
					$(this).dialog("close");
				}
			},
			close : function() {
				$("#atype").val("");
				$("#mroute").val("");
				$("#fapproval").val("");

			}

		});
		
		$("#dialog2").dialog({
			autoOpen : false,
			modal : true,
			maxHeight : 400,
			maxWidth : 400,
			show : "slideDown",
			buttons : {
				"Save" : function() {

					var from = $("#from").val();
					var to = $("#to").val();
					$(".dragged-square").data("from", from);
					$(".dragged-square").data("to", to);					
					$(this).dialog("close");
				},
				"Cancel" : function() {
					$("#from").val("");
					$("#to").val("");
					$(this).dialog("close");
				}
			},
			close : function() {
				
				
			}

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
				<div class="draggable   ui-corner-tr ui-widget-content">
					<font color="white">Action</font>
				</div>
				<br>
				<div class="draggable square ui-corner-tr ui-widget-content">
					<font color="white">Email</font>
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
		<div id="dialog1" title="Action Configuration">
			<form>
				<fieldset>
					<label for="atype">Activation Type</label> <input type="text"
						name="atype" id="atype"
						class="text ui-widget-content ui-corner-all"> <label>Mandatory
						Route </label> <input type="radio" name="mroute" id="mroute" value="Yes"
						class="text ui-widget-content ui-corner-all"> <label
						for="mroute">Yes </label> <input type="radio" name="mroute"
						id="mroute" value="No"
						class="text ui-widget-content ui-corner-all"> <label
						for="mroute">No </label> <label for="fapproval">Final
						Approval</label> <input type="text" name="fapproval" id="fapproval"
						class="text ui-widget-content ui-corner-all">


				</fieldset>
			</form>
		</div>
		<div id="dialog2" title="Email Configuration">
			<form>
				<fieldset>
					<label for="from">From</label> <input type="text"
						name="from" id="from"
						class="text ui-widget-content ui-corner-all"> 
						<br>
						<label>To
						</label>  <input type="text"
						name="to" id="to"
						class="text ui-widget-content ui-corner-all">
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>