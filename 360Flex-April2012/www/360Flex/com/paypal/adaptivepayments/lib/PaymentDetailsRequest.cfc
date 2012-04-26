
<cfscript>
component name="PaymentDetailsRequest" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
	
	property name="payKey"  type="string" display="payKey" required="no" hint="";
	
	property name="transactionId"  type="string" display="transactionId" required="no" hint="";
	
	property name="trackingId"  type="string" display="trackingId" required="no" hint="";
	
	
	public PaymentDetailsRequest function init( RequestEnvelope requestEnvelope="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setrequestEnvelope(arguments.requestEnvelope);
			
		
		
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
	
	
	public void function setpayKey(string payKey)
	{
		this.payKey = arguments.payKey;
	}  
		
	public string function getpayKey()
	{
		return this.payKey;
	} 
	
	
	public void function settransactionId(string transactionId)
	{
		this.transactionId = arguments.transactionId;
	}  
		
	public string function gettransactionId()
	{
		return this.transactionId;
	} 
	
	
	public void function settrackingId(string trackingId)
	{
		this.trackingId = arguments.trackingId;
	}  
		
	public string function gettrackingId()
	{
		return this.trackingId;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.requestEnvelope' ) )
			
				local.struct["requestEnvelope"] = getrequestEnvelope().getStruct();
			
		if(  isDefined( 'this.payKey' ) )
			
				local.struct["payKey"] = getpayKey();
			
		if(  isDefined( 'this.transactionId' ) )
			
				local.struct["transactionId"] = gettransactionId();
			
		if(  isDefined( 'this.trackingId' ) )
			
				local.struct["trackingId"] = gettrackingId();
			
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
				
				if('#key#' eq 'payKey') {
				
					this.setpayKey(local.json[key]);
				}
				
				if('#key#' eq 'transactionId') {
				
					this.settransactionId(local.json[key]);
				}
				
				if('#key#' eq 'trackingId') {
				
					this.settrackingId(local.json[key]);
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
					
					this.setpayKey(local.json[i]);
					
					this.settransactionId(local.json[i]);
					
					this.settrackingId(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'requestEnvelope') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setrequestEnvelope( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'payKey') {
					
						this.setpayKey(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'transactionId') {
					
						this.settransactionId(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'trackingId') {
					
						this.settrackingId(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

