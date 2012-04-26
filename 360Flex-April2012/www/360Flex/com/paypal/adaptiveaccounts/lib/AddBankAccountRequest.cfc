
		<cfscript>
		component name="AddBankAccountRequest" output="false"  hint="I define the properties and methods"
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
			
			property name="bankCountryCode"  type="string" display="bankCountryCode" required="yes" hint="
								Country code for the bank
							";
			
			property name="bankName"  type="string" display="bankName" required="no" hint="
								The defualt value is UNKNOWN.
							";
			
			property name="routingNumber"  type="string" display="routingNumber" required="no" hint="
								Bank routing or transit number
							";
			
			property name="bankAccountType"  type="numeric" display="bankAccountType" required="no" hint="";
			
			property name="bankAccountNumber"  type="string" display="bankAccountNumber" required="no" hint="
								Basic Bank Account Number (BBAN)
							";
			
			property name="iban"  type="string" display="iban" required="no" hint="
								International Bank Account Number (IBAN)
							";
			
			property name="clabe"  type="string" display="clabe" required="no" hint="
								CLABE represents the bank information for countries like Mexico
							";
			
			property name="bsbNumber"  type="string" display="bsbNumber" required="no" hint="
								Bank/State/Branch number
							";
			
			property name="branchLocation"  type="string" display="branchLocation" required="no" hint="
								Branch location
							";
			
			property name="sortCode"  type="string" display="sortCode" required="no" hint="
								Branch sort code.
							";
			
			property name="bankTransitNumber"  type="string" display="bankTransitNumber" required="no" hint="
								Bank transit number
							";
			
			property name="institutionNumber"  type="string" display="institutionNumber" required="no" hint="
								Institution number
							";
			
			property name="branchCode"  type="string" display="branchCode" required="no" hint="
								Branch code
							";
			
			property name="agencyNumber"  type="string" display="agencyNumber" required="no" hint="
								For Brazil Agency Number
							";
			
			property name="bankCode"  type="string" display="bankCode" required="no" hint="
								Bank code
							";
			
			property name="ribKey"  type="string" display="ribKey" required="no" hint="
								RIB key 
							";
			
			property name="controlDigit"  type="string" display="controlDigit" required="no" hint="
								control digits
							";
			
			property name="taxIdType"  type="string" display="taxIdType" required="no" hint="
								Tax id type of CNPJ or CPF, only supported for Brazil.
							";
			
			property name="taxIdNumber"  type="string" display="taxIdNumber" required="no" hint="
								Tax id number for Brazil.
							";
			
			property name="accountHolderDateOfBirth"  type="numeric" display="accountHolderDateOfBirth" required="no" hint="
								Date of birth of the account holder
							";
			
			property name="confirmationType"  type="numeric" display="confirmationType" required="yes" hint="";
			
			property name="webOptions"  type="numeric" display="webOptions" required="no" hint="";
			
			
			public AddBankAccountRequest function init( RequestEnvelope requestEnvelope="", string bankCountryCode="", numeric confirmationType="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setrequestEnvelope(arguments.requestEnvelope);
					
						this.setbankCountryCode(arguments.bankCountryCode);
					
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
			
			
			public void function setbankCountryCode(string bankCountryCode)
			{
				this.bankCountryCode = arguments.bankCountryCode;
			}  
				
			public string function getbankCountryCode()
			{
				return this.bankCountryCode;
			} 
			
			
			public void function setbankName(string bankName)
			{
				this.bankName = arguments.bankName;
			}  
				
			public string function getbankName()
			{
				return this.bankName;
			} 
			
			
			public void function setroutingNumber(string routingNumber)
			{
				this.routingNumber = arguments.routingNumber;
			}  
				
			public string function getroutingNumber()
			{
				return this.routingNumber;
			} 
			
			
			public void function setbankAccountType(numeric bankAccountType)
			{
				this.bankAccountType = arguments.bankAccountType;
			}  
				
			public numeric function getbankAccountType()
			{
				return this.bankAccountType;
			} 
			
			
			public void function setbankAccountNumber(string bankAccountNumber)
			{
				this.bankAccountNumber = arguments.bankAccountNumber;
			}  
				
			public string function getbankAccountNumber()
			{
				return this.bankAccountNumber;
			} 
			
			
			public void function setiban(string iban)
			{
				this.iban = arguments.iban;
			}  
				
			public string function getiban()
			{
				return this.iban;
			} 
			
			
			public void function setclabe(string clabe)
			{
				this.clabe = arguments.clabe;
			}  
				
			public string function getclabe()
			{
				return this.clabe;
			} 
			
			
			public void function setbsbNumber(string bsbNumber)
			{
				this.bsbNumber = arguments.bsbNumber;
			}  
				
			public string function getbsbNumber()
			{
				return this.bsbNumber;
			} 
			
			
			public void function setbranchLocation(string branchLocation)
			{
				this.branchLocation = arguments.branchLocation;
			}  
				
			public string function getbranchLocation()
			{
				return this.branchLocation;
			} 
			
			
			public void function setsortCode(string sortCode)
			{
				this.sortCode = arguments.sortCode;
			}  
				
			public string function getsortCode()
			{
				return this.sortCode;
			} 
			
			
			public void function setbankTransitNumber(string bankTransitNumber)
			{
				this.bankTransitNumber = arguments.bankTransitNumber;
			}  
				
			public string function getbankTransitNumber()
			{
				return this.bankTransitNumber;
			} 
			
			
			public void function setinstitutionNumber(string institutionNumber)
			{
				this.institutionNumber = arguments.institutionNumber;
			}  
				
			public string function getinstitutionNumber()
			{
				return this.institutionNumber;
			} 
			
			
			public void function setbranchCode(string branchCode)
			{
				this.branchCode = arguments.branchCode;
			}  
				
			public string function getbranchCode()
			{
				return this.branchCode;
			} 
			
			
			public void function setagencyNumber(string agencyNumber)
			{
				this.agencyNumber = arguments.agencyNumber;
			}  
				
			public string function getagencyNumber()
			{
				return this.agencyNumber;
			} 
			
			
			public void function setbankCode(string bankCode)
			{
				this.bankCode = arguments.bankCode;
			}  
				
			public string function getbankCode()
			{
				return this.bankCode;
			} 
			
			
			public void function setribKey(string ribKey)
			{
				this.ribKey = arguments.ribKey;
			}  
				
			public string function getribKey()
			{
				return this.ribKey;
			} 
			
			
			public void function setcontrolDigit(string controlDigit)
			{
				this.controlDigit = arguments.controlDigit;
			}  
				
			public string function getcontrolDigit()
			{
				return this.controlDigit;
			} 
			
			
			public void function settaxIdType(string taxIdType)
			{
				this.taxIdType = arguments.taxIdType;
			}  
				
			public string function gettaxIdType()
			{
				return this.taxIdType;
			} 
			
			
			public void function settaxIdNumber(string taxIdNumber)
			{
				this.taxIdNumber = arguments.taxIdNumber;
			}  
				
			public string function gettaxIdNumber()
			{
				return this.taxIdNumber;
			} 
			
			
			public void function setaccountHolderDateOfBirth(numeric accountHolderDateOfBirth)
			{
				this.accountHolderDateOfBirth = arguments.accountHolderDateOfBirth;
			}  
				
			public numeric function getaccountHolderDateOfBirth()
			{
				return this.accountHolderDateOfBirth;
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
					
				if(  isDefined( 'this.bankCountryCode' ) )
					
						local.struct["bankCountryCode"] = getbankCountryCode();
					
				if(  isDefined( 'this.bankName' ) )
					
						local.struct["bankName"] = getbankName();
					
				if(  isDefined( 'this.routingNumber' ) )
					
						local.struct["routingNumber"] = getroutingNumber();
					
				if(  isDefined( 'this.bankAccountType' ) )
					
						local.struct["bankAccountType"] = getbankAccountType();
					
				if(  isDefined( 'this.bankAccountNumber' ) )
					
						local.struct["bankAccountNumber"] = getbankAccountNumber();
					
				if(  isDefined( 'this.iban' ) )
					
						local.struct["iban"] = getiban();
					
				if(  isDefined( 'this.clabe' ) )
					
						local.struct["clabe"] = getclabe();
					
				if(  isDefined( 'this.bsbNumber' ) )
					
						local.struct["bsbNumber"] = getbsbNumber();
					
				if(  isDefined( 'this.branchLocation' ) )
					
						local.struct["branchLocation"] = getbranchLocation();
					
				if(  isDefined( 'this.sortCode' ) )
					
						local.struct["sortCode"] = getsortCode();
					
				if(  isDefined( 'this.bankTransitNumber' ) )
					
						local.struct["bankTransitNumber"] = getbankTransitNumber();
					
				if(  isDefined( 'this.institutionNumber' ) )
					
						local.struct["institutionNumber"] = getinstitutionNumber();
					
				if(  isDefined( 'this.branchCode' ) )
					
						local.struct["branchCode"] = getbranchCode();
					
				if(  isDefined( 'this.agencyNumber' ) )
					
						local.struct["agencyNumber"] = getagencyNumber();
					
				if(  isDefined( 'this.bankCode' ) )
					
						local.struct["bankCode"] = getbankCode();
					
				if(  isDefined( 'this.ribKey' ) )
					
						local.struct["ribKey"] = getribKey();
					
				if(  isDefined( 'this.controlDigit' ) )
					
						local.struct["controlDigit"] = getcontrolDigit();
					
				if(  isDefined( 'this.taxIdType' ) )
					
						local.struct["taxIdType"] = gettaxIdType();
					
				if(  isDefined( 'this.taxIdNumber' ) )
					
						local.struct["taxIdNumber"] = gettaxIdNumber();
					
				if(  isDefined( 'this.accountHolderDateOfBirth' ) )
					
						local.struct["accountHolderDateOfBirth"] = getaccountHolderDateOfBirth();
					
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
						
						if('#key#' eq 'bankCountryCode') {
						
							this.setbankCountryCode(local.json[key]);
						}
						
						if('#key#' eq 'bankName') {
						
							this.setbankName(local.json[key]);
						}
						
						if('#key#' eq 'routingNumber') {
						
							this.setroutingNumber(local.json[key]);
						}
						
						if('#key#' eq 'bankAccountType') {
						
							this.setbankAccountType(local.json[key]);
						}
						
						if('#key#' eq 'bankAccountNumber') {
						
							this.setbankAccountNumber(local.json[key]);
						}
						
						if('#key#' eq 'iban') {
						
							this.setiban(local.json[key]);
						}
						
						if('#key#' eq 'clabe') {
						
							this.setclabe(local.json[key]);
						}
						
						if('#key#' eq 'bsbNumber') {
						
							this.setbsbNumber(local.json[key]);
						}
						
						if('#key#' eq 'branchLocation') {
						
							this.setbranchLocation(local.json[key]);
						}
						
						if('#key#' eq 'sortCode') {
						
							this.setsortCode(local.json[key]);
						}
						
						if('#key#' eq 'bankTransitNumber') {
						
							this.setbankTransitNumber(local.json[key]);
						}
						
						if('#key#' eq 'institutionNumber') {
						
							this.setinstitutionNumber(local.json[key]);
						}
						
						if('#key#' eq 'branchCode') {
						
							this.setbranchCode(local.json[key]);
						}
						
						if('#key#' eq 'agencyNumber') {
						
							this.setagencyNumber(local.json[key]);
						}
						
						if('#key#' eq 'bankCode') {
						
							this.setbankCode(local.json[key]);
						}
						
						if('#key#' eq 'ribKey') {
						
							this.setribKey(local.json[key]);
						}
						
						if('#key#' eq 'controlDigit') {
						
							this.setcontrolDigit(local.json[key]);
						}
						
						if('#key#' eq 'taxIdType') {
						
							this.settaxIdType(local.json[key]);
						}
						
						if('#key#' eq 'taxIdNumber') {
						
							this.settaxIdNumber(local.json[key]);
						}
						
						if('#key#' eq 'accountHolderDateOfBirth') {
						
							this.setaccountHolderDateOfBirth(local.json[key]);
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
							
							this.setbankCountryCode(local.json[i]);
							
							this.setbankName(local.json[i]);
							
							this.setroutingNumber(local.json[i]);
							
							this.setbankAccountType(local.json[i]);
							
							this.setbankAccountNumber(local.json[i]);
							
							this.setiban(local.json[i]);
							
							this.setclabe(local.json[i]);
							
							this.setbsbNumber(local.json[i]);
							
							this.setbranchLocation(local.json[i]);
							
							this.setsortCode(local.json[i]);
							
							this.setbankTransitNumber(local.json[i]);
							
							this.setinstitutionNumber(local.json[i]);
							
							this.setbranchCode(local.json[i]);
							
							this.setagencyNumber(local.json[i]);
							
							this.setbankCode(local.json[i]);
							
							this.setribKey(local.json[i]);
							
							this.setcontrolDigit(local.json[i]);
							
							this.settaxIdType(local.json[i]);
							
							this.settaxIdNumber(local.json[i]);
							
							this.setaccountHolderDateOfBirth(local.json[i]);
							
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
											
							
							if('#key#' eq 'bankCountryCode') {
							
								this.setbankCountryCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'bankName') {
							
								this.setbankName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'routingNumber') {
							
								this.setroutingNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'bankAccountType') {
							
								this.setbankAccountType(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'bankAccountNumber') {
							
								this.setbankAccountNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'iban') {
							
								this.setiban(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'clabe') {
							
								this.setclabe(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'bsbNumber') {
							
								this.setbsbNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'branchLocation') {
							
								this.setbranchLocation(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'sortCode') {
							
								this.setsortCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'bankTransitNumber') {
							
								this.setbankTransitNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'institutionNumber') {
							
								this.setinstitutionNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'branchCode') {
							
								this.setbranchCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'agencyNumber') {
							
								this.setagencyNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'bankCode') {
							
								this.setbankCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'ribKey') {
							
								this.setribKey(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'controlDigit') {
							
								this.setcontrolDigit(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'taxIdType') {
							
								this.settaxIdType(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'taxIdNumber') {
							
								this.settaxIdNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'accountHolderDateOfBirth') {
							
								this.setaccountHolderDateOfBirth(local.json[i][key]);
							
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
		
