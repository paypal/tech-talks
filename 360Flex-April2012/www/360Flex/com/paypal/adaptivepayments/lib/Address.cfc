
<cfscript>
component name="Address" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="addresseeName"  type="string" display="addresseeName" required="no" hint="";
	
	property name="baseAddress"  type="BaseAddress" display="baseAddress" required="yes" hint="";
	
	property name="addressId"  type="string" display="addressId" required="no" hint="";
	
	
	public Address function init( BaseAddress baseAddress="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setbaseAddress(arguments.baseAddress);
			
		
		
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
	
	
	public void function setaddresseeName(string addresseeName)
	{
		this.addresseeName = arguments.addresseeName;
	}  
		
	public string function getaddresseeName()
	{
		return this.addresseeName;
	} 
	
	
	public void function setbaseAddress(BaseAddress baseAddress)
	{
		this.baseAddress = arguments.baseAddress;
	}  
		
	public BaseAddress function getbaseAddress()
	{
		return this.baseAddress;
	} 
	
	
	public void function setaddressId(string addressId)
	{
		this.addressId = arguments.addressId;
	}  
		
	public string function getaddressId()
	{
		return this.addressId;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.addresseeName' ) )
			
				local.struct["addresseeName"] = getaddresseeName();
			
		if(  isDefined( 'this.baseAddress' ) )
			
				local.struct["baseAddress"] = getbaseAddress().getStruct();
			
		if(  isDefined( 'this.addressId' ) )
			
				local.struct["addressId"] = getaddressId();
			
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
				
				if('#key#' eq 'addresseeName') {
				
					this.setaddresseeName(local.json[key]);
				}
				
				if('#key#' eq 'baseAddress') {
				
					var keyCom = 'baseAddress';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setbaseAddress( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'addressId') {
				
					this.setaddressId(local.json[key]);
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
					
					this.setaddresseeName(local.json[i]);
					
					this.setbaseAddress(local.json[i]);
					
					this.setaddressId(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'addresseeName') {
					
						this.setaddresseeName(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'baseAddress') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setbaseAddress( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'addressId') {
					
						this.setaddressId(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

