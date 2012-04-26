
<cfscript>
component name="PreapprovalRequest" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
	
	property name="clientDetails"  type="ClientDetailsType" display="clientDetails" required="no" hint="";
	
	property name="cancelUrl"  type="string" display="cancelUrl" required="yes" hint="";
	
	property name="currencyCode"  type="string" display="currencyCode" required="yes" hint="";
	
	property name="dateOfMonth"  type="numeric" display="dateOfMonth" required="no" hint="";
	
	property name="dayOfWeek"  type="DayOfWeek" display="dayOfWeek" required="no" hint="";
	
	property name="endingDate"  type="string" display="endingDate" required="no" hint="";
	
	property name="maxAmountPerPayment"  type="numeric" display="maxAmountPerPayment" required="no" hint="";
	
	property name="maxNumberOfPayments"  type="numeric" display="maxNumberOfPayments" required="no" hint="";
	
	property name="maxNumberOfPaymentsPerPeriod"  type="numeric" display="maxNumberOfPaymentsPerPeriod" required="no" hint="";
	
	property name="maxTotalAmountOfAllPayments"  type="numeric" display="maxTotalAmountOfAllPayments" required="no" hint="";
	
	property name="paymentPeriod"  type="string" display="paymentPeriod" required="no" hint="";
	
	property name="returnUrl"  type="string" display="returnUrl" required="yes" hint="";
	
	property name="memo"  type="string" display="memo" required="no" hint="";
	
	property name="ipnNotificationUrl"  type="string" display="ipnNotificationUrl" required="no" hint="";
	
	property name="senderEmail"  type="string" display="senderEmail" required="no" hint="";
	
	property name="startingDate"  type="string" display="startingDate" required="yes" hint="";
	
	property name="pinType"  type="string" display="pinType" required="no" hint="";
	
	property name="feesPayer"  type="string" display="feesPayer" required="no" hint="";
	
	property name="displayMaxTotalAmount"  type="boolean" display="displayMaxTotalAmount" required="no" hint="";
	
	
	public PreapprovalRequest function init( RequestEnvelope requestEnvelope="", string cancelUrl="", string currencyCode="", string returnUrl="", string startingDate="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setrequestEnvelope(arguments.requestEnvelope);
			
				this.setcancelUrl(arguments.cancelUrl);
			
				this.setcurrencyCode(arguments.currencyCode);
			
				this.setreturnUrl(arguments.returnUrl);
			
				this.setstartingDate(arguments.startingDate);
			
		
		
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
	
	
	public void function setdateOfMonth(numeric dateOfMonth)
	{
		this.dateOfMonth = arguments.dateOfMonth;
	}  
		
	public numeric function getdateOfMonth()
	{
		return this.dateOfMonth;
	} 
	
	
	public void function setdayOfWeek(DayOfWeek dayOfWeek)
	{
		this.dayOfWeek = arguments.dayOfWeek;
	}  
		
	public DayOfWeek function getdayOfWeek()
	{
		return this.dayOfWeek;
	} 
	
	
	public void function setendingDate(string endingDate)
	{
		this.endingDate = arguments.endingDate;
	}  
		
	public string function getendingDate()
	{
		return this.endingDate;
	} 
	
	
	public void function setmaxAmountPerPayment(numeric maxAmountPerPayment)
	{
		this.maxAmountPerPayment = arguments.maxAmountPerPayment;
	}  
		
	public numeric function getmaxAmountPerPayment()
	{
		return this.maxAmountPerPayment;
	} 
	
	
	public void function setmaxNumberOfPayments(numeric maxNumberOfPayments)
	{
		this.maxNumberOfPayments = arguments.maxNumberOfPayments;
	}  
		
	public numeric function getmaxNumberOfPayments()
	{
		return this.maxNumberOfPayments;
	} 
	
	
	public void function setmaxNumberOfPaymentsPerPeriod(numeric maxNumberOfPaymentsPerPeriod)
	{
		this.maxNumberOfPaymentsPerPeriod = arguments.maxNumberOfPaymentsPerPeriod;
	}  
		
	public numeric function getmaxNumberOfPaymentsPerPeriod()
	{
		return this.maxNumberOfPaymentsPerPeriod;
	} 
	
	
	public void function setmaxTotalAmountOfAllPayments(numeric maxTotalAmountOfAllPayments)
	{
		this.maxTotalAmountOfAllPayments = arguments.maxTotalAmountOfAllPayments;
	}  
		
	public numeric function getmaxTotalAmountOfAllPayments()
	{
		return this.maxTotalAmountOfAllPayments;
	} 
	
	
	public void function setpaymentPeriod(string paymentPeriod)
	{
		this.paymentPeriod = arguments.paymentPeriod;
	}  
		
	public string function getpaymentPeriod()
	{
		return this.paymentPeriod;
	} 
	
	
	public void function setreturnUrl(string returnUrl)
	{
		this.returnUrl = arguments.returnUrl;
	}  
		
	public string function getreturnUrl()
	{
		return this.returnUrl;
	} 
	
	
	public void function setmemo(string memo)
	{
		this.memo = arguments.memo;
	}  
		
	public string function getmemo()
	{
		return this.memo;
	} 
	
	
	public void function setipnNotificationUrl(string ipnNotificationUrl)
	{
		this.ipnNotificationUrl = arguments.ipnNotificationUrl;
	}  
		
	public string function getipnNotificationUrl()
	{
		return this.ipnNotificationUrl;
	} 
	
	
	public void function setsenderEmail(string senderEmail)
	{
		this.senderEmail = arguments.senderEmail;
	}  
		
	public string function getsenderEmail()
	{
		return this.senderEmail;
	} 
	
	
	public void function setstartingDate(string startingDate)
	{
		this.startingDate = arguments.startingDate;
	}  
		
	public string function getstartingDate()
	{
		return this.startingDate;
	} 
	
	
	public void function setpinType(string pinType)
	{
		this.pinType = arguments.pinType;
	}  
		
	public string function getpinType()
	{
		return this.pinType;
	} 
	
	
	public void function setfeesPayer(string feesPayer)
	{
		this.feesPayer = arguments.feesPayer;
	}  
		
	public string function getfeesPayer()
	{
		return this.feesPayer;
	} 
	
	
	public void function setdisplayMaxTotalAmount(boolean displayMaxTotalAmount)
	{
		this.displayMaxTotalAmount = arguments.displayMaxTotalAmount;
	}  
		
	public boolean function getdisplayMaxTotalAmount()
	{
		return this.displayMaxTotalAmount;
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
			
		if(  isDefined( 'this.cancelUrl' ) )
			
				local.struct["cancelUrl"] = getcancelUrl();
			
		if(  isDefined( 'this.currencyCode' ) )
			
				local.struct["currencyCode"] = getcurrencyCode();
			
		if(  isDefined( 'this.dateOfMonth' ) )
			
				local.struct["dateOfMonth"] = getdateOfMonth();
			
		if(  isDefined( 'this.dayOfWeek' ) )
			
				local.struct["dayOfWeek"] = getdayOfWeek().getStruct();
			
		if(  isDefined( 'this.endingDate' ) )
			
				local.struct["endingDate"] = getendingDate();
			
		if(  isDefined( 'this.maxAmountPerPayment' ) )
			
				local.struct["maxAmountPerPayment"] = getmaxAmountPerPayment();
			
		if(  isDefined( 'this.maxNumberOfPayments' ) )
			
				local.struct["maxNumberOfPayments"] = getmaxNumberOfPayments();
			
		if(  isDefined( 'this.maxNumberOfPaymentsPerPeriod' ) )
			
				local.struct["maxNumberOfPaymentsPerPeriod"] = getmaxNumberOfPaymentsPerPeriod();
			
		if(  isDefined( 'this.maxTotalAmountOfAllPayments' ) )
			
				local.struct["maxTotalAmountOfAllPayments"] = getmaxTotalAmountOfAllPayments();
			
		if(  isDefined( 'this.paymentPeriod' ) )
			
				local.struct["paymentPeriod"] = getpaymentPeriod();
			
		if(  isDefined( 'this.returnUrl' ) )
			
				local.struct["returnUrl"] = getreturnUrl();
			
		if(  isDefined( 'this.memo' ) )
			
				local.struct["memo"] = getmemo();
			
		if(  isDefined( 'this.ipnNotificationUrl' ) )
			
				local.struct["ipnNotificationUrl"] = getipnNotificationUrl();
			
		if(  isDefined( 'this.senderEmail' ) )
			
				local.struct["senderEmail"] = getsenderEmail();
			
		if(  isDefined( 'this.startingDate' ) )
			
				local.struct["startingDate"] = getstartingDate();
			
		if(  isDefined( 'this.pinType' ) )
			
				local.struct["pinType"] = getpinType();
			
		if(  isDefined( 'this.feesPayer' ) )
			
				local.struct["feesPayer"] = getfeesPayer();
			
		if(  isDefined( 'this.displayMaxTotalAmount' ) )
			
				local.struct["displayMaxTotalAmount"] = getdisplayMaxTotalAmount();
			
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
				
				if('#key#' eq 'cancelUrl') {
				
					this.setcancelUrl(local.json[key]);
				}
				
				if('#key#' eq 'currencyCode') {
				
					this.setcurrencyCode(local.json[key]);
				}
				
				if('#key#' eq 'dateOfMonth') {
				
					this.setdateOfMonth(local.json[key]);
				}
				
				if('#key#' eq 'dayOfWeek') {
				
					var keyCom = 'dayOfWeek';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setdayOfWeek( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'endingDate') {
				
					this.setendingDate(local.json[key]);
				}
				
				if('#key#' eq 'maxAmountPerPayment') {
				
					this.setmaxAmountPerPayment(local.json[key]);
				}
				
				if('#key#' eq 'maxNumberOfPayments') {
				
					this.setmaxNumberOfPayments(local.json[key]);
				}
				
				if('#key#' eq 'maxNumberOfPaymentsPerPeriod') {
				
					this.setmaxNumberOfPaymentsPerPeriod(local.json[key]);
				}
				
				if('#key#' eq 'maxTotalAmountOfAllPayments') {
				
					this.setmaxTotalAmountOfAllPayments(local.json[key]);
				}
				
				if('#key#' eq 'paymentPeriod') {
				
					this.setpaymentPeriod(local.json[key]);
				}
				
				if('#key#' eq 'returnUrl') {
				
					this.setreturnUrl(local.json[key]);
				}
				
				if('#key#' eq 'memo') {
				
					this.setmemo(local.json[key]);
				}
				
				if('#key#' eq 'ipnNotificationUrl') {
				
					this.setipnNotificationUrl(local.json[key]);
				}
				
				if('#key#' eq 'senderEmail') {
				
					this.setsenderEmail(local.json[key]);
				}
				
				if('#key#' eq 'startingDate') {
				
					this.setstartingDate(local.json[key]);
				}
				
				if('#key#' eq 'pinType') {
				
					this.setpinType(local.json[key]);
				}
				
				if('#key#' eq 'feesPayer') {
				
					this.setfeesPayer(local.json[key]);
				}
				
				if('#key#' eq 'displayMaxTotalAmount') {
				
					this.setdisplayMaxTotalAmount(local.json[key]);
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
					
					this.setcancelUrl(local.json[i]);
					
					this.setcurrencyCode(local.json[i]);
					
					this.setdateOfMonth(local.json[i]);
					
					this.setdayOfWeek(local.json[i]);
					
					this.setendingDate(local.json[i]);
					
					this.setmaxAmountPerPayment(local.json[i]);
					
					this.setmaxNumberOfPayments(local.json[i]);
					
					this.setmaxNumberOfPaymentsPerPeriod(local.json[i]);
					
					this.setmaxTotalAmountOfAllPayments(local.json[i]);
					
					this.setpaymentPeriod(local.json[i]);
					
					this.setreturnUrl(local.json[i]);
					
					this.setmemo(local.json[i]);
					
					this.setipnNotificationUrl(local.json[i]);
					
					this.setsenderEmail(local.json[i]);
					
					this.setstartingDate(local.json[i]);
					
					this.setpinType(local.json[i]);
					
					this.setfeesPayer(local.json[i]);
					
					this.setdisplayMaxTotalAmount(local.json[i]);
					
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
									
					
					if('#key#' eq 'cancelUrl') {
					
						this.setcancelUrl(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'currencyCode') {
					
						this.setcurrencyCode(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'dateOfMonth') {
					
						this.setdateOfMonth(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'dayOfWeek') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setdayOfWeek( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'endingDate') {
					
						this.setendingDate(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'maxAmountPerPayment') {
					
						this.setmaxAmountPerPayment(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'maxNumberOfPayments') {
					
						this.setmaxNumberOfPayments(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'maxNumberOfPaymentsPerPeriod') {
					
						this.setmaxNumberOfPaymentsPerPeriod(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'maxTotalAmountOfAllPayments') {
					
						this.setmaxTotalAmountOfAllPayments(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'paymentPeriod') {
					
						this.setpaymentPeriod(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'returnUrl') {
					
						this.setreturnUrl(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'memo') {
					
						this.setmemo(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'ipnNotificationUrl') {
					
						this.setipnNotificationUrl(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'senderEmail') {
					
						this.setsenderEmail(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'startingDate') {
					
						this.setstartingDate(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'pinType') {
					
						this.setpinType(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'feesPayer') {
					
						this.setfeesPayer(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'displayMaxTotalAmount') {
					
						this.setdisplayMaxTotalAmount(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

