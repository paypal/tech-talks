<cfscript>
/** @accessors true */

component {

	public ExpressCheckout function init() {
	
		return this;
	}
	
	public struct  function setExpressCheckoutData(required struct form,required struct request,struct data) {
	
		var result = structNew();
		
		structAppend(result,form,false);
		structAppend(result,request,false);
		structAppend(result,data,false);
		
		var itemAmt = 0;
		var itemCnt = 0;
		var PAYMENTREQUEST_0_AMT = 0;
		if (isDefined('form.itemCnt'))
		{
			itemCnt = form.itemCnt;
		} else 	if (isDefined('data.itemCnt')) {
			itemCnt = data.itemCnt;
		}
	
		
		
		for (i=0; i LT itemCnt; i = i+1)
		{
			setVariable('qty', 'form.L_QTY' & i);
			setVariable('amt', 'form.L_AMT' & i);
			if (isDefined(qty) and isDefined(amt))
			{
				itemAmt = itemAmt + (#Evaluate('form.L_QTY' & i)# * #Evaluate('form.L_AMT' & i)#);
			}
			
			setVariable('qty', 'form.L_PAYMENTREQUEST_0_QTY' & i);
			setVariable('amt', 'form.L_PAYMENTREQUEST_0_AMT' & i);
			if (isDefined(qty) and isDefined(amt))
			{
				itemAmt = itemAmt + (#Evaluate('form.L_PAYMENTREQUEST_0_QTY' & i)# * #Evaluate('form.L_PAYMENTREQUEST_0_AMT' & i)#);
			}
			
			setVariable('qty', 'data.L_QTY' & i);
			setVariable('amt', 'data.L_AMT' & i);
			if (isDefined(qty) and isDefined(amt))
			{
				itemAmt = itemAmt + (#Evaluate('data.L_QTY' & i)# * #Evaluate('form.L_AMT' & i)#);
			}
			
			setVariable('qty', 'data.L_PAYMENTREQUEST_0_QTY' & i);
			setVariable('amt', 'data.L_PAYMENTREQUEST_0_AMT' & i);
			if (isDefined(qty) and isDefined(amt))
			{
				itemAmt = itemAmt + (#Evaluate('data.L_PAYMENTREQUEST_0_QTY' & i)# * #Evaluate('data.L_PAYMENTREQUEST_0_AMT' & i)#);
			}
		
		}
		
		
		
		if (isDefined('data.ITEMAMT'))	
		{
			itemAmt= DecimalFormat(data.ITEMAMT);	
		}
		
		if (isDefined('form.ITEMAMT'))	
		{
			itemAmt= DecimalFormat(form.ITEMAMT);	
		}
		result.itemAmt= DecimalFormat(itemAmt);	
		
		if (NOT isDefined('data.L_PAYMENTREQUEST_0_AMT'))	
		{
			result.PAYMENTREQUEST_0_AMT = DecimalFormat(itemAmt);
		}
	
	
		//Calculating amount = itemamount+ shippingamt+shippingdisc+taxamt+insuranceamount;
		var amt = 0;
		var SHIPPINGAMT = 0;
		var SHIPDISCAMT = 0;
		var TAXAMT = 0;
		var INSURANCEAMT = 0;
		var paymentaction = '';
		var currencyCodeType = '';
		
		if (isDefined('data.SHIPPINGAMT'))
		{
			SHIPPINGAMT = data.SHIPPINGAMT;
		}
	
		if (isDefined('data.SHIPDISCAMT'))
		{
			SHIPDISCAMT = data.SHIPDISCAMT;
		}
		
		if (isDefined('data.TAXAMT'))
		{
			TAXAMT = data.TAXAMT;
		}
		
		if (isDefined('data.INSURANCEAMT'))
		{
			INSURANCEAMT = data.INSURANCEAMT;
		}
		
		if (isDefined('form.paymentaction'))
		{
			result.paymentaction = form.paymentaction;
		}
		
		if (isDefined('data.paymentaction'))
		{
			result.paymentaction = data.paymentaction;
		}
	
		if (isDefined('form.currencyCodeType'))
		{
			currencyCodeType = form.currencyCodeType;
		}
	
		amt= #DecimalFormat(Evaluate(#itemAmt# + SHIPPINGAMT + SHIPDISCAMT + TAXAMT + INSURANCEAMT))#;

		result.amt = amt;
		
		// calculating maxamt
		result.maxamt=#DecimalFormat(Evaluate(#amt# + 25))#;
		
		// set cancel URL
		result.cancelURL = "http://" & data.serverName & ":" & data.serverPort & data.contextPath & data.cancelPage &"?paymentaction=" & paymentaction;
		
		// set return URL
		result.returnURL = "http://" & data.serverName & ":" & data.serverPort & data.contextPath & data.returnPage & "?amt=#amt#&currencycode=#currencyCodeType#&paymentaction=#paymentaction#";
	
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
		
		if (isDefined('form.paymentaction'))
		{
			paymentaction = form.paymentaction;
		}
		
		if (isDefined('data.paymentaction'))
		{
			paymentaction = data.paymentaction;
		}
	
		return result;	
	}
	
}
</cfscript>