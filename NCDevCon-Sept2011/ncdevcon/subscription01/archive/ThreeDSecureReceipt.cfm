
<!-- 
ThreeDSecureReceipt.cfm

Submits a credit card transaction to PayPal using a
DoDirectPayment request.

The code collects transaction parameters from the form
displayed by ThreeDSecure.cfm then constructs and sends
the DoDirectPayment request string to the PayPal server.
The paymentType variable becomes the PAYMENTACTION parameter
of the request string.

After the PayPal server returns the response, the code
displays the API request and response in the browser.
If the response from PayPal was a success, it displays the
response parameters. If the response was an error, it
displays the errors.

Called by ThreeDSecure.cfm.

Calls CallerService.cfc and APIError.cfm. 
-->
<cfscript>
	try {
		
		StructClear(Session);
		
		// create our objects to call methods on
		caller = createObject("CallerService");
		display = createObject("DisplayService");
		dp = createObject("DirectPayment");
		
		data = StructNew();
		data.method = "DoDirectPayment";
		data.currencycode = "USD";
		data.countrycode = "GB";

		requestData = dp.setDirectPayment3DData(form,request,data);
		
		response = caller.doHttppost(requestData);
		
		responseStruct = StructNew();
		responseStruct = caller.getNVPResponse(#URLDecode(response)#);
		Session.resStruct = responseStruct;
	}

	catch(any e) 
	{
		writeOutput("Error: " & e.message);
		writeDump(Session.resStruct);
		abort;
	}
</cfscript>
<cfoutput>

<head>
<title>PayPal ColdFusion SDK - 3D Secure DoDirectPayment API</title>
<link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<cfif responseStruct.Ack is "Success" || responseStruct.Ack is "SuccessWithWarning" >

	<br>
	<center>
	<font size=2 color=black face=Verdana><b>3D Secure DDP Response</b></font>
	<br><br>
	<b>Thank you for your payment!</b><br><br>
    <cfscript>
		writeOutput(display.displayText(responseStruct));
	</cfscript>
    </center>
</cfif>


<cfif responseStruct.Ack is "Failure">
    	<center> 
		<b>Error!</b>
		<br>
        <cfscript>
       	 	writeOutput(display.displayText(responseStruct));
        </cfscript>
</cfif>


<br>
<a class="home" id="CallsLink" href="index.html">Home</a>
</body>
</html>
</cfoutput>
