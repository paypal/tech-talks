
<cfscript>
component name="RequestEnvelope" output="false"  hint="I define the properties and methods"
{

	
	property name="detailLevel"  type="DetailLevelCode" display="detailLevel" required="no" hint="
								This specifies the required detail level
								that is needed by a client application
								pertaining to a particular data
								component (e.g., Item, Transaction,
								etc.). The detail level is specified in
								the DetailLevelCodeType which has all
								the enumerated values of the detail
								level for each component.
							";
	
	property name="errorLanguage"  type="string" display="errorLanguage" required="yes" hint="
								This should be the standard RFC 3066
								language identification tag, e.g.,
								en_US.
							";
	

	public RequestEnvelope function init( string errorLanguage="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.seterrorLanguage(arguments.errorLanguage);
			
		
		
		return this;  
	}
	
	
	public void function setdetailLevel(DetailLevelCode detailLevel)
	{
		this.detailLevel = arguments.detailLevel;
	}  
		
	public DetailLevelCode function getdetailLevel()
	{
		return this.detailLevel;
	} 
	
	
	public void function seterrorLanguage(string errorLanguage)
	{
		this.errorLanguage = arguments.errorLanguage;
	}  
		
	public string function geterrorLanguage()
	{
		return this.errorLanguage;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.detailLevel' ) )
			
				local.struct["detailLevel"] = getdetailLevel().getStruct();
			
		if(  isDefined( 'this.errorLanguage' ) )
			
				local.struct["errorLanguage"] = geterrorLanguage();
			
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
						if(NOT isStruct(local.json[key]) AND ('DetailLevelCode' eq "string" OR 'DetailLevelCode' eq "boolean" OR 'DetailLevelCode' eq "numeric"))
						{
							this.setdetailLevel(local.json[key]);
						} else {
							var keyCom = 'detailLevel';
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
							this.setdetailLevel( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
						{
							this.seterrorLanguage(local.json[key]);
						} else {
							var keyCom = 'errorLanguage';
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
							this.seterrorLanguage( keyObj.deserialize(local.json[key]) );
							
						}
							
				
			}
		} else if (isArray(local.json)) {
		
			for( i = 1; i lte ArrayLen(local.json); i = i + 1)
			{
			
				for(key in local.json[i])
				{
					
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('DetailLevelCode' eq "string" OR 'DetailLevelCode' eq "boolean" OR 'DetailLevelCode' eq "numeric"))
							{
								this.setdetailLevel(local.json[i][key]);
							} else {
								var keyCom = 'detailLevel';
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
								this.setdetailLevel( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
							{
								this.seterrorLanguage(local.json[i][key]);
							} else {
								var keyCom = 'errorLanguage';
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
								this.seterrorLanguage( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
				}
			
			}
		
		}
		
		return this;
	} 
	
	
	
	
}
</cfscript>

