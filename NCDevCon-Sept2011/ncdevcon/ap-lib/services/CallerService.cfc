<cfscript>
/*
CallerService.cfc
This ColdFusion component reused by all sample page to get credential information and 
it has getNVPResponse method which takes nvpString as parameter and return Nvpresponse 
as CF Struct object. using this object we can display the response values
*/
component output="false" {

    serverURL = "https://svcs.sandbox.paypal.com/AdaptivePayments/Pay";
	
	public any function doHttppost( required struct requestData ) {

    	var httpService = new http(); 
		httpService.setMethod("post"); 
		httpService.setCharset("utf-8"); 
		httpService.setUrl(serverURL); 
           
		for (key in requestData)
		{
			httpService.addParam(type="formfield",name="#key#",value="#requestData[key]#",encoded="yes"); 
		}
        
		httpService.addParam(type="header",name="X-PAYPAL-SECURITY-USERID",value="sidney_1311957058_biz_api1.x.com",encoded="yes");         
		httpService.addParam(type="header",name="X-PAYPAL-SECURITY-PASSWORD",value="1311957099",encoded="yes");
        httpService.addParam(type="header",name="X-PAYPAL-SECURITY-SIGNATURE",value="AsWOI0XsYOW6SY4-RFW6nmQX9L2GAx2Dvzlusmnc2lLkNlYS6cilwiEc",encoded="yes");
        httpService.addParam(type="header",name="X-PAYPAL-DEVICE-IPADDRESS",value="cgi.remote_addr",encoded="yes");
        httpService.addParam(type="header",name="X-PAYPAL-REQUEST-DATA-FORMAT",value="NV",encoded="yes");
        httpService.addParam(type="header",name="X-PAYPAL-RESPONSE-DATA-FORMAT",value="JSON",encoded="yes");
        httpService.addParam(type="header",name="X-PAYPAL-APPLICATION-ID",value="APP-80W284485P519543T",encoded="yes");         
        
        httpService.addParam(type="body",value="&actionType=PAY&trackingID=12345&cancelUrl=http://www.x.com&currencyCode=USD&receiverList.receiver(0).amount=50.00&receiverList.receiver(0).email=nc1_1316197521_per@x.com&receiverList.receiver(1).amount=99.00&receiverList.receiver(1).email=nc2_1316197650_per@x.com&requestEnvelope.errorLanguage=en_US&returnUrl=http://www.x.com/test/return.cfm",encoded="yes"); 
        
		var result = httpService.send().getPrefix(); 

		return deserializeJSON(result.filecontent);

	}
    
}

</cfscript>