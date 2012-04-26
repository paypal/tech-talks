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
	<title>Subscription process</title>
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
		data.L_PAYMENTREQUEST_0_ITEMCATEGORY0="Physical";
		data.L_PAYMENTREQUEST_0_NAME0="Pillow Pet";
		data.L_PAYMENTREQUEST_0_NUMBER0="666";
		data.L_PAYMENTREQUEST_0_QTY0="1";
		data.L_PAYMENTREQUEST_0_TAXAMT0="0";
		data.L_PAYMENTREQUEST_0_AMT0="99.00";
		data.L_PAYMENTREQUEST_0_DESC0="It's a pillow, it's a pet, it's a pillow pet!";
		data.ITEMCNT= "1";
		data.paymenAction= "sale";
		data.paymentType="sale";
		
		// set url info
		data.serverName = SERVER_NAME;
		data.serverPort = CGI.SERVER_PORT;
		data.contextPath = GetDirectoryFromPath(#SCRIPT_NAME#);
		data.protocol = CGI.SERVER_PROTOCOL;
		data.cancelPage = "checkout01.cfm";
		data.returnPage = "checkout03.cfm";
		
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