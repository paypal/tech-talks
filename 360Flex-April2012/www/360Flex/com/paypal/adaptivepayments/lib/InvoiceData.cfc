
<cfscript>
component name="InvoiceData" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="item"  type="InvoiceItem" display="item" required="no" hint="";
	
	property name="totalTax"  type="numeric" display="totalTax" required="no" hint="";
	
	property name="totalShipping"  type="numeric" display="totalShipping" required="no" hint="";
	variables.items= ArrayNew(1);
	
	public InvoiceData function init( )
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
		
		
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
	
	
	public void function setitem(InvoiceItem item)
	{
		this.item = arguments.item;
	}  
		
	public InvoiceItem function getitem()
	{
		return this.item;
	} 
	
	
	
	public any function addItem(InvoiceItem  item)
	{
		if(Compare('InvoiceItem','string') eq 0)
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
	
	public void function settotalTax(numeric totalTax)
	{
		this.totalTax = arguments.totalTax;
	}  
		
	public numeric function gettotalTax()
	{
		return this.totalTax;
	} 
	
	
	public void function settotalShipping(numeric totalShipping)
	{
		this.totalShipping = arguments.totalShipping;
	}  
		
	public numeric function gettotalShipping()
	{
		return this.totalShipping;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.item' ) )
			
				local.struct["item"] =getItems();
			
		if(  isDefined( 'this.totalTax' ) )
			
				local.struct["totalTax"] = gettotalTax();
			
		if(  isDefined( 'this.totalShipping' ) )
			
				local.struct["totalShipping"] = gettotalShipping();
			
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
				
				if('#key#' eq 'item') {
				
					var keyCom = 'item';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setitem( keyObj.deserialize(local.json[key]) );
					
					this.addItem(keyObj.deserialize(local.json[key]));
				}
				
				if('#key#' eq 'totalTax') {
				
					this.settotalTax(local.json[key]);
				}
				
				if('#key#' eq 'totalShipping') {
				
					this.settotalShipping(local.json[key]);
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
					
					this.setitem(local.json[i]);
					
					this.settotalTax(local.json[i]);
					
					this.settotalShipping(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'item') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setitem( keyObj.deserialize(local.json[i][key]) );
						
							this.addItem(keyObj.deserialize(local.json[i][key]));
						
					}
									
					
					if('#key#' eq 'totalTax') {
					
						this.settotalTax(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'totalShipping') {
					
						this.settotalShipping(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

