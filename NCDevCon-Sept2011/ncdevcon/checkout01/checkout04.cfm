<!--
*************************************************
DoExpressCheckoutPayment.cfm

This page takes necessary parameter from GetExpressCheckoutDetails page
and pssing into doHttppost function to perform doExpressCheckout
This page will show the response value coming from the Server. If any error occurs,
the page will redirect to APIError.cfm to show exact error details

*************************************************
-->
<cfscript>
	responseStruct = StructNew();
	
	try {
		
		// create our objects to call methods on
		caller = createObject("CallerService");
		display = createObject("DisplayService");
		ec = createObject("ExpressCheckout");
		
		
		data = StructNew();
		data.method = "DoExpressCheckoutPayment";
		data.paymentAction = "sale";

		requestData = ec.setDoCheckoutData(form,request,data);
		response = caller.doHttppost(requestData);
		responseStruct = caller.getNVPResponse(#URLDecode(response)#);
		
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
    <title>PayPal CF SDK - DoExpressCheckoutPayment API</title>
    <link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
   
	<cfif responseStruct.Ack is "Success">
      <center>
        <br>
            <center>
            <font size=2 color=black face=Verdana><b>DoExpressCheckoutPayment</b></font>
            <br><br>
            <b>Thank you for your payment!</b><br><br>
            <div class="api">
             <cfscript>
                writeOutput(display.displayText(responseStruct));
            </cfscript>
            </div>
        </center>
    </cfif>
	<cfif responseStruct.Ack is "Failure">
		<center> 
		<b>Error!</b>
		<br>
        <cfscript>
       	 	writeOutput(display.displayText(responseStruct));
        </cfscript>
        </center>
	</cfif>

</cfoutput>
<a class="home" id="CallsLink" href="../index.html">Home</a>
</body>
</html>
