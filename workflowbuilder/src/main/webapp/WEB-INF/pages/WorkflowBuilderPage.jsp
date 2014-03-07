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
	var i = 0;
	var j = 0;
	var coord = [];
	$(function() {

		var original = false;
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
				if (original) {
					var newDiv = $(ui.helper).clone();
					newDiv.draggable({
						containment : ".drop-area"
					});
					$(this).append(newDiv);
					original = false;
					$(newDiv).click(function() {
						var id = $(ui.draggable).attr("id");
						i = i + 1;
						generateCoord(newDiv, id); //Calculate the centre of the div's
						if (i == 2) {
							recalcEdge(id, coord); //Calculate the centre of the edge of the div's
							drawLine(coord);       //Draw the line with Arrowhead
							i = j = 0;
							coord[0] = coord[1] = coord[2] = coord[3] = 0;
						}
					});
				}
			}
		})
	});
	//Get the absolute position of a DOM object on a page
	function findPos(obj) {
		var currLeft = currTop = 0;
		if (obj.offsetParent) {
			do {
				currLeft += obj.offsetLeft;
				currTop += obj.offsetTop;
			} while (obj = obj.offsetParent);

			return {
				x : currLeft,
				y : currTop
			};
		}
	}
	function generateCoord(newDiv, id) {
		curLeft = newDiv.offset().left;
		curTop = newDiv.offset().top;

		curLeft += (document.getElementById(id).offsetWidth) / 2;
		curTop  += (document.getElementById(id).offsetHeight) / 2;

		coord[j] = curLeft;
		coord[j + 1] = curTop;

		j = j + 2;
	}
	function recalcEdge(id, coord) {
		if ((Math.abs(coord[0] - coord[2])) > (Math.abs(coord[1] - coord[3]))) {
			//Left to Right
			if (coord[0] < coord[2]) {
				alert("Left to Right");
				coord[0] += (document.getElementById(id).offsetWidth) / 2;
				coord[2] -= (document.getElementById(id).offsetWidth) / 2;
			}
			//Right to Left
			if (coord[0] > coord[2]) {
				alert("Right to Left");
				coord[0] -= (document.getElementById(id).offsetWidth) / 2;
				coord[2] += (document.getElementById(id).offsetWidth) / 2;
			}
		} else if ((Math.abs(coord[0] - coord[2])) < (Math.abs(coord[1]
				- coord[3]))) {
			//Top to Bottom
			if (coord[1] < coord[3]) {
				alert("Top to Bottom");
				coord[1] += (document.getElementById(id).offsetHeight) / 2;
				coord[3] -= (document.getElementById(id).offsetHeight) / 2;
			}
			//Bottom to Top
			if (coord[1] > coord[3]) {
				alert("Bottom to Top");
				coord[1] -= (document.getElementById(id).clientHeight) / 2;
				coord[3] += (document.getElementById(id).clientHeight) / 2;
			}
		}
		//Adjust the coordinates with respect to the canvas.
		var canvasPos = findPos(document.getElementById('myCanvas'));
		coord[0] -= canvasPos.x;
		coord[1] -= canvasPos.y;
		coord[2] -= canvasPos.x;
		coord[3] -= canvasPos.y;
	}
	function drawLine(coord) {
		var ctx = document.getElementById('myCanvas').getContext('2d');
		//To draw the Line
		ctx.beginPath();
		ctx.moveTo(coord[0], coord[1]);
		ctx.lineTo(coord[2], coord[3]);
		ctx.stroke();
		//To draw the Arrowhead
		var endRadians = Math.atan((coord[3] - coord[1])/ (coord[2] - coord[0]));
		endRadians += ((coord[2] > coord[0]) ? 90 : -90) * Math.PI / 180;
		ctx.save();
		ctx.translate(coord[2], coord[3]);
		ctx.rotate(endRadians);
		ctx.moveTo(0, 0);
		ctx.lineTo(5, 20);
		ctx.lineTo(-5, 20);
		ctx.closePath();
		ctx.restore();
		ctx.fill();
	}
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
				<div id="circle"
					class="draggable circle ui-corner-tr ui-widget-content">
					<font color="white">Start</font>
				</div>
				<br>
				<div id="square"
					class="draggable square ui-corner-tr ui-widget-content">
					<font color="white">Request</font>
				</div>
				<br>
				<div id="rectangle"
					class="draggable rectangle ui-corner-tr ui-widget-content">
					<font color="white">Approve</font>
				</div>
				<br>
				<div id="oval" class="draggable oval ui-corner-tr ui-widget-content">
					<font color="white">Processed</font>
				</div>
			</div>
			<div class="drop-area ui-widget-content ui-state-default">
				<canvas id="myCanvas" width="1000" height="550px"></canvas>
			</div>
		</div>
	</div>
</body>
</html>