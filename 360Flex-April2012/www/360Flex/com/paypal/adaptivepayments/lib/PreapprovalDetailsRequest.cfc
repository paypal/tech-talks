
<cfscript>
component name="PreapprovalDetailsRequest" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
	
	property name="preapprovalKey"  type="string" display="preapprovalKey" required="yes" hint="";
	
	property name="getBillingAddress"  type="boolean" display="getBillingAddress" required="no" hint="";
	
	
	public PreapprovalDetailsRequest function init( RequestEnvelope requestEnvelope="", string preapprovalKey="")
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
	
	
	public void function setgetBillingAddress(boolean getBillingAddress)
	{
		this.getBillingAddress = arguments.getBillingAddress;
	}  
		
	public boolean function getgetBillingAddress()
	{
		return this.getBillingAddress;
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
			
		if(  isDefined( 'this.getBillingAddress' ) )
			
				local.struct["getBillingAddress"] = getgetBillingAddress();
			
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
				
				if('#key#' eq 'getBillingAddress') {
				
					this.setgetBillingAddress(local.json[key]);
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
					
					this.setgetBillingAddress(local.json[i]);
					
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
									
					
					if('#key#' eq 'getBillingAddress') {
					
						this.setgetBillingAddress(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

