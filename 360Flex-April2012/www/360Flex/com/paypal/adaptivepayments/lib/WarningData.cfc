
<cfscript>
component name="WarningData" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="warningId"  type="numeric" display="warningId" required="no" hint="";
	
	property name="message"  type="string" display="message" required="no" hint="";
	
	
	public WarningData function init( )
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
	
	
	public void function setwarningId(numeric warningId)
	{
		this.warningId = arguments.warningId;
	}  
		
	public numeric function getwarningId()
	{
		return this.warningId;
	} 
	
	
	public void function setmessage(string message)
	{
		this.message = arguments.message;
	}  
		
	public string function getmessage()
	{
		return this.message;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.warningId' ) )
			
				local.struct["warningId"] = getwarningId();
			
		if(  isDefined( 'this.message' ) )
			
				local.struct["message"] = getmessage();
			
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
				
				if('#key#' eq 'warningId') {
				
					this.setwarningId(local.json[key]);
				}
				
				if('#key#' eq 'message') {
				
					this.setmessage(local.json[key]);
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
					
					this.setwarningId(local.json[i]);
					
					this.setmessage(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'warningId') {
					
						this.setwarningId(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'message') {
					
						this.setmessage(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

