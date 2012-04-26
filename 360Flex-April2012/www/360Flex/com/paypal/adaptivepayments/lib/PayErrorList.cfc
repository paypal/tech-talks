
<cfscript>
component name="PayErrorList" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="payError"  type="PayError" display="payError" required="yes" hint="";
	variables.items= ArrayNew(1);
	
	public PayErrorList function init( PayError payError="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setpayError(arguments.payError);
			
				addItem(arguments.payError);
			
		
		
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
	
	
	public void function setpayError(PayError payError)
	{
		this.payError = arguments.payError;
	}  
		
	public PayError function getpayError()
	{
		return this.payError;
	} 
	
	
	
	public any function addItem(PayError  item)
	{
		if(Compare('PayError','string') eq 0)
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
				
		
		if(  isDefined( 'this.payError' ) )
			
				local.struct["payError"] =getItems();
			
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
				
				if('#key#' eq 'payError') {
				
					var keyCom = 'payError';
					
					if(keyCom eq 'payError')
						errorStruct = StructNew();
						errorStruct['error'] = local.json[key];
						local.json[key] = errorStruct;	
					
					var keyObj = createObject("component",'#keyCom#');
					this.setpayError( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setpayError(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'payError') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setpayError( keyObj.deserialize(local.json[i][key]) );
						
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

