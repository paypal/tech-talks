
<cfscript>
component name="PhoneNumberType" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="countryCode"  type="string" display="countryCode" required="yes" hint="";
	
	property name="phoneNumber"  type="string" display="phoneNumber" required="yes" hint="";
	
	property name="extension"  type="string" display="extension" required="no" hint="";
	
	
	public PhoneNumberType function init( string countryCode="", string phoneNumber="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setcountryCode(arguments.countryCode);
			
				this.setphoneNumber(arguments.phoneNumber);
			
		
		
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
	
	
	public void function setcountryCode(string countryCode)
	{
		this.countryCode = arguments.countryCode;
	}  
		
	public string function getcountryCode()
	{
		return this.countryCode;
	} 
	
	
	public void function setphoneNumber(string phoneNumber)
	{
		this.phoneNumber = arguments.phoneNumber;
	}  
		
	public string function getphoneNumber()
	{
		return this.phoneNumber;
	} 
	
	
	public void function setextension(string extension)
	{
		this.extension = arguments.extension;
	}  
		
	public string function getextension()
	{
		return this.extension;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.countryCode' ) )
			
				local.struct["countryCode"] = getcountryCode();
			
		if(  isDefined( 'this.phoneNumber' ) )
			
				local.struct["phoneNumber"] = getphoneNumber();
			
		if(  isDefined( 'this.extension' ) )
			
				local.struct["extension"] = getextension();
			
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
				
				if('#key#' eq 'countryCode') {
				
					this.setcountryCode(local.json[key]);
				}
				
				if('#key#' eq 'phoneNumber') {
				
					this.setphoneNumber(local.json[key]);
				}
				
				if('#key#' eq 'extension') {
				
					this.setextension(local.json[key]);
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
					
					this.setcountryCode(local.json[i]);
					
					this.setphoneNumber(local.json[i]);
					
					this.setextension(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'countryCode') {
					
						this.setcountryCode(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'phoneNumber') {
					
						this.setphoneNumber(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'extension') {
					
						this.setextension(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

