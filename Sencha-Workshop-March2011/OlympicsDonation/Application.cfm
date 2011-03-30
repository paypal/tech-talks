<!--- This Page contains all necessary application level variables --->
<cfapplication name="coldfusion_nvp_samples"
  sessionmanagement="Yes">
<CFFUNCTION name="displayText" returntype="void" output="Yes">
<cfargument name="requestData" type="struct" required="yes">      
<cfloop collection=#responseStruct# item ="key">

             <tr>
                  <td >#key#:</td>
                  <td >#responseStruct[key]#</td>
				  
            </tr>
</cfloop>
</CFFUNCTION>
<!---
This file defines the parameters needed to make an API call.
PayPal includes the following API Signature for making API
calls to the PayPal sandbox:

API Username 	sdk-three_api1.sdk.com
API Password 	QFZCWN5HZM8VBG7Q
API Signature 	A.d9eRKfd1yVkRrtmMfCFLTqa6M9AyodL0SJkhYztxUi8W9pCXF6.4NI
 --->
<cfset serverURL = "https://api-3t.sandbox.paypal.com/nvp"> 

	<!--- SUBJECT to be uncommented for UNIPAY all the other credentials like API username,
		  password,signature can be commented for UNIPAY
		  To enable Payments for Third Party Email whcih will be passed along with Partner's 3token credentials
		  uncomment both subject and 3 token credentials.
	--->
   <!---  <cfset SUBJECT="sdk-three@sdk.com">  --->
    <cfset APIuserName = "sdk-three_api1.sdk.com">
	<cfset APIPassword = "QFZCWN5HZM8VBG7Q">
	<cfset APISignature = "A.d9eRKfd1yVkRrtmMfCFLTqa6M9AyodL0SJkhYztxUi8W9pCXF6.4NI">
<!--- condition to check if it is UNIPAY --->
<cfif isdefined("SUBJECT") && (isdefined("APIuserName") eq "false" &&isdefined("APIPassword") eq "false" &&isdefined("APISignature") eq "false")>
	<cfset UNIPAYSUBJECT="#SUBJECT#"> 
	<cfset USERNAME = "">
	<cfset PASSWORD = "">
	<cfset SIGNATURE = "">
</cfif>
<!--- condition to check if it is Payments for Third Party Email--->
<cfif isdefined("SUBJECT") && isdefined("APIuserName") &&isdefined("APIPassword") &&isdefined("APISignature")>
	<cfset UNIPAYSUBJECT="#SUBJECT#"> 
	<cfset USERNAME = "#APIuserName#">
	<cfset PASSWORD = "#APIPassword#">
	<cfset SIGNATURE = "#APISignature#">
</cfif>
<!--- condition to check if it is 3 token credentials --->
<cfif isdefined("SUBJECT") eq "false" && isdefined("APIuserName") &&isdefined("APIPassword") &&isdefined("APISignature")>
	<cfset UNIPAYSUBJECT=""> 
	<cfset USERNAME = "#APIuserName#">
	<cfset PASSWORD = "#APIPassword#">
	<cfset SIGNATURE = "#APISignature#">
</cfif>
<cfset PayPalURL = "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=">
<cfset version = "65.1">

<!--- 	By default the API requests doesn't go through proxy. To route the requests through a proxy server 	set "useProxy" value as "true" and set values for proxyName and proxyPort. Set proxyName with
	the Host Name or the IP address of the proxy server. proxyPort should be a valid port number.
	eg: 
	<cfset useProxy = "true">
	<cfset proxyName = "127.0.0.1">
	<cfset proxyPort = "8081">--->


<cfset useProxy = "false">
<cfset proxyName = "">
<cfset proxyPort = "">