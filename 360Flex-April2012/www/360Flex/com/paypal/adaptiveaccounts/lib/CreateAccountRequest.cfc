
		<cfscript>
		component name="CreateAccountRequest" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
			
			property name="clientDetails"  type="ClientDetailsType" display="clientDetails" required="no" hint="";
			
			property name="accountType"  type="string" display="accountType" required="no" hint="
								Valid values are: Personal, Premier, and
								Business. Flag="2" corresponds to
								java.util.regex.Pattern.CASE_INSENSITIVE,
								meaning the strings are not
								case-sensitive
							";
			
			property name="name"  type="numeric" display="name" required="yes" hint="";
			
			property name="dateOfBirth"  type="numeric" display="dateOfBirth" required="no" hint="";
			
			property name="address"  type="numeric" display="address" required="yes" hint="";
			
			property name="contactPhoneNumber"  type="string" display="contactPhoneNumber" required="no" hint="
							Must provide at least one of contactPhoneNumber, homePhoneNumber, or mobilePhoneNumber
							";
			
			property name="homePhoneNumber"  type="string" display="homePhoneNumber" required="no" hint="
							Must provide at least one of contactPhoneNumber, homePhoneNumber, or mobilePhoneNumber
							";
			
			property name="mobilePhoneNumber"  type="string" display="mobilePhoneNumber" required="no" hint="
							Must provide at least one of contactPhoneNumber, homePhoneNumber, or mobilePhoneNumber
							";
			
			property name="currencyCode"  type="string" display="currencyCode" required="no" hint="";
			
			property name="citizenshipCountryCode"  type="string" display="citizenshipCountryCode" required="no" hint="";
			
			property name="preferredLanguageCode"  type="string" display="preferredLanguageCode" required="yes" hint="";
			
			property name="notificationURL"  type="string" display="notificationURL" required="no" hint="";
			
			property name="emailAddress"  type="string" display="emailAddress" required="no" hint="";
			
			property name="registrationType"  type="string" display="registrationType" required="no" hint="
								Valid values are: Mobile and Web.
								Mobile: Returns a key to complete the
								registration. Web: Returns a URL to
								complete the registration.
							";
			
			property name="createAccountWebOptions"  type="numeric" display="createAccountWebOptions" required="no" hint="";
			
			property name="suppressWelcomeEmail"  type="boolean" display="suppressWelcomeEmail" required="no" hint="";
			
			property name="performExtraVettingOnThisAccount"  type="boolean" display="performExtraVettingOnThisAccount" required="no" hint="
								Set to true if you want this account to undergo extra vetting by PayPal
								before becoming usable. 
						";
			
			property name="taxId"  type="string" display="taxId" required="no" hint="
								tax id, ssn, itin, pan, cpf, acn, abn, etc.
							";
			
			property name="partnerField1"  type="string" display="partnerField1" required="no" hint="";
			
			property name="partnerField2"  type="string" display="partnerField2" required="no" hint="";
			
			property name="partnerField3"  type="string" display="partnerField3" required="no" hint="";
			
			property name="partnerField4"  type="string" display="partnerField4" required="no" hint="";
			
			property name="partnerField5"  type="string" display="partnerField5" required="no" hint="";
			
			property name="businessInfo"  type="numeric" display="businessInfo" required="no" hint="
								Required for business account creation
							";
			
			
			public CreateAccountRequest function init( RequestEnvelope requestEnvelope="", numeric name="", numeric address="", string preferredLanguageCode="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setrequestEnvelope(arguments.requestEnvelope);
					
						this.setname(arguments.name);
					
						this.setaddress(arguments.address);
					
						this.setpreferredLanguageCode(arguments.preferredLanguageCode);
					
				
				
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
			
			
			public void function setaccountType(string accountType)
			{
				this.accountType = arguments.accountType;
			}  
				
			public string function getaccountType()
			{
				return this.accountType;
			} 
			
			
			public void function setname(numeric name)
			{
				this.name = arguments.name;
			}  
				
			public numeric function getname()
			{
				return this.name;
			} 
			
			
			public void function setdateOfBirth(numeric dateOfBirth)
			{
				this.dateOfBirth = arguments.dateOfBirth;
			}  
				
			public numeric function getdateOfBirth()
			{
				return this.dateOfBirth;
			} 
			
			
			public void function setaddress(numeric address)
			{
				this.address = arguments.address;
			}  
				
			public numeric function getaddress()
			{
				return this.address;
			} 
			
			
			public void function setcontactPhoneNumber(string contactPhoneNumber)
			{
				this.contactPhoneNumber = arguments.contactPhoneNumber;
			}  
				
			public string function getcontactPhoneNumber()
			{
				return this.contactPhoneNumber;
			} 
			
			
			public void function sethomePhoneNumber(string homePhoneNumber)
			{
				this.homePhoneNumber = arguments.homePhoneNumber;
			}  
				
			public string function gethomePhoneNumber()
			{
				return this.homePhoneNumber;
			} 
			
			
			public void function setmobilePhoneNumber(string mobilePhoneNumber)
			{
				this.mobilePhoneNumber = arguments.mobilePhoneNumber;
			}  
				
			public string function getmobilePhoneNumber()
			{
				return this.mobilePhoneNumber;
			} 
			
			
			public void function setcurrencyCode(string currencyCode)
			{
				this.currencyCode = arguments.currencyCode;
			}  
				
			public string function getcurrencyCode()
			{
				return this.currencyCode;
			} 
			
			
			public void function setcitizenshipCountryCode(string citizenshipCountryCode)
			{
				this.citizenshipCountryCode = arguments.citizenshipCountryCode;
			}  
				
			public string function getcitizenshipCountryCode()
			{
				return this.citizenshipCountryCode;
			} 
			
			
			public void function setpreferredLanguageCode(string preferredLanguageCode)
			{
				this.preferredLanguageCode = arguments.preferredLanguageCode;
			}  
				
			public string function getpreferredLanguageCode()
			{
				return this.preferredLanguageCode;
			} 
			
			
			public void function setnotificationURL(string notificationURL)
			{
				this.notificationURL = arguments.notificationURL;
			}  
				
			public string function getnotificationURL()
			{
				return this.notificationURL;
			} 
			
			
			public void function setemailAddress(string emailAddress)
			{
				this.emailAddress = arguments.emailAddress;
			}  
				
			public string function getemailAddress()
			{
				return this.emailAddress;
			} 
			
			
			public void function setregistrationType(string registrationType)
			{
				this.registrationType = arguments.registrationType;
			}  
				
			public string function getregistrationType()
			{
				return this.registrationType;
			} 
			
			
			public void function setcreateAccountWebOptions(numeric createAccountWebOptions)
			{
				this.createAccountWebOptions = arguments.createAccountWebOptions;
			}  
				
			public numeric function getcreateAccountWebOptions()
			{
				return this.createAccountWebOptions;
			} 
			
			
			public void function setsuppressWelcomeEmail(boolean suppressWelcomeEmail)
			{
				this.suppressWelcomeEmail = arguments.suppressWelcomeEmail;
			}  
				
			public boolean function getsuppressWelcomeEmail()
			{
				return this.suppressWelcomeEmail;
			} 
			
			
			public void function setperformExtraVettingOnThisAccount(boolean performExtraVettingOnThisAccount)
			{
				this.performExtraVettingOnThisAccount = arguments.performExtraVettingOnThisAccount;
			}  
				
			public boolean function getperformExtraVettingOnThisAccount()
			{
				return this.performExtraVettingOnThisAccount;
			} 
			
			
			public void function settaxId(string taxId)
			{
				this.taxId = arguments.taxId;
			}  
				
			public string function gettaxId()
			{
				return this.taxId;
			} 
			
			
			public void function setpartnerField1(string partnerField1)
			{
				this.partnerField1 = arguments.partnerField1;
			}  
				
			public string function getpartnerField1()
			{
				return this.partnerField1;
			} 
			
			
			public void function setpartnerField2(string partnerField2)
			{
				this.partnerField2 = arguments.partnerField2;
			}  
				
			public string function getpartnerField2()
			{
				return this.partnerField2;
			} 
			
			
			public void function setpartnerField3(string partnerField3)
			{
				this.partnerField3 = arguments.partnerField3;
			}  
				
			public string function getpartnerField3()
			{
				return this.partnerField3;
			} 
			
			
			public void function setpartnerField4(string partnerField4)
			{
				this.partnerField4 = arguments.partnerField4;
			}  
				
			public string function getpartnerField4()
			{
				return this.partnerField4;
			} 
			
			
			public void function setpartnerField5(string partnerField5)
			{
				this.partnerField5 = arguments.partnerField5;
			}  
				
			public string function getpartnerField5()
			{
				return this.partnerField5;
			} 
			
			
			public void function setbusinessInfo(numeric businessInfo)
			{
				this.businessInfo = arguments.businessInfo;
			}  
				
			public numeric function getbusinessInfo()
			{
				return this.businessInfo;
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
					
				if(  isDefined( 'this.accountType' ) )
					
						local.struct["accountType"] = getaccountType();
					
				if(  isDefined( 'this.name' ) )
					
						local.struct["name"] = getname();
					
				if(  isDefined( 'this.dateOfBirth' ) )
					
						local.struct["dateOfBirth"] = getdateOfBirth();
					
				if(  isDefined( 'this.address' ) )
					
						local.struct["address"] = getaddress();
					
				if(  isDefined( 'this.contactPhoneNumber' ) )
					
						local.struct["contactPhoneNumber"] = getcontactPhoneNumber();
					
				if(  isDefined( 'this.homePhoneNumber' ) )
					
						local.struct["homePhoneNumber"] = gethomePhoneNumber();
					
				if(  isDefined( 'this.mobilePhoneNumber' ) )
					
						local.struct["mobilePhoneNumber"] = getmobilePhoneNumber();
					
				if(  isDefined( 'this.currencyCode' ) )
					
						local.struct["currencyCode"] = getcurrencyCode();
					
				if(  isDefined( 'this.citizenshipCountryCode' ) )
					
						local.struct["citizenshipCountryCode"] = getcitizenshipCountryCode();
					
				if(  isDefined( 'this.preferredLanguageCode' ) )
					
						local.struct["preferredLanguageCode"] = getpreferredLanguageCode();
					
				if(  isDefined( 'this.notificationURL' ) )
					
						local.struct["notificationURL"] = getnotificationURL();
					
				if(  isDefined( 'this.emailAddress' ) )
					
						local.struct["emailAddress"] = getemailAddress();
					
				if(  isDefined( 'this.registrationType' ) )
					
						local.struct["registrationType"] = getregistrationType();
					
				if(  isDefined( 'this.createAccountWebOptions' ) )
					
						local.struct["createAccountWebOptions"] = getcreateAccountWebOptions();
					
				if(  isDefined( 'this.suppressWelcomeEmail' ) )
					
						local.struct["suppressWelcomeEmail"] = getsuppressWelcomeEmail();
					
				if(  isDefined( 'this.performExtraVettingOnThisAccount' ) )
					
						local.struct["performExtraVettingOnThisAccount"] = getperformExtraVettingOnThisAccount();
					
				if(  isDefined( 'this.taxId' ) )
					
						local.struct["taxId"] = gettaxId();
					
				if(  isDefined( 'this.partnerField1' ) )
					
						local.struct["partnerField1"] = getpartnerField1();
					
				if(  isDefined( 'this.partnerField2' ) )
					
						local.struct["partnerField2"] = getpartnerField2();
					
				if(  isDefined( 'this.partnerField3' ) )
					
						local.struct["partnerField3"] = getpartnerField3();
					
				if(  isDefined( 'this.partnerField4' ) )
					
						local.struct["partnerField4"] = getpartnerField4();
					
				if(  isDefined( 'this.partnerField5' ) )
					
						local.struct["partnerField5"] = getpartnerField5();
					
				if(  isDefined( 'this.businessInfo' ) )
					
						local.struct["businessInfo"] = getbusinessInfo();
					
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
						
						if('#key#' eq 'accountType') {
						
							this.setaccountType(local.json[key]);
						}
						
						if('#key#' eq 'name') {
						
							this.setname(local.json[key]);
						}
						
						if('#key#' eq 'dateOfBirth') {
						
							this.setdateOfBirth(local.json[key]);
						}
						
						if('#key#' eq 'address') {
						
							this.setaddress(local.json[key]);
						}
						
						if('#key#' eq 'contactPhoneNumber') {
						
							this.setcontactPhoneNumber(local.json[key]);
						}
						
						if('#key#' eq 'homePhoneNumber') {
						
							this.sethomePhoneNumber(local.json[key]);
						}
						
						if('#key#' eq 'mobilePhoneNumber') {
						
							this.setmobilePhoneNumber(local.json[key]);
						}
						
						if('#key#' eq 'currencyCode') {
						
							this.setcurrencyCode(local.json[key]);
						}
						
						if('#key#' eq 'citizenshipCountryCode') {
						
							this.setcitizenshipCountryCode(local.json[key]);
						}
						
						if('#key#' eq 'preferredLanguageCode') {
						
							this.setpreferredLanguageCode(local.json[key]);
						}
						
						if('#key#' eq 'notificationURL') {
						
							this.setnotificationURL(local.json[key]);
						}
						
						if('#key#' eq 'emailAddress') {
						
							this.setemailAddress(local.json[key]);
						}
						
						if('#key#' eq 'registrationType') {
						
							this.setregistrationType(local.json[key]);
						}
						
						if('#key#' eq 'createAccountWebOptions') {
						
							this.setcreateAccountWebOptions(local.json[key]);
						}
						
						if('#key#' eq 'suppressWelcomeEmail') {
						
							this.setsuppressWelcomeEmail(local.json[key]);
						}
						
						if('#key#' eq 'performExtraVettingOnThisAccount') {
						
							this.setperformExtraVettingOnThisAccount(local.json[key]);
						}
						
						if('#key#' eq 'taxId') {
						
							this.settaxId(local.json[key]);
						}
						
						if('#key#' eq 'partnerField1') {
						
							this.setpartnerField1(local.json[key]);
						}
						
						if('#key#' eq 'partnerField2') {
						
							this.setpartnerField2(local.json[key]);
						}
						
						if('#key#' eq 'partnerField3') {
						
							this.setpartnerField3(local.json[key]);
						}
						
						if('#key#' eq 'partnerField4') {
						
							this.setpartnerField4(local.json[key]);
						}
						
						if('#key#' eq 'partnerField5') {
						
							this.setpartnerField5(local.json[key]);
						}
						
						if('#key#' eq 'businessInfo') {
						
							this.setbusinessInfo(local.json[key]);
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
							
							this.setaccountType(local.json[i]);
							
							this.setname(local.json[i]);
							
							this.setdateOfBirth(local.json[i]);
							
							this.setaddress(local.json[i]);
							
							this.setcontactPhoneNumber(local.json[i]);
							
							this.sethomePhoneNumber(local.json[i]);
							
							this.setmobilePhoneNumber(local.json[i]);
							
							this.setcurrencyCode(local.json[i]);
							
							this.setcitizenshipCountryCode(local.json[i]);
							
							this.setpreferredLanguageCode(local.json[i]);
							
							this.setnotificationURL(local.json[i]);
							
							this.setemailAddress(local.json[i]);
							
							this.setregistrationType(local.json[i]);
							
							this.setcreateAccountWebOptions(local.json[i]);
							
							this.setsuppressWelcomeEmail(local.json[i]);
							
							this.setperformExtraVettingOnThisAccount(local.json[i]);
							
							this.settaxId(local.json[i]);
							
							this.setpartnerField1(local.json[i]);
							
							this.setpartnerField2(local.json[i]);
							
							this.setpartnerField3(local.json[i]);
							
							this.setpartnerField4(local.json[i]);
							
							this.setpartnerField5(local.json[i]);
							
							this.setbusinessInfo(local.json[i]);
							
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
											
							
							if('#key#' eq 'accountType') {
							
								this.setaccountType(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'name') {
							
								this.setname(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'dateOfBirth') {
							
								this.setdateOfBirth(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'address') {
							
								this.setaddress(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'contactPhoneNumber') {
							
								this.setcontactPhoneNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'homePhoneNumber') {
							
								this.sethomePhoneNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'mobilePhoneNumber') {
							
								this.setmobilePhoneNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'currencyCode') {
							
								this.setcurrencyCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'citizenshipCountryCode') {
							
								this.setcitizenshipCountryCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'preferredLanguageCode') {
							
								this.setpreferredLanguageCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'notificationURL') {
							
								this.setnotificationURL(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'emailAddress') {
							
								this.setemailAddress(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'registrationType') {
							
								this.setregistrationType(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'createAccountWebOptions') {
							
								this.setcreateAccountWebOptions(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'suppressWelcomeEmail') {
							
								this.setsuppressWelcomeEmail(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'performExtraVettingOnThisAccount') {
							
								this.setperformExtraVettingOnThisAccount(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'taxId') {
							
								this.settaxId(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'partnerField1') {
							
								this.setpartnerField1(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'partnerField2') {
							
								this.setpartnerField2(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'partnerField3') {
							
								this.setpartnerField3(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'partnerField4') {
							
								this.setpartnerField4(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'partnerField5') {
							
								this.setpartnerField5(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'businessInfo') {
							
								this.setbusinessInfo(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
