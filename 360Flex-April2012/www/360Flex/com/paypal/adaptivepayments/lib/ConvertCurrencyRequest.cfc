
<cfscript>
component name="ConvertCurrencyRequest" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
	
	property name="baseAmountList"  type="CurrencyList" display="baseAmountList" required="yes" hint="";
	
	property name="convertToCurrencyList"  type="CurrencyCodeList" display="convertToCurrencyList" required="yes" hint="";
	
	property name="countryCode"  type="string" display="countryCode" required="no" hint="
								The two-character ISO country code where
								fx suppposed to happen
							";
	
	property name="conversionType"  type="string" display="conversionType" required="no" hint="";
	
	
	public ConvertCurrencyRequest function init( RequestEnvelope requestEnvelope="", CurrencyList baseAmountList="", CurrencyCodeList convertToCurrencyList="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setrequestEnvelope(arguments.requestEnvelope);
			
				this.setbaseAmountList(arguments.baseAmountList);
			
				this.setconvertToCurrencyList(arguments.convertToCurrencyList);
			
		
		
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
	
	
	public void function setbaseAmountList(CurrencyList baseAmountList)
	{
		this.baseAmountList = arguments.baseAmountList;
	}  
		
	public CurrencyList function getbaseAmountList()
	{
		return this.baseAmountList;
	} 
	
	
	public void function setconvertToCurrencyList(CurrencyCodeList convertToCurrencyList)
	{
		this.convertToCurrencyList = arguments.convertToCurrencyList;
	}  
		
	public CurrencyCodeList function getconvertToCurrencyList()
	{
		return this.convertToCurrencyList;
	} 
	
	
	public void function setcountryCode(string countryCode)
	{
		this.countryCode = arguments.countryCode;
	}  
		
	public string function getcountryCode()
	{
		return this.countryCode;
	} 
	
	
	public void function setconversionType(string conversionType)
	{
		this.conversionType = arguments.conversionType;
	}  
		
	public string function getconversionType()
	{
		return this.conversionType;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.requestEnvelope' ) )
			
				local.struct["requestEnvelope"] = getrequestEnvelope().getStruct();
			
		if(  isDefined( 'this.baseAmountList' ) )
			
				local.struct["baseAmountList"] = getbaseAmountList().getStruct();
			
		if(  isDefined( 'this.convertToCurrencyList' ) )
			
				local.struct["convertToCurrencyList"] = getconvertToCurrencyList().getStruct();
			
		if(  isDefined( 'this.countryCode' ) )
			
				local.struct["countryCode"] = getcountryCode();
			
		if(  isDefined( 'this.conversionType' ) )
			
				local.struct["conversionType"] = getconversionType();
			
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
				
				if('#key#' eq 'baseAmountList') {
				
					var keyCom = 'baseAmountList';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setbaseAmountList( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'convertToCurrencyList') {
				
					var keyCom = 'convertToCurrencyList';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setconvertToCurrencyList( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'countryCode') {
				
					this.setcountryCode(local.json[key]);
				}
				
				if('#key#' eq 'conversionType') {
				
					this.setconversionType(local.json[key]);
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
					
					this.setbaseAmountList(local.json[i]);
					
					this.setconvertToCurrencyList(local.json[i]);
					
					this.setcountryCode(local.json[i]);
					
					this.setconversionType(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'requestEnvelope') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setrequestEnvelope( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'baseAmountList') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setbaseAmountList( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'convertToCurrencyList') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setconvertToCurrencyList( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'countryCode') {
					
						this.setcountryCode(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'conversionType') {
					
						this.setconversionType(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

