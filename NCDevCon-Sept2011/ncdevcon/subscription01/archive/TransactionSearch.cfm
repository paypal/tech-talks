<!-- 
*************************************************
TransctionSearch.cfm

	This page has necessary input value to perform Transaction Search 
	When click submit button, action will submit to Transaction Search result page
	there retrieving all form values and pass into doHttppost function.

*************************************************
-->


<html>
<head>
    <title>PayPal CF SDK - TransactionSearch API</title>
    <link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

 
<cfform action="TransactionSearchResults.cfm">
    <h1>Transaction Search</h1>
    
	<fieldset>
    <ol>
    <li> 
    <label> StartDate:</label>
     <cfinput type="text" name="startDateStr" maxlength="10" size="10"  value="#DateFormat(Now()-1, "mm/dd/yyyy")#"/>
     <em>(Required)        MM/DD/YYYY</em>
    </li>
    
     <li> 
    <label> EndDate:</label>
    <cfinput type="text" name="endDateStr" maxlength="10" size="10"  value="#DateFormat(Now(), "mm/dd/yyyy")#" />
    MM/DD/YYYY
    </li>
    
     <li> 
    <label> TransactionID:</label>
  <input type="text" name="transactionID" />
    </li>
    
    <li> 
    <label></label>
    <input type="Submit" value="Submit" />
        </li>
    </ol>
    </fieldset>
    </cfform>

   <a class="home" id="CallsLink" href="index.html">Home</a>
</body>
</html>