<!-- 
*************************************************
DoReauthorizationReceipt.cfm

This page takes necessary parameter from DoReauthorization page 
and pass pass parameters to doHttppost function to perform DoReauthorization.
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
	trans = createObject("Transaction");

	try {
		
		data = StructNew();
		data.method = "DoReauthorization";
	
		requestData = trans.setReauthorizationData(form,request,data);
		
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

<head>
    <title>PayPal CF SDK - DoReAuthorization API</title>
    <link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<cfif responseStruct.Ack is "Success">
    <h1>>Do ReAuthorization</h1>
	<b>ReAuthorization Succeeded!</b><br><br>
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
    </center>
</cfif>

<a class="home" id="CallsLink" href="index.html">Home</a>
</body>
</html>