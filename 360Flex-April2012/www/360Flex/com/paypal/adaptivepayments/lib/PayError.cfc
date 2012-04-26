
<cfscript>
component name="PayError" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="receiver"  type="Receiver" display="receiver" required="yes" hint="";
	
	property name="error"  type="ErrorData" display="error" required="yes" hint="";
	
	
	public PayError function init( Receiver receiver="", ErrorData error="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setreceiver(arguments.receiver);
			
				this.seterror(arguments.error);
			
		
		
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
	
	
	public void function setreceiver(Receiver receiver)
	{
		this.receiver = arguments.receiver;
	}  
		
	public Receiver function getreceiver()
	{
		return this.receiver;
	} 
	
	
	public void function seterror(ErrorData error)
	{
		this.error = arguments.error;
	}  
		
	public ErrorData function geterror()
	{
		return this.error;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.receiver' ) )
			
				local.struct["receiver"] = getreceiver().getStruct();
			
		if(  isDefined( 'this.error' ) )
			
				local.struct["error"] = geterror().getStruct();
			
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
				
				if('#key#' eq 'receiver') {
				
					var keyCom = 'receiver';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setreceiver( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'error') {
				
					var keyCom = 'error';
					
					keyCom = 'ErrorData'; 
					var keyObj = createObject("component",'#keyCom#');
					this.seterror( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setreceiver(local.json[i]);
					
					this.seterror(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'receiver') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setreceiver( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'error') {
					
						keyCom = 'ErrorData';
						
						var keyObj = createObject("component",'#keyCom#');
						this.seterror( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

