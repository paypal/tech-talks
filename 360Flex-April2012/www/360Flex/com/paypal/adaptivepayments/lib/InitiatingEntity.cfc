
<cfscript>
component name="InitiatingEntity" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="institutionCustomer"  type="InstitutionCustomer" display="institutionCustomer" required="no" hint="";
	
	
	public InitiatingEntity function init( )
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
	
	
	public void function setinstitutionCustomer(InstitutionCustomer institutionCustomer)
	{
		this.institutionCustomer = arguments.institutionCustomer;
	}  
		
	public InstitutionCustomer function getinstitutionCustomer()
	{
		return this.institutionCustomer;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.institutionCustomer' ) )
			
				local.struct["institutionCustomer"] = getinstitutionCustomer().getStruct();
			
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
				
				if('#key#' eq 'institutionCustomer') {
				
					var keyCom = 'institutionCustomer';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setinstitutionCustomer( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setinstitutionCustomer(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'institutionCustomer') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setinstitutionCustomer( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

