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
<title>Subscription via Express Checkout Step 3</title>
<link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>

<body>


  <form action="sub04.cfm" method="post">
	<cfif responseStruct.Ack is "Success">
     
     
     	<center> 
		<b>Review Order</b>
		<br>
		<b>GetExpressCheckoutDetails</b>
        <br><br>
         <input type="submit" value="Activate Subscription" />
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

    <input type="hidden" name="token" value="#responseStruct.token#">
    <input type="hidden"  name="amt" value="#URL.AMT#">

  </form>
<a class="home" id="CallsLink" href="index.html">Home</a>
</body>
</html>
</cfoutput>