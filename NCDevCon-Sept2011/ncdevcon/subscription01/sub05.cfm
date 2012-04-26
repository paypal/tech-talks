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
	<title>Subscription via Express Checkout Step 5</title>
	<link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
<cfscript>
responseStruct="";
	try {	
		// create our objects to call methods on
		caller = createObject("CallerService");
		display = createObject("DisplayService");
		ec = createObject("ExpressCheckout");
		
		data = StructNew();
		data.METHOD = "GetRecurringPaymentsProfileDetails";
		data.profileid= url.profileid;
		
		data.serverName = SERVER_NAME;
		data.serverPort = CGI.SERVER_PORT;
		data.contextPath = GetDirectoryFromPath(#SCRIPT_NAME#);
		data.protocol = CGI.SERVER_PROTOCOL;
		data.cancelPage = "sub01.cfm";
		data.returnPage = "sub03.cfm";
	
		requestData = ec.setExpressCheckoutData(form,request,data);
		
		response = caller.doHttppost(requestData);
		
		responseStruct = caller.getNVPResponse(#URLDecode(response)#);
	
	}
	
	catch(any e) 
	{
		writeOutput("Error: " & e.message);
		writeDump(responseStruct);
	}
	
</cfscript>
	
    
    <cfif responseStruct.Ack is "Success">
      <center>
        <br>
            <center>
            <font size=2 color=black face=Verdana><b>GetRecurringPaymentsProfileDetails</b></font>
            <br><br>
            <b>Profile Status!</b><br><br>
            
            <div class="api">
             <cfscript>
                writeOutput(display.displayText(responseStruct));
            </cfscript>
            </div>
        </center>
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
    
<a class="home"  href="../index.html">Home</a>
</body>
</html>
</cfoutput>