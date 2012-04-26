
<cfscript>
component name="InvoiceItem" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="name"  type="string" display="name" required="no" hint="";
	
	property name="identifier"  type="string" display="identifier" required="no" hint="";
	
	property name="price"  type="numeric" display="price" required="no" hint="";
	
	property name="itemPrice"  type="numeric" display="itemPrice" required="no" hint="";
	
	property name="itemCount"  type="numeric" display="itemCount" required="no" hint="";
	
	
	public InvoiceItem function init( )
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
	
	
	public void function setname(string name)
	{
		this.name = arguments.name;
	}  
		
	public string function getname()
	{
		return this.name;
	} 
	
	
	public void function setidentifier(string identifier)
	{
		this.identifier = arguments.identifier;
	}  
		
	public string function getidentifier()
	{
		return this.identifier;
	} 
	
	
	public void function setprice(numeric price)
	{
		this.price = arguments.price;
	}  
		
	public numeric function getprice()
	{
		return this.price;
	} 
	
	
	public void function setitemPrice(numeric itemPrice)
	{
		this.itemPrice = arguments.itemPrice;
	}  
		
	public numeric function getitemPrice()
	{
		return this.itemPrice;
	} 
	
	
	public void function setitemCount(numeric itemCount)
	{
		this.itemCount = arguments.itemCount;
	}  
		
	public numeric function getitemCount()
	{
		return this.itemCount;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.name' ) )
			
				local.struct["name"] = getname();
			
		if(  isDefined( 'this.identifier' ) )
			
				local.struct["identifier"] = getidentifier();
			
		if(  isDefined( 'this.price' ) )
			
				local.struct["price"] = getprice();
			
		if(  isDefined( 'this.itemPrice' ) )
			
				local.struct["itemPrice"] = getitemPrice();
			
		if(  isDefined( 'this.itemCount' ) )
			
				local.struct["itemCount"] = getitemCount();
			
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
				
				if('#key#' eq 'name') {
				
					this.setname(local.json[key]);
				}
				
				if('#key#' eq 'identifier') {
				
					this.setidentifier(local.json[key]);
				}
				
				if('#key#' eq 'price') {
				
					this.setprice(local.json[key]);
				}
				
				if('#key#' eq 'itemPrice') {
				
					this.setitemPrice(local.json[key]);
				}
				
				if('#key#' eq 'itemCount') {
				
					this.setitemCount(local.json[key]);
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
					
					this.setname(local.json[i]);
					
					this.setidentifier(local.json[i]);
					
					this.setprice(local.json[i]);
					
					this.setitemPrice(local.json[i]);
					
					this.setitemCount(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'name') {
					
						this.setname(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'identifier') {
					
						this.setidentifier(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'price') {
					
						this.setprice(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'itemPrice') {
					
						this.setitemPrice(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'itemCount') {
					
						this.setitemCount(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

