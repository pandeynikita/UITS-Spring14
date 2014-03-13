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

function jsplumbConnector()
{
	
	alert("in func jsplumbConnector");
	// setup some defaults for jsPlumb.	
	var instance = jsPlumb.getInstance({
		Endpoint : ["Dot", {radius:2}],
		HoverPaintStyle : {strokeStyle:"#1e8151", lineWidth:2 },
		ConnectionOverlays : [
			[ "Arrow", { 
				location:1,
				id:"arrow",
                length:14,
                foldback:0.8
			} ],
		],
		Container:"statemachine-demo"
	});
	alert(JSON.stringify(instance));
	var windows = jsPlumb.getSelector(".statemachine-demo .w");
	alert(JSON.stringify(windows));
	console.log(windows);
	
    // initialise draggable elements.  
    instance.draggable();
	instance.draggable(windows);

    // bind a click listener to each connection; the connection is deleted. you could of course
	// just do this: jsPlumb.bind("click", jsPlumb.detach), but I wanted to make it clear what was
	// happening.
	instance.bind("click", function(c) { 
		instance.detach(c); 
	});

	// bind a connection listener. note that the parameter passed to this function contains more than
	// just the new connection - see the documentation for a full list of what is included in 'info'.
	// this listener sets the connection's internal
	// id as the label overlay's text.
	// suspend drawing and initialise.
	instance.doWhileSuspended(function() {
		// make each ".ep" div a source and give it some parameters to work with.  here we tell it
		// to use a Continuous anchor and the StateMachine connectors, and also we give it the
		// connector's paint style.  note that in this demo the strokeStyle is dynamically generated,
		// which prevents us from just setting a jsPlumb.Defaults.PaintStyle.  but that is what i
		// would recommend you do. Note also here that we use the 'filter' option to tell jsPlumb
		// which parts of the element should actually respond to a drag start.
		instance.makeSource(windows, {
			filter:".ep",				// only supported by jquery
			anchor:"Continuous",
			connector:[ "StateMachine", { curviness:20 } ],
			connectorStyle:{ strokeStyle:"#5c96bc", lineWidth:2, outlineColor:"transparent", outlineWidth:4 },
			maxConnections:5
		});						

		// initialise all '.w' elements as connection targets.
	});
	
}

</script>
</head>
<body>

	<div class="wrapper">
		<div class="outer">
			<div class="container"><h1>WorkFlow Editor</h1>
			</div>
		</div>
		<div id="statemachine-demo" class="statemachine-demo class="container">
			<div class="tool-box ui-widget ui-helper-clearfix">
				<div class="circle w ui-corner-tr ui-widget-content">
					<font color="white">Start</font><div class="ep"></div>
				</div>
				<br>
				<div  class="square ui-corner-tr ui-widget-content w">
					<font color="white">Request</font><div class="ep"></div>
				</div>
				<br>
				<div class="rectangle ui-corner-tr ui-widget-content w">
					<font color="white">Approve</font><div class="ep"></div>
				</div>
				<br>
				<div class="oval ui-corner-tr ui-widget-content w">
					<font color="white">Processed</font><div class="ep"></div>
				</div>
			</div>
		
		
		</div>
</div>
</body>
</html>