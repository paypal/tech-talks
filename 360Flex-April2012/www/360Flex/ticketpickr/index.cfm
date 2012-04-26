<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
</head>

<body>

<cf_PAYFLOWPRO QUERY   = "RESULT"
            HOSTADDRESS   	= "pilot-payflowpro.paypal.com"
            HOSTPORT       	= "443"
            TIMEOUT        	= "30"
            TRXTYPE        	= "S"
            TENDER         	= "C"
            PARTNER 		= "PayPal"
            VENDOR 		= ""
            USER    		= "smaestre"
            PWD            	= "Admin47tac"
            ACCT           	= "371449635398431"
            EXPDATE        	= "0114"
            AMT            	= "1.00"
            COMMENT1       	= ""
            COMMENT2       	= "Purchased qty 1 foobar"
            EMAIL		= ""
            NAME		= ""
            STREET		= ""
            CITY		= ""
	    STATE		= ""
	    ZIP			= ""
            >
            <cfdump var="#RESULT#">
</body>
</html>
