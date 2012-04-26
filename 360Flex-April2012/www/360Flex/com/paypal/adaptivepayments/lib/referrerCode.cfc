
<cfscript>
component name="SenderOptions" output="false"  hint="I define the properties and methods"
{

	
	property name="requireShippingAddressSelection"  type="boolean" display="requireShippingAddressSelection" required="no" hint="
								Require the user to select a shipping
								address during the web flow.
							";
	
	property name="referrerCode"  type="string" display="referrerCode" required="no" hint="";
	

	public SenderOptions function init( )
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
		
		
		return this;  
	}
	
	
	public void function setrequireShippingAddressSelection(boolean requireShippingAddressSelection)
	{
		this.requireShippingAddressSelection = arguments.requireShippingAddressSelection;
	}  
		
	public boolean function getrequireShippingAddressSelection()
	{
		return this.requireShippingAddressSelection;
	} 
	
	
	public void function setreferrerCode(string referrerCode)
	{
		this.referrerCode = arguments.referrerCode;
	}  
		
	public string function getreferrerCode()
	{
		return this.referrerCode;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.requireShippingAddressSelection' ) )
			
				local.struct["requireShippingAddressSelection"] = getrequireShippingAddressSelection();
			
		if(  isDefined( 'this.referrerCode' ) )
			
				local.struct["referrerCode"] = getreferrerCode();
			
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
						if(NOT isStruct(local.json[key]) AND ('boolean' eq "string" OR 'boolean' eq "boolean" OR 'boolean' eq "numeric"))
						{
							this.setrequireShippingAddressSelection(local.json[key]);
						} else {
							var keyCom = 'requireShippingAddressSelection';
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
							this.setrequireShippingAddressSelection( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
						{
							this.setreferrerCode(local.json[key]);
						} else {
							var keyCom = 'referrerCode';
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
							this.setreferrerCode( keyObj.deserialize(local.json[key]) );
							
						}
							
				
			}
		} else if (isArray(local.json)) {
		
			for( i = 1; i lte ArrayLen(local.json); i = i + 1)
			{
			
				for(key in local.json[i])
				{
					
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('boolean' eq "string" OR 'boolean' eq "boolean" OR 'boolean' eq "numeric"))
							{
								this.setrequireShippingAddressSelection(local.json[i][key]);
							} else {
								var keyCom = 'requireShippingAddressSelection';
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
								this.setrequireShippingAddressSelection( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
							{
								this.setreferrerCode(local.json[i][key]);
							} else {
								var keyCom = 'referrerCode';
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
								this.setreferrerCode( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
				}
			
			}
		
		}
		
		return this;
	} 
	
	
	
	
}
</cfscript>

