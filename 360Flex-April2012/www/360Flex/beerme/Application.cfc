<cfscript>
/**
@dateCreated "Jan 10, 2012"
@hint "You implement methods in Application.cfc to handle ColdFusion application events and set variables in the CFC to configure application characteristics."
*/

component output="false" {
	
	/* **************************** APPLICATION VARIABLES **************************** */
	this.name = "Beer ME Samples";
	this.applicationTimeout = createTimeSpan(0, 2, 0, 0);
    
    this.customtagpaths = "#getDirectoryFromPath(ExpandPath('../com/paypal/adaptivepayments/lib/'))#";
    this.customtagpaths= ListAppend(this.customtagpaths, getDirectoryFromPath(ExpandPath('../com/paypal/service/')));
    this.customtagpaths= ListAppend(this.customtagpaths, getDirectoryFromPath(ExpandPath('../com/paypal/adaptivepayments/service/')));
	this.customTagPaths = this.customtagpaths; 
	
	this.serverSideFormValidation = true;
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0, 0, 30, 0);
	
	this.setClientCookies = true;
	this.setDomainCookies = false;
	
	this.scriptProtect = true;
	this.secureJSON = false;
	this.secureJSONPrefix = "";	
	
	this.enablerobustexception = true;

/* **************************** APPLICATION METHODS **************************** */

	public void function onApplicationEnd(struct ApplicationScope=structNew()) {
	
		return;
	}
	
	
	public boolean function onApplicationStart() {
   
		return true;
	}

	/*public void function onCFCRequest(required string cfcname, required string method, required string args) {
	
		return;
	}*/


	public void function onRequestEnd() {
	
		return;
	}

	
	public boolean function onRequestStart(required string TargetPage) {
    

		var paypalStruct = StructNew();
		paypalStruct['X-PAYPAL-SECURITY-USERID'] = "sidney_1311957058_biz_api1.x.com";
		paypalStruct['X-PAYPAL-SECURITY-PASSWORD'] = "1311957099";
		paypalStruct['X-PAYPAL-SECURITY-SIGNATURE'] = "AsWOI0XsYOW6SY4-RFW6nmQX9L2GAx2Dvzlusmnc2lLkNlYS6cilwiEc";
		paypalStruct['X-PAYPAL-DEVICE-IPADDRESS'] = cgi.remote_addr;
		paypalStruct['X-PAYPAL-APPLICATION-ID'] = "APP-80W284485P519543T";
		paypalStruct['PAYPAL-API-URL'] = "https://svcs.sandbox.paypal.com/";
		paypalStruct['PAYPAL-REDIRECT-URL'] = "https://www.sandbox.paypal.com/webscr&cmd=";
		paypalStruct['PAYPAL-VERSION'] = "85";
		request['paypalStruct'] = paypalStruct;
	
		/* Build Return URL for your server */
        serverName = SERVER_NAME;
		serverPort = CGI.SERVER_PORT;
	
		protocol = lcase(CGI.SERVER_PROTOCOL);
		if(protocol eq 'http/1.1')
		{
			p = "http://";
		} else {
			p = "https://";
		}
		request.serverURL = p & serverName & ":" & serverPort;
    
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