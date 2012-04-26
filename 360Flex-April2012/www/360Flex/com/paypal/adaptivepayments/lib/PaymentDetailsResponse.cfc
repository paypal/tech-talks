
<cfscript>
component name="PaymentDetailsResponse" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="responseEnvelope"  type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
	
	property name="cancelUrl"  type="string" display="cancelUrl" required="yes" hint="";
	
	property name="currencyCode"  type="string" display="currencyCode" required="yes" hint="";
	
	property name="ipnNotificationUrl"  type="string" display="ipnNotificationUrl" required="no" hint="";
	
	property name="memo"  type="string" display="memo" required="no" hint="";
	
	property name="paymentInfoList"  type="PaymentInfoList" display="paymentInfoList" required="yes" hint="";
	
	property name="returnUrl"  type="string" display="returnUrl" required="yes" hint="";
	
	property name="senderEmail"  type="string" display="senderEmail" required="no" hint="";
	
	property name="status"  type="string" display="status" required="yes" hint="";
	
	property name="trackingId"  type="string" display="trackingId" required="no" hint="";
	
	property name="payKey"  type="string" display="payKey" required="yes" hint="";
	
	property name="actionType"  type="string" display="actionType" required="yes" hint="";
	
	property name="feesPayer"  type="string" display="feesPayer" required="yes" hint="";
	
	property name="reverseAllParallelPaymentsOnError"  type="boolean" display="reverseAllParallelPaymentsOnError" required="no" hint="";
	
	property name="preapprovalKey"  type="string" display="preapprovalKey" required="no" hint="";
	
	property name="fundingConstraint"  type="FundingConstraint" display="fundingConstraint" required="no" hint="";
	
	property name="sender"  type="SenderIdentifier" display="sender" required="no" hint="";
	
	
	public PaymentDetailsResponse function init( ResponseEnvelope responseEnvelope="", string cancelUrl="", string currencyCode="", PaymentInfoList paymentInfoList="", string returnUrl="", string status="", string payKey="", string actionType="", string feesPayer="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setresponseEnvelope(arguments.responseEnvelope);
			
				this.setcancelUrl(arguments.cancelUrl);
			
				this.setcurrencyCode(arguments.currencyCode);
			
				this.setpaymentInfoList(arguments.paymentInfoList);
			
				this.setreturnUrl(arguments.returnUrl);
			
				this.setstatus(arguments.status);
			
				this.setpayKey(arguments.payKey);
			
				this.setactionType(arguments.actionType);
			
				this.setfeesPayer(arguments.feesPayer);
			
		
		
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
	
	
	public void function setcancelUrl(string cancelUrl)
	{
		this.cancelUrl = arguments.cancelUrl;
	}  
		
	public string function getcancelUrl()
	{
		return this.cancelUrl;
	} 
	
	
	public void function setcurrencyCode(string currencyCode)
	{
		this.currencyCode = arguments.currencyCode;
	}  
		
	public string function getcurrencyCode()
	{
		return this.currencyCode;
	} 
	
	
	public void function setipnNotificationUrl(string ipnNotificationUrl)
	{
		this.ipnNotificationUrl = arguments.ipnNotificationUrl;
	}  
		
	public string function getipnNotificationUrl()
	{
		return this.ipnNotificationUrl;
	} 
	
	
	public void function setmemo(string memo)
	{
		this.memo = arguments.memo;
	}  
		
	public string function getmemo()
	{
		return this.memo;
	} 
	
	
	public void function setpaymentInfoList(PaymentInfoList paymentInfoList)
	{
		this.paymentInfoList = arguments.paymentInfoList;
	}  
		
	public PaymentInfoList function getpaymentInfoList()
	{
		return this.paymentInfoList;
	} 
	
	
	public void function setreturnUrl(string returnUrl)
	{
		this.returnUrl = arguments.returnUrl;
	}  
		
	public string function getreturnUrl()
	{
		return this.returnUrl;
	} 
	
	
	public void function setsenderEmail(string senderEmail)
	{
		this.senderEmail = arguments.senderEmail;
	}  
		
	public string function getsenderEmail()
	{
		return this.senderEmail;
	} 
	
	
	public void function setstatus(string status)
	{
		this.status = arguments.status;
	}  
		
	public string function getstatus()
	{
		return this.status;
	} 
	
	
	public void function settrackingId(string trackingId)
	{
		this.trackingId = arguments.trackingId;
	}  
		
	public string function gettrackingId()
	{
		return this.trackingId;
	} 
	
	
	public void function setpayKey(string payKey)
	{
		this.payKey = arguments.payKey;
	}  
		
	public string function getpayKey()
	{
		return this.payKey;
	} 
	
	
	public void function setactionType(string actionType)
	{
		this.actionType = arguments.actionType;
	}  
		
	public string function getactionType()
	{
		return this.actionType;
	} 
	
	
	public void function setfeesPayer(string feesPayer)
	{
		this.feesPayer = arguments.feesPayer;
	}  
		
	public string function getfeesPayer()
	{
		return this.feesPayer;
	} 
	
	
	public void function setreverseAllParallelPaymentsOnError(boolean reverseAllParallelPaymentsOnError)
	{
		this.reverseAllParallelPaymentsOnError = arguments.reverseAllParallelPaymentsOnError;
	}  
		
	public boolean function getreverseAllParallelPaymentsOnError()
	{
		return this.reverseAllParallelPaymentsOnError;
	} 
	
	
	public void function setpreapprovalKey(string preapprovalKey)
	{
		this.preapprovalKey = arguments.preapprovalKey;
	}  
		
	public string function getpreapprovalKey()
	{
		return this.preapprovalKey;
	} 
	
	
	public void function setfundingConstraint(FundingConstraint fundingConstraint)
	{
		this.fundingConstraint = arguments.fundingConstraint;
	}  
		
	public FundingConstraint function getfundingConstraint()
	{
		return this.fundingConstraint;
	} 
	
	
	public void function setsender(SenderIdentifier sender)
	{
		this.sender = arguments.sender;
	}  
		
	public SenderIdentifier function getsender()
	{
		return this.sender;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.responseEnvelope' ) )
			
				local.struct["responseEnvelope"] = getresponseEnvelope().getStruct();
			
		if(  isDefined( 'this.cancelUrl' ) )
			
				local.struct["cancelUrl"] = getcancelUrl();
			
		if(  isDefined( 'this.currencyCode' ) )
			
				local.struct["currencyCode"] = getcurrencyCode();
			
		if(  isDefined( 'this.ipnNotificationUrl' ) )
			
				local.struct["ipnNotificationUrl"] = getipnNotificationUrl();
			
		if(  isDefined( 'this.memo' ) )
			
				local.struct["memo"] = getmemo();
			
		if(  isDefined( 'this.paymentInfoList' ) )
			
				local.struct["paymentInfoList"] = getpaymentInfoList().getStruct();
			
		if(  isDefined( 'this.returnUrl' ) )
			
				local.struct["returnUrl"] = getreturnUrl();
			
		if(  isDefined( 'this.senderEmail' ) )
			
				local.struct["senderEmail"] = getsenderEmail();
			
		if(  isDefined( 'this.status' ) )
			
				local.struct["status"] = getstatus();
			
		if(  isDefined( 'this.trackingId' ) )
			
				local.struct["trackingId"] = gettrackingId();
			
		if(  isDefined( 'this.payKey' ) )
			
				local.struct["payKey"] = getpayKey();
			
		if(  isDefined( 'this.actionType' ) )
			
				local.struct["actionType"] = getactionType();
			
		if(  isDefined( 'this.feesPayer' ) )
			
				local.struct["feesPayer"] = getfeesPayer();
			
		if(  isDefined( 'this.reverseAllParallelPaymentsOnError' ) )
			
				local.struct["reverseAllParallelPaymentsOnError"] = getreverseAllParallelPaymentsOnError();
			
		if(  isDefined( 'this.preapprovalKey' ) )
			
				local.struct["preapprovalKey"] = getpreapprovalKey();
			
		if(  isDefined( 'this.fundingConstraint' ) )
			
				local.struct["fundingConstraint"] = getfundingConstraint().getStruct();
			
		if(  isDefined( 'this.sender' ) )
			
				local.struct["sender"] = getsender().getStruct();
			
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
				
				if('#key#' eq 'cancelUrl') {
				
					this.setcancelUrl(local.json[key]);
				}
				
				if('#key#' eq 'currencyCode') {
				
					this.setcurrencyCode(local.json[key]);
				}
				
				if('#key#' eq 'ipnNotificationUrl') {
				
					this.setipnNotificationUrl(local.json[key]);
				}
				
				if('#key#' eq 'memo') {
				
					this.setmemo(local.json[key]);
				}
				
				if('#key#' eq 'paymentInfoList') {
				
					var keyCom = 'paymentInfoList';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setpaymentInfoList( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'returnUrl') {
				
					this.setreturnUrl(local.json[key]);
				}
				
				if('#key#' eq 'senderEmail') {
				
					this.setsenderEmail(local.json[key]);
				}
				
				if('#key#' eq 'status') {
				
					this.setstatus(local.json[key]);
				}
				
				if('#key#' eq 'trackingId') {
				
					this.settrackingId(local.json[key]);
				}
				
				if('#key#' eq 'payKey') {
				
					this.setpayKey(local.json[key]);
				}
				
				if('#key#' eq 'actionType') {
				
					this.setactionType(local.json[key]);
				}
				
				if('#key#' eq 'feesPayer') {
				
					this.setfeesPayer(local.json[key]);
				}
				
				if('#key#' eq 'reverseAllParallelPaymentsOnError') {
				
					this.setreverseAllParallelPaymentsOnError(local.json[key]);
				}
				
				if('#key#' eq 'preapprovalKey') {
				
					this.setpreapprovalKey(local.json[key]);
				}
				
				if('#key#' eq 'fundingConstraint') {
				
					var keyCom = 'fundingConstraint';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setfundingConstraint( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'sender') {
				
					var keyCom = 'sender';
					
					keyCom = 'SenderIdentifier'; 
					var keyObj = createObject("component",'#keyCom#');
					this.setsender( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setcancelUrl(local.json[i]);
					
					this.setcurrencyCode(local.json[i]);
					
					this.setipnNotificationUrl(local.json[i]);
					
					this.setmemo(local.json[i]);
					
					this.setpaymentInfoList(local.json[i]);
					
					this.setreturnUrl(local.json[i]);
					
					this.setsenderEmail(local.json[i]);
					
					this.setstatus(local.json[i]);
					
					this.settrackingId(local.json[i]);
					
					this.setpayKey(local.json[i]);
					
					this.setactionType(local.json[i]);
					
					this.setfeesPayer(local.json[i]);
					
					this.setreverseAllParallelPaymentsOnError(local.json[i]);
					
					this.setpreapprovalKey(local.json[i]);
					
					this.setfundingConstraint(local.json[i]);
					
					this.setsender(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'responseEnvelope') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setresponseEnvelope( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'cancelUrl') {
					
						this.setcancelUrl(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'currencyCode') {
					
						this.setcurrencyCode(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'ipnNotificationUrl') {
					
						this.setipnNotificationUrl(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'memo') {
					
						this.setmemo(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'paymentInfoList') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setpaymentInfoList( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'returnUrl') {
					
						this.setreturnUrl(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'senderEmail') {
					
						this.setsenderEmail(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'status') {
					
						this.setstatus(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'trackingId') {
					
						this.settrackingId(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'payKey') {
					
						this.setpayKey(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'actionType') {
					
						this.setactionType(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'feesPayer') {
					
						this.setfeesPayer(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'reverseAllParallelPaymentsOnError') {
					
						this.setreverseAllParallelPaymentsOnError(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'preapprovalKey') {
					
						this.setpreapprovalKey(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'fundingConstraint') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setfundingConstraint( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'sender') {
					
						keyCom = 'SenderIdentifier';
						
						var keyObj = createObject("component",'#keyCom#');
						this.setsender( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

