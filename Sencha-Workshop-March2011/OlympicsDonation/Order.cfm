<cfsilent>
<CFTRY>
	<cfset PayPalURL = "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout-mobile&useraction=commit&token=">
	
	<cfset StructClear(Session)>
	<cfset serverName = #SERVER_NAME#>
	<cfset serverPort = #CGI.SERVER_PORT#>
	<cfset contextPath = GetDirectoryFromPath(#SCRIPT_NAME#)>
	<cfset protocol = #CGI.SERVER_PROTOCOL#>
	<cfset cancelUrlPath = "http://" & serverName & ":" & serverPort & contextPath & "index.html">
	
    <CFOBJECT COMPONENT="CallerService" name="caller">

	<!---
		Passing necessary parameter to perform Setexpresscheckout transaction in the CFHTTP Tag
	--->
			  
	<CFSET requestData = StructNew()>
	<CFSET requestData.METHOD = "SetExpressCheckout">
	<CFSET requestData.PAYMENTACTION = "Sale">
	<CFSET requestData.USER = "sidney_1300905880_biz_api1.designovermatter.com">
	<CFSET requestData.PWD = "1300905887">
	<CFSET requestData.SIGNATURE = "AW-FVgPul9bWu29OhQHbSoMS0KjiA4WshXplWg9c1DDISeYDYNfNi0dr">
	<CFSET requestData.VERSION = "69.0">
	<CFSET requestData.DESC = "Donation">
	<CFSET requestData.AMT = "10.00">
    
	
	<CFSET requestData.CancelURL = "#cancelUrlPath#">
	<cfset returnUrlPath = "http://" & serverName & contextPath & "Checkout.cfm" >
	<CFSET requestData.ReturnURL = "#returnUrlPath#">

	<!---
	Calling "SetExpressCheckout" doHttppost for API call
	--->

 	<cfinvoke component="CallerService" method="doHttppost" returnvariable="response">
		<cfinvokeargument name="requestData" value=#requestData#>
		<cfinvokeargument name="serverURL" value=#serverURL#>
		<cfinvokeargument name="proxyName" value=#proxyName#>
		<cfinvokeargument name="proxyPort" value=#proxyPort#>
		<cfinvokeargument name="useProxy" value=#useProxy#>
	</cfinvoke>

	<cfset responseStruct = caller.getNVPResponse(#URLDecode(response)#)>

	<cfset Session.resStruct = #responseStruct#>
	
	<cfif responseStruct.Ack is not "Success">
		<cfthrow>
	<cfelse>
		<CFSET TOKEN = #responseStruct.TOKEN#>
	</cfif>

	<!--- set the URL for the JavaScript Redirect from the Sencha App --->
	<CFSET redirecturl = #PayPalURL# & #TOKEN#>
	

<CFCATCH>
	<!--- catch the error here --->

</CFCATCH>
</CFTRY>

</cfsilent>
<cfif responseStruct.Ack is not "Success">APIError.cfm?error=fromServer<cfabort></cfif>
<cfoutput>#redirecturl#</cfoutput>
