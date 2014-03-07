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
	var list = [];
	var k = 0;
	var oldid;
	var height = 0, width = 0;
	var counter;

	$(function() {
		counter = 0;
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
					var newId = "dragged" + counter;
					$(newDiv).attr("id", newId);
					counter++;
					$(this).append(newDiv);
					original = false;
					$(newDiv).click(function() {
						/* var id = $(ui.draggable).attr("id"); */
						var id = $(newDiv).attr("id");
						i = i + 1;
						generateCoord(newDiv, id);
						
						if (i == 2 && id != oldid) {
							toId = newId;
							findPath(list);
							drawLine(coord);
							i = k = 0;
							coord[0] = coord[1] = coord[2] = coord[3] = 0;

							for (j = 0; j < 16; j++)
								list[j] = 0;
							j = 0;
							oldid = null;
							id = null;
						} else if (i == 2 && id == oldid) {
							i = k = 0;
							coord[0] = coord[1] = coord[2] = coord[3] = 0;
							for (j = 0; j < 16; j++)
								list[j] = 0;
							j = 0;
							oldid = null;
							id = null;
						} else {
							oldid = id;
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

		width = (document.getElementById(id).offsetWidth) / 2;
		height = (document.getElementById(id).offsetHeight) / 2;

		var canvasPos = findPos(document.getElementById('myCanvas'));

		//left edge
		list[k++] = curLeft - canvasPos.x;
		list[k++] = curTop + height - canvasPos.y;
		//top
		list[k++] = curLeft + width - canvasPos.x;
		list[k++] = curTop - canvasPos.y;
		//right edge
		list[k++] = curLeft + (2 * width) - canvasPos.x;
		list[k++] = curTop + height - canvasPos.y;
		//bottom
		list[k++] = curLeft + width - canvasPos.x;
		list[k++] = curTop + (2 * height) - canvasPos.y;

	}
	function findPath(list) {
		var min = 90071992547409920;
		for (a = 0; a < 8; a += 2) {
			for (b = 8; b < 16; b += 2) {
				xdist = list[a] - list[b];
				ydist = list[a + 1] - list[b + 1];
				dist = Math.sqrt((xdist * xdist) + (ydist * ydist));
				if (dist <= min) {
					min = dist;
					coord[0] = list[a];
					coord[1] = list[a + 1];
					coord[2] = list[b];
					coord[3] = list[b + 1];
				}
			}
		}

	}
	function drawLine(coord, fromId, toId) {
		var ctx = document.getElementById('myCanvas').getContext('2d');
		ctx.beginPath();
		ctx.moveTo(coord[0], coord[1]);
		ctx.lineTo(coord[2], coord[3]);
		ctx.stroke();
		//To draw the Arrowhead
		var endRadians = Math.atan((coord[3] - coord[1])
				/ (coord[2] - coord[0]));
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
			<div class="drop-area ui-widget-content ui-state-default">
				<canvas id="myCanvas" width="1000" height="550px"></canvas>
			</div>
		</div>
	</div>
</body>
</html>