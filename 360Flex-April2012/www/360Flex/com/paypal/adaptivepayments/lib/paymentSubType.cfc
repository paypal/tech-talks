
<cfscript>
component name="Receiver" output="false"  hint="I define the properties and methods"
{

	
	property name="amount"  type="numeric" display="amount" required="yes" hint="";
	
	property name="email"  type="string" display="email" required="no" hint="";
	
	property name="phone"  type="PhoneNumberType" display="phone" required="no" hint="";
	
	property name="primary"  type="boolean" display="primary" required="no" hint="";
	
	property name="invoiceId"  type="string" display="invoiceId" required="no" hint="";
	
	property name="paymentType"  type="string" display="paymentType" required="no" hint="";
	
	property name="paymentSubType"  type="string" display="paymentSubType" required="no" hint="";
	

	public Receiver function init( numeric amount="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setamount(arguments.amount);
			
		
		
		return this;  
	}
	
	
	public void function setamount(numeric amount)
	{
		this.amount = arguments.amount;
	}  
		
	public numeric function getamount()
	{
		return this.amount;
	} 
	
	
	public void function setemail(string email)
	{
		this.email = arguments.email;
	}  
		
	public string function getemail()
	{
		return this.email;
	} 
	
	
	public void function setphone(PhoneNumberType phone)
	{
		this.phone = arguments.phone;
	}  
		
	public PhoneNumberType function getphone()
	{
		return this.phone;
	} 
	
	
	public void function setprimary(boolean primary)
	{
		this.primary = arguments.primary;
	}  
		
	public boolean function getprimary()
	{
		return this.primary;
	} 
	
	
	public void function setinvoiceId(string invoiceId)
	{
		this.invoiceId = arguments.invoiceId;
	}  
		
	public string function getinvoiceId()
	{
		return this.invoiceId;
	} 
	
	
	public void function setpaymentType(string paymentType)
	{
		this.paymentType = arguments.paymentType;
	}  
		
	public string function getpaymentType()
	{
		return this.paymentType;
	} 
	
	
	public void function setpaymentSubType(string paymentSubType)
	{
		this.paymentSubType = arguments.paymentSubType;
	}  
		
	public string function getpaymentSubType()
	{
		return this.paymentSubType;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.amount' ) )
			
				local.struct["amount"] = getamount();
			
		if(  isDefined( 'this.email' ) )
			
				local.struct["email"] = getemail();
			
		if(  isDefined( 'this.phone' ) )
			
				local.struct["phone"] = getphone().getStruct();
			
		if(  isDefined( 'this.primary' ) )
			
				local.struct["primary"] = getprimary();
			
		if(  isDefined( 'this.invoiceId' ) )
			
				local.struct["invoiceId"] = getinvoiceId();
			
		if(  isDefined( 'this.paymentType' ) )
			
				local.struct["paymentType"] = getpaymentType();
			
		if(  isDefined( 'this.paymentSubType' ) )
			
				local.struct["paymentSubType"] = getpaymentSubType();
			
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
						if(NOT isStruct(local.json[key]) AND ('numeric' eq "string" OR 'numeric' eq "boolean" OR 'numeric' eq "numeric"))
						{
							this.setamount(local.json[key]);
						} else {
							var keyCom = 'amount';
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
							this.setamount( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
						{
							this.setemail(local.json[key]);
						} else {
							var keyCom = 'email';
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
							this.setemail( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('PhoneNumberType' eq "string" OR 'PhoneNumberType' eq "boolean" OR 'PhoneNumberType' eq "numeric"))
						{
							this.setphone(local.json[key]);
						} else {
							var keyCom = 'phone';
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
							this.setphone( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('boolean' eq "string" OR 'boolean' eq "boolean" OR 'boolean' eq "numeric"))
						{
							this.setprimary(local.json[key]);
						} else {
							var keyCom = 'primary';
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
							this.setprimary( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
						{
							this.setinvoiceId(local.json[key]);
						} else {
							var keyCom = 'invoiceId';
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
							this.setinvoiceId( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
						{
							this.setpaymentType(local.json[key]);
						} else {
							var keyCom = 'paymentType';
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
							this.setpaymentType( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
						{
							this.setpaymentSubType(local.json[key]);
						} else {
							var keyCom = 'paymentSubType';
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
							this.setpaymentSubType( keyObj.deserialize(local.json[key]) );
							
						}
							
				
			}
		} else if (isArray(local.json)) {
		
			for( i = 1; i lte ArrayLen(local.json); i = i + 1)
			{
			
				for(key in local.json[i])
				{
					
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('numeric' eq "string" OR 'numeric' eq "boolean" OR 'numeric' eq "numeric"))
							{
								this.setamount(local.json[i][key]);
							} else {
								var keyCom = 'amount';
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
								this.setamount( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
							{
								this.setemail(local.json[i][key]);
							} else {
								var keyCom = 'email';
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
								this.setemail( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('PhoneNumberType' eq "string" OR 'PhoneNumberType' eq "boolean" OR 'PhoneNumberType' eq "numeric"))
							{
								this.setphone(local.json[i][key]);
							} else {
								var keyCom = 'phone';
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
								this.setphone( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('boolean' eq "string" OR 'boolean' eq "boolean" OR 'boolean' eq "numeric"))
							{
								this.setprimary(local.json[i][key]);
							} else {
								var keyCom = 'primary';
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
								this.setprimary( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
							{
								this.setinvoiceId(local.json[i][key]);
							} else {
								var keyCom = 'invoiceId';
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
								this.setinvoiceId( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
							{
								this.setpaymentType(local.json[i][key]);
							} else {
								var keyCom = 'paymentType';
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
								this.setpaymentType( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
							{
								this.setpaymentSubType(local.json[i][key]);
							} else {
								var keyCom = 'paymentSubType';
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
								this.setpaymentSubType( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
				}
			
			}
		
		}
		
		return this;
	} 
	
	
	
	
}
</cfscript>

