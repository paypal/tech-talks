
<cfscript>
component name="FundingConstraint" output="false"  hint="I define the properties and methods"
{

	
	property name="allowedFundingType"  type="FundingTypeList" display="allowedFundingType" required="no" hint="";
	

	public FundingConstraint function init( )
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
		
		
		return this;  
	}
	
	
	public void function setallowedFundingType(FundingTypeList allowedFundingType)
	{
		this.allowedFundingType = arguments.allowedFundingType;
	}  
		
	public FundingTypeList function getallowedFundingType()
	{
		return this.allowedFundingType;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.allowedFundingType' ) )
			
				local.struct["allowedFundingType"] = getallowedFundingType().getStruct();
			
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
						if(NOT isStruct(local.json[key]) AND ('FundingTypeList' eq "string" OR 'FundingTypeList' eq "boolean" OR 'FundingTypeList' eq "numeric"))
						{
							this.setallowedFundingType(local.json[key]);
						} else {
							var keyCom = 'allowedFundingType';
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
							this.setallowedFundingType( keyObj.deserialize(local.json[key]) );
							
						}
							
				
			}
		} else if (isArray(local.json)) {
		
			for( i = 1; i lte ArrayLen(local.json); i = i + 1)
			{
			
				for(key in local.json[i])
				{
					
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('FundingTypeList' eq "string" OR 'FundingTypeList' eq "boolean" OR 'FundingTypeList' eq "numeric"))
							{
								this.setallowedFundingType(local.json[i][key]);
							} else {
								var keyCom = 'allowedFundingType';
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
								this.setallowedFundingType( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
				}
			
			}
		
		}
		
		return this;
	} 
	
	
	
	
}
</cfscript>

