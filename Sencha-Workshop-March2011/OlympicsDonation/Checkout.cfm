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
	<CFSET requestData.METHOD = "DoExpressCheckoutPayment">
	<CFSET requestData.PAYMENTACTION = "Sale">
	<CFSET requestData.USER = "sidney_1300905880_biz_api1.designovermatter.com">
	<CFSET requestData.PWD = "1300905887">
	<CFSET requestData.SIGNATURE = "AW-FVgPul9bWu29OhQHbSoMS0KjiA4WshXplWg9c1DDISeYDYNfNi0dr">
	<CFSET requestData.VERSION = "69.0">
	<CFSET requestData.DESC = "Donation">
	<CFSET requestData.AMT = "10.00">
    
    <cfset requestData.TOKEN = URL.TOKEN>
    <cfset requestData.PAYERID = URL.PAYERID>


	<!---
	Calling "DoExpressCheckoutPayment" doHttppost for API call
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
		<cfset returnUrlPath = "http://" & serverName & ":" & serverPort & contextPath & "index.html?TOKEN=" & responseStruct.TOKEN>
	</cfif>
	
    <!--- redirect back to Sencha App --->
	<cflocation url="#returnUrlPath#" addtoken="yes">
	

<CFCATCH>
    
	<cfset responseStruct = StructNew() >
    <cfset responseStruct.errorType =  "#cfcatch.type#">
    <cfset responseStruct.errorMessage =  "#cfcatch.message#">
    <cfset Session.resStruct = "#responseStruct#">
    <cfset urlPath = "APIError.cfm?error=formServer&&errorType=Server&errorMessage=">


    <CFLOCATION URL="#urlPath#">
    
</CFCATCH>
</CFTRY>

</cfsilent>

