

<!-- ThreeDSecure.cfm
 
This is the main web page for the DoDirectPayment sample.
This page allows the user to enter name, address, amount,
and credit card information. 
When the user clicks the Submit button, ThreeDSecureReceipt.cfm
is called.

Called by index.html.

Calls ThreeDSecureReceipt.cfm. -->

<head>
<title>PayPal Coldfusion SDK - 3D Secure DoDirectPayment API</title>
<link href="css/sdk.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
	function generateCC(){
		var cc_number = new Array(16);
		var cc_len = 16;
		var start = 0;
		var rand_number = Math.random();

		switch(document.frm3D.creditCardType.value)
        {
			case "Visa":
				cc_number[start++] = 4;
				break;
			case "MasterCard":
				cc_number[start++] = 5;
				cc_number[start++] = Math.floor(Math.random() * 5) + 1;
				break;
			case "Maestro":
				cc_number[start++] = 3;
				cc_number[start++] = Math.round(Math.random()) ? 7 : 4 ;
				cc_len = 16;
				break;
        }

        for (var i = start; i < (cc_len - 1); i++) {
			cc_number[i] = Math.floor(Math.random() * 10);
        }

		var sum = 0;
		for (var j = 0; j < (cc_len - 1); j++) {
			var digit = cc_number[j];
			if ((j & 1) == (cc_len & 1)) digit *= 2;
			if (digit > 9) digit -= 9;
			sum += digit;
		}

		var check_digit = new Array(0, 9, 8, 7, 6, 5, 4, 3, 2, 1);
		cc_number[cc_len - 1] = check_digit[sum % 10];

		document.frm3D.acct.value = "";
		for (var k = 0; k < cc_len; k++) {
			document.frm3D.acct.value += cc_number[k];
		}
	}


</script>
</head>
<body>
<cfoutput>
<form action="ThreeDSecureReceipt.cfm" method="post" name="frm3D">
 
<h1>3D Secure Payment</h1>

<fieldset>
    <legend>Shopping cart Products</legend>
    		
    <ul>
    <li>
    <label>First Name:</label>
 	<input type="text" size="30" maxlength="32" name="firstName" value="John" /></li>
    <li><label>Last Name:</label><input type="text" size="30" maxlength="32" name="lastName" value="Doe" /></li>
    <li><label>Card Type:</label><select name="creditCardType" onChange="javascript:generateCC(); return false;">
            <option value="Visa" selected>Visa</option>
            <option value="MasterCard">MasterCard</option>
          </select>
        </li>
    <li><label>Card Number:</label><input type="text" size="19" maxlength="19" name="acct" value="4414436109035814" /></li>
	<li><label>Start Date:</label>
			  <select name="startDateMonth">
				<option value="01">01</option>
				<option value="02">02</option>
				<option value="03">03</option>
				<option value="04">04</option>
				<option value="05">05</option>
				<option value="06">06</option>
				<option value="07">07</option>
				<option value="08">08</option>
				<option value="09">09</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			<select name="startDateYear">
				<option value="2011" selected>2011</option>
				<option value="2012">2012</option>
				<option value="2013">2013</option>
				<option value="2014">2014</option>
				<option value="2015">2015</option>
			</select>
	</li>
    <li><label>Expiration Date:</label><select name="expDateMonth">
            <option value="01">01</option>
            <option value="02">02</option>
            <option value="03">03</option>
            <option value="04">04</option>
            <option value="05">05</option>
            <option value="06">06</option>
            <option value="07">07</option>
            <option value="08">08</option>
            <option value="09">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
          </select>
          <select name="expDateYear">
            <option value="2011">2011</option>
            <option value="2012">2012</option>
            <option value="2013">2013</option>
       		 <option value="2014">2014</option>
            <option value="2015">2015</option>
            <option value="2016" selected>2016</option>
            <option value="2017">2017</option>
            <option value="2018">2018</option>
            <option value="2019">2019</option>
            <option value="2020">2020</option>
          </select>
        </li>
    <li><label>Card Verification Number:</label><input type="text" size="3" maxlength="4" name="cvv2" value="962" /></li>
    </ul>
    </fieldset>
    
    <fieldset>
    <legend>Billing Address:</legend>
    <ul>
    <li><label>Address 1: </label><input type="text" size="25" maxlength="100" name="street" value="123 Fake St" /></li>
    <li><label>Address 2: </label><input type="text" size="25" maxlength="100" name="address2" />
          (optional)</li>
    <li><label>City: </label><input type="text" size="25" maxlength="40" name="city" value="London" /></li>
    <li><label>State: </label> <input type="text" size="25" maxlength="40" name="state" value="London">
        </li>
    <li><label>ZIP Code: </label><input type="text" size="10" maxlength="10" name="zip" value="WC2H 7LA" /></li>
    <li><label>Country: </label> United Kingdom </li>
    <li><label>Amount:</label>
			<input type="text" size="4" maxlength="7" name="amt" value="1.00"> 
			<select name=currencycode>
				<option value="USD">USD</option>
				<option value="GBP" selected>GBP</option>
				<option value="EUR">EUR</option>
				<option value="JPY">JPY</option>
				<option value="CAD">CAD</option>
				<option value="AUD">AUD</option>
			</select>
	</li>
    </ul>
    </fieldset>
    
    <fieldset>
    <legend>3D Secure</legend>
    <ul>
		<li><label>EciFlag:</label><input id="eciFlag" type="text" maxLength="10" size="10" name="ECI3DS"></li>
		<li><label>Cavv:</label><input id="cavv" type="text" maxLength="10" size="10" name="cavv"></li>
		<li><label>Xid:</label><input id="xid" type="text" maxLength="10" size="10" name="xid"></li>
		<li><label>MPIVendor3DS:</label><input id="enrolled" type="text" maxLength="10" size="10" name="MPIVENDOR3DS"></li>
		<li><label>AuthStatus3D:</label><input id="pAResStatus" type="text" maxLength="10" size="10" name="AUTHSTATUS3DS"></li>
		<li><label></label><input type="Submit" value="Submit"></li>
        </ul>
    </fieldset>

  <input TYPE="hidden" NAME="PAYMENTACTION" VALUE="#URL.paymentaction#">
</form>
</cfoutput>
</body>
<a class="home" id="CallsLink" href="index.html">Home</a>
</html>