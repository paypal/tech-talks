<!--
*************************************************
DoDirectPayment.cfm

	This is page has necessary input value to perform dodirectpayment transaction
	When click submit button, action will submit to dodirectpaymentreceipt page
	there retrieving all form values and pass into doHttppost function.

*************************************************
-->

<head>
<title>PayPal CF SDK - DoDirectPayment API</title>
<link href="css/sdk.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
	function generateCC(){
		var cc_number = new Array(16);
		var cc_len = 16;
		var start = 0;
		var rand_number = Math.random();

		switch(document.frmDCC.creditCardType.value)
        {
			case "Visa":
				cc_number[start++] = 4;
				break;
			case "Discover":
				cc_number[start++] = 6;
				cc_number[start++] = 0;
				cc_number[start++] = 1;
				cc_number[start++] = 1;
				break;
			case "MasterCard":
				cc_number[start++] = 5;
				cc_number[start++] = Math.floor(Math.random() * 5) + 1;
				break;
			case "Amex":
				cc_number[start++] = 3;
				cc_number[start++] = Math.round(Math.random()) ? 7 : 4 ;
				cc_len = 15;
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

		document.frmDCC.creditCardNumber.value = "";
		for (var k = 0; k < cc_len; k++) {
			document.frmDCC.creditCardNumber.value += cc_number[k];
		}
	}


</script>
</head>
<body>

<cfoutput>
<form action="DoDirectPaymentReceipt.cfm" method="post" name="frmDCC">
 <h1>Do Direct Payment</h1>
	<fieldset>
    <ul>
    <li>
    <label> First Name:</label>
	<input type="text" size="30" maxlength="32" name="firstName" value="John" />
    </li>
      <li>
    <label>  Last Name:</label><input type="text" size="30" maxlength="32" name="lastName" value="Doe" /></li>
      <li>
    <label>  Card Type:</label><select name="creditCardType" onChange="javascript:generateCC(); return false;">
            <option value="Visa" selected>Visa</option>
            <option value="MasterCard">MasterCard</option>
            <option value="Discover">Discover</option>
            <option value="Amex">American Express</option>
          </select>
        </li>
      <li>
    <label>  Card Number:</label><input type="text" size="19" maxlength="19" name="acct" value="4623226975828898" /></li>
      <li>
    <label>  Expiration Date:</label><select name="expDateMonth">
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
            <option value="2015" selected>2016</option>
            <option value="2015">2017</option>
            <option value="2015">2018</option>
            <option value="2015">2019</option>
            <option value="2015">2020</option>
          </select>
        </li>
      <li>
    <label>  Card Verification Number:</label><input type="text" size="3" maxlength="4" name="cvv2" value="962" /></li>
      <tr>
         <td align=right><br><b>Billing Address:</b></li>
      <li>
    <label>  Address 1: </label><input type="text" size="25" maxlength="100" name="street" value="123 Fake St" /></li>
      <li>
    <label>  Address 2: </label><input type="text" size="25" maxlength="100" name="address2" />
          (optional)</li>
      <li>
    <label>  City: </label><input type="text" size="25" maxlength="40" name="city" value="Omaha" /></li>
      <li>
    <label>  State: </label><select name="state">
            <option></option>
            <option value="AK">AK</option>
            <option value="AL">AL</option>
            <option value="AR">AR</option>
            <option value="AZ">AZ</option>
            <option value="CA" selected>CA</option>
            <option value="CO">CO</option>
            <option value="CT">CT</option>
            <option value="DC">DC</option>
            <option value="DE">DE</option>
            <option value="FL">FL</option>
            <option value="GA">GA</option>
            <option value="HI">HI</option>
            <option value="IA">IA</option>
            <option value="ID">ID</option>
            <option value="IL">IL</option>
            <option value="IN">IN</option>
            <option value="KS">KS</option>
            <option value="KY">KY</option>
            <option value="LA">LA</option>
            <option value="MA">MA</option>
            <option value="MD">MD</option>
            <option value="ME">ME</option>
            <option value="MI">MI</option>
            <option value="MN">MN</option>
            <option value="MO">MO</option>
            <option value="MS">MS</option>
            <option value="MT">MT</option>
            <option value="NC">NC</option>
            <option value="ND">ND</option>
            <option value="NE">NE</option>
            <option value="NH">NH</option>
            <option value="NJ">NJ</option>
            <option value="NM">NM</option>
            <option value="NV">NV</option>
            <option value="NY">NY</option>
            <option value="OH">OH</option>
            <option value="OK">OK</option>
            <option value="OR">OR</option>
            <option value="PA">PA</option>
            <option value="RI">RI</option>
            <option value="SC">SC</option>
            <option value="SD">SD</option>
            <option value="TN">TN</option>
            <option value="TX">TX</option>
            <option value="UT">UT</option>
            <option value="VA">VA</option>
            <option value="VT">VT</option>
            <option value="WA">WA</option>
            <option value="WI">WI</option>
            <option value="WV">WV</option>
            <option value="WY">WY</option>
            <option value="AA">AA</option>
            <option value="AE">AE</option>
            <option value="AP">AP</option>
            <option value="AS">AS</option>
            <option value="FM">FM</option>
            <option value="GU">GU</option>
            <option value="MH">MH</option>
            <option value="MP">MP</option>
            <option value="PR">PR</option>
            <option value="PW">PW</option>
            <option value="VI">VI</option>
          </select>
        </li>
      <li>
    <label>  ZIP Code: </label><input type="text" size="10" maxlength="10" name="zip" value="95131" />
          (5 or 9 digits) </li>
      <li>
    <label>  Country: </label> United States </li>
      <li>
    <label>  Amount:</label><input type="text" size="4" maxlength="7" name="amt" value="1.00" />USD
      <li>
    <label> </label><input type="Submit" value="Submit" /></li>
  </ul>
  </fieldset>
  <input type="hidden" name="paymentaction" value="#URL.paymentaction#">
</form>
</cfoutput>
<a class="home" id="CallsLink" href="index.html">Home</a>

</body>
</html>