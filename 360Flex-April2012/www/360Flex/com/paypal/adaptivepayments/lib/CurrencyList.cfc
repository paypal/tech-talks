
<cfscript>
component name="CurrencyList" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="currency"  type="CurrencyType" display="currency" required="yes" hint="";
	variables.items= ArrayNew(1);
	
	public CurrencyList function init( CurrencyType currency="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setcurrency(arguments.currency);
			
				addItem(arguments.currency);
			
		
		
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
	
	
	public void function setcurrency(CurrencyType currency)
	{
		this.currency = arguments.currency;
	}  
		
	public CurrencyType function getcurrency()
	{
		return this.currency;
	} 
	
	
	
	public any function addItem(CurrencyType  item)
	{
		if(Compare('CurrencyType','string') eq 0)
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
				
		
		if(  isDefined( 'this.currency' ) )
			
				local.struct["currency"] =getItems();
			
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
				
				if('#key#' eq 'currency') {
				
					var keyCom = 'currency';
					
					keyCom = 'CurrencyType'; 
					var keyObj = createObject("component",'#keyCom#');
					this.setcurrency( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setcurrency(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'currency') {
					
						keyCom = 'CurrencyType';
						
						var keyObj = createObject("component",'#keyCom#');
						this.setcurrency( keyObj.deserialize(local.json[i][key]) );
						
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

