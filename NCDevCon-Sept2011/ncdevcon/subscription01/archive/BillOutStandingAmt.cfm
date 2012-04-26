<!--
*************************************************
BillOutStandingAmt.cfm

	This page has necessary inputs to perform Bill Outstanding amount API.
	When clicking of submit button in this page,form will be submited to OutstandingAmtReceipt.cfm page
	there form values are passed into doHttppost function.

*************************************************
-->

<head>
<title>PayPal CF SDK - Bill Outstanding Amount API</title>
<link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
<cfoutput>
<form action="OutstandingAmtReceipt.cfm" method="post" name="formBillOutstandingAmt">
<h1>Bill Outstanding Amount</h1>
	<fieldset>
    <ol>
    <li>
    <label>Profile ID:</label>
    <input type="text" name="profileID" value="" />  (Required)
    </li>
    
    <li><label>Amount:</label><input type="text" name="amt" value="" /></li>
    
    <li><label></label> <input type="Submit" value="Submit" /></li>
    </ol>
    </fieldset>
</form>
</cfoutput>

<a class="home" id="CallsLink" href="RecurringPaymentsIndex.cfm">Recurring Payments Home</a>
</body>
</html>
