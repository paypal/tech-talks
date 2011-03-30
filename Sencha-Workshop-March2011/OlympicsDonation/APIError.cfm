<!--
*************************************************
APIError.cfm

Displays error parameters.

Called by DoDirectPaymentReceipt.cfm, TransactionDetails.cfm,
GetExpressCheckoutDetails.cfm and DoExpressCheckoutPayment.cfm.

*************************************************
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>PayPal SDK - DoAuthorization</title>
    <link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
<cfset responseStruct = #Session.resStruct#>
<cfif #URL.error# is "fromClient">
<center>
    <table class="api">
      <tr>
            <td class="field">
                Error Type :</td>
            <td><CFOUTPUT>#responseStruct.errorType#</CFOUTPUT></td>
        </tr>
        <tr>
            <td class="field">
                Error Message :</td>
            <td><CFOUTPUT>#responseStruct.errorMessage#</CFOUTPUT></td>
        </tr>
	</table>
</center>
</cfif>

<cfif #URL.error# is "fromServer">
<center>
<table class="api">
<b>The PayPal API has returned an error!</b>
	<cfloop collection=#responseStruct# item="key">
		<tr>
			<td><CFOUTPUT>#key#:</CFOUTPUT></td>
			<td><CFOUTPUT>#responseStruct[key]#</CFOUTPUT></td>
	       </tr>
	</cfloop>
</table>
</center>
</cfif>
</body>
<a class="home" id="CallsLink" href="index.html">Home</a>

</html>