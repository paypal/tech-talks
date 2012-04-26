<!-- 
*************************************************
DoDirectPaymentReceipt.cfm

This page takes necessary parameter from DoDirectPayment page 
and pssing into doHttppost function to perform DoDirectPayment.
This page will show the response value coming from the Server. 
If any error occurs, the page will redirect to APIError.cfm 
to show exact error details

*************************************************
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
		data.countrycode = "US";

		requestData = dp.setDirectPaymentData(form,request,data);
		
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
<title>PayPal CF SDK - DoDirectPayment API</title>
<link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
	
	<cfif responseStruct.Ack is "Success" || responseStruct.Ack is "SuccessWithWarning">
       <h1>Do Direct Payment</h1>
        <b>Thank you for your payment!</b>
        <br>
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
</body>
<a class="home" id="CallsLink" href="index.html">Home</a>
</html>
</cfoutput>