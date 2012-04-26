
<cfscript>
component name="ExecutePaymentResponse" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="responseEnvelope"  type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
	
	property name="paymentExecStatus"  type="string" display="paymentExecStatus" required="yes" hint="";
	
	property name="payErrorList"  type="PayErrorList" display="payErrorList" required="no" hint="";
	
	
	public ExecutePaymentResponse function init( ResponseEnvelope responseEnvelope="", string paymentExecStatus="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setresponseEnvelope(arguments.responseEnvelope);
			
				this.setpaymentExecStatus(arguments.paymentExecStatus);
			
		
		
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
	
	
	public void function setresponseEnvelope(ResponseEnvelope responseEnvelope)
	{
		this.responseEnvelope = arguments.responseEnvelope;
	}  
		
	public ResponseEnvelope function getresponseEnvelope()
	{
		return this.responseEnvelope;
	} 
	
	
	public void function setpaymentExecStatus(string paymentExecStatus)
	{
		this.paymentExecStatus = arguments.paymentExecStatus;
	}  
		
	public string function getpaymentExecStatus()
	{
		return this.paymentExecStatus;
	} 
	
	
	public void function setpayErrorList(PayErrorList payErrorList)
	{
		this.payErrorList = arguments.payErrorList;
	}  
		
	public PayErrorList function getpayErrorList()
	{
		return this.payErrorList;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.responseEnvelope' ) )
			
				local.struct["responseEnvelope"] = getresponseEnvelope().getStruct();
			
		if(  isDefined( 'this.paymentExecStatus' ) )
			
				local.struct["paymentExecStatus"] = getpaymentExecStatus();
			
		if(  isDefined( 'this.payErrorList' ) )
			
				local.struct["payErrorList"] = getpayErrorList().getStruct();
			
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
				
				if('#key#' eq 'responseEnvelope') {
				
					var keyCom = 'responseEnvelope';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setresponseEnvelope( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'paymentExecStatus') {
				
					this.setpaymentExecStatus(local.json[key]);
				}
				
				if('#key#' eq 'error') {
				
					var keyCom = 'payErrorList';
					
					if(keyCom eq 'payErrorList')
						errorStruct = StructNew();
						errorStruct['payError'] = local.json[key];
						local.json[key] = errorStruct;
					
					var keyObj = createObject("component",'#keyCom#');
					this.setpayErrorList( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setresponseEnvelope(local.json[i]);
					
					this.setpaymentExecStatus(local.json[i]);
					
					this.setpayErrorList(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'responseEnvelope') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setresponseEnvelope( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'paymentExecStatus') {
					
						this.setpaymentExecStatus(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'error') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setpayErrorList( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

