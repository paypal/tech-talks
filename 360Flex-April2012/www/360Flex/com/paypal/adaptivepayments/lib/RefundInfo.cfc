
<cfscript>
component name="RefundInfo" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="receiver"  type="Receiver" display="receiver" required="yes" hint="";
	
	property name="refundStatus"  type="string" display="refundStatus" required="no" hint="";
	
	property name="refundNetAmount"  type="numeric" display="refundNetAmount" required="no" hint="";
	
	property name="refundFeeAmount"  type="numeric" display="refundFeeAmount" required="no" hint="";
	
	property name="refundGrossAmount"  type="numeric" display="refundGrossAmount" required="no" hint="";
	
	property name="totalOfAllRefunds"  type="numeric" display="totalOfAllRefunds" required="no" hint="";
	
	property name="refundHasBecomeFull"  type="boolean" display="refundHasBecomeFull" required="no" hint="";
	
	property name="encryptedRefundTransactionId"  type="string" display="encryptedRefundTransactionId" required="no" hint="";
	
	property name="refundTransactionStatus"  type="string" display="refundTransactionStatus" required="no" hint="";
	
	property name="errorList"  type="ErrorList" display="errorList" required="no" hint="";
	
	
	public RefundInfo function init( Receiver receiver="")
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
	
	
	public void function setreceiver(Receiver receiver)
	{
		this.receiver = arguments.receiver;
	}  
		
	public Receiver function getreceiver()
	{
		return this.receiver;
	} 
	
	
	public void function setrefundStatus(string refundStatus)
	{
		this.refundStatus = arguments.refundStatus;
	}  
		
	public string function getrefundStatus()
	{
		return this.refundStatus;
	} 
	
	
	public void function setrefundNetAmount(numeric refundNetAmount)
	{
		this.refundNetAmount = arguments.refundNetAmount;
	}  
		
	public numeric function getrefundNetAmount()
	{
		return this.refundNetAmount;
	} 
	
	
	public void function setrefundFeeAmount(numeric refundFeeAmount)
	{
		this.refundFeeAmount = arguments.refundFeeAmount;
	}  
		
	public numeric function getrefundFeeAmount()
	{
		return this.refundFeeAmount;
	} 
	
	
	public void function setrefundGrossAmount(numeric refundGrossAmount)
	{
		this.refundGrossAmount = arguments.refundGrossAmount;
	}  
		
	public numeric function getrefundGrossAmount()
	{
		return this.refundGrossAmount;
	} 
	
	
	public void function settotalOfAllRefunds(numeric totalOfAllRefunds)
	{
		this.totalOfAllRefunds = arguments.totalOfAllRefunds;
	}  
		
	public numeric function gettotalOfAllRefunds()
	{
		return this.totalOfAllRefunds;
	} 
	
	
	public void function setrefundHasBecomeFull(boolean refundHasBecomeFull)
	{
		this.refundHasBecomeFull = arguments.refundHasBecomeFull;
	}  
		
	public boolean function getrefundHasBecomeFull()
	{
		return this.refundHasBecomeFull;
	} 
	
	
	public void function setencryptedRefundTransactionId(string encryptedRefundTransactionId)
	{
		this.encryptedRefundTransactionId = arguments.encryptedRefundTransactionId;
	}  
		
	public string function getencryptedRefundTransactionId()
	{
		return this.encryptedRefundTransactionId;
	} 
	
	
	public void function setrefundTransactionStatus(string refundTransactionStatus)
	{
		this.refundTransactionStatus = arguments.refundTransactionStatus;
	}  
		
	public string function getrefundTransactionStatus()
	{
		return this.refundTransactionStatus;
	} 
	
	
	public void function seterrorList(ErrorList errorList)
	{
		this.errorList = arguments.errorList;
	}  
		
	public ErrorList function geterrorList()
	{
		return this.errorList;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.receiver' ) )
			
				local.struct["receiver"] = getreceiver().getStruct();
			
		if(  isDefined( 'this.refundStatus' ) )
			
				local.struct["refundStatus"] = getrefundStatus();
			
		if(  isDefined( 'this.refundNetAmount' ) )
			
				local.struct["refundNetAmount"] = getrefundNetAmount();
			
		if(  isDefined( 'this.refundFeeAmount' ) )
			
				local.struct["refundFeeAmount"] = getrefundFeeAmount();
			
		if(  isDefined( 'this.refundGrossAmount' ) )
			
				local.struct["refundGrossAmount"] = getrefundGrossAmount();
			
		if(  isDefined( 'this.totalOfAllRefunds' ) )
			
				local.struct["totalOfAllRefunds"] = gettotalOfAllRefunds();
			
		if(  isDefined( 'this.refundHasBecomeFull' ) )
			
				local.struct["refundHasBecomeFull"] = getrefundHasBecomeFull();
			
		if(  isDefined( 'this.encryptedRefundTransactionId' ) )
			
				local.struct["encryptedRefundTransactionId"] = getencryptedRefundTransactionId();
			
		if(  isDefined( 'this.refundTransactionStatus' ) )
			
				local.struct["refundTransactionStatus"] = getrefundTransactionStatus();
			
		if(  isDefined( 'this.errorList' ) )
			
				local.struct["errorList"] = geterrorList().getStruct();
			
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
				
				if('#key#' eq 'receiver') {
				
					var keyCom = 'receiver';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setreceiver( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'refundStatus') {
				
					this.setrefundStatus(local.json[key]);
				}
				
				if('#key#' eq 'refundNetAmount') {
				
					this.setrefundNetAmount(local.json[key]);
				}
				
				if('#key#' eq 'refundFeeAmount') {
				
					this.setrefundFeeAmount(local.json[key]);
				}
				
				if('#key#' eq 'refundGrossAmount') {
				
					this.setrefundGrossAmount(local.json[key]);
				}
				
				if('#key#' eq 'totalOfAllRefunds') {
				
					this.settotalOfAllRefunds(local.json[key]);
				}
				
				if('#key#' eq 'refundHasBecomeFull') {
				
					this.setrefundHasBecomeFull(local.json[key]);
				}
				
				if('#key#' eq 'encryptedRefundTransactionId') {
				
					this.setencryptedRefundTransactionId(local.json[key]);
				}
				
				if('#key#' eq 'refundTransactionStatus') {
				
					this.setrefundTransactionStatus(local.json[key]);
				}
				
				if('#key#' eq 'errorList') {
				
					var keyCom = 'errorList';
					
					var keyObj = createObject("component",'#keyCom#');
					this.seterrorList( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setreceiver(local.json[i]);
					
					this.setrefundStatus(local.json[i]);
					
					this.setrefundNetAmount(local.json[i]);
					
					this.setrefundFeeAmount(local.json[i]);
					
					this.setrefundGrossAmount(local.json[i]);
					
					this.settotalOfAllRefunds(local.json[i]);
					
					this.setrefundHasBecomeFull(local.json[i]);
					
					this.setencryptedRefundTransactionId(local.json[i]);
					
					this.setrefundTransactionStatus(local.json[i]);
					
					this.seterrorList(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'receiver') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setreceiver( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'refundStatus') {
					
						this.setrefundStatus(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'refundNetAmount') {
					
						this.setrefundNetAmount(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'refundFeeAmount') {
					
						this.setrefundFeeAmount(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'refundGrossAmount') {
					
						this.setrefundGrossAmount(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'totalOfAllRefunds') {
					
						this.settotalOfAllRefunds(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'refundHasBecomeFull') {
					
						this.setrefundHasBecomeFull(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'encryptedRefundTransactionId') {
					
						this.setencryptedRefundTransactionId(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'refundTransactionStatus') {
					
						this.setrefundTransactionStatus(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'errorList') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.seterrorList( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

