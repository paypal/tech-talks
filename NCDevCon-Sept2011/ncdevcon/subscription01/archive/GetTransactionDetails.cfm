<!-- 
*************************************************
GetTransactionDetails.cfm

This page contains necessary inputs for Transaction details. 
When click submit button, page will submit the
values of this page to transactionDetails.cfm 
and transactionDetails.cfm will do a HTTP Post to API server
and get the transaction details.	

*************************************************
-->

<head>
    <title>PayPal CF SDK - GetTransactionDetails API</title>
    <link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<cfoutput>
<form action="TransactionDetails.cfm">
<h1>Get Transaction Details </h1>
<fieldset>
    
    <ol>
    <li>
    <label>Transaction ID:</label><input type="text" name="transactionID" value="20P46879S1049380U" /> (Required)</li>
    <li>
    <label></label>
    <input type="Submit" value="Submit" />
    </li>
    </ol>
</fieldset>
   
</form>
</cfoutput>
  
<a class="home" href="index.html">Home</a>
</body>
</html>