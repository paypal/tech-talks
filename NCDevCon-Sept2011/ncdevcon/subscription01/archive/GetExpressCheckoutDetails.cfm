<!--
*************************************************
GetExpressCheckoutDetails.cfm

This page shows shipping details coming from the server's response object. When click the submit button
token, payerid, amount, currency and other necessary information passed into DoExpressChekoutpayment.cfm.

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
		data.method = "GetExpressCheckoutDetails";
		data.token = url.token;

		requestData = ec.setGetCheckoutData(request,data);
		response = caller.doHttppost(requestData);
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
<title>PayPal CF SDK - ExpressCheckout API</title>
<link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>

<body>
  <cfform action="DoExpressCheckoutPayment.cfm" method="post">
	<cfif responseStruct.Ack is "Success">
		<cfinput type="hidden" name="totalAmt" value="#responseStruct.AMT#">
		<center> 
		<b>Review Order</b>
		<br>
		<b>DoExpressCheckoutPayment</b>
        <br><br>
        <cfscript>
       	 	writeOutput(display.displayText(responseStruct));
        </cfscript>
        <input type="submit" value="Pay" />
	</cfif>

	<cfif responseStruct.Ack is "Failure">
       	<center> 
		<b>Error!</b>
		<br>
        <cfscript>
       	 	writeOutput(display.displayText(responseStruct));
        </cfscript>
    </cfif>

    <cfinput type="hidden"  name="payerId" value="#URL.payerId#">
    <cfinput type="hidden" name="token" value="#URL.token#">
    <cfinput type="hidden"  name="amt" value="#URL.AMT#">
    <cfinput type="hidden" name="currencycode" value="#URL.currencycode#">
    <cfinput type="hidden" name="paymentaction" value="#URL.paymentaction#">

  </cfform>
<a class="home" id="CallsLink" href="index.html">Home</a>
</body>
</html>
</cfoutput>