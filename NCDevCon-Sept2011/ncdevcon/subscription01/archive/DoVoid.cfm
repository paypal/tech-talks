<!-- 
*************************************************
DoVoid.cfm

	This page has necessary input value to perform DoVoid transaction
	When click submit button, action will submit to DoVoidreceipt page 
	there retrieving all form values and pass into doHttppost function

*************************************************
-->
<cfparam name="URL.authorizationId" default="" >
<html>
<head>
    <title>PayPal CF SDK - DoVoid API</title>
    <link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<form action="DoVoidReceipt.cfm" method="post" name="formVoid">

<h1>Do Void</h1>
<fieldset>

    <ol>
    <li>
    <label>Authorization ID:</label>
    <input type="text" name="authorizationId" value="<CFOUTPUT>#URL.authorizationId#</CFOUTPUT>" /><em>(Required)</em>
	</li>
      
    <li><label>Note:</label><textarea name="note" cols="30" rows="4"></textarea></li>
    <li><label></label><input type="Submit" value="Submit" /></li>  
    </ol>
</fieldset>
      
</form>
      
<a class="home" id="CallsLink" href="index.html">Home</a>
</body>
</html>