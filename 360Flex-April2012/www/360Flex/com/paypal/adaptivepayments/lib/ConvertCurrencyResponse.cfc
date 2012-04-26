
<cfscript>
component name="ConvertCurrencyResponse" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="responseEnvelope"  type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
	
	property name="estimatedAmountTable"  type="CurrencyConversionTable" display="estimatedAmountTable" required="yes" hint="";
	
	
	public ConvertCurrencyResponse function init( ResponseEnvelope responseEnvelope="", CurrencyConversionTable estimatedAmountTable="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setresponseEnvelope(arguments.responseEnvelope);
			
				this.setestimatedAmountTable(arguments.estimatedAmountTable);
			
		
		
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
	
	
	public void function setestimatedAmountTable(CurrencyConversionTable estimatedAmountTable)
	{
		this.estimatedAmountTable = arguments.estimatedAmountTable;
	}  
		
	public CurrencyConversionTable function getestimatedAmountTable()
	{
		return this.estimatedAmountTable;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.responseEnvelope' ) )
			
				local.struct["responseEnvelope"] = getresponseEnvelope().getStruct();
			
		if(  isDefined( 'this.estimatedAmountTable' ) )
			
				local.struct["estimatedAmountTable"] = getestimatedAmountTable().getStruct();
			
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
				
				if('#key#' eq 'estimatedAmountTable') {
				
					var keyCom = 'estimatedAmountTable';
					
					keyCom = 'CurrencyConversionTable'; 
					var keyObj = createObject("component",'#keyCom#');
					this.setestimatedAmountTable( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setestimatedAmountTable(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'responseEnvelope') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setresponseEnvelope( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'estimatedAmountTable') {
					
						keyCom = 'CurrencyConversionTable';
						
						var keyObj = createObject("component",'#keyCom#');
						this.setestimatedAmountTable( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

