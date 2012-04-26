<!--
*************************************************
TransactionDetails.cfm

This page takes necessary parameter from GetTransactionDetails.cfm page
and passing the parameters to doHttppost function which takes request value
as Struct Object it will call cfhttp tag to perform TransactionDetails.This
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
	admin = createObject("Transaction");

	try {
		
		data = StructNew();
		data.method = "GetTransactionDetails";
		
		requestData = admin.setAdministrativeData(form,request,data,url);
	
		response = caller.doHttppost(requestData);
		
		responseStruct = StructNew();
		responseStruct = caller.getNVPResponse(#URLDecode(response)#);
		Session.resStruct = responseStruct;
		if (not StructKeyExists(responseStruct, "PARENTTRANSACTIONID"))
		{
			responseStruct.PARENTTRANSACTIONID = "";
		}
	}

	catch(any e) 
	{
		writeOutput("Error: " & e.message);
		writeDump(session.resStruct);
		abort;
	}
</cfscript>

<head>
<title>PayPal CF SDK - Transaction details</title>
<link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<cfoutput>
<cfif responseStruct.Ack is "Success">
  
<h1 align="center">Transaction Details</h1>

<div>
<fieldset>
    <ol>
    <li><label>Payer:</label> #responseStruct.RECEIVEREMAIL#</li>
    <li><label>Payer ID:</label>#responseStruct.PAYERID#</li>
    <li><label>First Name:</label>#responseStruct.FIRSTNAME#</li>
    <li><label>Last Name:</label>#responseStruct.LASTNAME#</li>
    <li><label>Transaction ID:</label>#responseStruct.TRANSACTIONID#</li>
    <li><label>Parent Transaction ID (if any):</label>#responseStruct.PARENTTRANSACTIONID#</li>
    <li><label>Gross Amount:</label>#responseStruct.AMT#</li>
    <li><label>Payment Status:</label>#responseStruct.PAYERSTATUS#</li>
    <li> <label>Pending Reason:</label>#responseStruct.PENDINGREASON#</li>
    <li><label>ProtectionEligibility:</label>#responseStruct.PROTECTIONELIGIBILITY#</li>
	</ol>
      <a id="DoVoidLink" href="DoVoid.cfm?authorizationID=#responseStruct.TRANSACTIONID#">Void</a>
		<a id="DoCaptureLink" href="DoCapture.cfm?authorizationID=#responseStruct.TRANSACTIONID#&currency=#responseStruct.CURRENCYCODE#&amount=#responseStruct.AMT#">
                Capture</a>
		<a id="RefundTransactionLink" href="RefundTransaction.cfm?transactionID=#responseStruct.TRANSACTIONID#&currency=#responseStruct.CURRENCYCODE#&amount=#responseStruct.AMT#">
                Refund</a>
		<a href="javascript:history.back()">Back</a>
</fieldset>

</div>

       
      
</cfif>
<cfif responseStruct.Ack is "Failure">
      	<center> 
		<b>Error!</b>
		<br>
        <cfscript>
       	 	writeOutput(display.displayText(responseStruct));
        </cfscript>
</cfif>

</cfoutput>

<a  id="CallsLink" class="home"  href="index.html"><font color=blue><B>Home<B><font></a>
</body>
</html>