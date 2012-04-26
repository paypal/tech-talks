<cfscript>
/*
CallerService.cfc
This ColdFusion component reused by all sample page to get credential information and 
it has getNVPResponse method which takes nvpString as parameter and return Nvpresponse 
as CF Struct object. using this object we can display the response values
*/
component output="false" {

	public string function doHttppost( required struct requestData ) {

		var httpService = new http(); 
		httpService.setMethod("post"); 
		httpService.setCharset("utf-8"); 
		httpService.setUrl(requestData.serverURL); 

		if (requestData.useProxy is "true")
		{
			httpService.setProxyServer(requestData.proxyName); 
			httpService.setProxyPort(requestData.proxyPort); 
		}
		
		for (key in requestData)
		{
			httpService.addParam(type="formfield",name="#key#",value="#requestData[key]#",encoded="yes"); 
		}
		
		var result = httpService.send().getPrefix(); 

		return result.filecontent;
	}
	
	public struct function getNVPResponse(required string nvpString) {
		var responseStruct = StructNew();
		var keyValStruct = StructNew();
		var keys = "";
		var Values = "";
		var nvpArray = ArrayNew(1) ;
		var keyArray = ArrayNew(1) ;
		var valueArray = ArrayNew(1) ;
		var key = "";
		var value = "";
		var currentValue = "";
		var tempVal = "";
		var count = 1 ;
		var tempvalue = "";
		var lennvp =  0;
		
		for (i=1;i LTE len(nvpString);i=i+1)
		{ 
			lennvp = lennvp + 1;
			var index = 1;
			
			if (#Mid(nvpString, i, 1)# is not "&")
			{
				tempVal = tempVal & #Mid(nvpString, i, 1)#;
			}
	
			if (#Mid(nvpString, i, 1)# is "&" OR "#lennvp#" is "#len(nvpString)#")
			{
				nvpArray[count] = #trim(tempVal)#;
				count =  count + 1;
				tempVal = "";
			}
		}
	
		for (i=1;i LTE #ArrayLen(nvpArray)#;i=i+1)
		{ 
			currentValue = #nvpArray[i]#;
			currentKeyArray = ListToArray(currentValue,'=');
			keyArray[i] = currentKeyArray[1];
		}
	
		vals = "";
		key = "";
		
		for (var i=1;i LT ArrayLen(nvpArray);i=i+1)
		{ 
			vals  = #nvpArray[i]#;
			key = #keyArray[i]#;
			
			value = #RemoveChars(vals ,1, (len(key) +1))#;
			valueArray[i] = value;
			x = StructInsert(responseStruct,#trim(key)#,#trim(value)#);
		}
		
		return responseStruct;
	}
	
	public array function populateEmptyValue( required any noteORuid, required any size) 
	{

		if (ArrayIsEmpty(noteORuid) )
        {
        	for (i=1;i LTE size;i=i+1)
      		{
      			noteORuid[i] = "";
            }
	    
        } else {
        
        	for  (i=1;i LTE size;i=i+1)
            {
            	if (ArrayLen(noteORuid) not equal size)
                {
					ArrayAppend(noteORuid, "");
				}
            }
        }		
		return noteORuid;
	}
	
}
</cfscript>
