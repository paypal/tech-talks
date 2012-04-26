
<cfscript>
component name="UserLimit" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="limitType"  type="string" display="limitType" required="yes" hint="";
	
	property name="limitAmount"  type="CurrencyType" display="limitAmount" required="yes" hint="";
	
	
	public UserLimit function init( string limitType="", CurrencyType limitAmount="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setlimitType(arguments.limitType);
			
				this.setlimitAmount(arguments.limitAmount);
			
		
		
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
	
	
	public void function setlimitType(string limitType)
	{
		this.limitType = arguments.limitType;
	}  
		
	public string function getlimitType()
	{
		return this.limitType;
	} 
	
	
	public void function setlimitAmount(CurrencyType limitAmount)
	{
		this.limitAmount = arguments.limitAmount;
	}  
		
	public CurrencyType function getlimitAmount()
	{
		return this.limitAmount;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.limitType' ) )
			
				local.struct["limitType"] = getlimitType();
			
		if(  isDefined( 'this.limitAmount' ) )
			
				local.struct["limitAmount"] = getlimitAmount().getStruct();
			
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
				
				if('#key#' eq 'limitType') {
				
					this.setlimitType(local.json[key]);
				}
				
				if('#key#' eq 'limitAmount') {
				
					var keyCom = 'limitAmount';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setlimitAmount( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setlimitType(local.json[i]);
					
					this.setlimitAmount(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'limitType') {
					
						this.setlimitType(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'limitAmount') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setlimitAmount( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

