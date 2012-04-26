
<cfscript>
component name="FundingPlan" output="false"  hint="I define the properties and methods"
{

	
	property name="fundingPlanId"  type="string" display="fundingPlanId" required="yes" hint="";
	
	property name="fundingAmount"  type="CurrencyType" display="fundingAmount" required="yes" hint="";
	
	property name="backupFundingSource"  type="FundingSource" display="backupFundingSource" required="no" hint="";
	
	property name="senderFees"  type="CurrencyType" display="senderFees" required="no" hint="";
	
	property name="currencyConversion"  type="CurrencyConversion" display="currencyConversion" required="no" hint="";
	
	property name="charge"  type="FundingPlanCharge" display="charge" required="yes" hint="";
	variables.items= ArrayNew(1); 

	public FundingPlan function init( string fundingPlanId="", CurrencyType fundingAmount="", FundingPlanCharge charge="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setfundingPlanId(arguments.fundingPlanId);
			
				this.setfundingAmount(arguments.fundingAmount);
			
				this.setcharge(arguments.charge);
			
				addItem(arguments.charge);
			
		
		
		return this;  
	}
	
	
	public void function setfundingPlanId(string fundingPlanId)
	{
		this.fundingPlanId = arguments.fundingPlanId;
	}  
		
	public string function getfundingPlanId()
	{
		return this.fundingPlanId;
	} 
	
	
	public void function setfundingAmount(CurrencyType fundingAmount)
	{
		this.fundingAmount = arguments.fundingAmount;
	}  
		
	public CurrencyType function getfundingAmount()
	{
		return this.fundingAmount;
	} 
	
	
	public void function setbackupFundingSource(FundingSource backupFundingSource)
	{
		this.backupFundingSource = arguments.backupFundingSource;
	}  
		
	public FundingSource function getbackupFundingSource()
	{
		return this.backupFundingSource;
	} 
	
	
	public void function setsenderFees(CurrencyType senderFees)
	{
		this.senderFees = arguments.senderFees;
	}  
		
	public CurrencyType function getsenderFees()
	{
		return this.senderFees;
	} 
	
	
	public void function setcurrencyConversion(CurrencyConversion currencyConversion)
	{
		this.currencyConversion = arguments.currencyConversion;
	}  
		
	public CurrencyConversion function getcurrencyConversion()
	{
		return this.currencyConversion;
	} 
	
	
	public void function setcharge(FundingPlanCharge charge)
	{
		this.charge = arguments.charge;
	}  
		
	public FundingPlanCharge function getcharge()
	{
		return this.charge;
	} 
	
	
	
	public any function addItem(FundingPlanCharge  item)
	{
		if(Compare('FundingPlanCharge','string') eq 0)
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
		
		if(  isDefined( 'this.fundingPlanId' ) )
			
				local.struct["fundingPlanId"] = getfundingPlanId();
			
		if(  isDefined( 'this.fundingAmount' ) )
			
				local.struct["fundingAmount"] = getfundingAmount().getStruct();
			
		if(  isDefined( 'this.backupFundingSource' ) )
			
				local.struct["backupFundingSource"] = getbackupFundingSource().getStruct();
			
		if(  isDefined( 'this.senderFees' ) )
			
				local.struct["senderFees"] = getsenderFees().getStruct();
			
		if(  isDefined( 'this.currencyConversion' ) )
			
				local.struct["currencyConversion"] = getcurrencyConversion().getStruct();
			
		if(  isDefined( 'this.charge' ) )
			
				local.struct["charge"] =getItems();
			
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
						if(NOT isStruct(local.json[key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
						{
							this.setfundingPlanId(local.json[key]);
						} else {
							var keyCom = 'fundingPlanId';
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
							this.setfundingPlanId( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('CurrencyType' eq "string" OR 'CurrencyType' eq "boolean" OR 'CurrencyType' eq "numeric"))
						{
							this.setfundingAmount(local.json[key]);
						} else {
							var keyCom = 'fundingAmount';
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
							this.setfundingAmount( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('FundingSource' eq "string" OR 'FundingSource' eq "boolean" OR 'FundingSource' eq "numeric"))
						{
							this.setbackupFundingSource(local.json[key]);
						} else {
							var keyCom = 'backupFundingSource';
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
							this.setbackupFundingSource( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('CurrencyType' eq "string" OR 'CurrencyType' eq "boolean" OR 'CurrencyType' eq "numeric"))
						{
							this.setsenderFees(local.json[key]);
						} else {
							var keyCom = 'senderFees';
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
							this.setsenderFees( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('CurrencyConversion' eq "string" OR 'CurrencyConversion' eq "boolean" OR 'CurrencyConversion' eq "numeric"))
						{
							this.setcurrencyConversion(local.json[key]);
						} else {
							var keyCom = 'currencyConversion';
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
							this.setcurrencyConversion( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('FundingPlanCharge' eq "string" OR 'FundingPlanCharge' eq "boolean" OR 'FundingPlanCharge' eq "numeric"))
						{
							this.setcharge(local.json[key]);
						} else {
							var keyCom = 'charge';
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
							this.setcharge( keyObj.deserialize(local.json[key]) );
							
								this.addItem(keyObj.deserialize(local.json[key]));
							
						}
							
				
			}
		} else if (isArray(local.json)) {
		
			for( i = 1; i lte ArrayLen(local.json); i = i + 1)
			{
			
				for(key in local.json[i])
				{
					
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
							{
								this.setfundingPlanId(local.json[i][key]);
							} else {
								var keyCom = 'fundingPlanId';
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
								this.setfundingPlanId( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('CurrencyType' eq "string" OR 'CurrencyType' eq "boolean" OR 'CurrencyType' eq "numeric"))
							{
								this.setfundingAmount(local.json[i][key]);
							} else {
								var keyCom = 'fundingAmount';
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
								this.setfundingAmount( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('FundingSource' eq "string" OR 'FundingSource' eq "boolean" OR 'FundingSource' eq "numeric"))
							{
								this.setbackupFundingSource(local.json[i][key]);
							} else {
								var keyCom = 'backupFundingSource';
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
								this.setbackupFundingSource( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('CurrencyType' eq "string" OR 'CurrencyType' eq "boolean" OR 'CurrencyType' eq "numeric"))
							{
								this.setsenderFees(local.json[i][key]);
							} else {
								var keyCom = 'senderFees';
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
								this.setsenderFees( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('CurrencyConversion' eq "string" OR 'CurrencyConversion' eq "boolean" OR 'CurrencyConversion' eq "numeric"))
							{
								this.setcurrencyConversion(local.json[i][key]);
							} else {
								var keyCom = 'currencyConversion';
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
								this.setcurrencyConversion( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('FundingPlanCharge' eq "string" OR 'FundingPlanCharge' eq "boolean" OR 'FundingPlanCharge' eq "numeric"))
							{
								this.setcharge(local.json[i][key]);
							} else {
								var keyCom = 'charge';
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
								this.setcharge( keyObj.deserialize(local.json[i][key]) );
								
									this.addItem(keyObj.deserialize(local.json[i][key]));
								
							}
								
					
				}
			
			}
		
		}
		
		return this;
	} 
	
	
	
	
}
</cfscript>

