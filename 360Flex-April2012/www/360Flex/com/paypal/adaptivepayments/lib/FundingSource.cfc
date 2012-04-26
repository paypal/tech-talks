
<cfscript>
component name="FundingSource" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="lastFourOfAccountNumber"  type="string" display="lastFourOfAccountNumber" required="no" hint="";
	
	property name="type"  type="string" display="type" required="yes" hint="";
	
	property name="displayName"  type="string" display="displayName" required="no" hint="";
	
	property name="fundingSourceId"  type="string" display="fundingSourceId" required="no" hint="";
	
	property name="allowed"  type="boolean" display="allowed" required="no" hint="";
	
	
	public FundingSource function init( string type="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.settype(arguments.type);
			
		
		
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
	
	
	public void function setlastFourOfAccountNumber(string lastFourOfAccountNumber)
	{
		this.lastFourOfAccountNumber = arguments.lastFourOfAccountNumber;
	}  
		
	public string function getlastFourOfAccountNumber()
	{
		return this.lastFourOfAccountNumber;
	} 
	
	
	public void function settype(string type)
	{
		this.type = arguments.type;
	}  
		
	public string function gettype()
	{
		return this.type;
	} 
	
	
	public void function setdisplayName(string displayName)
	{
		this.displayName = arguments.displayName;
	}  
		
	public string function getdisplayName()
	{
		return this.displayName;
	} 
	
	
	public void function setfundingSourceId(string fundingSourceId)
	{
		this.fundingSourceId = arguments.fundingSourceId;
	}  
		
	public string function getfundingSourceId()
	{
		return this.fundingSourceId;
	} 
	
	
	public void function setallowed(boolean allowed)
	{
		this.allowed = arguments.allowed;
	}  
		
	public boolean function getallowed()
	{
		return this.allowed;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.lastFourOfAccountNumber' ) )
			
				local.struct["lastFourOfAccountNumber"] = getlastFourOfAccountNumber();
			
		if(  isDefined( 'this.type' ) )
			
				local.struct["type"] = gettype();
			
		if(  isDefined( 'this.displayName' ) )
			
				local.struct["displayName"] = getdisplayName();
			
		if(  isDefined( 'this.fundingSourceId' ) )
			
				local.struct["fundingSourceId"] = getfundingSourceId();
			
		if(  isDefined( 'this.allowed' ) )
			
				local.struct["allowed"] = getallowed();
			
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
				
				if('#key#' eq 'lastFourOfAccountNumber') {
				
					this.setlastFourOfAccountNumber(local.json[key]);
				}
				
				if('#key#' eq 'type') {
				
					this.settype(local.json[key]);
				}
				
				if('#key#' eq 'displayName') {
				
					this.setdisplayName(local.json[key]);
				}
				
				if('#key#' eq 'fundingSourceId') {
				
					this.setfundingSourceId(local.json[key]);
				}
				
				if('#key#' eq 'allowed') {
				
					this.setallowed(local.json[key]);
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
					
					this.setlastFourOfAccountNumber(local.json[i]);
					
					this.settype(local.json[i]);
					
					this.setdisplayName(local.json[i]);
					
					this.setfundingSourceId(local.json[i]);
					
					this.setallowed(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'lastFourOfAccountNumber') {
					
						this.setlastFourOfAccountNumber(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'type') {
					
						this.settype(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'displayName') {
					
						this.setdisplayName(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'fundingSourceId') {
					
						this.setfundingSourceId(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'allowed') {
					
						this.setallowed(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

