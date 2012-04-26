
<cfscript>
component name="PaymentInfo" output="false"  hint="I define the properties and methods"
{

	
	property name="transactionId"  type="string" display="transactionId" required="no" hint="";
	
	property name="transactionStatus"  type="string" display="transactionStatus" required="no" hint="";
	
	property name="receiver"  type="Receiver" display="receiver" required="yes" hint="";
	
	property name="refundedAmount"  type="numeric" display="refundedAmount" required="no" hint="";
	
	property name="pendingRefund"  type="boolean" display="pendingRefund" required="no" hint="";
	
	property name="senderTransactionId"  type="string" display="senderTransactionId" required="no" hint="";
	
	property name="senderTransactionStatus"  type="string" display="senderTransactionStatus" required="no" hint="";
	
	property name="pendingReason"  type="string" display="pendingReason" required="no" hint="";
	

	public PaymentInfo function init( Receiver receiver="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setreceiver(arguments.receiver);
			
		
		
		return this;  
	}
	
	
	public void function settransactionId(string transactionId)
	{
		this.transactionId = arguments.transactionId;
	}  
		
	public string function gettransactionId()
	{
		return this.transactionId;
	} 
	
	
	public void function settransactionStatus(string transactionStatus)
	{
		this.transactionStatus = arguments.transactionStatus;
	}  
		
	public string function gettransactionStatus()
	{
		return this.transactionStatus;
	} 
	
	
	public void function setreceiver(Receiver receiver)
	{
		this.receiver = arguments.receiver;
	}  
		
	public Receiver function getreceiver()
	{
		return this.receiver;
	} 
	
	
	public void function setrefundedAmount(numeric refundedAmount)
	{
		this.refundedAmount = arguments.refundedAmount;
	}  
		
	public numeric function getrefundedAmount()
	{
		return this.refundedAmount;
	} 
	
	
	public void function setpendingRefund(boolean pendingRefund)
	{
		this.pendingRefund = arguments.pendingRefund;
	}  
		
	public boolean function getpendingRefund()
	{
		return this.pendingRefund;
	} 
	
	
	public void function setsenderTransactionId(string senderTransactionId)
	{
		this.senderTransactionId = arguments.senderTransactionId;
	}  
		
	public string function getsenderTransactionId()
	{
		return this.senderTransactionId;
	} 
	
	
	public void function setsenderTransactionStatus(string senderTransactionStatus)
	{
		this.senderTransactionStatus = arguments.senderTransactionStatus;
	}  
		
	public string function getsenderTransactionStatus()
	{
		return this.senderTransactionStatus;
	} 
	
	
	public void function setpendingReason(string pendingReason)
	{
		this.pendingReason = arguments.pendingReason;
	}  
		
	public string function getpendingReason()
	{
		return this.pendingReason;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.transactionId' ) )
			
				local.struct["transactionId"] = gettransactionId();
			
		if(  isDefined( 'this.transactionStatus' ) )
			
				local.struct["transactionStatus"] = gettransactionStatus();
			
		if(  isDefined( 'this.receiver' ) )
			
				local.struct["receiver"] = getreceiver().getStruct();
			
		if(  isDefined( 'this.refundedAmount' ) )
			
				local.struct["refundedAmount"] = getrefundedAmount();
			
		if(  isDefined( 'this.pendingRefund' ) )
			
				local.struct["pendingRefund"] = getpendingRefund();
			
		if(  isDefined( 'this.senderTransactionId' ) )
			
				local.struct["senderTransactionId"] = getsenderTransactionId();
			
		if(  isDefined( 'this.senderTransactionStatus' ) )
			
				local.struct["senderTransactionStatus"] = getsenderTransactionStatus();
			
		if(  isDefined( 'this.pendingReason' ) )
			
				local.struct["pendingReason"] = getpendingReason();
			
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
							this.settransactionId(local.json[key]);
						} else {
							var keyCom = 'transactionId';
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
							this.settransactionId( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
						{
							this.settransactionStatus(local.json[key]);
						} else {
							var keyCom = 'transactionStatus';
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
							this.settransactionStatus( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('Receiver' eq "string" OR 'Receiver' eq "boolean" OR 'Receiver' eq "numeric"))
						{
							this.setreceiver(local.json[key]);
						} else {
							var keyCom = 'receiver';
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
							this.setreceiver( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('numeric' eq "string" OR 'numeric' eq "boolean" OR 'numeric' eq "numeric"))
						{
							this.setrefundedAmount(local.json[key]);
						} else {
							var keyCom = 'refundedAmount';
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
							this.setrefundedAmount( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('boolean' eq "string" OR 'boolean' eq "boolean" OR 'boolean' eq "numeric"))
						{
							this.setpendingRefund(local.json[key]);
						} else {
							var keyCom = 'pendingRefund';
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
							this.setpendingRefund( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
						{
							this.setsenderTransactionId(local.json[key]);
						} else {
							var keyCom = 'senderTransactionId';
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
							this.setsenderTransactionId( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
						{
							this.setsenderTransactionStatus(local.json[key]);
						} else {
							var keyCom = 'senderTransactionStatus';
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
							this.setsenderTransactionStatus( keyObj.deserialize(local.json[key]) );
							
						}
							
				
					if('#key#' eq currName)
						if(NOT isStruct(local.json[key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
						{
							this.setpendingReason(local.json[key]);
						} else {
							var keyCom = 'pendingReason';
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
							this.setpendingReason( keyObj.deserialize(local.json[key]) );
							
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
								this.settransactionId(local.json[i][key]);
							} else {
								var keyCom = 'transactionId';
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
								this.settransactionId( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
							{
								this.settransactionStatus(local.json[i][key]);
							} else {
								var keyCom = 'transactionStatus';
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
								this.settransactionStatus( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('Receiver' eq "string" OR 'Receiver' eq "boolean" OR 'Receiver' eq "numeric"))
							{
								this.setreceiver(local.json[i][key]);
							} else {
								var keyCom = 'receiver';
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
								this.setreceiver( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('numeric' eq "string" OR 'numeric' eq "boolean" OR 'numeric' eq "numeric"))
							{
								this.setrefundedAmount(local.json[i][key]);
							} else {
								var keyCom = 'refundedAmount';
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
								this.setrefundedAmount( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('boolean' eq "string" OR 'boolean' eq "boolean" OR 'boolean' eq "numeric"))
							{
								this.setpendingRefund(local.json[i][key]);
							} else {
								var keyCom = 'pendingRefund';
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
								this.setpendingRefund( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
							{
								this.setsenderTransactionId(local.json[i][key]);
							} else {
								var keyCom = 'senderTransactionId';
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
								this.setsenderTransactionId( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
							{
								this.setsenderTransactionStatus(local.json[i][key]);
							} else {
								var keyCom = 'senderTransactionStatus';
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
								this.setsenderTransactionStatus( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
					if('#key#' eq currName)
							if(NOT isStruct(local.json[i][key]) AND ('string' eq "string" OR 'string' eq "boolean" OR 'string' eq "numeric"))
							{
								this.setpendingReason(local.json[i][key]);
							} else {
								var keyCom = 'pendingReason';
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
								this.setpendingReason( keyObj.deserialize(local.json[i][key]) );
								
							}
								
					
				}
			
			}
		
		}
		
		return this;
	} 
	
	
	
	
}
</cfscript>

