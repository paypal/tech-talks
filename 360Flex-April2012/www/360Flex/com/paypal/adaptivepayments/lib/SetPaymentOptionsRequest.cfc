
<cfscript>
component name="SetPaymentOptionsRequest" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
	
	property name="payKey"  type="string" display="payKey" required="yes" hint="";
	
	property name="initiatingEntity"  type="InitiatingEntity" display="initiatingEntity" required="no" hint="";
	
	property name="displayOptions"  type="DisplayOptions" display="displayOptions" required="no" hint="";
	
	property name="shippingAddressId"  type="string" display="shippingAddressId" required="no" hint="";
	
	property name="senderOptions"  type="SenderOptions" display="senderOptions" required="no" hint="";
	
	property name="receiverOptions"  type="ReceiverOptions" display="receiverOptions" required="no" hint="";
	variables.items= ArrayNew(1);
	
	public SetPaymentOptionsRequest function init( RequestEnvelope requestEnvelope="", string payKey="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setrequestEnvelope(arguments.requestEnvelope);
			
				this.setpayKey(arguments.payKey);
			
		
		
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
	
	
	public void function setinitiatingEntity(InitiatingEntity initiatingEntity)
	{
		this.initiatingEntity = arguments.initiatingEntity;
	}  
		
	public InitiatingEntity function getinitiatingEntity()
	{
		return this.initiatingEntity;
	} 
	
	
	public void function setdisplayOptions(DisplayOptions displayOptions)
	{
		this.displayOptions = arguments.displayOptions;
	}  
		
	public DisplayOptions function getdisplayOptions()
	{
		return this.displayOptions;
	} 
	
	
	public void function setshippingAddressId(string shippingAddressId)
	{
		this.shippingAddressId = arguments.shippingAddressId;
	}  
		
	public string function getshippingAddressId()
	{
		return this.shippingAddressId;
	} 
	
	
	public void function setsenderOptions(SenderOptions senderOptions)
	{
		this.senderOptions = arguments.senderOptions;
	}  
		
	public SenderOptions function getsenderOptions()
	{
		return this.senderOptions;
	} 
	
	
	public void function setreceiverOptions(ReceiverOptions receiverOptions)
	{
		this.receiverOptions = arguments.receiverOptions;
	}  
		
	public ReceiverOptions function getreceiverOptions()
	{
		return this.receiverOptions;
	} 
	
	
	
	public any function addItem(ReceiverOptions  item)
	{
		if(Compare('ReceiverOptions','string') eq 0)
		{
			ArrayAppend(variables.items,arguments.item);
		} else {
			ArrayAppend(variables.items,arguments.item.getStruct());
		}
		
	} 
	
	public any function getItems()
	{
		return variables.items;
	} 
	
	public any function clearItems()
	{
		variables.items = ArrayNew(1);
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
			
		if(  isDefined( 'this.initiatingEntity' ) )
			
				local.struct["initiatingEntity"] = getinitiatingEntity().getStruct();
			
		if(  isDefined( 'this.displayOptions' ) )
			
				local.struct["displayOptions"] = getdisplayOptions().getStruct();
			
		if(  isDefined( 'this.shippingAddressId' ) )
			
				local.struct["shippingAddressId"] = getshippingAddressId();
			
		if(  isDefined( 'this.senderOptions' ) )
			
				local.struct["senderOptions"] = getsenderOptions().getStruct();
			
		if(  isDefined( 'this.receiverOptions' ) )
			
				local.struct["receiverOptions"] =getItems();
			
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
				
				if('#key#' eq 'initiatingEntity') {
				
					var keyCom = 'initiatingEntity';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setinitiatingEntity( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'displayOptions') {
				
					var keyCom = 'displayOptions';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setdisplayOptions( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'shippingAddressId') {
				
					this.setshippingAddressId(local.json[key]);
				}
				
				if('#key#' eq 'senderOptions') {
				
					var keyCom = 'senderOptions';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setsenderOptions( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'receiverOptions') {
				
					var keyCom = 'receiverOptions';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setreceiverOptions( keyObj.deserialize(local.json[key]) );
					
					this.addItem(keyObj.deserialize(local.json[key]));
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
					
					this.setinitiatingEntity(local.json[i]);
					
					this.setdisplayOptions(local.json[i]);
					
					this.setshippingAddressId(local.json[i]);
					
					this.setsenderOptions(local.json[i]);
					
					this.setreceiverOptions(local.json[i]);
					
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
									
					
					if('#key#' eq 'initiatingEntity') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setinitiatingEntity( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'displayOptions') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setdisplayOptions( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'shippingAddressId') {
					
						this.setshippingAddressId(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'senderOptions') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setsenderOptions( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'receiverOptions') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setreceiverOptions( keyObj.deserialize(local.json[i][key]) );
						
							this.addItem(keyObj.deserialize(local.json[i][key]));
						
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

