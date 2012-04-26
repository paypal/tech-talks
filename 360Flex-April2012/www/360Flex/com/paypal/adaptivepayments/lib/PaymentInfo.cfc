
<cfscript>
component name="PaymentInfo" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
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
	
	public void function setError(ErrorData error)
	{
		this.error = arguments.error;
	}  
		
	public ErrorData function getError()
	{
		return this.error;
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
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
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
				
				if('#key#' eq 'transactionId') {
				
					this.settransactionId(local.json[key]);
				}
				
				if('#key#' eq 'transactionStatus') {
				
					this.settransactionStatus(local.json[key]);
				}
				
				if('#key#' eq 'receiver') {
				
					var keyCom = 'receiver';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setreceiver( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'refundedAmount') {
				
					this.setrefundedAmount(local.json[key]);
				}
				
				if('#key#' eq 'pendingRefund') {
				
					this.setpendingRefund(local.json[key]);
				}
				
				if('#key#' eq 'senderTransactionId') {
				
					this.setsenderTransactionId(local.json[key]);
				}
				
				if('#key#' eq 'senderTransactionStatus') {
				
					this.setsenderTransactionStatus(local.json[key]);
				}
				
				if('#key#' eq 'pendingReason') {
				
					this.setpendingReason(local.json[key]);
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
					
					this.settransactionId(local.json[i]);
					
					this.settransactionStatus(local.json[i]);
					
					this.setreceiver(local.json[i]);
					
					this.setrefundedAmount(local.json[i]);
					
					this.setpendingRefund(local.json[i]);
					
					this.setsenderTransactionId(local.json[i]);
					
					this.setsenderTransactionStatus(local.json[i]);
					
					this.setpendingReason(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'transactionId') {
					
						this.settransactionId(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'transactionStatus') {
					
						this.settransactionStatus(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'receiver') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setreceiver( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'refundedAmount') {
					
						this.setrefundedAmount(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'pendingRefund') {
					
						this.setpendingRefund(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'senderTransactionId') {
					
						this.setsenderTransactionId(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'senderTransactionStatus') {
					
						this.setsenderTransactionStatus(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'pendingReason') {
					
						this.setpendingReason(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

