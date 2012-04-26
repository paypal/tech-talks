<!--
*************************************************
GetRPprofileDetails.cfm

	This page has necessary inputs to perform Get recurring payments profile details.
	When clicking of submit button, action will submit RPprofileDetails.cfm page
	there retrieving all form values and passing into doHttppost function.

*************************************************
-->
<cfoutput>
<head>
<title>PayPal CF SDK - Create Recurring Payments Profile API</title>
<link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<form action="RPprofileDetails.cfm" method="post" name="formManageRPprofile">
<h1>Recurring Payments Profile Details</h1>
<fieldset>
    <ol>
    <li>
    <label> Profile ID:</label><input type="text" size="30" maxlength="32" name="profileId" <cfif isdefined("URL.profileid")>value=#URL.profileid#<cfelse>value=""</cfif> />(Required) </li>
     
     <li><label></label><input type="Submit" value="Submit"/></li>
  </ol>
  </fieldset>
</form>

<a class="home" id="CallsLink" href="RecurringPaymentsIndex.cfm">Recurring Payments Home</a>
</body>
</html>
</cfoutput>