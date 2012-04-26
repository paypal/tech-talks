<!-- 
*************************************************
RefundReceipt.cfm

This page takes necessary parameter from RefundReceipt.cfm page 
and pssing into doHttppost function which takes request value
as Struct Object it will call cfhttp tag to perform Refund Transaction.This 
page will show the response value coming from the Server. If 
any error occurs, the page will redirect to APIError.cfm to 
show exact error details

*************************************************
-->

<cfscript>
	StructClear(Session);
		
	// create our objects to call methods on
	caller = createObject("CallerService");
	display = createObject("DisplayService");
	trans = createObject("Transaction");

	try {
		
		data = StructNew();
		data.method = "RefundTransaction";
	
		requestData = trans.setRefundData(form,request,data);
		
		//writeDump(requestData);
		//abort;
		
		response = caller.doHttppost(requestData);
		
		responseStruct = StructNew();
		responseStruct = caller.getNVPResponse(#URLDecode(response)#);
		Session.resStruct = responseStruct;
		
	}

	catch(any e) 
	{
		writeOutput("Error: " & e.message);
		writeDump(session.resStruct);
		abort;
	}
</cfscript>

<html>
<head>
    <title>PayPal SDK - Refund Receipt</title>
    <link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<cfif responseStruct.Ack is "Success">
	<h1>Refund Transaction</h1>
	
	<b>Transaction refunded!</b><br><br>
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

<a class="home" id="CallsLink" href="index.html">Home</a>
</body>
</html>