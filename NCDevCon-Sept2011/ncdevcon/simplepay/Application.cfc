<cfscript>
/**
@dateCreated "July 18, 2011"
@hint "You implement methods in Application.cfc to handle ColdFusion application events and set variables in the CFC to configure application characteristics."
*/


component output="false" {
	
	/* **************************** APPLICATION VARIABLES **************************** */
	THIS.name = "SimplePay";
	THIS.applicationTimeout = createTimeSpan(0, 2, 0, 0);
    
    
    customtagpathArray = "{#getDirectoryFromPath(ExpandPath('../ap-lib/'))#,#getDirectoryFromPath(ExpandPath('../ap-lib/services/'))#}";	
	THIS.customTagPaths = customtagpathArray; 
	
	
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

	public any function CreateCFC(string path) {
 	  	return CreateObject('component', Arguments.path);
 	} 

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
    	
		request.PayPalURL = 'https://www.sandbox.paypal.com/webscr?cmd=_ap-payment&paykey=';
		
	 
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