
<cfscript>
component name="adaptivepayments2" output="false"  hint="I define the properties and methods"
{
	
	
	variables.serverURL = "https://svcs.sandbox.paypal.com/AdaptivePayments/";
	
	public service function init()
		hint="I initialize the component and return myself" 
	 	output="false" {
		  
		return this;  
	}
	
	

	public any function PaymentDetailsRequest(
		 DetailLevelCode, required string errorLanguage, 
		)
	 	output="false" {
		
		  
		return this;  
	}
	
	
	
	
		
}
</cfscript>

