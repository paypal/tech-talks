<cfscript>

component {

	public ExpressCheckout function init() {
	
		return this;
	}
	
	public struct  function setExpressCheckoutData(required struct form,required struct request,struct data) {
	
		var result = structNew();
		
		structAppend(result,form,false);
		structAppend(result,request,false);
		structAppend(result,data,false);
		
		// Calculating ITEMAMT =(amount1*quantity1)+(amount2*quantity2)
		var itemAmt = 0;
		for (i=0; i LT form.itemCnt; i = i+1)
		{
			itemAmt = itemAmt + (#Evaluate('form.L_QTY' & i)# * #Evaluate('form.L_AMT' & i)#);
		}
		result.itemAmt= DecimalFormat(itemAmt);		
	
		//Calculating amount = itemamount+ shippingamt+shippingdisc+taxamt+insuranceamount;
		var amt = 0;
		amt= #DecimalFormat(Evaluate(#itemAmt# + data.SHIPPINGAMT + data.SHIPDISCAMT + data.TAXAMT + data.INSURANCEAMT))#;

		result.amt = amt;
		
		// calculating maxamt
		result.maxamt=#DecimalFormat(Evaluate(#amt# + 25))#;
		
		// set cancel URL
		result.cancelURL = "http://" & data.serverName & ":" & data.serverPort & data.contextPath & data.cancelPage &"?paymentaction=" & form.paymentaction;
		
		// set return URL
		result.returnURL = "http://" & data.serverName & ":" & data.serverPort & data.contextPath & data.returnPage & "?amt=#amt#&currencycode=#form.currencyCodeType#&paymentaction=#form.paymentaction#";
	
		return result;
	}
	
	
	public struct  function setGetCheckoutData(required struct request,required struct data) {
		var result = structNew();
		structAppend(result,request,false);
		structAppend(result,data,false);
	
		return result;	
	}
	
	public struct  function setDoCheckoutData(required struct form,required struct request,struct data) {
		var result = structNew();
		
		structAppend(result,form,false);
		structAppend(result,request,false);
		structAppend(result,data,false);
	
		return result;	
	}
	
}
</cfscript>