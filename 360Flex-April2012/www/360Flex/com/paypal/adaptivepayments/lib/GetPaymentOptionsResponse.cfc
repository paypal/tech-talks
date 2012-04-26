
<cfscript>
component name="GetPaymentOptionsResponse" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="responseEnvelope"  type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
	
	property name="initiatingEntity"  type="InitiatingEntity" display="initiatingEntity" required="no" hint="";
	
	property name="displayOptions"  type="DisplayOptions" display="displayOptions" required="no" hint="";
	
	property name="shippingAddressId"  type="string" display="shippingAddressId" required="no" hint="";
	
	property name="senderOptions"  type="SenderOptions" display="senderOptions" required="no" hint="";
	
	property name="receiverOptions"  type="ReceiverOptions" display="receiverOptions" required="no" hint="";
	variables.items= ArrayNew(1);
	
	public GetPaymentOptionsResponse function init( ResponseEnvelope responseEnvelope="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setresponseEnvelope(arguments.responseEnvelope);
			
		
		
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
				
		
		if(  isDefined( 'this.responseEnvelope' ) )
			
				local.struct["responseEnvelope"] = getresponseEnvelope().getStruct();
			
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
				
				if('#key#' eq 'responseEnvelope') {
				
					var keyCom = 'responseEnvelope';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setresponseEnvelope( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setresponseEnvelope(local.json[i]);
					
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
					
					if('#key#' eq 'responseEnvelope') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setresponseEnvelope( keyObj.deserialize(local.json[i][key]) );
						
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

