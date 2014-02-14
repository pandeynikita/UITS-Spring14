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
<script src="./resources/static/custom.js"></script>
<link rel="stylesheet" href="./resources/css/custom.css">
<link rel="stylesheet" type="text/css"
	href="./resources/css/bootstrap.css">
<link rel="stylesheet" href="./resources/css/bootstrap-responsive.css">
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
