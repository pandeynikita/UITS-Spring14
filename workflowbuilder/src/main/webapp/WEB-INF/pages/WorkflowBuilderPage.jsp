<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
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
<link rel="stylesheet" href="./resources/css/demos.css">
<link rel="stylesheet" type="text/css"
	href="./resources/css/bootstrap.css">
<link rel="stylesheet" href="./resources/css/bootstrap-responsive.css">
<link type="text/css" href="./resources/css/bootstrap.css"
	rel="stylesheet" />
<style>
#circle {
	width: 80px;
	height: 80px;
	background: teal;
	border-radius: 40px;
	border: 0.15em solid black;
	border-style: inset;
	padding: 4px 3px 1px 3px;
	position: relative;
}

#square {
	width: 80px;
	height: 80px;
	background: teal;
	border: 0.15em solid black;
	border-style: inset;
	padding: 4px 3px 1px 3px;
	position: relative;
}

#rectangle {
	width: 80px;
	height: 40px;
	background: teal;
	border: 0.15em solid black;
	border-style: inset;
	padding: 4px 3px 1px 3px;
	position: relative;
}

#oval {
	width: 100px;
	height: 50px;
	background: teal;
	border-radius: 100px/50px;
	border: 0.15em solid black;
	border-style: inset;
	padding: 4px 3px 1px 3px;
	position: relative;
}

.arrow {
	width: 120px;
}

.line {
	width: 90px;
	background: teal;
	height: 35px;
	float: left;
	border: 0.15em solid black;
	border-style: inset;
}

.point {
	width: 0;
	height: 0;
	border-top: 20px solid transparent;
	border-bottom: 15px solid transparent;
	border-left: 30px solid teal;
	float: right;
}

#gallery {
	float: left;
	width: 30%;
	min-height: 12em;
}

.gallery.custom-state-active {
	background: #eee;
}

.gallery li {
	float: left;
	width: 96px;
	padding: 0.4em;
	margin: 0 0.4em 0.4em 0;
	text-align: center;
}

.gallery li h5 {
	margin: 0 0 0.4em;
	cursor: move;
}

.gallery li a {
	float: left;
}

.gallery li a.ui-icon-zoomin {
	float: left;
}

.gallery li img {
	width: 100%;
	cursor: move;
}

#trash {
	float: left;
	width: 70%;
	min-height: 68em;
	padding: 1%;
}

#trash h4 {
	line-height: 16px;
	margin: 0 0 0.4em;
}

#trash h4 .ui-icon {
	float: left;
}

#trash .gallery h5 {
	display: none;
}
</style>
<script>
	$(function() {
		// there's the gallery and the trash
		var $gallery = $("#gallery"), $trash = $("#trash");

		// let the gallery items be draggable
		$("li", $gallery).draggable({
			revert : "invalid", // when not dropped, the item will revert back to its initial position
			containment : "document",
			helper : "clone",
			cursor : "move"
		});

		// let the trash be droppable, accepting the gallery items
		$trash.droppable({
			accept : "#gallery > li",
			activeClass : "ui-state-highlight",
			drop : function(event, ui) {
				deleteImage(ui.draggable);
			}
		});

		// let the gallery be droppable as well, accepting items from the trash
		$gallery.droppable({
			accept : "#trash li",
			activeClass : "custom-state-active",
			drop : function(event, ui) {
				recycleImage(ui.draggable);
			}
		});

		// resolve the icons behavior with event delegation
		$("ul.gallery > li").click(function(event) {
			var $item = $(this), $target = $(event.target);
			return false;
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="ui-widget ui-helper-clearfix">

			<ul id="gallery" class="gallery ui-helper-reset ui-helper-clearfix">
				<li class="ui-corner-tr">
					<h5 id="circle">
						<font color="white">Action</font>
					</h5>
				</li>
				<li class="ui-corner-tr">
					<h5 id="square">
						<font color="white">Approval</font>
					</h5>
				</li>
				<li class="ui-corner-tr">
					<h5 id="oval">
						<font color="white">Cancel</font>
					</h5>
				</li>
				<li class="ui-corner-tr">
					<h5 class="arrow">
						<font color="white">
							<h5 class="line">
								Connector
								<h5 class="point">
						</font>
					</h5>
					</h5>
					</h5>
				</li>
			</ul>

			<div id="trash" class="ui-widget-content ui-state-default">
				<h4 class="ui-widget-header">
					<span class="ui-icon ui-icon-trash">Workflow Editor</span>Workflow
					Editor
				</h4>
			</div>

		</div>
	</div>
</body>
</html>
