<!--
*************************************************
GetExpressCheckoutDetails.cfm

This page shows shipping details coming from the server's response object. When click the submit button
token, payerid, amount, currency and other necessary information passed into DoExpressChekoutpayment.cfm.

*************************************************
-->
<cfscript>
	responseStruct = "";
	try {
		
		// create our objects to call methods on
		caller = createObject("CallerService");
		display = createObject("DisplayService");
		ec = createObject("ExpressCheckout");
		
		data = StructNew();
		data.method = "GetExpressCheckoutDetails";
		data.token = url.token;

		requestData = ec.setGetCheckoutData(request,data);
		
		response = caller.doHttppost(requestData);
		
		responseStruct = StructNew();
		responseStruct = caller.getNVPResponse(#URLDecode(response)#);
	
		if (not StructKeyExists(responseStruct, "SHIPTOSTREET2"))
		{
			responseStruct.SHIPTOSTREET2 = "";
		}
	}

	catch(any e) 
	{
		writeOutput("Error: " & e.message);
		writeDump(responseStruct);
		abort;
	}
</cfscript>

<cfoutput>

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
</head>

<body>


<div data-role="page"  data-theme="c">
	<div data-role="header">
	    <a  rel="external" href="../index.html">Home</a>

		<h1>Kiddie Store</h1>
	</div><!-- /header -->

	<div data-role="content">
	<cfif responseStruct.Ack is "Success">
		<center> 
		<b>Order Complete</b>
		<br>
		<b>Congrats!</b>
        <br><br>
        
        <cfscript>
       	 	writeOutput(display.displayText(responseStruct));
        </cfscript>
       
	</cfif>

	<cfif responseStruct.Ack is "Failure">
       	<center> 
		<b>Error!</b>
		<br>
        <cfscript>
       	 	writeOutput(display.displayText(responseStruct));
        </cfscript>
    </cfif>


    </div>
</div>   
</body>
</html>
</cfoutput>