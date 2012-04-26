
<cfscript>
component name="PayRequest" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
	
	property name="clientDetails"  type="ClientDetailsType" display="clientDetails" required="no" hint="";
	
	property name="actionType"  type="string" display="actionType" required="yes" hint="";
	
	property name="cancelUrl"  type="string" display="cancelUrl" required="yes" hint="";
	
	property name="currencyCode"  type="string" display="currencyCode" required="yes" hint="";
	
	property name="feesPayer"  type="string" display="feesPayer" required="no" hint="";
	
	property name="ipnNotificationUrl"  type="string" display="ipnNotificationUrl" required="no" hint="";
	
	property name="memo"  type="string" display="memo" required="no" hint="";
	
	property name="pin"  type="string" display="pin" required="no" hint="";
	
	property name="preapprovalKey"  type="string" display="preapprovalKey" required="no" hint="";
	
	property name="receiverList"  type="ReceiverList" display="receiverList" required="yes" hint="";
	
	property name="reverseAllParallelPaymentsOnError"  type="boolean" display="reverseAllParallelPaymentsOnError" required="no" hint="";
	
	property name="senderEmail"  type="string" display="senderEmail" required="no" hint="";
	
	property name="returnUrl"  type="string" display="returnUrl" required="yes" hint="";
	
	property name="trackingId"  type="string" display="trackingId" required="no" hint="";
	
	property name="fundingConstraint"  type="FundingConstraint" display="fundingConstraint" required="no" hint="";
	
	property name="sender"  type="SenderIdentifier" display="sender" required="no" hint="";
	
	
	public PayRequest function init( RequestEnvelope requestEnvelope="", string actionType="", string cancelUrl="", string currencyCode="", ReceiverList receiverList="", string returnUrl="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setrequestEnvelope(arguments.requestEnvelope);
			
				this.setactionType(arguments.actionType);
			
				this.setcancelUrl(arguments.cancelUrl);
			
				this.setcurrencyCode(arguments.currencyCode);
			
				this.setreceiverList(arguments.receiverList);
			
				this.setreturnUrl(arguments.returnUrl);
			
		
		
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
	
	
	public void function setclientDetails(ClientDetailsType clientDetails)
	{
		this.clientDetails = arguments.clientDetails;
	}  
		
	public ClientDetailsType function getclientDetails()
	{
		return this.clientDetails;
	} 
	
	
	public void function setactionType(string actionType)
	{
		this.actionType = arguments.actionType;
	}  
		
	public string function getactionType()
	{
		return this.actionType;
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
	
	
	public void function setfeesPayer(string feesPayer)
	{
		this.feesPayer = arguments.feesPayer;
	}  
		
	public string function getfeesPayer()
	{
		return this.feesPayer;
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
	
	
	public void function setpin(string pin)
	{
		this.pin = arguments.pin;
	}  
		
	public string function getpin()
	{
		return this.pin;
	} 
	
	
	public void function setpreapprovalKey(string preapprovalKey)
	{
		this.preapprovalKey = arguments.preapprovalKey;
	}  
		
	public string function getpreapprovalKey()
	{
		return this.preapprovalKey;
	} 
	
	
	public void function setreceiverList(ReceiverList receiverList)
	{
		this.receiverList = arguments.receiverList;
	}  
		
	public ReceiverList function getreceiverList()
	{
		return this.receiverList;
	} 
	
	
	public void function setreverseAllParallelPaymentsOnError(boolean reverseAllParallelPaymentsOnError)
	{
		this.reverseAllParallelPaymentsOnError = arguments.reverseAllParallelPaymentsOnError;
	}  
		
	public boolean function getreverseAllParallelPaymentsOnError()
	{
		return this.reverseAllParallelPaymentsOnError;
	} 
	
	
	public void function setsenderEmail(string senderEmail)
	{
		this.senderEmail = arguments.senderEmail;
	}  
		
	public string function getsenderEmail()
	{
		return this.senderEmail;
	} 
	
	
	public void function setreturnUrl(string returnUrl)
	{
		this.returnUrl = arguments.returnUrl;
	}  
		
	public string function getreturnUrl()
	{
		return this.returnUrl;
	} 
	
	
	public void function settrackingId(string trackingId)
	{
		this.trackingId = arguments.trackingId;
	}  
		
	public string function gettrackingId()
	{
		return this.trackingId;
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
				
		
		if(  isDefined( 'this.requestEnvelope' ) )
			
				local.struct["requestEnvelope"] = getrequestEnvelope().getStruct();
			
		if(  isDefined( 'this.clientDetails' ) )
			
				local.struct["clientDetails"] = getclientDetails().getStruct();
			
		if(  isDefined( 'this.actionType' ) )
			
				local.struct["actionType"] = getactionType();
			
		if(  isDefined( 'this.cancelUrl' ) )
			
				local.struct["cancelUrl"] = getcancelUrl();
			
		if(  isDefined( 'this.currencyCode' ) )
			
				local.struct["currencyCode"] = getcurrencyCode();
			
		if(  isDefined( 'this.feesPayer' ) )
			
				local.struct["feesPayer"] = getfeesPayer();
			
		if(  isDefined( 'this.ipnNotificationUrl' ) )
			
				local.struct["ipnNotificationUrl"] = getipnNotificationUrl();
			
		if(  isDefined( 'this.memo' ) )
			
				local.struct["memo"] = getmemo();
			
		if(  isDefined( 'this.pin' ) )
			
				local.struct["pin"] = getpin();
			
		if(  isDefined( 'this.preapprovalKey' ) )
			
				local.struct["preapprovalKey"] = getpreapprovalKey();
			
		if(  isDefined( 'this.receiverList' ) )
			
				local.struct["receiverList"] = getreceiverList().getStruct();
			
		if(  isDefined( 'this.reverseAllParallelPaymentsOnError' ) )
			
				local.struct["reverseAllParallelPaymentsOnError"] = getreverseAllParallelPaymentsOnError();
			
		if(  isDefined( 'this.senderEmail' ) )
			
				local.struct["senderEmail"] = getsenderEmail();
			
		if(  isDefined( 'this.returnUrl' ) )
			
				local.struct["returnUrl"] = getreturnUrl();
			
		if(  isDefined( 'this.trackingId' ) )
			
				local.struct["trackingId"] = gettrackingId();
			
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
				
				if('#key#' eq 'requestEnvelope') {
				
					var keyCom = 'requestEnvelope';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setrequestEnvelope( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'clientDetails') {
				
					var keyCom = 'clientDetails';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setclientDetails( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'actionType') {
				
					this.setactionType(local.json[key]);
				}
				
				if('#key#' eq 'cancelUrl') {
				
					this.setcancelUrl(local.json[key]);
				}
				
				if('#key#' eq 'currencyCode') {
				
					this.setcurrencyCode(local.json[key]);
				}
				
				if('#key#' eq 'feesPayer') {
				
					this.setfeesPayer(local.json[key]);
				}
				
				if('#key#' eq 'ipnNotificationUrl') {
				
					this.setipnNotificationUrl(local.json[key]);
				}
				
				if('#key#' eq 'memo') {
				
					this.setmemo(local.json[key]);
				}
				
				if('#key#' eq 'pin') {
				
					this.setpin(local.json[key]);
				}
				
				if('#key#' eq 'preapprovalKey') {
				
					this.setpreapprovalKey(local.json[key]);
				}
				
				if('#key#' eq 'receiverList') {
				
					var keyCom = 'receiverList';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setreceiverList( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'reverseAllParallelPaymentsOnError') {
				
					this.setreverseAllParallelPaymentsOnError(local.json[key]);
				}
				
				if('#key#' eq 'senderEmail') {
				
					this.setsenderEmail(local.json[key]);
				}
				
				if('#key#' eq 'returnUrl') {
				
					this.setreturnUrl(local.json[key]);
				}
				
				if('#key#' eq 'trackingId') {
				
					this.settrackingId(local.json[key]);
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
					
					this.setrequestEnvelope(local.json[i]);
					
					this.setclientDetails(local.json[i]);
					
					this.setactionType(local.json[i]);
					
					this.setcancelUrl(local.json[i]);
					
					this.setcurrencyCode(local.json[i]);
					
					this.setfeesPayer(local.json[i]);
					
					this.setipnNotificationUrl(local.json[i]);
					
					this.setmemo(local.json[i]);
					
					this.setpin(local.json[i]);
					
					this.setpreapprovalKey(local.json[i]);
					
					this.setreceiverList(local.json[i]);
					
					this.setreverseAllParallelPaymentsOnError(local.json[i]);
					
					this.setsenderEmail(local.json[i]);
					
					this.setreturnUrl(local.json[i]);
					
					this.settrackingId(local.json[i]);
					
					this.setfundingConstraint(local.json[i]);
					
					this.setsender(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'requestEnvelope') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setrequestEnvelope( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'clientDetails') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setclientDetails( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'actionType') {
					
						this.setactionType(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'cancelUrl') {
					
						this.setcancelUrl(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'currencyCode') {
					
						this.setcurrencyCode(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'feesPayer') {
					
						this.setfeesPayer(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'ipnNotificationUrl') {
					
						this.setipnNotificationUrl(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'memo') {
					
						this.setmemo(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'pin') {
					
						this.setpin(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'preapprovalKey') {
					
						this.setpreapprovalKey(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'receiverList') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setreceiverList( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'reverseAllParallelPaymentsOnError') {
					
						this.setreverseAllParallelPaymentsOnError(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'senderEmail') {
					
						this.setsenderEmail(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'returnUrl') {
					
						this.setreturnUrl(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'trackingId') {
					
						this.settrackingId(local.json[i][key]);
					
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

