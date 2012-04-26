<!-- 
*************************************************
TransactionSearchResults.cfm

This page takes necessary parameter from TransactionSearch.cfm page 
and pssing into doHttppost function which takes request value
as Struct Object it will call cfhttp tag to perform TransactionSearch 
This page will show the response value coming from the Server. If 
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
		data.method = "TransactionSearch";
	
		requestData = trans.setTransactionSearchData(form,request,data);
		
		//writeDump(requestData);
		//abort;
		
		response = caller.doHttppost(requestData);
		
		responseStruct = StructNew();
		responseStruct = caller.getNVPResponse(#URLDecode(response)#);
		Session.resStruct = responseStruct;
		
		txnCount = 0;
		for (key in responseStruct)
		{
			if (StructKeyExists(responseStruct, "L_TRANSACTIONID" & txnCount) )
			{
				txnCount = txnCount + 1;
			}
		}
	}

	catch(any e) 
	{
		writeOutput("Error: " & e.message);
		//writeDump(session.resStruct);
		abort;
	}
</cfscript>
<head>
    <title>PayPal CF SDK: Transaction Search Results</title>
    <link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<cfoutput>
<cfif (responseStruct.Ack is "Success" or responseStruct.Ack is "SuccessWithWarning")  and txnCount is not 0>

<h1 align="center">Transaction Search Results</h1>
   
<h3> Results 1 - #txnCount# </h3>

<div class="tRow">     
    <div class="tHeader">ID</div>
    <div class="tHeader">Time</div>
    <div class="tHeader">Status</div>
    <div class="tHeader">Payer Name</div>
    <div class="tHeader">Gross Amount</div>
</div>

<cfset txnCount = 0>
<cfset	txnSearchTable = StructNew()>
<cfset rowCount =  0>
<cfloop collection=#responseStruct# item="key">

	<cfif StructKeyExists(responseStruct, "L_TRANSACTIONID" & #txnCount#)>
	<cfset rowCount =  rowCount + 1>
	<div class="tRow"> 

		<cfset txnKey = "L_TRANSACTIONID" & #txnCount#>
		<cfset timeStmpKey = "L_TIMESTAMP" & #txnCount#>
		<cfset statusKey = "L_STATUS" & #txnCount#>
		<cfset nameKey  = "L_NAME" & #txnCount#>
		<cfset amtKey = "L_AMT" & #txnCount#>
		<div class="tHeader">#rowCount#</div>
		<div class="tHeader"><a id=TransactionDetailsLink0 href="TransactionDetails.cfm?transactionID=#responseStruct[txnKey]#">#responseStruct[txnKey]#</a></div>
		<div class="tHeader">
			<cfif StructKeyExists(responseStruct, "L_TIMESTAMP" & #txnCount#)>
				#responseStruct[timeStmpKey]#
			</cfif>
		</div>
		<div class="tHeader">
			<cfif StructKeyExists(responseStruct, "L_STATUS" & #txnCount#)>
                #responseStruct[statusKey]#
            </cfif>
		</div>
		<div class="tHeader">
			<cfif StructKeyExists(responseStruct, "L_NAME" & #txnCount#)>
				#responseStruct[nameKey]#
			</cfif>
		</div>
		<div class="tHeader">
			<cfif StructKeyExists(responseStruct, "L_AMT" & #txnCount#)>
				#responseStruct[amtKey]#
			</cfif>
		</div>
 	</div>
</cfif>
<cfset #txnCount# = txnCount + 1>

</cfloop>

</cfif>

<cfif txnCount is 0>
	<br>Found 0 transactions
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
<a class="home" id="CallsLink" href="index.html">Home</a>
</body>
</html>