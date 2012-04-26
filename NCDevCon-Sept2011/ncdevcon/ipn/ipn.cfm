<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
</head>

<body>

<!-- COLDFUSION   -->
<!-- read post from PayPal system -->
<CFSET requestData = getHTTPRequestData() />
<!-- add 'cmd' and post back to PayPal system to validate -->

<!---
<cfdocument format="PDF" filename="requestdata.pdf" overwrite="yes">
<cfoutput>
  #requestData.content#
  <br /><br /><br />
  </cfoutput>
</cfdocument>
 --->
<CFHTTP url="https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_notify-validate&#requestData.content#" />

<!---
<cfdocument format="PDF" filename="filecontent.pdf" overwrite="yes">
  <cfdump var="#CFHTTP#">
</cfdocument>
--->

<!-- check notification validation -->
<CFIF #CFHTTP.FileContent# is "VERIFIED">
verified

	
    <cfdocument format="PDF" filename="form.pdf" overwrite="yes">
  		<cfdump var="#form#">
	</cfdocument>
    
    <cfdocument format="PDF" filename="form-detail.pdf" overwrite="yes">
  		<cfoutput>
      		#form.FIRST_NAME#
            <br />
            #form.LAST_NAME#
            <br />
  			#form.txn_id#
            <br />
 		</cfoutput>
    
	</cfdocument>
    

	<CFELSEIF #CFHTTP.FileContent# is "INVALID">
	<!-- log for investigation -->
	<CFELSE>
	
<!-- error -->
</CFIF>


</body>
</html>