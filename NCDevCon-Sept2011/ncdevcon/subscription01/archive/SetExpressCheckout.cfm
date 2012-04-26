<!--
*************************************************
SetExpressCheckout.cfm

	This page has necessary inputs to perform setExpressCheckout transaction.
	When clicking of submit button, action will submit reviewOrder.cfm page
	there retrieving all form values and pass into doHttppost function.

*************************************************
-->
<cfoutput>
<head>
<title>PayPal CF SDK - ExpressCheckout API</title>
<link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<form action="ReviewOrder.cfm" method="post" >
	
<h1>Step 1: SetExpressCheckout</h1>
    		
<center>
	You must be logged into <a href="https://developer.paypal.com" target="_blank">Developer Central</a>
</center>

<fieldset>
    <legend>Shopping cart Products</legend>
    		
    <ul>
    <li>
    <label>CDs:</label>
	<input type="text" size="30" maxlength="32" name="L_NAME1" id="L_NAME1" value="Path To Nirvana">
	</li>
		
	<li>
    <label> Amount:  </label>
	<input type="text" name="L_AMT1" size="5" maxlength="32" id="L_AMT1" value="39.00"> 
	</li>
	<li>
    <label>Quantity:   </label>
	<input type="text" size="3" maxlength="32" name="L_QTY1" id="L_QTY1" value="2"> </li>
	<li>
    <label>Books:</label>
	<input type="text" size="30" maxlength="32" name="L_NAME0" id="L_NAME0" value="Know Thyself">
    </li>

	<li>
    <label>Amount: <br /> </label>
	<input type="text" name="L_AMT0" size="5" maxlength="32" id="L_AMT0" value="9.00">
    </li>

	<li>
    <label>Quantity:   </label>  <input type="text" size="3" maxlength="32" name="L_QTY0" id="L_QTY0"  value="2"> 
    </li>
	<li>
    <label>Currency: <br /> </label>
		       <select name="currencyCodeType" id="currencyCodeType">
				<option value="USD">USD</option>
				<option value="GBP">GBP</option>
				<option value="EUR">EUR</option>
				<option value="JPY">JPY</option>
				<option value="CAD">CAD</option>
				<option value="AUD">AUD</option>
			</select>
      </li>
      
       <input type="hidden" size="3" maxlength="32" name="ITEMCNT" id="ITEMCNT"  value="2"> 
       <input type="hidden" size="3" maxlength="32" name="L_NUMBER0" id="L_NUMBER0"  value="1000"> 
       <input type="hidden" size="3" maxlength="32" name="L_DESC0" id="L_DESC0"  value="Size: 8.8-oz"> 
       <input type="hidden" size="3" maxlength="32" name="L_NUMBER1" id="L_NUMBER1"  value="1001"> 
       <input type="hidden" size="3" maxlength="32" name="L_DESC1" id="L_DESC1"  value="Size: Two 24-piece boxes">
       <input type="hidden" size="3" maxlength="32" name="L_ITEMWEIGHTVALUE1" id="L_ITEMWEIGHTVALUE1"  value="0.5"> 
       <input type="hidden" size="3" maxlength="32" name="L_ITEMWEIGHTUNIT1" id="L_ITEMWEIGHTUNIT1"  value="lbs"> 
    </ul>
    </fieldset>
    
    <fieldset>
    <legend>Ship To:</legend>
	<ul>
	<li>
    <label> Name:</label>
	<input type="text" size="30" maxlength="32" name="SHIPTOSTREET" value="True Seeker" id="SHIPTOSTREET">
    </li>
	<li>
    <label>Street:</label>
	<input type="text" size="30" maxlength="32" name="SHIPTOSTREET" id="SHIPTOSTREET" value="111, Bliss Ave">
    </li>
	<li>
    <label>City:</label>
	<input type="text" size="30" maxlength="32" name="SHIPTOCITY" id="SHIPTOCITY" value="San Jose">
    </li>
	<li>
    <label>State:</label>
	<input type="text" size="30" maxlength="32" name="SHIPTOSTATE" id="SHIPTOSTATE" value="CA">
    </li>
	<li>
    <label>Country:</label>
	<input type="text" size="30" maxlength="32" name="SHIPTOCOUNTRYCODE" id="SHIPTOCOUNTRYCODE" value="US">
    </li>
	<li>
    <label>Zip Code:</label>
	<input type="text" size="30" maxlength="32" name="SHIPTOZIP" id="SHIPTOZIP" runat="server" value="95128">
    </li>
	<br>
	<br>
	<input type="image" name="submit" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif"	id="submit" runat="server">
				
    <br>
    <br>
    Save time. Pay securely without sharing your financial information.
	</ul>
    </fieldset>
       
 	<!--
		Using this hidden variable the system can identify whether it is Authorization, Sale or Order
		This paymentaction coming from Calls.html
	-->
  <input TYPE="hidden" name="paymentAction" value="#URL.paymentaction#">
	<input type="hidden" name="paymentType" value="#URL.paymentaction#">
  <a class="home" href="index.html">Home</a>
</form>
</body>
</html>
</cfoutput>