<!-- 
*************************************************
MassPay.cfm

	This page has necessary input value to perform MassPay transaction
	When click submit button, action will submit to MassPay page 
	there retrieving all form values and pass into doHttppost function.

*************************************************
-->

<html>
<head>
    <title>PayPal CFSDK - MassPay</title>
    <link href="css/sdk.css" rel="stylesheet" type="text/css">
</head>
<body>

<cfoutput>
<form action="MassPayReceipt.cfm" method="post" name="formMassPay">
<h1>Mass Pay</h1>
    
	<fieldset>
    <ol>
    <li>
    <label>Email Subject:</label>
	<input id="EmailSubject" type="text" value="You have money!" name="emailSubject" >
	</li>
	
    <li>
    <label>Receiver Type:</label>
    <input id="ReceiverType" type="text" value="EmailAddress" name="receiverType" >
    </li>
    
    <li>
    <label>Currency:</label>
    <select name="currency">
        <option value="USD" selected>USD</option>
        <option value="GBP">GBP</option>
        <option value="EUR">EUR</option>
        <option value="JPY">JPY</option>
        <option value="CAD">CAD</option>
        <option value="AUD">AUD</option>
    </select>
	</li>
    </ol>
    </fieldset>
    
    <fieldset>
    <legend>Mass Pay Item Details</legend>
  
    <li>
    <label>Payee 1:</label>
    </li>
    
    <li>
    <label>ReceiverEmail(Required):</label>
    <input type="text" name="receiveremail" value="user@paypal.com">
    </li>
    
    <li>
    <label>Amount(Required):</label>
    <input type="text" name="amt" size="5" maxlength="7" value="1.00">
    </li>
    
    <li>
    <label>UniqueID:</label>
    <input type="text" name="uniqueID">
    </li>
    
    <li>
    <label>Note:</label>
    <input type="text" name="note">
    </li>
    
    
     <li>
    <label>Payee 2:</label>
    </li>
    
    <li>
    <label>ReceiverEmail(Required):</label>
    <input type="text" name="receiveremail" value="user@paypal.com">
    </li>
    
    <li>
    <label>Amount(Required):</label>
    <input type="text" name="amt" size="5" maxlength="7" value="1.00">
    </li>
    
    <li>
    <label>UniqueID:</label>
    <input type="text" name="uniqueID">
    </li>
    
    <li>
    <label>Note:</label>
    <input type="text" name="note">
    </li>
    
    
    <li>
    <label>Payee 3:</label>
    </li>
    
    <li>
    <label>ReceiverEmail(Required):</label>
    <input type="text" name="receiveremail" value="user@paypal.com">
    </li>
    
    <li>
    <label>Amount(Required):</label>
    <input type="text" name="amt" size="5" maxlength="7" value="1.00">
    </li>
    
    <li>
    <label>UniqueID:</label>
    <input type="text" name="uniqueID">
    </li>
    
    <li>
    <label>Note:</label>
    <input type="text" name="note">
    </li>
    
    <li>
    <label></label>
    <input type="submit" value="Submit">
    </li>
    </ol>
    </fieldset>
	
</form>
</cfoutput>
<a class="home" href="index.html">Home</a>
</body>
</html>