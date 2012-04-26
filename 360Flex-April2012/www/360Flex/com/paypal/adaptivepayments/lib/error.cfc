
<cfscript>
component name="ExecutePaymentResponse" output="false"  hint="I define the properties and methods"
{

	
	property name="responseEnvelope"  type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
	
	property name="paymentExecStatus"  type="string" display="paymentExecStatus" required="yes" hint="";
	
	property name="payErrorList"  type="PayErrorList" display="payErrorList" required="no" hint="";
	

	public ExecutePaymentResponse function init( ResponseEnvelope responseEnvelope="", string paymentExecStatus="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setresponseEnvelope(arguments.responseEnvelope);
			
				this.setpaymentExecStatus(arguments.paymentExecStatus);
			
		
		
		return this;  
	}
	
	
	public void function setresponseEnvelope(ResponseEnvelope responseEnvelope)
	{
		this.responseEnvelope = arguments.responseEnvelope;
	}  
		
	public ResponseEnvelope function getresponseEnvelope()
	{
		return this.responseEnvelope;
	} 
	
	
	public void function setpaymentExecStatus(string paymentExecStatus)
	{
		this.paymentExecStatus = arguments.paymentExecStatus;
	}  
		
	public string function getpaymentExecStatus()
	{
		return this.paymentExecStatus;
	} 
	
	
	public void function setpayErrorList(PayErrorList payErrorList)
	{
		this.payErrorList = arguments.payErrorList;
	}  
		
	public PayErrorList function getpayErrorList()
	{
		return this.payErrorList;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.responseEnvelope' ) )
			
				local.struct["responseEnvelope"] = getresponseEnvelope().getStruct();
			
		if(  isDefined( 'this.paymentExecStatus' ) )
			
				local.struct["paymentExecStatus"] = getpaymentExecStatus();
			
		if(  isDefined( 'this.payErrorList' ) )
			
				local.struct["payErrorList"] = getpayErrorList().getStruct();
			
		return local.struct;
	} 
	
	public any function serialize()
	{
		return serializeJSON(this.getStruct());
	} 
	
	public any function deserialize(any jsonObj)
	{
		if(isJSON(jsonObj))
		{
			local.json = deserializeJSON(jsonObj);
		} else {
			local.json = jsonObj;
		}
		
		if(isStruct(local.json))
		{
		
			for(key in local.json)
			{
				
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('ResponseEnvelope' eq "string" OR 'ResponseEnvelope' eq "boolean" OR 'ResponseEnvelope' eq "numeric"))
						{
							this.setresponseEnvelope(local.json[key]);
						} else {
							var keyCom = 'responseEnvelope';
							if(keyCom eq 'ack')
								keyCom = 'ackCode';
							if(keyCom eq 'sender')
								keyCom = 'SenderIdentifier';
							if(keyCom eq 'estimatedAmountTable')
									keyCom = 'CurrencyConversionTable';
							if(keyCom eq 'baseAmount')
									keyCom = 'CurrencyType';
							if(keyCom eq 'currency')
									keyCom = 'CurrencyType';
							if(keyCom eq 'error')
									keyCom = 'ErrorData';
							if(keyCom eq 'severity')
									keyCom = 'ErrorSeverity';
								if(keyCom eq 'category')
									keyCom = 'ErrorCategory';
								if(keyCom eq 'parameter')
									keyCom = 'ErrorParameter';
							
									
								
							var keyObj = createObject("component",'#keyCom#');
							this.setresponseEnvelope( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
						{
							this.setpaymentExecStatus(local.json[key]);
						} else {
							var keyCom = 'paymentExecStatus';
							if(keyCom eq 'ack')
								keyCom = 'ackCode';
							if(keyCom eq 'sender')
								keyCom = 'SenderIdentifier';
							if(keyCom eq 'estimatedAmountTable')
									keyCom = 'CurrencyConversionTable';
							if(keyCom eq 'baseAmount')
									keyCom = 'CurrencyType';
							if(keyCom eq 'currency')
									keyCom = 'CurrencyType';
							if(keyCom eq 'error')
									keyCom = 'ErrorData';
							if(keyCom eq 'severity')
									keyCom = 'ErrorSeverity';
								if(keyCom eq 'category')
									keyCom = 'ErrorCategory';
								if(keyCom eq 'parameter')
									keyCom = 'ErrorParameter';
							
									
								
							var keyObj = createObject("component",'#keyCom#');
							this.setpaymentExecStatus( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('PayErrorList' eq "string" OR 'PayErrorList' eq "boolean" OR 'PayErrorList' eq "numeric"))
						{
							this.setpayErrorList(local.json[key]);
						} else {
							var keyCom = 'payErrorList';
							if(keyCom eq 'ack')
								keyCom = 'ackCode';
							if(keyCom eq 'sender')
								keyCom = 'SenderIdentifier';
							if(keyCom eq 'estimatedAmountTable')
									keyCom = 'CurrencyConversionTable';
							if(keyCom eq 'baseAmount')
									keyCom = 'CurrencyType';
							if(keyCom eq 'currency')
									keyCom = 'CurrencyType';
							if(keyCom eq 'error')
									keyCom = 'ErrorData';
							if(keyCom eq 'severity')
									keyCom = 'ErrorSeverity';
								if(keyCom eq 'category')
									keyCom = 'ErrorCategory';
								if(keyCom eq 'parameter')
									keyCom = 'ErrorParameter';
							
									
								
							var keyObj = createObject("component",'#keyCom#');
							this.setpayErrorList( keyObj.deserialize(local.json[key]) );
							
						}
							
				
			}
		} else if (isArray(local.json)) {
		
			for( i = 1; i lte ArrayLen(local.json); i = i + 1)
			{
			
				for(key in local.json[i])
				{
					
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('ResponseEnvelope' eq "string" OR 'ResponseEnvelope' eq "boolean" OR 'ResponseEnvelope' eq "numeric"))
							{
								this.setresponseEnvelope(local.json[i][key]);
							} else {
								var keyCom = 'responseEnvelope';
								if(keyCom eq 'ack')
									keyCom = 'ackCode';
								if(keyCom eq 'sender')
									keyCom = 'SenderIdentifier';
								if(keyCom eq 'estimatedAmountTable')
									keyCom = 'CurrencyConversionTable';
								if(keyCom eq 'baseAmount')
									keyCom = 'CurrencyType';
								if(keyCom eq 'currency')
									keyCom = 'CurrencyType';
								if(keyCom eq 'error')
									keyCom = 'ErrorData';
								if(keyCom eq 'severity')
									keyCom = 'ErrorSeverity';
								if(keyCom eq 'category')
									keyCom = 'ErrorCategory';
								if(keyCom eq 'parameter')
									keyCom = 'ErrorParameter';
									
									
		
									
								var keyObj = createObject("component",'#keyCom#');
								this.setresponseEnvelope( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
							{
								this.setpaymentExecStatus(local.json[i][key]);
							} else {
								var keyCom = 'paymentExecStatus';
								if(keyCom eq 'ack')
									keyCom = 'ackCode';
								if(keyCom eq 'sender')
									keyCom = 'SenderIdentifier';
								if(keyCom eq 'estimatedAmountTable')
									keyCom = 'CurrencyConversionTable';
								if(keyCom eq 'baseAmount')
									keyCom = 'CurrencyType';
								if(keyCom eq 'currency')
									keyCom = 'CurrencyType';
								if(keyCom eq 'error')
									keyCom = 'ErrorData';
								if(keyCom eq 'severity')
									keyCom = 'ErrorSeverity';
								if(keyCom eq 'category')
									keyCom = 'ErrorCategory';
								if(keyCom eq 'parameter')
									keyCom = 'ErrorParameter';
									
									
		
									
								var keyObj = createObject("component",'#keyCom#');
								this.setpaymentExecStatus( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('PayErrorList' eq "string" OR 'PayErrorList' eq "boolean" OR 'PayErrorList' eq "numeric"))
							{
								this.setpayErrorList(local.json[i][key]);
							} else {
								var keyCom = 'payErrorList';
								if(keyCom eq 'ack')
									keyCom = 'ackCode';
								if(keyCom eq 'sender')
									keyCom = 'SenderIdentifier';
								if(keyCom eq 'estimatedAmountTable')
									keyCom = 'CurrencyConversionTable';
								if(keyCom eq 'baseAmount')
									keyCom = 'CurrencyType';
								if(keyCom eq 'currency')
									keyCom = 'CurrencyType';
								if(keyCom eq 'error')
									keyCom = 'ErrorData';
								if(keyCom eq 'severity')
									keyCom = 'ErrorSeverity';
								if(keyCom eq 'category')
									keyCom = 'ErrorCategory';
								if(keyCom eq 'parameter')
									keyCom = 'ErrorParameter';
									
									
		
									
								var keyObj = createObject("component",'#keyCom#');
								this.setpayErrorList( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
				}
			
			}
		
		}
		
		return this;
	} 
	
	
	
	
}
</cfscript>

