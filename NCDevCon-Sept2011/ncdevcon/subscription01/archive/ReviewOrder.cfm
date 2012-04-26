<!--
*************************************************
ReviewOrder.cfm

When click submit button in the setexpresscheckout.cfm, the page submitted in Orderreview.cfm
it takes necessary values as parameter and pass into destination URL which returns token and
payerid.This token we need to pass as parameter for getExpresscheckout which return shipping
details. Then we need to pass payer id, token and other necessary information for doexpresschekout

*************************************************
-->
<cfoutput>
<html>
<head>
	<title>PayPal CF SDK - ReviewOrder API</title>
	<link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
<cfscript>
	responseStruct="";
	try {	
		// create our objects to call methods on
		caller = createObject("CallerService");
		ec = createObject("ExpressCheckout");
		
		
		data = StructNew();
		data.METHOD = "SetExpressCheckout";
		data.ADDRESSOVERRIDE = "1";
		data.CALLBACKTIMEOUT = "4";
		data.L_SHIPPINGOPTIONAMOUNT0 = "3.00";
		data.L_SHIPPINGOPTIONAMOUNT1 = "8.00";
		data.L_SHIPPINGOPTIONLABEL0 = "UPS Ground 7 Days";
		data.L_SHIPPINGOPTIONlABEL1 = "UPS Next Day Air";
		data.L_SHIPPINGOPTIONNAME0 ="Ground";
		data.L_SHIPPINGOPTIONNAME1 = "UPS Air";
		data.L_SHIPPINGOPTIONISDEFAULT0 = "false";
		data.L_SHIPPINGOPTIONISDEFAULT1 ="true";	
		data.INSURANCEAMT = "1.00";
		data.INSURANCEOPTIONOFFERED = "true";
		data.CALLBACK = "https://d-sjn-00513807/callback.pl";
		data.SHIPPINGAMT = "8.00";
		data.SHIPDISCAMT = "-3.00";
		data.TAXAMT = "2.00";
		
		// set url info
		data.serverName = SERVER_NAME;
		data.serverPort = CGI.SERVER_PORT;
		data.contextPath = GetDirectoryFromPath(#SCRIPT_NAME#);
		data.protocol = CGI.SERVER_PROTOCOL;
		data.cancelPage = "SetExpressCheckout.cfm";
		data.returnPage = "GetExpressCheckoutDetails.cfm";
		
		requestData = ec.setExpressCheckoutData(form,request,data);
		
		response = caller.doHttppost(requestData);
		
		responseStruct = caller.getNVPResponse(#URLDecode(response)#);
		
		if (responseStruct.Ack is not "Success")
		{
			Throw(type="InvalidData",message="Response:#responseStruct.Ack#, ErrorCode: #responseStruct.L_ERRORCODE0#, Message: #responseStruct.L_LONGMESSAGE0#"); 	
		
		} else {
			token = responseStruct.token;
		}
		
		/*	cfhttp.FileContent returns token and other response value from the server.
		We need to pass token as parameter to destination URL which redirect to return URL
		*/
		redirecturl = request.PayPalURL & token;
	 	location(redirecturl,false);
		
	}
	
	catch(any e) 
	{
		writeOutput("Error: " & e.message);
		writeDump(responseStruct);
	}
	
</cfscript>
	
<a class="home"  href="index.html">Home</a>
</body>
</html>
</cfoutput>