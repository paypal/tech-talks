<html>
<head>
	<title>Button Manager</title>
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>

    <script>
	 $(document).ready(function() {
			
	
			$('#createButton').live('click',function(e)
			{
				
				$.ajax({
					url: 'buttonmanager.cfc',
					data: 'method=BMCreateButton',
					success: function(data){
						var obj = $.parseJSON(data);
						console.log(obj['code']);
						$('#ppButton').append(obj['code']);
						
				},
				error: function(request, textStatus, error){
					
					}
				});	
				
			});
			
		});
	</script>
    
    
</head>
<body>
	
<a href="#" id="createButton">create button</a>
<p id="ppButton">

</p>



<br><br>
<a href="../index.html">home</a>


</body>
</html>
