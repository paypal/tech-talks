<!DOCTYPE html>
<html >
<head>
<meta charset=UTF-8 />
<title>Express Checkout Step 1</title>


	<link href="assets/css/jquery.mobile-1.0b2.css" rel="stylesheet" type="text/css"/>
    
	<script src="assets/js/jquery-1.6.2.min.js" ></script>
	
    <script>
	$(document).bind("mobileinit", function(){
  			 $.mobile.ajaxEnabled=false;	//apply overrides here
	});
	
	
	</script>
    
  	<script src="assets/js/jquery.mobile-1.0b2.js" ></script>
    
</head>
<body>

<div data-role="page"  data-theme="c">
	<div data-role="header">
		<h1>Kiddie Store</h1>
	</div><!-- /header -->

	<div data-role="content">
		<form action="checkout02.cfm" method="post">
    	<div  style="float:left;">
    	    <img src="images/horse.jpg" height="150px" align="right"/>
        </div>
            <div style="float:left; width:300px; padding:10px; font-family:Verdana, Geneva, sans-serif;font-size:12px;">
            From the original My Pillow Pets, this Extra Cuddly brown horse is made of soft plush fabric. Open the velcro closure and use as a pillow. Close the velcro closure and you have the softest pet ever. This is part of the Original My Pillow Pets, as advertised on Nickelodeon, Discovery Kids, TV Land.</div>
        <div style="clear:both;">&nbsp;</div>
        <input type="submit" value="Buy It Now" />
	
	    </form>

    </div>
</div>


</body>
</html>