<!--
*************************************************
DoAuthorization.cfm

	This page has necessary input value to perform DoAuthorization transaction
	When click submit button, action will submit to AuthorizationeReceipt page
	there retrieving all form values and pass into cfhttp tag as query parameter for
	destination URL.

*************************************************
-->
<cfparam name="URL.transactionID" default="" >
<cfparam name="URL.amt" default="" >
<cfparam name="URL.currencyCode" default="" >

<html>
<head>
    <title>PayPal CF SDK - DoAuthorization API</title>
    <link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
 
<cfoutput>
<form action="AuthorizationReceipt.cfm" method="post" name="formAuth">
    <h1>Do Authorization </h1>
	<fieldset>
 
    <ol>
    <li>
    <label>Transaction ID:</label>
	<input type="text" name="transactionid" value = "#URL.transactionID#"/><em>(Required)</em>
    </li>
    
    <li><label>Amount:</label><input type="text" name="amt" size="5" maxlength="7" value="#URL.amt#"/>
	<select name="currencyCode" value="#URL.currencyCode#" >
                <option value="USD">USD</option>
                <option value="GBP">GBP</option>
                <option value="EUR">EUR</option>
                <option value="JPY">JPY</option>
                <option value="CAD">CAD</option>
                <option value="AUD">AUD</option>
                </select>
	       <em>(Required)</em>
    </li>

    <li><label></label>
 	<input type="Submit" value="Submit" />
	</li>
    </ol>
    </fieldset>
<form>
</cfoutput>

<a class="home" id="CallsLink" href="index.html">Home</a>

</body>
</html>