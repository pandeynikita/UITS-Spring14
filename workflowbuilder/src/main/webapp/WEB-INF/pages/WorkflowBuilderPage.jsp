<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
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
	<link rel="stylesheet" href="./css/demos.css">
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
    <link rel="stylesheet" href="./css/bootstrap-responsive.css">
	<style>
	#gallery { float: left; width: 30%; min-height: 12em; }
	.gallery.custom-state-active { background: #eee; }
	.gallery li { float: left; width: 96px; padding: 0.4em; margin: 0 0.4em 0.4em 0; text-align: center; }
	.gallery li h5 { margin: 0 0 0.4em; cursor: move; }
	.gallery li a { float: left; }
	.gallery li a.ui-icon-zoomin { float: left; }
	.gallery li img { width: 100%; cursor: move; }

	#trash { float: left; width: 70%; min-height: 68em; padding: 1%;position:absolute;
    top:10px; right: 10px; }
    #trash h4 { line-height: 16px; margin: 0 0 0.4em; }
	#trash h4 .ui-icon { float: left; }
	#trash .gallery h5 { display: none; }

#circle {
	width: 80px;
	height: 80px;
	background: teal;
	border-radius: 40px;
	border:0.15em solid black;
	border-style:inset;
	padding:4px 3px 1px 3px;
	position:relative;
}

#square {
	width: 80px;
	height: 80px;
	background: teal;
	border:0.15em solid black;
	border-style:inset;
	padding:4px 3px 1px 3px;
	position:relative;
}

#rectangle {
	width: 80px;
	height: 40px;
	background: teal;
	border:0.15em solid black;
	border-style:inset;
	padding:4px 3px 1px 3px;
	position:relative;
}

#oval {
	width: 100px;
	height: 50px;
	background: teal;
	border-radius: 100px / 50px;
	border:0.15em solid black;
	border-style:inset;
	padding:4px 3px 1px 3px;
	position:relative;
}
.dragged1 {
	position:absolute; 
	width:32px;
	height:32px;
}
.dragged2 {
	position:absolute; 
	width:32px;
	height:32px;
}

.dragged3 {
	position:absolute; 
	width:32px;
	height:32px;
}
	</style>
	<script src="http://www.google.com/jsapi" type="text/javascript"></script>
	<script type="text/javascript">
	    google.load("jquery", "1.4.2");
		google.load("jqueryui", "1.7.2");
	</script>
	<script>
	$(function() {
		counter = 0;
		// let the gallery items be draggable
		$( ".gallery" ).draggable({
			revert: "invalid", // when not dropped, the item will revert back to its initial position
			containment: 'trash',
			helper: "clone",
		    cursor: "move",
				//When first dragged
		        stop: function( event, ui ) {
		            var pos = $(ui.helper).offset();
		            
		            objName = "#clonediv" + counter
		            counter++
		            $(objName).css({
		                "left": pos.left,
		                "top": pos.top
		            });
		            $(objName).removeClass("gallery");
		            //When an existing object is dragged
		            $(objName).draggable({
		                containment: 'parent',
		                stop: function( event, ui ) {
		                    var pos = $(ui.helper).offset();
		                    console.log($(this).attr("id"));
		                    console.log(pos.left)
		                    console.log(pos.top)
		                }
		            });
		        }
		});

		// let the trash be droppable, accepting the gallery items
		$("#trash").droppable({
			//accept: "#gallery",
			activeClass: "ui-state-highlight",
			
			drop: function( event, ui ) {
		        if (ui.helper.attr('id').search(/gall[0-9]/) != -1) {
	                counter++;
	                var element = $(ui.draggable).clone();
	                element.addClass("tempclass");
	                $(this).append(element);
	                $(".tempclass").attr("id", "clonediv" + counter);
	                $("#clonediv" + counter).removeClass("tempclass");
	                //Get the dynamically item id
	                draggedNumber = ui.helper.attr('id').search(/gall([0-9])/)
	                itemDragged = "dragged" + RegExp.$1
	                console.log(itemDragged)
	                $("#clonediv" + counter).addClass(itemDragged);
	            }
				
			
        
			}
		});
	

		// let the gallery be droppable as well, accepting items from the trash
		$(".gallery").droppable({
			accept: "#trash",
		    activeClass: "custom-state-active",
			drop: function( event, ui ) {
 				recycleImage( ui.draggable );
			}
		});

		// resolve the icons behavior with event delegation
		/* $( ".gallery" ).click(function( event ) {
			var $item = $( this ),
				$target = $( event.target );
			return false;
		}); */
		
	});
	</script>
</head>
<body>
<div class="container">
<div class="ui-widget ui-helper-clearfix">

<div id="gallery" class="gallery ui-helper-reset ui-helper-clearfix" >
	<div id="gall1" class="gallery ui-corner-tr" style="text-align: center;">
		<h5 id="circle"><font color="white">Action</font></h5>
	</div>
		
	<div id="gall2" class="gallery" style="text-align: center;">
		<h5 id="square"><font color="white">Approval</font></h5>
	</div>
	
	<div id="gall3" class="gallery" style="text-align: center;">
	<h5 id="oval"><font color="white">Cancel</font></h5>
	</div>
</div>
<div id="trash" class="ui-widget-content ui-state-default">
	<h4 class="ui-widget-header"><span class="ui-icon ui-icon-trash">Workflow Editor</span></h4>
</div>

</div>
</div>
</body>
</html>
