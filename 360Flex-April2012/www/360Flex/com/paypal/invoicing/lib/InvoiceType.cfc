
		<cfscript>
		component name="InvoiceType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="merchantEmail"  type="string" display="merchantEmail" required="yes" hint="
								Merchant's email.
							";
			
			property name="payerEmail"  type="string" display="payerEmail" required="yes" hint="
								Email to which the invoice will be sent.
							";
			
			property name="number"  type="string" display="number" required="no" hint="
								Unique identifier for the invoice.
							";
			
			property name="merchantInfo"  type="BusinessInfoType" display="merchantInfo" required="no" hint="
								Company contact information of the merchant company sending the invoice.
							";
			
			property name="itemList"  type="InvoiceItemListType" display="itemList" required="yes" hint="
								List of items included in this invoice.
							";
			
			property name="currencyCode"  type="string" display="currencyCode" required="yes" hint="
								Currency used for all invoice item amounts and totals.
							";
			
			property name="invoiceDate"  type="string" display="invoiceDate" required="no" hint="
								Date on which the invoice will be enabled.
							";
			
			property name="dueDate"  type="string" display="dueDate" required="no" hint="
								Date on which the invoice payment is due.
							";
			
			property name="paymentTerms"  type="PaymentTermsType" display="paymentTerms" required="yes" hint="
								Terms by which the invoice payment is due.
							";
			
			property name="discountPercent"  type="numeric" display="discountPercent" required="no" hint="
								A discount percent applied to the invoice, if any.
							";
			
			property name="discountAmount"  type="numeric" display="discountAmount" required="no" hint="
								A discount amount applied to the invoice, if any.  If DiscountPercent is provided, DiscountAmount is ignored.
							";
			
			property name="terms"  type="string" display="terms" required="no" hint="
								General terms for the invoice.
							";
			
			property name="note"  type="string" display="note" required="no" hint="
								Note to the payer company.
							";
			
			property name="merchantMemo"  type="string" display="merchantMemo" required="no" hint="
								Memo for book keeping that is private to the Merchant.
							";
			
			property name="billingInfo"  type="BusinessInfoType" display="billingInfo" required="no" hint="
								Billing information for the payer.
							";
			
			property name="shippingInfo"  type="BusinessInfoType" display="shippingInfo" required="no" hint="
								Shipping information for the payer.
							";
			
			property name="shippingAmount"  type="numeric" display="shippingAmount" required="no" hint="
								Cost of shipping.
							";
			
			property name="shippingTaxName"  type="string" display="shippingTaxName" required="no" hint="
								Name of the applicable tax on shipping cost, if any.
							";
			
			property name="shippingTaxRate"  type="numeric" display="shippingTaxRate" required="no" hint="
								Rate of the applicable tax on shipping cost, if any.
							";
			
			property name="logoUrl"  type="string" display="logoUrl" required="no" hint="
								The external image URL of the invoice's logo, if any
							";
			
			property name="referrerCode"  type="ReferrerCode" display="referrerCode" required="no" hint="
								BN code for tracking transactions with a particular partner. 
							";
			
			
			public InvoiceType function init( string merchantEmail="", string payerEmail="", InvoiceItemListType itemList="", string currencyCode="", PaymentTermsType paymentTerms="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setmerchantEmail(arguments.merchantEmail);
					
						this.setpayerEmail(arguments.payerEmail);
					
						this.setitemList(arguments.itemList);
					
						this.setcurrencyCode(arguments.currencyCode);
					
						this.setpaymentTerms(arguments.paymentTerms);
					
				
				
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
			
			
			public void function setmerchantInfo(BusinessInfoType merchantInfo)
			{
				this.merchantInfo = arguments.merchantInfo;
			}  
				
			public BusinessInfoType function getmerchantInfo()
			{
				return this.merchantInfo;
			} 
			
			
			public void function setitemList(InvoiceItemListType itemList)
			{
				this.itemList = arguments.itemList;
			}  
				
			public InvoiceItemListType function getitemList()
			{
				return this.itemList;
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
			
			
			public void function setpaymentTerms(PaymentTermsType paymentTerms)
			{
				this.paymentTerms = arguments.paymentTerms;
			}  
				
			public PaymentTermsType function getpaymentTerms()
			{
				return this.paymentTerms;
			} 
			
			
			public void function setdiscountPercent(numeric discountPercent)
			{
				this.discountPercent = arguments.discountPercent;
			}  
				
			public numeric function getdiscountPercent()
			{
				return this.discountPercent;
			} 
			
			
			public void function setdiscountAmount(numeric discountAmount)
			{
				this.discountAmount = arguments.discountAmount;
			}  
				
			public numeric function getdiscountAmount()
			{
				return this.discountAmount;
			} 
			
			
			public void function setterms(string terms)
			{
				this.terms = arguments.terms;
			}  
				
			public string function getterms()
			{
				return this.terms;
			} 
			
			
			public void function setnote(string note)
			{
				this.note = arguments.note;
			}  
				
			public string function getnote()
			{
				return this.note;
			} 
			
			
			public void function setmerchantMemo(string merchantMemo)
			{
				this.merchantMemo = arguments.merchantMemo;
			}  
				
			public string function getmerchantMemo()
			{
				return this.merchantMemo;
			} 
			
			
			public void function setbillingInfo(BusinessInfoType billingInfo)
			{
				this.billingInfo = arguments.billingInfo;
			}  
				
			public BusinessInfoType function getbillingInfo()
			{
				return this.billingInfo;
			} 
			
			
			public void function setshippingInfo(BusinessInfoType shippingInfo)
			{
				this.shippingInfo = arguments.shippingInfo;
			}  
				
			public BusinessInfoType function getshippingInfo()
			{
				return this.shippingInfo;
			} 
			
			
			public void function setshippingAmount(numeric shippingAmount)
			{
				this.shippingAmount = arguments.shippingAmount;
			}  
				
			public numeric function getshippingAmount()
			{
				return this.shippingAmount;
			} 
			
			
			public void function setshippingTaxName(string shippingTaxName)
			{
				this.shippingTaxName = arguments.shippingTaxName;
			}  
				
			public string function getshippingTaxName()
			{
				return this.shippingTaxName;
			} 
			
			
			public void function setshippingTaxRate(numeric shippingTaxRate)
			{
				this.shippingTaxRate = arguments.shippingTaxRate;
			}  
				
			public numeric function getshippingTaxRate()
			{
				return this.shippingTaxRate;
			} 
			
			
			public void function setlogoUrl(string logoUrl)
			{
				this.logoUrl = arguments.logoUrl;
			}  
				
			public string function getlogoUrl()
			{
				return this.logoUrl;
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
						
				
				if(  isDefined( 'this.merchantEmail' ) )
					
						local.struct["merchantEmail"] = getmerchantEmail();
					
				if(  isDefined( 'this.payerEmail' ) )
					
						local.struct["payerEmail"] = getpayerEmail();
					
				if(  isDefined( 'this.number' ) )
					
						local.struct["number"] = getnumber();
					
				if(  isDefined( 'this.merchantInfo' ) )
					
						local.struct["merchantInfo"] = getmerchantInfo().getStruct();
					
				if(  isDefined( 'this.itemList' ) )
					
						local.struct["itemList"] = getitemList().getStruct();
					
				if(  isDefined( 'this.currencyCode' ) )
					
						local.struct["currencyCode"] = getcurrencyCode();
					
				if(  isDefined( 'this.invoiceDate' ) )
					
						local.struct["invoiceDate"] = getinvoiceDate();
					
				if(  isDefined( 'this.dueDate' ) )
					
						local.struct["dueDate"] = getdueDate();
					
				if(  isDefined( 'this.paymentTerms' ) )
					
						local.struct["paymentTerms"] = getpaymentTerms().getStruct();
					
				if(  isDefined( 'this.discountPercent' ) )
					
						local.struct["discountPercent"] = getdiscountPercent();
					
				if(  isDefined( 'this.discountAmount' ) )
					
						local.struct["discountAmount"] = getdiscountAmount();
					
				if(  isDefined( 'this.terms' ) )
					
						local.struct["terms"] = getterms();
					
				if(  isDefined( 'this.note' ) )
					
						local.struct["note"] = getnote();
					
				if(  isDefined( 'this.merchantMemo' ) )
					
						local.struct["merchantMemo"] = getmerchantMemo();
					
				if(  isDefined( 'this.billingInfo' ) )
					
						local.struct["billingInfo"] = getbillingInfo().getStruct();
					
				if(  isDefined( 'this.shippingInfo' ) )
					
						local.struct["shippingInfo"] = getshippingInfo().getStruct();
					
				if(  isDefined( 'this.shippingAmount' ) )
					
						local.struct["shippingAmount"] = getshippingAmount();
					
				if(  isDefined( 'this.shippingTaxName' ) )
					
						local.struct["shippingTaxName"] = getshippingTaxName();
					
				if(  isDefined( 'this.shippingTaxRate' ) )
					
						local.struct["shippingTaxRate"] = getshippingTaxRate();
					
				if(  isDefined( 'this.logoUrl' ) )
					
						local.struct["logoUrl"] = getlogoUrl();
					
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
						
						if('#key#' eq 'merchantEmail') {
						
							this.setmerchantEmail(local.json[key]);
						}
						
						if('#key#' eq 'payerEmail') {
						
							this.setpayerEmail(local.json[key]);
						}
						
						if('#key#' eq 'number') {
						
							this.setnumber(local.json[key]);
						}
						
						if('#key#' eq 'merchantInfo') {
						
							var keyCom = 'merchantInfo';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setmerchantInfo( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'itemList') {
						
							var keyCom = 'itemList';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setitemList( keyObj.deserialize(local.json[key]) );
							
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
						
						if('#key#' eq 'paymentTerms') {
						
							var keyCom = 'paymentTerms';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setpaymentTerms( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'discountPercent') {
						
							this.setdiscountPercent(local.json[key]);
						}
						
						if('#key#' eq 'discountAmount') {
						
							this.setdiscountAmount(local.json[key]);
						}
						
						if('#key#' eq 'terms') {
						
							this.setterms(local.json[key]);
						}
						
						if('#key#' eq 'note') {
						
							this.setnote(local.json[key]);
						}
						
						if('#key#' eq 'merchantMemo') {
						
							this.setmerchantMemo(local.json[key]);
						}
						
						if('#key#' eq 'billingInfo') {
						
							var keyCom = 'billingInfo';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setbillingInfo( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'shippingInfo') {
						
							var keyCom = 'shippingInfo';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setshippingInfo( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'shippingAmount') {
						
							this.setshippingAmount(local.json[key]);
						}
						
						if('#key#' eq 'shippingTaxName') {
						
							this.setshippingTaxName(local.json[key]);
						}
						
						if('#key#' eq 'shippingTaxRate') {
						
							this.setshippingTaxRate(local.json[key]);
						}
						
						if('#key#' eq 'logoUrl') {
						
							this.setlogoUrl(local.json[key]);
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
							
							this.setmerchantEmail(local.json[i]);
							
							this.setpayerEmail(local.json[i]);
							
							this.setnumber(local.json[i]);
							
							this.setmerchantInfo(local.json[i]);
							
							this.setitemList(local.json[i]);
							
							this.setcurrencyCode(local.json[i]);
							
							this.setinvoiceDate(local.json[i]);
							
							this.setdueDate(local.json[i]);
							
							this.setpaymentTerms(local.json[i]);
							
							this.setdiscountPercent(local.json[i]);
							
							this.setdiscountAmount(local.json[i]);
							
							this.setterms(local.json[i]);
							
							this.setnote(local.json[i]);
							
							this.setmerchantMemo(local.json[i]);
							
							this.setbillingInfo(local.json[i]);
							
							this.setshippingInfo(local.json[i]);
							
							this.setshippingAmount(local.json[i]);
							
							this.setshippingTaxName(local.json[i]);
							
							this.setshippingTaxRate(local.json[i]);
							
							this.setlogoUrl(local.json[i]);
							
							this.setreferrerCode(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'merchantEmail') {
							
								this.setmerchantEmail(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'payerEmail') {
							
								this.setpayerEmail(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'number') {
							
								this.setnumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'merchantInfo') {
							
                             var keyCom = 'merchantInfo';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setmerchantInfo( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'itemList') {
							
                             var keyCom = 'itemList';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setitemList( keyObj.deserialize(local.json[i][key]) );
								
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
											
							
							if('#key#' eq 'paymentTerms') {
							
                             var keyCom = 'paymentTerms';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setpaymentTerms( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'discountPercent') {
							
								this.setdiscountPercent(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'discountAmount') {
							
								this.setdiscountAmount(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'terms') {
							
								this.setterms(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'note') {
							
								this.setnote(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'merchantMemo') {
							
								this.setmerchantMemo(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'billingInfo') {
							
                             var keyCom = 'billingInfo';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setbillingInfo( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'shippingInfo') {
							
                             var keyCom = 'shippingInfo';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setshippingInfo( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'shippingAmount') {
							
								this.setshippingAmount(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'shippingTaxName') {
							
								this.setshippingTaxName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'shippingTaxRate') {
							
								this.setshippingTaxRate(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'logoUrl') {
							
								this.setlogoUrl(local.json[i][key]);
							
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
		
