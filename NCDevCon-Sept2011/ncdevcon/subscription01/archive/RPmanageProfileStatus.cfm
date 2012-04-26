<!-- 
*************************************************
changedRPstatus.cfm

This page takes necessary parameter from ManageRPprofile page 
and pssing into doHttppost function to perform manage Recurring Payments Profile.
This page will show the response value coming from the Server. 
If any error occurs, the page will redirect to APIError.cfm 
to show exact error details

*************************************************
-->

<cfscript>
	StructClear(Session);
	
	// create our objects to call methods on
	caller = createObject("CallerService");
	display = createObject("DisplayService");
	rp = createObject("RecurringPayment");
	
	try {
		
		data = StructNew();
		data.method = "ManageRecurringPaymentsProfileStatus";
	
	
		requestData = rp.setRecurringPaymentStatusData(form,request,data);
	
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

<cfoutput>
<head>
<title>PayPal CF SDK - Manage Recurring Payments Profile Status API</title>
<link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<CFSET requestData.METHOD = "ManageRecurringPaymentsProfileStatus">

<cfif responseStruct.Ack is "Success">
	<center>
	<b>Manage Recurring Payments Profile Status</b><br><br>
   
    <cfscript>
		writeOutput(display.displayText(responseStruct));
	</cfscript>
    <br>
	<a id="CallsLink" href="RPgetProfileDetails.cfm?profileid=#responseStruct["PROFILEID"]#">Get Recurring Payments Details</a>
    </center>
</cfif>


<cfif responseStruct.Ack is "Failure">
    <b>Error!</b>
    <br>
    <cfscript>
        writeOutput(display.displayText(responseStruct));
    </cfscript>
</cfif>

<br>

<a class="home" id="CallRPLink" href="RecurringPaymentsIndex.cfm">Recurring Payments Home</a>
</body>
</html>
</cfoutput>