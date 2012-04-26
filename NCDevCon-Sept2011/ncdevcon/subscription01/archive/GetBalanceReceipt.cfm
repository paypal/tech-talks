<!-- 
*************************************************
DoCaptureReceipt.cfm

This page takes necessary parameter from doCapture.cfm page 
and pssing into doHttppost function which takes request value
as Struct Object it will call cfhttp tag to perform DoCapture.This 
page will show the response value coming from the Server. If 
any error occurs, the page will redirect to APIError.cfm to 
show exact error details

*************************************************
-->

<cfscript>
	try {
		
		StructClear(Session);
		
		// create our objects to call methods on
		caller = createObject("CallerService");
		display = createObject("DisplayService");
		trans = createObject("transaction");
		
		data = StructNew();
		data.method = "GetBalance";

		requestData = trans.setBalanceData(request,data);
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
    <title>PayPal CF SDK - DoCapture API</title>
    <link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<cfif responseStruct.Ack is "Success">
	<br>
	<center>
	<font size=2 color=black face=Verdana><b>GetBalance Response</b></font>
	<br>
     <cfscript>
       	 	writeOutput(display.displayText(responseStruct));
        </cfscript>
    </center>
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