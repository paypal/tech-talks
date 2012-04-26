<cfoutput>
<html>
<head>
	<title>Subscription process</title>
	<link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
<cfscript>
code = "";
responseStruct="";
	try {	
		// create our objects to call methods on
		caller = createObject("CallerService");
		
		data = StructNew();
		data.USER = request.USER;
        data.PWD = request.PWD;
        data.SIGNATURE = request.SIGNATURE;
		data.VERSION = "78";
		
		data.SERVERURL = request.serverURL;
		data.USEPROXY = false;	
		
		data.METHOD = "BMCreateButton";
		
		data.BUTTONCODE = "hosted";
		data.BUTTONTYPE = "buynow";
		
		data.L_BUTTONVAR0 = "business=sidney_1311957058_biz@x.com";
		data.L_BUTTONVAR1 = "item_name=Virtual Cow";
		data.L_BUTTONVAR2 = "amount=1.50";
		data.L_BUTTONVAR3 = "no_shipping=1";
		data.L_BUTTONVAR4 = "currency_code=USD";
		data.L_BUTTONVAR5 = "no_note=1";
		
		response = caller.doHttppost(data);
		
		responseStruct = caller.getNVPResponse(#URLDecode(response)#);
	
		if (responseStruct.Ack is not "Success")
		{
			Throw(type="InvalidData",message="Response:#responseStruct.Ack#, ErrorCode: #responseStruct.L_ERRORCODE0#, Message: #responseStruct.L_LONGMESSAGE0#"); 	
		
		} else {
			code = responseStruct.websitecode;
		}
		
	}
	
	catch(any e) 
	{
		writeOutput("Error: " & e.message);
		writeDump(responseStruct);
	}
	
</cfscript>

	
#code#



<br><br>
<a href="../index.html">home</a>

</body>
</html>
</cfoutput>