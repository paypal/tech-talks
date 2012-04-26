
<cfscript>
component name="FundingConstraint" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="allowedFundingType"  type="FundingTypeList" display="allowedFundingType" required="no" hint="";
	
	
	public FundingConstraint function init( )
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
		
		
		return this;  
	}
	
	public void function setError(ErrorData error)
	{
		this.error = arguments.error;
	}  
		
	public ErrorData function getError()
	{
		return this.error;
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
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
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
				
				if('#key#' eq 'allowedFundingType') {
				
					var keyCom = 'allowedFundingType';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setallowedFundingType( keyObj.deserialize(local.json[key]) );
					
				}
				
				
				if('#key#' eq 'error')
				{	
					var keyObj = createObject("component",'ErrorData');
					this.setError( keyObj.deserialize(local.json[key]) );	
				}
				
			}
		} else if (isArray(local.json)) {
		
			for( i = 1; i lte ArrayLen(local.json); i = i + 1)
			{
			
				if(NOT isStruct(local.json[i]))
				{
					
					this.setallowedFundingType(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'allowedFundingType') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setallowedFundingType( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

