
<cfscript>
component name="SenderOptions" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
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
	
	public void function setError(ErrorData error)
	{
		this.error = arguments.error;
	}  
		
	public ErrorData function getError()
	{
		return this.error;
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
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
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
				
				if('#key#' eq 'requireShippingAddressSelection') {
				
					this.setrequireShippingAddressSelection(local.json[key]);
				}
				
				if('#key#' eq 'referrerCode') {
				
					this.setreferrerCode(local.json[key]);
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
					
					this.setrequireShippingAddressSelection(local.json[i]);
					
					this.setreferrerCode(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'requireShippingAddressSelection') {
					
						this.setrequireShippingAddressSelection(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'referrerCode') {
					
						this.setreferrerCode(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

