
<cfscript>
component name="CurrencyConversion" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="from"  type="CurrencyType" display="from" required="yes" hint="";
	
	property name="to"  type="CurrencyType" display="to" required="yes" hint="";
	
	property name="exchangeRate"  type="numeric" display="exchangeRate" required="yes" hint="";
	
	
	public CurrencyConversion function init( CurrencyType from="", CurrencyType to="", numeric exchangeRate="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setfrom(arguments.from);
			
				this.setto(arguments.to);
			
				this.setexchangeRate(arguments.exchangeRate);
			
		
		
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
	
	
	public void function setfrom(CurrencyType from)
	{
		this.from = arguments.from;
	}  
		
	public CurrencyType function getfrom()
	{
		return this.from;
	} 
	
	
	public void function setto(CurrencyType to)
	{
		this.to = arguments.to;
	}  
		
	public CurrencyType function getto()
	{
		return this.to;
	} 
	
	
	public void function setexchangeRate(numeric exchangeRate)
	{
		this.exchangeRate = arguments.exchangeRate;
	}  
		
	public numeric function getexchangeRate()
	{
		return this.exchangeRate;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.from' ) )
			
				local.struct["from"] = getfrom().getStruct();
			
		if(  isDefined( 'this.to' ) )
			
				local.struct["to"] = getto().getStruct();
			
		if(  isDefined( 'this.exchangeRate' ) )
			
				local.struct["exchangeRate"] = getexchangeRate();
			
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
				
				if('#key#' eq 'from') {
				
					var keyCom = 'from';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setfrom( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'to') {
				
					var keyCom = 'to';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setto( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'exchangeRate') {
				
					this.setexchangeRate(local.json[key]);
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
					
					this.setfrom(local.json[i]);
					
					this.setto(local.json[i]);
					
					this.setexchangeRate(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'from') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setfrom( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'to') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setto( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'exchangeRate') {
					
						this.setexchangeRate(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

