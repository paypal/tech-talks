<cfscript>
/*
CallerService.cfc
This ColdFusion component used to make your API call with credentials and payload
it also has methods for decoding the response.
*/
component output="false" {

	//variables.serverURL = "https://svcs.sandbox.paypal.com/AdaptivePayments/";
	
	public service function init()
		hint="I initialize the component and return myself" 
	 	output="false" {
		  
		return this;  
	}
	
	public any function doHttppost(required string endpoint, required string method, required string payload,string requestFormat='JSON', string responseFormat='JSON' ) {

    	var httpService = new http(); 
		httpService.setMethod("post"); 
		httpService.setCharset("utf-8"); 
		httpService.setUrl( request.paypalStruct['PAYPAL-API-URL']  & arguments.endpoint & '/' & arguments.method); 
        
		httpService.addParam(type="header",name="X-PAYPAL-SECURITY-USERID",value="#request.paypalStruct['X-PAYPAL-SECURITY-USERID']#",encoded="yes");         
		httpService.addParam(type="header",name="X-PAYPAL-SECURITY-PASSWORD",value="#request.paypalStruct['X-PAYPAL-SECURITY-PASSWORD']#",encoded="yes");
        httpService.addParam(type="header",name="X-PAYPAL-SECURITY-SIGNATURE",value="#request.paypalStruct['X-PAYPAL-SECURITY-SIGNATURE']#",encoded="yes");
        httpService.addParam(type="header",name="X-PAYPAL-DEVICE-IPADDRESS",value="#request.paypalStruct['X-PAYPAL-DEVICE-IPADDRESS']#",encoded="yes");
        httpService.addParam(type="header",name="X-PAYPAL-REQUEST-DATA-FORMAT",value="#arguments.requestFormat#",encoded="yes");
        httpService.addParam(type="header",name="X-PAYPAL-RESPONSE-DATA-FORMAT",value="#arguments.responseFormat#",encoded="yes");
        httpService.addParam(type="header",name="X-PAYPAL-VERSION",value="#request.paypalStruct['PAYPAL-VERSION']#",encoded="yes");
        httpService.addParam(type="header",name="X-PAYPAL-APPLICATION-ID",value="#request.paypalStruct['X-PAYPAL-APPLICATION-ID']#",encoded="yes");         
        
        httpService.addParam(type="body",value="#arguments.payload#",encoded="yes"); 
       
		var result = httpService.send().getPrefix(); 
		return result.filecontent;
	}
	
}
</cfscript>