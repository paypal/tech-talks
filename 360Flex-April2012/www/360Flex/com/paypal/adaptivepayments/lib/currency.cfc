
<cfscript>
component name="CurrencyList" output="false"  hint="I define the properties and methods"
{

	
	property name="currency"  type="CurrencyType" display="currency" required="yes" hint="";
	variables.items= ArrayNew(1); 

	public CurrencyList function init( CurrencyType currency="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setcurrency(arguments.currency);
			
				addItem(arguments.currency);
			
		
		
		return this;  
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
				
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('CurrencyType' eq "string" OR 'CurrencyType' eq "boolean" OR 'CurrencyType' eq "numeric"))
						{
							this.setcurrency(local.json[key]);
						} else {
							var keyCom = 'currency';
							if(keyCom eq 'ack')
								keyCom = 'ackCode';
							if(keyCom eq 'sender')
								keyCom = 'SenderIdentifier';
							if(keyCom eq 'estimatedAmountTable')
									keyCom = 'CurrencyConversionTable';
							if(keyCom eq 'baseAmount')
									keyCom = 'CurrencyType';
							if(keyCom eq 'currency')
									keyCom = 'CurrencyType';
							if(keyCom eq 'error')
									keyCom = 'ErrorData';
							if(keyCom eq 'severity')
									keyCom = 'ErrorSeverity';
								if(keyCom eq 'category')
									keyCom = 'ErrorCategory';
								if(keyCom eq 'parameter')
									keyCom = 'ErrorParameter';
							
									
								
							var keyObj = createObject("component",'#keyCom#');
							this.setcurrency( keyObj.deserialize(local.json[key]) );
							
								this.addItem(keyObj.deserialize(local.json[key]));
							
						}
							
				
			}
		} else if (isArray(local.json)) {
		
			for( i = 1; i lte ArrayLen(local.json); i = i + 1)
			{
			
				for(key in local.json[i])
				{
					
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('CurrencyType' eq "string" OR 'CurrencyType' eq "boolean" OR 'CurrencyType' eq "numeric"))
							{
								this.setcurrency(local.json[i][key]);
							} else {
								var keyCom = 'currency';
								if(keyCom eq 'ack')
									keyCom = 'ackCode';
								if(keyCom eq 'sender')
									keyCom = 'SenderIdentifier';
								if(keyCom eq 'estimatedAmountTable')
									keyCom = 'CurrencyConversionTable';
								if(keyCom eq 'baseAmount')
									keyCom = 'CurrencyType';
								if(keyCom eq 'currency')
									keyCom = 'CurrencyType';
								if(keyCom eq 'error')
									keyCom = 'ErrorData';
								if(keyCom eq 'severity')
									keyCom = 'ErrorSeverity';
								if(keyCom eq 'category')
									keyCom = 'ErrorCategory';
								if(keyCom eq 'parameter')
									keyCom = 'ErrorParameter';
									
									
		
									
								var keyObj = createObject("component",'#keyCom#');
								this.setcurrency( keyObj.deserialize(local.json[i][key]) );
								
									this.addItem(keyObj.deserialize(local.json[i][key]));
								
							}
								
					
				}
			
			}
		
		}
		
		return this;
	} 
	
	
	
	
}
</cfscript>

