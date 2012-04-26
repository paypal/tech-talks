
		<cfscript>
		component name="AddPaymentCardRequest" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
			
			property name="emailAddress"  type="string" display="emailAddress" required="no" hint="
								Identifying the PayPal account to which this request is targetted to.
								Caller of this API has to either provided an emailAddress or an accountId.
							";
			
			property name="accountId"  type="string" display="accountId" required="no" hint="
								Identifying the PayPal account to which this request is targetted to.
								Caller of this API has to either provided an emailAddress or an accountId.
							";
			
			property name="createAccountKey"  type="string" display="createAccountKey" required="no" hint="";
			
			property name="nameOnCard"  type="numeric" display="nameOnCard" required="yes" hint="";
			
			property name="billingAddress"  type="numeric" display="billingAddress" required="yes" hint="";
			
			property name="cardOwnerDateOfBirth"  type="numeric" display="cardOwnerDateOfBirth" required="no" hint="";
			
			property name="cardNumber"  type="string" display="cardNumber" required="yes" hint="";
			
			property name="cardType"  type="numeric" display="cardType" required="yes" hint="";
			
			property name="expirationDate"  type="numeric" display="expirationDate" required="no" hint="";
			
			property name="cardVerificationNumber"  type="string" display="cardVerificationNumber" required="no" hint="
								CVV2: Proivde only for requests where 
								confirmationType is None (Direct request)
							";
			
			property name="startDate"  type="numeric" display="startDate" required="no" hint="";
			
			property name="issueNumber"  type="string" display="issueNumber" required="no" hint="
                                Up to 2 digit for Switch/Maestro/Solo cards.
                            ";
			
			property name="confirmationType"  type="numeric" display="confirmationType" required="yes" hint="";
			
			property name="webOptions"  type="numeric" display="webOptions" required="no" hint="";
			
			
			public AddPaymentCardRequest function init( RequestEnvelope requestEnvelope="", numeric nameOnCard="", numeric billingAddress="", string cardNumber="", numeric cardType="", numeric confirmationType="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setrequestEnvelope(arguments.requestEnvelope);
					
						this.setnameOnCard(arguments.nameOnCard);
					
						this.setbillingAddress(arguments.billingAddress);
					
						this.setcardNumber(arguments.cardNumber);
					
						this.setcardType(arguments.cardType);
					
						this.setconfirmationType(arguments.confirmationType);
					
				
				
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
			
			
			public void function setemailAddress(string emailAddress)
			{
				this.emailAddress = arguments.emailAddress;
			}  
				
			public string function getemailAddress()
			{
				return this.emailAddress;
			} 
			
			
			public void function setaccountId(string accountId)
			{
				this.accountId = arguments.accountId;
			}  
				
			public string function getaccountId()
			{
				return this.accountId;
			} 
			
			
			public void function setcreateAccountKey(string createAccountKey)
			{
				this.createAccountKey = arguments.createAccountKey;
			}  
				
			public string function getcreateAccountKey()
			{
				return this.createAccountKey;
			} 
			
			
			public void function setnameOnCard(numeric nameOnCard)
			{
				this.nameOnCard = arguments.nameOnCard;
			}  
				
			public numeric function getnameOnCard()
			{
				return this.nameOnCard;
			} 
			
			
			public void function setbillingAddress(numeric billingAddress)
			{
				this.billingAddress = arguments.billingAddress;
			}  
				
			public numeric function getbillingAddress()
			{
				return this.billingAddress;
			} 
			
			
			public void function setcardOwnerDateOfBirth(numeric cardOwnerDateOfBirth)
			{
				this.cardOwnerDateOfBirth = arguments.cardOwnerDateOfBirth;
			}  
				
			public numeric function getcardOwnerDateOfBirth()
			{
				return this.cardOwnerDateOfBirth;
			} 
			
			
			public void function setcardNumber(string cardNumber)
			{
				this.cardNumber = arguments.cardNumber;
			}  
				
			public string function getcardNumber()
			{
				return this.cardNumber;
			} 
			
			
			public void function setcardType(numeric cardType)
			{
				this.cardType = arguments.cardType;
			}  
				
			public numeric function getcardType()
			{
				return this.cardType;
			} 
			
			
			public void function setexpirationDate(numeric expirationDate)
			{
				this.expirationDate = arguments.expirationDate;
			}  
				
			public numeric function getexpirationDate()
			{
				return this.expirationDate;
			} 
			
			
			public void function setcardVerificationNumber(string cardVerificationNumber)
			{
				this.cardVerificationNumber = arguments.cardVerificationNumber;
			}  
				
			public string function getcardVerificationNumber()
			{
				return this.cardVerificationNumber;
			} 
			
			
			public void function setstartDate(numeric startDate)
			{
				this.startDate = arguments.startDate;
			}  
				
			public numeric function getstartDate()
			{
				return this.startDate;
			} 
			
			
			public void function setissueNumber(string issueNumber)
			{
				this.issueNumber = arguments.issueNumber;
			}  
				
			public string function getissueNumber()
			{
				return this.issueNumber;
			} 
			
			
			public void function setconfirmationType(numeric confirmationType)
			{
				this.confirmationType = arguments.confirmationType;
			}  
				
			public numeric function getconfirmationType()
			{
				return this.confirmationType;
			} 
			
			
			public void function setwebOptions(numeric webOptions)
			{
				this.webOptions = arguments.webOptions;
			}  
				
			public numeric function getwebOptions()
			{
				return this.webOptions;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.requestEnvelope' ) )
					
						local.struct["requestEnvelope"] = getrequestEnvelope().getStruct();
					
				if(  isDefined( 'this.emailAddress' ) )
					
						local.struct["emailAddress"] = getemailAddress();
					
				if(  isDefined( 'this.accountId' ) )
					
						local.struct["accountId"] = getaccountId();
					
				if(  isDefined( 'this.createAccountKey' ) )
					
						local.struct["createAccountKey"] = getcreateAccountKey();
					
				if(  isDefined( 'this.nameOnCard' ) )
					
						local.struct["nameOnCard"] = getnameOnCard();
					
				if(  isDefined( 'this.billingAddress' ) )
					
						local.struct["billingAddress"] = getbillingAddress();
					
				if(  isDefined( 'this.cardOwnerDateOfBirth' ) )
					
						local.struct["cardOwnerDateOfBirth"] = getcardOwnerDateOfBirth();
					
				if(  isDefined( 'this.cardNumber' ) )
					
						local.struct["cardNumber"] = getcardNumber();
					
				if(  isDefined( 'this.cardType' ) )
					
						local.struct["cardType"] = getcardType();
					
				if(  isDefined( 'this.expirationDate' ) )
					
						local.struct["expirationDate"] = getexpirationDate();
					
				if(  isDefined( 'this.cardVerificationNumber' ) )
					
						local.struct["cardVerificationNumber"] = getcardVerificationNumber();
					
				if(  isDefined( 'this.startDate' ) )
					
						local.struct["startDate"] = getstartDate();
					
				if(  isDefined( 'this.issueNumber' ) )
					
						local.struct["issueNumber"] = getissueNumber();
					
				if(  isDefined( 'this.confirmationType' ) )
					
						local.struct["confirmationType"] = getconfirmationType();
					
				if(  isDefined( 'this.webOptions' ) )
					
						local.struct["webOptions"] = getwebOptions();
					
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
						
						if('#key#' eq 'emailAddress') {
						
							this.setemailAddress(local.json[key]);
						}
						
						if('#key#' eq 'accountId') {
						
							this.setaccountId(local.json[key]);
						}
						
						if('#key#' eq 'createAccountKey') {
						
							this.setcreateAccountKey(local.json[key]);
						}
						
						if('#key#' eq 'nameOnCard') {
						
							this.setnameOnCard(local.json[key]);
						}
						
						if('#key#' eq 'billingAddress') {
						
							this.setbillingAddress(local.json[key]);
						}
						
						if('#key#' eq 'cardOwnerDateOfBirth') {
						
							this.setcardOwnerDateOfBirth(local.json[key]);
						}
						
						if('#key#' eq 'cardNumber') {
						
							this.setcardNumber(local.json[key]);
						}
						
						if('#key#' eq 'cardType') {
						
							this.setcardType(local.json[key]);
						}
						
						if('#key#' eq 'expirationDate') {
						
							this.setexpirationDate(local.json[key]);
						}
						
						if('#key#' eq 'cardVerificationNumber') {
						
							this.setcardVerificationNumber(local.json[key]);
						}
						
						if('#key#' eq 'startDate') {
						
							this.setstartDate(local.json[key]);
						}
						
						if('#key#' eq 'issueNumber') {
						
							this.setissueNumber(local.json[key]);
						}
						
						if('#key#' eq 'confirmationType') {
						
							this.setconfirmationType(local.json[key]);
						}
						
						if('#key#' eq 'webOptions') {
						
							this.setwebOptions(local.json[key]);
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
							
							this.setemailAddress(local.json[i]);
							
							this.setaccountId(local.json[i]);
							
							this.setcreateAccountKey(local.json[i]);
							
							this.setnameOnCard(local.json[i]);
							
							this.setbillingAddress(local.json[i]);
							
							this.setcardOwnerDateOfBirth(local.json[i]);
							
							this.setcardNumber(local.json[i]);
							
							this.setcardType(local.json[i]);
							
							this.setexpirationDate(local.json[i]);
							
							this.setcardVerificationNumber(local.json[i]);
							
							this.setstartDate(local.json[i]);
							
							this.setissueNumber(local.json[i]);
							
							this.setconfirmationType(local.json[i]);
							
							this.setwebOptions(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'requestEnvelope') {
							
								
								var keyObj = createObject("component",'#keyCom#');
								this.setrequestEnvelope( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'emailAddress') {
							
								this.setemailAddress(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'accountId') {
							
								this.setaccountId(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'createAccountKey') {
							
								this.setcreateAccountKey(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'nameOnCard') {
							
								this.setnameOnCard(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'billingAddress') {
							
								this.setbillingAddress(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'cardOwnerDateOfBirth') {
							
								this.setcardOwnerDateOfBirth(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'cardNumber') {
							
								this.setcardNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'cardType') {
							
								this.setcardType(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'expirationDate') {
							
								this.setexpirationDate(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'cardVerificationNumber') {
							
								this.setcardVerificationNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'startDate') {
							
								this.setstartDate(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'issueNumber') {
							
								this.setissueNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'confirmationType') {
							
								this.setconfirmationType(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'webOptions') {
							
								this.setwebOptions(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
