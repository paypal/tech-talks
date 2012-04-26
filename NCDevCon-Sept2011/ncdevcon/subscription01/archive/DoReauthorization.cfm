<!-- 
*************************************************
DoReauthorization.cfm

	This page has necessary input value to perform DoReauthorization transaction
	When click submit button, action will submit to DoReauthorizationReceipt page 
	In  DoReauthorizationReceipt page all form values will be retrieved and passed 
	into cfhttp tag as query parameter for destination URL.

*************************************************
-->

<html>
<head>
    <title>PayPal SDK - DoReauthorization</title>
    <link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form action="DoReauthorizationReceipt.cfm" method="post" name="formReAuth">
    <h1>DoReauthorization </h1>
        
	<fieldset>
    <ol>
    <li><label>Authorization ID:</label><input type="text" name="authorizationID" />(Required)</li>
    <li><label>Amount:</label>
                <input type="text" name="amt" size="5" maxlength="7" />
                <select name="currencyCode">
                <option value="USD">USD</option>
                <option value="GBP">GBP</option>
                <option value="EUR">EUR</option>
                <option value="JPY">JPY</option>
                <option value="CAD">CAD</option>
                <option value="AUD">AUD</option>
                </select>
                (Required)</li>
      <li><label></label><input type="Submit" value="Submit" /></li>
      </ol>
      </fieldset>
</form>

<a class="home" id="CallsLink" href="index.html">Home</a>
</body>
</html>