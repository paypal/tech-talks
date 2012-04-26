
		<cfscript>
		component name="SearchParametersType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="email"  type="string" display="email" required="no" hint="
								Email search string.
							";
			
			property name="recipientName"  type="string" display="recipientName" required="no" hint="
								Recipient search string.
							";
			
			property name="businessName"  type="string" display="businessName" required="no" hint="
								Company search string.
							";
			
			property name="invoiceNumber"  type="string" display="invoiceNumber" required="no" hint="
								Invoice number search string.
							";
			
			property name="status"  type="StatusType" display="status" required="no" hint="
								Invoice status search.
							";
			
			property name="lowerAmount"  type="numeric" display="lowerAmount" required="no" hint="
								Invoice amount search.  Specifies the smallest amount to be returned.
							";
			
			property name="upperAmount"  type="numeric" display="upperAmount" required="no" hint="
								Invoice amount search.  Specifies the largest amount to be returned.
							";
			
			property name="currencyCode"  type="string" display="currencyCode" required="no" hint="
								Currency used for lower and upper amounts.  Required when lowerAmount or upperAmount is specified.
							";
			
			property name="memo"  type="string" display="memo" required="no" hint="
								Invoice memo search string.
							";
			
			property name="origin"  type="OriginType" display="origin" required="no" hint="
								Whether the invoice was created via the website or via an API call.
							";
			
			property name="invoiceDate"  type="DateRangeType" display="invoiceDate" required="no" hint="
								Invoice date range filter.
							";
			
			property name="dueDate"  type="DateRangeType" display="dueDate" required="no" hint="
								Invoice due date range filter.
							";
			
			property name="paymentDate"  type="DateRangeType" display="paymentDate" required="no" hint="
								Invoice payment date range filter.
							";
			
			property name="creationDate"  type="DateRangeType" display="creationDate" required="no" hint="
								Invoice creation date range filter.
							";
			
			
			public SearchParametersType function init( )
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
				
				
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
			
			
			public void function setemail(string email)
			{
				this.email = arguments.email;
			}  
				
			public string function getemail()
			{
				return this.email;
			} 
			
			
			public void function setrecipientName(string recipientName)
			{
				this.recipientName = arguments.recipientName;
			}  
				
			public string function getrecipientName()
			{
				return this.recipientName;
			} 
			
			
			public void function setbusinessName(string businessName)
			{
				this.businessName = arguments.businessName;
			}  
				
			public string function getbusinessName()
			{
				return this.businessName;
			} 
			
			
			public void function setinvoiceNumber(string invoiceNumber)
			{
				this.invoiceNumber = arguments.invoiceNumber;
			}  
				
			public string function getinvoiceNumber()
			{
				return this.invoiceNumber;
			} 
			
			
			public void function setstatus(StatusType status)
			{
				this.status = arguments.status;
			}  
				
			public StatusType function getstatus()
			{
				return this.status;
			} 
			
			
			public void function setlowerAmount(numeric lowerAmount)
			{
				this.lowerAmount = arguments.lowerAmount;
			}  
				
			public numeric function getlowerAmount()
			{
				return this.lowerAmount;
			} 
			
			
			public void function setupperAmount(numeric upperAmount)
			{
				this.upperAmount = arguments.upperAmount;
			}  
				
			public numeric function getupperAmount()
			{
				return this.upperAmount;
			} 
			
			
			public void function setcurrencyCode(string currencyCode)
			{
				this.currencyCode = arguments.currencyCode;
			}  
				
			public string function getcurrencyCode()
			{
				return this.currencyCode;
			} 
			
			
			public void function setmemo(string memo)
			{
				this.memo = arguments.memo;
			}  
				
			public string function getmemo()
			{
				return this.memo;
			} 
			
			
			public void function setorigin(OriginType origin)
			{
				this.origin = arguments.origin;
			}  
				
			public OriginType function getorigin()
			{
				return this.origin;
			} 
			
			
			public void function setinvoiceDate(DateRangeType invoiceDate)
			{
				this.invoiceDate = arguments.invoiceDate;
			}  
				
			public DateRangeType function getinvoiceDate()
			{
				return this.invoiceDate;
			} 
			
			
			public void function setdueDate(DateRangeType dueDate)
			{
				this.dueDate = arguments.dueDate;
			}  
				
			public DateRangeType function getdueDate()
			{
				return this.dueDate;
			} 
			
			
			public void function setpaymentDate(DateRangeType paymentDate)
			{
				this.paymentDate = arguments.paymentDate;
			}  
				
			public DateRangeType function getpaymentDate()
			{
				return this.paymentDate;
			} 
			
			
			public void function setcreationDate(DateRangeType creationDate)
			{
				this.creationDate = arguments.creationDate;
			}  
				
			public DateRangeType function getcreationDate()
			{
				return this.creationDate;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.email' ) )
					
						local.struct["email"] = getemail();
					
				if(  isDefined( 'this.recipientName' ) )
					
						local.struct["recipientName"] = getrecipientName();
					
				if(  isDefined( 'this.businessName' ) )
					
						local.struct["businessName"] = getbusinessName();
					
				if(  isDefined( 'this.invoiceNumber' ) )
					
						local.struct["invoiceNumber"] = getinvoiceNumber();
					
				if(  isDefined( 'this.status' ) )
					
						local.struct["status"] = getstatus().getStruct();
					
				if(  isDefined( 'this.lowerAmount' ) )
					
						local.struct["lowerAmount"] = getlowerAmount();
					
				if(  isDefined( 'this.upperAmount' ) )
					
						local.struct["upperAmount"] = getupperAmount();
					
				if(  isDefined( 'this.currencyCode' ) )
					
						local.struct["currencyCode"] = getcurrencyCode();
					
				if(  isDefined( 'this.memo' ) )
					
						local.struct["memo"] = getmemo();
					
				if(  isDefined( 'this.origin' ) )
					
						local.struct["origin"] = getorigin().getStruct();
					
				if(  isDefined( 'this.invoiceDate' ) )
					
						local.struct["invoiceDate"] = getinvoiceDate().getStruct();
					
				if(  isDefined( 'this.dueDate' ) )
					
						local.struct["dueDate"] = getdueDate().getStruct();
					
				if(  isDefined( 'this.paymentDate' ) )
					
						local.struct["paymentDate"] = getpaymentDate().getStruct();
					
				if(  isDefined( 'this.creationDate' ) )
					
						local.struct["creationDate"] = getcreationDate().getStruct();
					
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
						
						if('#key#' eq 'email') {
						
							this.setemail(local.json[key]);
						}
						
						if('#key#' eq 'recipientName') {
						
							this.setrecipientName(local.json[key]);
						}
						
						if('#key#' eq 'businessName') {
						
							this.setbusinessName(local.json[key]);
						}
						
						if('#key#' eq 'invoiceNumber') {
						
							this.setinvoiceNumber(local.json[key]);
						}
						
						if('#key#' eq 'status') {
						
							var keyCom = 'status';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setstatus( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'lowerAmount') {
						
							this.setlowerAmount(local.json[key]);
						}
						
						if('#key#' eq 'upperAmount') {
						
							this.setupperAmount(local.json[key]);
						}
						
						if('#key#' eq 'currencyCode') {
						
							this.setcurrencyCode(local.json[key]);
						}
						
						if('#key#' eq 'memo') {
						
							this.setmemo(local.json[key]);
						}
						
						if('#key#' eq 'origin') {
						
							var keyCom = 'origin';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setorigin( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'invoiceDate') {
						
							var keyCom = 'invoiceDate';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setinvoiceDate( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'dueDate') {
						
							var keyCom = 'dueDate';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setdueDate( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'paymentDate') {
						
							var keyCom = 'paymentDate';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setpaymentDate( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'creationDate') {
						
							var keyCom = 'creationDate';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setcreationDate( keyObj.deserialize(local.json[key]) );
							
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
							
							this.setemail(local.json[i]);
							
							this.setrecipientName(local.json[i]);
							
							this.setbusinessName(local.json[i]);
							
							this.setinvoiceNumber(local.json[i]);
							
							this.setstatus(local.json[i]);
							
							this.setlowerAmount(local.json[i]);
							
							this.setupperAmount(local.json[i]);
							
							this.setcurrencyCode(local.json[i]);
							
							this.setmemo(local.json[i]);
							
							this.setorigin(local.json[i]);
							
							this.setinvoiceDate(local.json[i]);
							
							this.setdueDate(local.json[i]);
							
							this.setpaymentDate(local.json[i]);
							
							this.setcreationDate(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'email') {
							
								this.setemail(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'recipientName') {
							
								this.setrecipientName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'businessName') {
							
								this.setbusinessName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'invoiceNumber') {
							
								this.setinvoiceNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'status') {
							
                             var keyCom = 'status';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setstatus( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'lowerAmount') {
							
								this.setlowerAmount(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'upperAmount') {
							
								this.setupperAmount(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'currencyCode') {
							
								this.setcurrencyCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'memo') {
							
								this.setmemo(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'origin') {
							
                             var keyCom = 'origin';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setorigin( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'invoiceDate') {
							
                             var keyCom = 'invoiceDate';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setinvoiceDate( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'dueDate') {
							
                             var keyCom = 'dueDate';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setdueDate( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'paymentDate') {
							
                             var keyCom = 'paymentDate';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setpaymentDate( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'creationDate') {
							
                             var keyCom = 'creationDate';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setcreationDate( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
