
<cfscript>
component name="AccountIdentifier" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="email"  type="string" display="email" required="no" hint="";
	
	property name="phone"  type="PhoneNumberType" display="phone" required="no" hint="";
	
	
	public AccountIdentifier function init( )
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
	
	
	public void function setemail(string email)
	{
		this.email = arguments.email;
	}  
		
	public string function getemail()
	{
		return this.email;
	} 
	
	
	public void function setphone(PhoneNumberType phone)
	{
		this.phone = arguments.phone;
	}  
		
	public PhoneNumberType function getphone()
	{
		return this.phone;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.email' ) )
			
				local.struct["email"] = getemail();
			
		if(  isDefined( 'this.phone' ) )
			
				local.struct["phone"] = getphone().getStruct();
			
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
				
				if('#key#' eq 'email') {
				
					this.setemail(local.json[key]);
				}
				
				if('#key#' eq 'phone') {
				
					var keyCom = 'phone';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setphone( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setemail(local.json[i]);
					
					this.setphone(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'email') {
					
						this.setemail(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'phone') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setphone( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

