<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="./resources/static/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="./resources/css/bootstrap.css">
<script type="text/javascript">

var nodes= [
            {
                "name": "requests",
                "image": "circle",
                "header": "Action Configuration",
                "properties": {
                  "mandatoryRoute": {
                    "label": "Mandatory Route",
                    "type": "radio",
                    "options": [
                      "Yes",
                      "No"
                    ]
                  },
                  "activationType": {
                    "label": "Activation Type",
                    "type": "select",
                    "options": [
                      "Parallel",
                      "serial"
                    ]
                  }
                }
              }
            ]
$(function(){
	$("#buttonid").click(function(e){
		var obj = nodes[0].header;
		alert(obj);
		$(".modal-header").html(obj);		
		$("#dialog-example").modal('show');
	});
});
	
	
	        
	
            

</script>
</head>
<body>
	<button class="btn btn-primary" data-toggle="modal"
		data-target="#dialog-example" id="buttonid">Small modal</button>

	<div class="modal fade bs-example-modal" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">...</div>
		</div>
	</div>
	<div class="modal fade" id="dialog-example">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4>Dialog page</h4>
				</div>
				<div class="modal-body">Testing</div>
				<div class="modal-footer">
					<a href="#" data-dismiss="modal" class="btn">Close</a> <a href="#"
						class="btn btn-primary" id="btn-save">Save</a>
				</div>
			</div>
		</div>


	</div>
</body>
</html>