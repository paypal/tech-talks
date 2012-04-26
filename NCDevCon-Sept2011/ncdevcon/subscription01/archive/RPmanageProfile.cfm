<!--
*************************************************
ManageRPprofile.cfm

	This page has necessary inputs to perform manage recurring payments profile transaction.
	When clicking of submit button, action will submit changedRPstatus.cfm page
	there retrieving all form values and pass into doHttppost function.

*************************************************
-->

<head>
<title>PayPal CF SDK - Manage Recurring Payments Profile Status API</title>
<link href="css/sdk.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form action="RPmanageProfileStatus.cfm" method="post" name="formManageRPprofile">

<h1>Manage Recurring Payments Profile Status</h1>

<fieldset>
    <ol>
    <li>
    <label> Profile ID:</label>
    <input type="text" name="profileID" value="" /> (Required)</li>
     <li><label>Action:</label>
        
              <select name="action">
              	<option value="Cancel">Cancel</option>
              	<option value="Suspend">Suspend</option>
              	<option value="Reactivate">Reactivate</option>
              </select>
          </li>
     <li><label></label><input type="Submit" value="Submit" /></li>
     </ol>
</fieldset>
</form>

<a class="home" id="CallsLink" href="RecurringPaymentsIndex.cfm">Recurring Payments Home</a>
</body>
</html>