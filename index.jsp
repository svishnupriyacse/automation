<html>
<head>
<title>Image Upload--</title>

</head>
<body>
<h2>Hello World!</h2>
<div class="form-group">
			<label class="col-md-4 control-label" for="title">Title</label>
			<div class="col-md-4">
				<input id="title" name="title" type="text" 
					placeholder="Enter Title" class="form-control input-md"
					required>
			</div>
		</div><br>
		
		<div class="form-group">
			<label class="col-md-4 control-label" for="body">Body</label>
			<div class="col-md-4">
				<textarea id="body" class="form-control input-md" name="body" rows="4" cols="20" ></textarea>
			</div>
		</div><br>
		<div class="form-group" id="sum">
			<label class="col-md-4 control-label" for="summary">Summary</label>
			<div class="col-md-4">
				<textarea id="summary" class="form-control input-md" name="summary" rows="4" cols="20" ></textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-4 control-label" for="title">IMAGE:</label>
			<div class="col-md-4">
				<input id="fileupload" name="image" type="file" class="form-control input-md"
					required>
			</div>
		</div><br>
		<div id="dvPreview"></div><br>
		<div class="form-group" id="alttxt">
			<label class="col-md-4 control-label" for="title">Alternative Text:</label>
			<div class="col-md-4">
				<input id="alt" name="alttxt" type="text" class="form-control input-md"
					required>
			</div>
		</div><br>
		<div class="form-group">
			
			<input id="upload" type="button" value="upload" onclick="upload();">
			<input id="remove" type="button" value="remove" onclick="remove();">
		</div>
		<input id="save" type="button" value="remove" onclick="savedata();">
</body>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#remove").hide();
	$("#alttxt").hide();
	
	var imagelocation = $("#fileupload").val();
	console.log(imagelocation);
});
function summary(){
	document.getElementById("sum").display ="block";
}
function upload() {

                       if (typeof (FileReader) != "undefined") {
                    $("#dvPreview").show();
                    $("#dvPreview").append("<img style='height:200px; width:200px;' id='imgg' />");
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#dvPreview img").attr("src", e.target.result);
                    }
                    reader.readAsDataURL($("#fileupload")[0].files[0]);
                    
                    $("#remove").show();
                    $("#alttxt").show();
	   $("#upload").hide();
$("#fileupload").hide();

		
                } else {
                    alert("This browser does not support FileReader.");
                } 
};
function remove(){
	var reader = new FileReader();
	console.log(reader.readAsDataURL($("#fileupload")[0].files[0]));
	$("#alttxt").hide();
	$("#remove").hide();
	 $("#upload").show();
	 $("#fileupload").show();
	 $("#dvPreview img").remove();
	 $("#fileupload").attr({value:''});
	 
	 		
}

function savedata(){
	var dataToSend ={"Title" : $("#title").val(),
			"Summary" : $("#body").val(),
			"Body" : $("#summary").val(),
			"file" : $("#imgg").attr("src"),
			"AltTxt" : $("#alt").val(),
			}
	$.ajax({
		url:"page1",
		type : "POST",
		content:false,
		data: JSON.stringify(dataToSend),
		
	success: function(data){
        alert(data);
    }
	});
}
</script>
</html>
