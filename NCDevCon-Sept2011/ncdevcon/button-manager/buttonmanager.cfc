<cfcomponent>
	<cfscript>
		
		// create our objects to call methods on
		caller = createObject("component","lib.services.CallerService");
		/*
		serverName = SERVER_NAME;
		serverPort = CGI.SERVER_PORT;
		contextPath = GetDirectoryFromPath(#SCRIPT_NAME#);
		protocol = CGI.SERVER_PROTOCOL;
		*/
	</cfscript>
    
   <cffunction name="BMCreateButton" access="remote" returntype="any" returnFormat="JSON">
		
        <cfscript>
			var responseStruct="";
			var returnObj = StructNew();
		
			try {	
				// create our objects to call methods on
				
				data = StructNew();
				data.USER = request.USER;
				data.PWD = request.PWD;
				data.SIGNATURE = request.SIGNATURE;
				data.VERSION = "84";
				
				data.URLBASE = request.serverURL;
				data.USEPROXY = false;	
				
				data.METHOD = "BMCreateButton";
				
				data.BUTTONCODE = "cleartext"; // hosted, encrypted, cleartext
				data.BUTTONTYPE = "buynow";
				
				//data.L_BUTTONVAR0 = "business=sidney_1311957058_biz@x.com";
				data.L_BUTTONVAR1 = "item_name=T-shirt";
				data.L_BUTTONVAR2 = "amount=20.00";
				//data.L_BUTTONVAR3 = "no_shipping=1";
				//data.L_BUTTONVAR4 = "currency_code=USD";
				//data.L_BUTTONVAR5 = "no_note=1";
				
				response = caller.doHttppost(data);
				
				responseStruct = caller.getNVPResponse(#URLDecode(response)#);
			
				if (responseStruct.Ack is not "Success")
				{
					Throw(type="InvalidData",
					message="Response:#responseStruct.Ack#, ErrorCode: #responseStruct.L_ERRORCODE0#, 
					Message: #responseStruct.L_LONGMESSAGE0#"); 	
				
				} else {
					code = responseStruct.websitecode;
				}
				
			
				returnObj['success'] = true;
				returnObj['code'] = code;	
				
			}
			
			catch(any e) 
			{
				returnObj['success'] = true;
				returnObj['error'] = e.message;
			}
			
			
			return serializeJSON(returnObj);
		</cfscript>
		
	</cffunction>
    
   
</cfcomponent>