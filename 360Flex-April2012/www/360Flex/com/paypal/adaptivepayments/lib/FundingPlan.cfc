
<cfscript>
component name="FundingPlan" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
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
	
	public void function setError(ErrorData error)
	{
		this.error = arguments.error;
	}  
		
	public ErrorData function getError()
	{
		return this.error;
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
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
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
				
				if('#key#' eq 'fundingPlanId') {
				
					this.setfundingPlanId(local.json[key]);
				}
				
				if('#key#' eq 'fundingAmount') {
				
					var keyCom = 'fundingAmount';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setfundingAmount( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'backupFundingSource') {
				
					var keyCom = 'backupFundingSource';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setbackupFundingSource( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'senderFees') {
				
					var keyCom = 'senderFees';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setsenderFees( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'currencyConversion') {
				
					var keyCom = 'currencyConversion';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setcurrencyConversion( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'charge') {
				
					var keyCom = 'charge';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setcharge( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setfundingPlanId(local.json[i]);
					
					this.setfundingAmount(local.json[i]);
					
					this.setbackupFundingSource(local.json[i]);
					
					this.setsenderFees(local.json[i]);
					
					this.setcurrencyConversion(local.json[i]);
					
					this.setcharge(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'fundingPlanId') {
					
						this.setfundingPlanId(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'fundingAmount') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setfundingAmount( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'backupFundingSource') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setbackupFundingSource( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'senderFees') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setsenderFees( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'currencyConversion') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setcurrencyConversion( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'charge') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setcharge( keyObj.deserialize(local.json[i][key]) );
						
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

