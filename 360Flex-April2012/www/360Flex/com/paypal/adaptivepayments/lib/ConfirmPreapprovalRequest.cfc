
<cfscript>
component name="ConfirmPreapprovalRequest" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
	
	property name="preapprovalKey"  type="string" display="preapprovalKey" required="yes" hint="";
	
	property name="fundingSourceId"  type="string" display="fundingSourceId" required="no" hint="";
	
	property name="pin"  type="string" display="pin" required="no" hint="";
	
	
	public ConfirmPreapprovalRequest function init( RequestEnvelope requestEnvelope="", string preapprovalKey="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setrequestEnvelope(arguments.requestEnvelope);
			
				this.setpreapprovalKey(arguments.preapprovalKey);
			
		
		
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
	
	
	public void function setrequestEnvelope(RequestEnvelope requestEnvelope)
	{
		this.requestEnvelope = arguments.requestEnvelope;
	}  
		
	public RequestEnvelope function getrequestEnvelope()
	{
		return this.requestEnvelope;
	} 
	
	
	public void function setpreapprovalKey(string preapprovalKey)
	{
		this.preapprovalKey = arguments.preapprovalKey;
	}  
		
	public string function getpreapprovalKey()
	{
		return this.preapprovalKey;
	} 
	
	
	public void function setfundingSourceId(string fundingSourceId)
	{
		this.fundingSourceId = arguments.fundingSourceId;
	}  
		
	public string function getfundingSourceId()
	{
		return this.fundingSourceId;
	} 
	
	
	public void function setpin(string pin)
	{
		this.pin = arguments.pin;
	}  
		
	public string function getpin()
	{
		return this.pin;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.requestEnvelope' ) )
			
				local.struct["requestEnvelope"] = getrequestEnvelope().getStruct();
			
		if(  isDefined( 'this.preapprovalKey' ) )
			
				local.struct["preapprovalKey"] = getpreapprovalKey();
			
		if(  isDefined( 'this.fundingSourceId' ) )
			
				local.struct["fundingSourceId"] = getfundingSourceId();
			
		if(  isDefined( 'this.pin' ) )
			
				local.struct["pin"] = getpin();
			
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
				
				if('#key#' eq 'requestEnvelope') {
				
					var keyCom = 'requestEnvelope';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setrequestEnvelope( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'preapprovalKey') {
				
					this.setpreapprovalKey(local.json[key]);
				}
				
				if('#key#' eq 'fundingSourceId') {
				
					this.setfundingSourceId(local.json[key]);
				}
				
				if('#key#' eq 'pin') {
				
					this.setpin(local.json[key]);
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
					
					this.setrequestEnvelope(local.json[i]);
					
					this.setpreapprovalKey(local.json[i]);
					
					this.setfundingSourceId(local.json[i]);
					
					this.setpin(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'requestEnvelope') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setrequestEnvelope( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'preapprovalKey') {
					
						this.setpreapprovalKey(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'fundingSourceId') {
					
						this.setfundingSourceId(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'pin') {
					
						this.setpin(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

