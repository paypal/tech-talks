<cfscript>
/**
@dateCreated "July 18, 2011"
@hint "You implement methods in Application.cfc to handle ColdFusion application events and set variables in the CFC to configure application characteristics."
*/


component output="false" {
	
	/* **************************** APPLICATION VARIABLES **************************** */
	THIS.name = "NCDevConCheckout01";
	THIS.applicationTimeout = createTimeSpan(0, 2, 0, 0);
    
    
    customtagpaths = "#getDirectoryFromPath(ExpandPath('../lib/'))#";
	THIS.customTagPaths = customtagpaths; 
	
	THIS.serverSideFormValidation = true;
	THIS.sessionManagement = true;
	THIS.sessionTimeout = createTimeSpan(0, 0, 30, 0);
	
	THIS.setClientCookies = true;
	THIS.setDomainCookies = false;
	
	THIS.scriptProtect = true;
	THIS.secureJSON = false;
	THIS.secureJSONPrefix = "";
	
	
	THIS.enablerobustexception = true;


/* **************************** APPLICATION METHODS **************************** */

	public void function onApplicationEnd(struct ApplicationScope=structNew()) {
	
		return;
	}
	
	
	public boolean function onApplicationStart() {
   
		return true;
	}

	public void function onCFCRequest(required string cfcname, required string method, required string args) {
	
		return;
	}


	public void function onRequestEnd() {
	
		return;
	}

	
	public boolean function onRequestStart(required string TargetPage) {
    
    	request.serverURL = "https://api-3t.sandbox.paypal.com/nvp";

		/* SUBJECT to be uncommented for UNIPAY all the other credentials like API username,
              password,signature can be commented for UNIPAY
              To enable Payments for Third Party Email whcih will be passed along with Partner's 3token credentials
              uncomment both subject and 3 token credentials.
       */
       	
        
        //request.SUBJECT="sidney@x.com"; 
       
        APIuserName = "sidney_1311957058_biz_api1.x.com";
        APIPassword = "1311957099";
        APISignature = "AsWOI0XsYOW6SY4-RFW6nmQX9L2GAx2Dvzlusmnc2lLkNlYS6cilwiEc";
  	 	
		


	
		
		/*
         request.SUBJECT="clip_1309031681_biz@paypal.com"; 
       
        APIuserName = "clip_1309031681_biz_api1.paypal.com";
        APIPassword = "1309031732";
        APISignature = "AFcWxV21C7fd0v3bYYYRCpSSRl31An2lFbilAjH412uQjiC0OEJh45pL";
  	 	*/
        
		//condition to check if it is UNIPAY 
        if (isdefined("SUBJECT") && (isdefined("APIuserName") eq "false" && isdefined("APIPassword") eq "false" && isdefined("APISignature") eq "false") )
        {
            request.UNIPAYSUBJECT="#SUBJECT#"; 
            request.USER = "";
            request.PWD = "";
            request.SIGNATURE = "";
        }
        
      
    
        //condition to check if it is Payments for Third Party Email
        if (isdefined("SUBJECT") && isdefined("APIuserName") && isdefined("APIPassword") && isdefined("APISignature"))
        {
            request.UNIPAYSUBJECT="#SUBJECT#"; 
            request.USER = "#APIuserName#";
          	request.PWD = "#APIPassword#";
           	request.SIGNATURE = "#APISignature#";
        }
        
        
    	//condition to check if it is 3 token credentials 
        if (isdefined("SUBJECT") eq "false" && isdefined("APIuserName") && isdefined("APIPassword") && isdefined("APISignature") )
        {
            request.UNIPAYSUBJECT=""; 
            request.USER = "#APIuserName#";
            request.PWD = "#APIPassword#";
            request.SIGNATURE = "#APISignature#";
        }
        
        
        request.PayPalURL = "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=";
        request.version = "78";
    
   		/*
    	By default the API requests doesn't go through proxy. To route the requests through a proxy server
         	set "useProxy" value as "true" and set values for proxyName and proxyPort. Set proxyName with
        the Host Name or the IP address of the proxy server. proxyPort should be a valid port number.
        eg: 
        useProxy = "true";
        proxyName = "127.0.0.1";
        proxyPort = "8081";
        */

        request.useProxy = "false";
        request.proxyName = "";
        request.proxyPort = "";
     
		return true;
	}


	public void function onSessionEnd(required struct SessionScope, struct ApplicationScope=structNew()) {
	
		return;
	}


	public void function onSessionStart() {
	
		return;
	}

}
</cfscript>