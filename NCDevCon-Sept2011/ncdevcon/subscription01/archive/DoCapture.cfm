<!-- 
*************************************************
DoCapture.cfm

	This page has necessary input value to perform DoCapture transaction
	When click submit button, action will submit to DoCapturereceipt page 
	there retrieving all form values and pass into cfhttp tag as query parameter for 
	destination URL.

*************************************************
-->
<cfparam name="URL.authorizationID" default="">
<cfparam name="URL.amt" default="" >
<cfparam name="URL.currency" default="">
<html>
<head>
    <title>PayPal CF SDK - DoCapture API</title>
    <link href="css/sdk.css" rel="stylesheet" type="text/css" />
   
</head>
<body>
<cfoutput>
<form action="DoCaptureReceipt.cfm" method="post" name="formCapture">
<h1>Do Capture</h1>
	<fieldset>
      
    <ol>
    <li>
    <label>Authorization ID:</label>
    <input type="text" name="authorizationid" value = "#URL.authorizationID#"/><em>(Required)</em>
    </li>
    <li>
    <label>Complete Code Type:</label>
    <select name="CompleteType">
        <option value="Complete">Complete</option>
        <option value="NotComplete">NotComplete</option>
    </select>
    </li>
    <li>
    <label>Amount:</label>
	<input type="text" name="amt" size="5" maxlength="7" value="#URL.amt#"/>
   	<select name="currencycode" value="#URL.currency#" >
        <option value="USD">USD</option>
        <option value="GBP">GBP</option>
        <option value="EUR">EUR</option>
        <option value="JPY">JPY</option>
        <option value="CAD">CAD</option>
        <option value="AUD">AUD</option>
   	</select>
	<em>(Required)</em>
    </li>

	<li>
    <label> Invoice ID:</label>
	<input type="text" name="invoice_id" />
    </li>   

	<li>
    <label class="field"> Note:</label>
    <textarea name="note" cols="30" rows="4"></textarea></td>
    </li>
    <li>
    
    <label></label>
   	<input type="Submit" value="Submit" /> 
    </li>
      
    </ol>
           
    </center>
      <a class="home" id="CallsLink" href="index.html">Home</a>

</form>
</cfoutput>
</body>
</html>