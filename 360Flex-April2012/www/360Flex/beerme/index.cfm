<cfparam default="" name="url.state" >
<cfif isDefined('url.state') AND url.state eq "execute">

	<cfset total = numberOfBeers * 5 >
	<cfinvoke component="adaptivepayments" method="preapprovalRequest" returnvariable="response">
		<cfinvokeargument name="returnURL" value="#request.serverURL##GetDirectoryFromPath(SCRIPT_NAME)#index.cfm?state=return">
		<cfinvokeargument name="cancelURL" value="#request.serverURL##GetDirectoryFromPath(SCRIPT_NAME)#index.cfm?state=cancel">
		<cfinvokeargument name="senderEmail" value="#form.email#">
		<cfinvokeargument name="startingDate" value="#DateFormat(DateAdd("s",60,now()),'YYYY-MM-DD')#">
		<cfinvokeargument name="currencyCode" value="USD">
		<cfinvokeargument name="maxTotalAmountOfAllPayments" value="#total#">
		<cfinvokeargument name="displayMaxTotalAmount" value="true">
		<cfinvokeargument name="memo" value="Max Amount #numberOfBeers# beers at $5 each = $#total#">
	</cfinvoke>

</cfif>

<!DOCTYPE html>
	


<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<head>
	<meta charset="utf-8" />

	<!-- Set the viewport width to device width for mobile -->
	<meta name="viewport" content="width=device-width" />

	<title>Beer Me Website</title>
  
	<!-- Included CSS Files -->
	<link rel="stylesheet" href="assets/stylesheets/foundation.css">
	<link rel="stylesheet" href="assets/stylesheets/app.css">

	<!--[if lt IE 9]>
		<link rel="stylesheet" href="stylesheets/ie.css">
	<![endif]-->


	<!-- IE Fix for HTML5 Tags -->
	<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	

<script src="assets/javascripts/jquery-1.7.1.min.js"></script>

</head>
<body>

<div class="container">

	<div class="row">
		<div class="twelve columns">
			<form method="post" name="beerForm" action="index.cfm?state=execute">
				
				<fieldset>
					<h5>Beer Me Sign Up</h5>
					<p>Buy your friends a beer with ONE-Click.  Watch out may be hazardous to your bank account.</p>

					<label for="niceFieldsetInput">Name</label>
					<input type="text" name="fullName" value="Sid Maestre" class="input-text"  />
					
					<label for="niceFieldsetInput">PayPal Email</label>
					<input type="text" name="email"  value="html5_1319498027_per@x.com" class="input-text" />
					
					<label for="niceFieldsetInput">Beer Me Password</label>
					<input type="password" name="password" value="12345678" class="input-text" />
					
					<label for="customDropdown">Beers on Tap</label>
					<select name="numberOfBeers" id="customDropdown">
						<option SELECTED>2</option>
						<option>4</option>
						<option>6</option>
						<option>8</option>
						<option>10</option>
					</select>
					
					<a href="#" onclick="beerForm.submit()" class="nice small radius blue button">Turn on the Tap</a>
				</fieldset>
				
			</form>
		
			<cfif url.state eq 'execute'>
					<cfset payPalURL = request.paypalStruct['PAYPAL-REDIRECT-URL'] & '_ap-preapproval&preapprovalkey=#response.getPreapprovalKey()#'>
					Preapproval Beer me to charge your PayPal Account
					<br>
					<cfoutput>
					<a href="#payPalURL#"  class="nice radius blue button" target="_blank"><b>Login To PayPal </b></a><br>
					</cfoutput>
			
			</cfif>
		</div>
	</div>
</div>

</body>
</html>