<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Thank you</title>

<cfscript>
	responseStruct = "";
	

	try {
		
		// create our objects to call methods on
		caller = createObject("CallerService");
		display = createObject("DisplayService");
		ec = createObject("ExpressCheckout");
		
		
		data = StructNew();
		data.method = "DoExpressCheckoutPayment";
		data.token = url.token;
		data.amt = url.amt;
		data.payerid = url.payerid;
		data.paymentAction = "sale";

		requestData = ec.setGetCheckoutData(request,data);
		
		response = caller.doHttppost(requestData);
		responseStruct = StructNew();
		responseStruct = caller.getNVPResponse(#URLDecode(response)#);
		
		
		returnStruct = StructNew();
		returnStruct['transactionId'] = responseStruct.PAYMENTINFO_0_TRANSACTIONID;
		returnStruct['orderTime'] = responseStruct.PAYMENTINFO_0_ORDERTIME;
		returnStruct['paymentStatus'] = responseStruct.PAYMENTINFO_0_PAYMENTSTATUS;
	
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

<script>

function closeFlow() {
    parent.releaseDG(<cfoutput>#serializeJSON(returnStruct)#</cfoutput>);
}

</script>
</head>

<body onload="closeFlow()">
<div style="background-color:#FFF;height:400px;width:300px; border-radius:8px;padding:20px;">
    Thank you for the purchase!
    <button id="close" onclick="closeFlow();">close</button>
</div>
</body>
</html>