
		<cfscript>
		component name="InvoiceSummaryType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="invoiceID"  type="string" display="invoiceID" required="yes" hint="
								The created invoice's ID.
							";
			
			property name="merchantEmail"  type="string" display="merchantEmail" required="yes" hint="
								Invoice creator's email.
							";
			
			property name="payerEmail"  type="string" display="payerEmail" required="yes" hint="
								Email to which the invoice will be sent.
							";
			
			property name="number"  type="string" display="number" required="yes" hint="
								Unique identifier for the invoice.
							";
			
			property name="billingBusinessName"  type="string" display="billingBusinessName" required="no" hint="
								Business name of the billing info.
							";
			
			property name="billingFirstName"  type="string" display="billingFirstName" required="no" hint="
								First name of the billing info.
							";
			
			property name="billingLastName"  type="string" display="billingLastName" required="no" hint="
								Last name of the billing info.
							";
			
			property name="shippingBusinessName"  type="string" display="shippingBusinessName" required="no" hint="
								Business name of the shipping info.
							";
			
			property name="shippingFirstName"  type="string" display="shippingFirstName" required="no" hint="
								First name of the shipping info.
							";
			
			property name="shippingLastName"  type="string" display="shippingLastName" required="no" hint="
								Last name of the shipping info.
							";
			
			property name="totalAmount"  type="numeric" display="totalAmount" required="yes" hint="
								Total amount of the invoice.
							";
			
			property name="currencyCode"  type="string" display="currencyCode" required="yes" hint="
								Currency used for all invoice item amounts and totals.
							";
			
			property name="invoiceDate"  type="string" display="invoiceDate" required="yes" hint="
								Date on which the invoice will be enabled.
							";
			
			property name="dueDate"  type="string" display="dueDate" required="yes" hint="
								Date on which the invoice payment is due.
							";
			
			property name="status"  type="StatusType" display="status" required="yes" hint="
								Status of the invoice.
							";
			
			property name="origin"  type="OriginType" display="origin" required="yes" hint="
								Whether the invoice was created via the website or via an API call.
							";
			
			property name="referrerCode"  type="ReferrerCode" display="referrerCode" required="no" hint="
								BN code for tracking transactions with a particular partner. 
							";
			
			
			public InvoiceSummaryType function init( string invoiceID="", string merchantEmail="", string payerEmail="", string number="", numeric totalAmount="", string currencyCode="", string invoiceDate="", string dueDate="", StatusType status="", OriginType origin="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setinvoiceID(arguments.invoiceID);
					
						this.setmerchantEmail(arguments.merchantEmail);
					
						this.setpayerEmail(arguments.payerEmail);
					
						this.setnumber(arguments.number);
					
						this.settotalAmount(arguments.totalAmount);
					
						this.setcurrencyCode(arguments.currencyCode);
					
						this.setinvoiceDate(arguments.invoiceDate);
					
						this.setdueDate(arguments.dueDate);
					
						this.setstatus(arguments.status);
					
						this.setorigin(arguments.origin);
					
				
				
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
			
			
			public void function setinvoiceID(string invoiceID)
			{
				this.invoiceID = arguments.invoiceID;
			}  
				
			public string function getinvoiceID()
			{
				return this.invoiceID;
			} 
			
			
			public void function setmerchantEmail(string merchantEmail)
			{
				this.merchantEmail = arguments.merchantEmail;
			}  
				
			public string function getmerchantEmail()
			{
				return this.merchantEmail;
			} 
			
			
			public void function setpayerEmail(string payerEmail)
			{
				this.payerEmail = arguments.payerEmail;
			}  
				
			public string function getpayerEmail()
			{
				return this.payerEmail;
			} 
			
			
			public void function setnumber(string number)
			{
				this.number = arguments.number;
			}  
				
			public string function getnumber()
			{
				return this.number;
			} 
			
			
			public void function setbillingBusinessName(string billingBusinessName)
			{
				this.billingBusinessName = arguments.billingBusinessName;
			}  
				
			public string function getbillingBusinessName()
			{
				return this.billingBusinessName;
			} 
			
			
			public void function setbillingFirstName(string billingFirstName)
			{
				this.billingFirstName = arguments.billingFirstName;
			}  
				
			public string function getbillingFirstName()
			{
				return this.billingFirstName;
			} 
			
			
			public void function setbillingLastName(string billingLastName)
			{
				this.billingLastName = arguments.billingLastName;
			}  
				
			public string function getbillingLastName()
			{
				return this.billingLastName;
			} 
			
			
			public void function setshippingBusinessName(string shippingBusinessName)
			{
				this.shippingBusinessName = arguments.shippingBusinessName;
			}  
				
			public string function getshippingBusinessName()
			{
				return this.shippingBusinessName;
			} 
			
			
			public void function setshippingFirstName(string shippingFirstName)
			{
				this.shippingFirstName = arguments.shippingFirstName;
			}  
				
			public string function getshippingFirstName()
			{
				return this.shippingFirstName;
			} 
			
			
			public void function setshippingLastName(string shippingLastName)
			{
				this.shippingLastName = arguments.shippingLastName;
			}  
				
			public string function getshippingLastName()
			{
				return this.shippingLastName;
			} 
			
			
			public void function settotalAmount(numeric totalAmount)
			{
				this.totalAmount = arguments.totalAmount;
			}  
				
			public numeric function gettotalAmount()
			{
				return this.totalAmount;
			} 
			
			
			public void function setcurrencyCode(string currencyCode)
			{
				this.currencyCode = arguments.currencyCode;
			}  
				
			public string function getcurrencyCode()
			{
				return this.currencyCode;
			} 
			
			
			public void function setinvoiceDate(string invoiceDate)
			{
				this.invoiceDate = arguments.invoiceDate;
			}  
				
			public string function getinvoiceDate()
			{
				return this.invoiceDate;
			} 
			
			
			public void function setdueDate(string dueDate)
			{
				this.dueDate = arguments.dueDate;
			}  
				
			public string function getdueDate()
			{
				return this.dueDate;
			} 
			
			
			public void function setstatus(StatusType status)
			{
				this.status = arguments.status;
			}  
				
			public StatusType function getstatus()
			{
				return this.status;
			} 
			
			
			public void function setorigin(OriginType origin)
			{
				this.origin = arguments.origin;
			}  
				
			public OriginType function getorigin()
			{
				return this.origin;
			} 
			
			
			public void function setreferrerCode(ReferrerCode referrerCode)
			{
				this.referrerCode = arguments.referrerCode;
			}  
				
			public ReferrerCode function getreferrerCode()
			{
				return this.referrerCode;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.invoiceID' ) )
					
						local.struct["invoiceID"] = getinvoiceID();
					
				if(  isDefined( 'this.merchantEmail' ) )
					
						local.struct["merchantEmail"] = getmerchantEmail();
					
				if(  isDefined( 'this.payerEmail' ) )
					
						local.struct["payerEmail"] = getpayerEmail();
					
				if(  isDefined( 'this.number' ) )
					
						local.struct["number"] = getnumber();
					
				if(  isDefined( 'this.billingBusinessName' ) )
					
						local.struct["billingBusinessName"] = getbillingBusinessName();
					
				if(  isDefined( 'this.billingFirstName' ) )
					
						local.struct["billingFirstName"] = getbillingFirstName();
					
				if(  isDefined( 'this.billingLastName' ) )
					
						local.struct["billingLastName"] = getbillingLastName();
					
				if(  isDefined( 'this.shippingBusinessName' ) )
					
						local.struct["shippingBusinessName"] = getshippingBusinessName();
					
				if(  isDefined( 'this.shippingFirstName' ) )
					
						local.struct["shippingFirstName"] = getshippingFirstName();
					
				if(  isDefined( 'this.shippingLastName' ) )
					
						local.struct["shippingLastName"] = getshippingLastName();
					
				if(  isDefined( 'this.totalAmount' ) )
					
						local.struct["totalAmount"] = gettotalAmount();
					
				if(  isDefined( 'this.currencyCode' ) )
					
						local.struct["currencyCode"] = getcurrencyCode();
					
				if(  isDefined( 'this.invoiceDate' ) )
					
						local.struct["invoiceDate"] = getinvoiceDate();
					
				if(  isDefined( 'this.dueDate' ) )
					
						local.struct["dueDate"] = getdueDate();
					
				if(  isDefined( 'this.status' ) )
					
						local.struct["status"] = getstatus().getStruct();
					
				if(  isDefined( 'this.origin' ) )
					
						local.struct["origin"] = getorigin().getStruct();
					
				if(  isDefined( 'this.referrerCode' ) )
					
						local.struct["referrerCode"] = getreferrerCode().getStruct();
					
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
						
						if('#key#' eq 'invoiceID') {
						
							this.setinvoiceID(local.json[key]);
						}
						
						if('#key#' eq 'merchantEmail') {
						
							this.setmerchantEmail(local.json[key]);
						}
						
						if('#key#' eq 'payerEmail') {
						
							this.setpayerEmail(local.json[key]);
						}
						
						if('#key#' eq 'number') {
						
							this.setnumber(local.json[key]);
						}
						
						if('#key#' eq 'billingBusinessName') {
						
							this.setbillingBusinessName(local.json[key]);
						}
						
						if('#key#' eq 'billingFirstName') {
						
							this.setbillingFirstName(local.json[key]);
						}
						
						if('#key#' eq 'billingLastName') {
						
							this.setbillingLastName(local.json[key]);
						}
						
						if('#key#' eq 'shippingBusinessName') {
						
							this.setshippingBusinessName(local.json[key]);
						}
						
						if('#key#' eq 'shippingFirstName') {
						
							this.setshippingFirstName(local.json[key]);
						}
						
						if('#key#' eq 'shippingLastName') {
						
							this.setshippingLastName(local.json[key]);
						}
						
						if('#key#' eq 'totalAmount') {
						
							this.settotalAmount(local.json[key]);
						}
						
						if('#key#' eq 'currencyCode') {
						
							this.setcurrencyCode(local.json[key]);
						}
						
						if('#key#' eq 'invoiceDate') {
						
							this.setinvoiceDate(local.json[key]);
						}
						
						if('#key#' eq 'dueDate') {
						
							this.setdueDate(local.json[key]);
						}
						
						if('#key#' eq 'status') {
						
							var keyCom = 'status';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setstatus( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'origin') {
						
							var keyCom = 'origin';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setorigin( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'referrerCode') {
						
							var keyCom = 'referrerCode';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setreferrerCode( keyObj.deserialize(local.json[key]) );
							
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
							
							this.setinvoiceID(local.json[i]);
							
							this.setmerchantEmail(local.json[i]);
							
							this.setpayerEmail(local.json[i]);
							
							this.setnumber(local.json[i]);
							
							this.setbillingBusinessName(local.json[i]);
							
							this.setbillingFirstName(local.json[i]);
							
							this.setbillingLastName(local.json[i]);
							
							this.setshippingBusinessName(local.json[i]);
							
							this.setshippingFirstName(local.json[i]);
							
							this.setshippingLastName(local.json[i]);
							
							this.settotalAmount(local.json[i]);
							
							this.setcurrencyCode(local.json[i]);
							
							this.setinvoiceDate(local.json[i]);
							
							this.setdueDate(local.json[i]);
							
							this.setstatus(local.json[i]);
							
							this.setorigin(local.json[i]);
							
							this.setreferrerCode(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'invoiceID') {
							
								this.setinvoiceID(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'merchantEmail') {
							
								this.setmerchantEmail(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'payerEmail') {
							
								this.setpayerEmail(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'number') {
							
								this.setnumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'billingBusinessName') {
							
								this.setbillingBusinessName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'billingFirstName') {
							
								this.setbillingFirstName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'billingLastName') {
							
								this.setbillingLastName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'shippingBusinessName') {
							
								this.setshippingBusinessName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'shippingFirstName') {
							
								this.setshippingFirstName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'shippingLastName') {
							
								this.setshippingLastName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'totalAmount') {
							
								this.settotalAmount(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'currencyCode') {
							
								this.setcurrencyCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'invoiceDate') {
							
								this.setinvoiceDate(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'dueDate') {
							
								this.setdueDate(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'status') {
							
                             var keyCom = 'status';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setstatus( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'origin') {
							
                             var keyCom = 'origin';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setorigin( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'referrerCode') {
							
                             var keyCom = 'referrerCode';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setreferrerCode( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
