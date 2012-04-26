<!-- 
*************************************************
RefundTransaction.cfm

	This page has necessary input value to perform RefundTransaction transaction
	When click submit button, action will submit to RefundReceipt.cfm page 
	there retrieving all form values and pass into doHttppost function.

*************************************************
-->
<cfparam name="URL.transactionID" default="">
<cfparam name="URL.amt" default="">
<cfparam name="URL.currencyCode" default="">

<html>
<head>
    <title>PayPal CF SDK - RefundTransaction API</title>
    <link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<cfoutput>
<form method="POST" action="RefundReceipt.cfm" name="formRefund">
	  <h1>Refund Transaction</h1>
    
	<fieldset>
  
    <ol>
    <li>
    <label>Transaction ID:</label>
	<input type="text" name="transactionID" value = "#URL.transactionID#" />
		<em>(Required)</em>
	</li>
    
	
    <li><label>Refund Type:</label>
    	<select name="refundType">
        	<option value="Full">Full</option>
            <option value="Partial">Partial</option>
         </select>
    </li>
     
    <li><label>Amount:</label>
    <input type="text" name="amt" value="#URL.amt#" />
		  
   	<select name="currencyCode" value="#URL.currencyCode#" >
        <option value="USD">USD</option>
        <option value="GBP">GBP</option>
        <option value="JPY">JPY</option>
        <option value="EUR">EUR</option>
        <option value="CAD">CAD</option>
        <option value="AUD">AUD</option>
    </select>
		    
    <em>(Required if Partial Refund)</em>
    </li>
              
	<li><label>Memo:</label><textarea name="note" cols="30" rows="4"></textarea></li>
    <li><label></label> <input type="Submit" value="Submit" /></li>
    </ul>
    
</fieldset>
</form>
</cfoutput>
 
<a class="home" id="CallsLink" href="index.html">Home</a>
</body>
</html>