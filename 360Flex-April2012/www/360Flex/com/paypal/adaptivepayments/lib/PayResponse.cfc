
<cfscript>
component name="PayResponse" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="responseEnvelope"  type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
	
	property name="payKey"  type="string" display="payKey" required="yes" hint="";
	
	property name="paymentExecStatus"  type="string" display="paymentExecStatus" required="yes" hint="";
	
	property name="payErrorList"  type="PayErrorList" display="payErrorList" required="no" hint="";
	
	property name="defaultFundingPlan"  type="FundingPlan" display="defaultFundingPlan" required="no" hint="";
	
	
	public PayResponse function init( ResponseEnvelope responseEnvelope="", string payKey="", string paymentExecStatus="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setresponseEnvelope(arguments.responseEnvelope);
			
				this.setpayKey(arguments.payKey);
			
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
	
	
	public void function setpayKey(string payKey)
	{
		this.payKey = arguments.payKey;
	}  
		
	public string function getpayKey()
	{
		return this.payKey;
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
	
	
	public void function setdefaultFundingPlan(FundingPlan defaultFundingPlan)
	{
		this.defaultFundingPlan = arguments.defaultFundingPlan;
	}  
		
	public FundingPlan function getdefaultFundingPlan()
	{
		return this.defaultFundingPlan;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.responseEnvelope' ) )
			
				local.struct["responseEnvelope"] = getresponseEnvelope().getStruct();
			
		if(  isDefined( 'this.payKey' ) )
			
				local.struct["payKey"] = getpayKey();
			
		if(  isDefined( 'this.paymentExecStatus' ) )
			
				local.struct["paymentExecStatus"] = getpaymentExecStatus();
			
		if(  isDefined( 'this.payErrorList' ) )
			
				local.struct["payErrorList"] = getpayErrorList().getStruct();
			
		if(  isDefined( 'this.defaultFundingPlan' ) )
			
				local.struct["defaultFundingPlan"] = getdefaultFundingPlan().getStruct();
			
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
				
				if('#key#' eq 'payKey') {
				
					this.setpayKey(local.json[key]);
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
				
				if('#key#' eq 'defaultFundingPlan') {
				
					var keyCom = 'defaultFundingPlan';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setdefaultFundingPlan( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setpayKey(local.json[i]);
					
					this.setpaymentExecStatus(local.json[i]);
					
					this.setpayErrorList(local.json[i]);
					
					this.setdefaultFundingPlan(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'responseEnvelope') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setresponseEnvelope( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'payKey') {
					
						this.setpayKey(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'paymentExecStatus') {
					
						this.setpaymentExecStatus(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'error') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setpayErrorList( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'defaultFundingPlan') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setdefaultFundingPlan( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

