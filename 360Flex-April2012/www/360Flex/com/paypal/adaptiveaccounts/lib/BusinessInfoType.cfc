
		<cfscript>
		component name="BusinessInfoType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="businessName"  type="string" display="businessName" required="yes" hint="";
			
			property name="businessAddress"  type="numeric" display="businessAddress" required="yes" hint="";
			
			property name="workPhone"  type="string" display="workPhone" required="yes" hint="";
			
			property name="category"  type="numeric" display="category" required="no" hint="
								PayPal Business Category. i.e., baby -
								1004
							";
			
			property name="subCategory"  type="numeric" display="subCategory" required="no" hint="
								Paypal Business subcategory. i.e.,
								baby-clothing - 2027
							";
			
			property name="merchantCategoryCode"  type="numeric" display="merchantCategoryCode" required="no" hint="
								If Category and Subcategory is
								specified, then this is optional. PayPal
								uses the industry standard Merchant
								Category Codes. Please refer to your
								Association Merchant Category Code
								documentation for a list of codes
							";
			
			property name="doingBusinessAs"  type="string" display="doingBusinessAs" required="no" hint="";
			
			property name="customerServicePhone"  type="string" display="customerServicePhone" required="no" hint="";
			
			property name="customerServiceEmail"  type="string" display="customerServiceEmail" required="no" hint="";
			
			property name="disputeEmail"  type="string" display="disputeEmail" required="no" hint="";
			
			property name="webSite"  type="string" display="webSite" required="no" hint="";
			
			property name="companyId"  type="string" display="companyId" required="no" hint="
								Company Id: tax id, acn, abn, etc.
							";
			
			property name="dateOfEstablishment"  type="numeric" display="dateOfEstablishment" required="no" hint="";
			
			property name="businessType"  type="numeric" display="businessType" required="no" hint="";
			
			property name="businessSubtype"  type="numeric" display="businessSubtype" required="no" hint="";
			
			property name="incorporationId"  type="string" display="incorporationId" required="no" hint="";
			
			property name="averagePrice"  type="numeric" display="averagePrice" required="no" hint="
								Average transaction value.
							";
			
			property name="averageMonthlyVolume"  type="numeric" display="averageMonthlyVolume" required="no" hint="
								Average monthly transaction value.
							";
			
			property name="percentageRevenueFromOnline"  type="numeric" display="percentageRevenueFromOnline" required="no" hint="
								Percentage of the revenue that is from online sales (0%-100%).
							";
			
			property name="salesVenue"  type="numeric" display="salesVenue" required="no" hint="";
			
			property name="salesVenueDesc"  type="string" display="salesVenueDesc" required="no" hint="
								Description of store front or place for sales.
								Only required when "OTHER" is specified for
								salesVenue.  
							";
			
			property name="vatId"  type="string" display="vatId" required="no" hint="
								Value Added Tax (VAT) ID number
							";
			
			property name="vatCountryCode"  type="string" display="vatCountryCode" required="no" hint="
								Country code for country on the vat id.
							";
			
			property name="commercialRegistrationLocation"  type="string" display="commercialRegistrationLocation" required="no" hint="
							        Official commercial registration location.
							";
			
			property name="principalPlaceOfBusinessAddress"  type="numeric" display="principalPlaceOfBusinessAddress" required="no" hint="";
			
			property name="registeredOfficeAddress"  type="numeric" display="registeredOfficeAddress" required="no" hint="";
			
			property name="establishmentCountryCode"  type="string" display="establishmentCountryCode" required="no" hint="";
			
			property name="establishmentState"  type="string" display="establishmentState" required="no" hint="";
			
			property name="businessStakeholder"  type="numeric" display="businessStakeholder" required="no" hint="
								All the stakeholders of the company.  
							";
			variables.items= ArrayNew(1);variables.items= ArrayNew(1);
			
			public BusinessInfoType function init( string businessName="", numeric businessAddress="", string workPhone="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setbusinessName(arguments.businessName);
					
						this.setbusinessAddress(arguments.businessAddress);
					
						this.setworkPhone(arguments.workPhone);
					
				
				
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
			
			
			public void function setbusinessName(string businessName)
			{
				this.businessName = arguments.businessName;
			}  
				
			public string function getbusinessName()
			{
				return this.businessName;
			} 
			
			
			public void function setbusinessAddress(numeric businessAddress)
			{
				this.businessAddress = arguments.businessAddress;
			}  
				
			public numeric function getbusinessAddress()
			{
				return this.businessAddress;
			} 
			
			
			public void function setworkPhone(string workPhone)
			{
				this.workPhone = arguments.workPhone;
			}  
				
			public string function getworkPhone()
			{
				return this.workPhone;
			} 
			
			
			public void function setcategory(numeric category)
			{
				this.category = arguments.category;
			}  
				
			public numeric function getcategory()
			{
				return this.category;
			} 
			
			
			public void function setsubCategory(numeric subCategory)
			{
				this.subCategory = arguments.subCategory;
			}  
				
			public numeric function getsubCategory()
			{
				return this.subCategory;
			} 
			
			
			public void function setmerchantCategoryCode(numeric merchantCategoryCode)
			{
				this.merchantCategoryCode = arguments.merchantCategoryCode;
			}  
				
			public numeric function getmerchantCategoryCode()
			{
				return this.merchantCategoryCode;
			} 
			
			
			public void function setdoingBusinessAs(string doingBusinessAs)
			{
				this.doingBusinessAs = arguments.doingBusinessAs;
			}  
				
			public string function getdoingBusinessAs()
			{
				return this.doingBusinessAs;
			} 
			
			
			public void function setcustomerServicePhone(string customerServicePhone)
			{
				this.customerServicePhone = arguments.customerServicePhone;
			}  
				
			public string function getcustomerServicePhone()
			{
				return this.customerServicePhone;
			} 
			
			
			public void function setcustomerServiceEmail(string customerServiceEmail)
			{
				this.customerServiceEmail = arguments.customerServiceEmail;
			}  
				
			public string function getcustomerServiceEmail()
			{
				return this.customerServiceEmail;
			} 
			
			
			public void function setdisputeEmail(string disputeEmail)
			{
				this.disputeEmail = arguments.disputeEmail;
			}  
				
			public string function getdisputeEmail()
			{
				return this.disputeEmail;
			} 
			
			
			public void function setwebSite(string webSite)
			{
				this.webSite = arguments.webSite;
			}  
				
			public string function getwebSite()
			{
				return this.webSite;
			} 
			
			
			public void function setcompanyId(string companyId)
			{
				this.companyId = arguments.companyId;
			}  
				
			public string function getcompanyId()
			{
				return this.companyId;
			} 
			
			
			public void function setdateOfEstablishment(numeric dateOfEstablishment)
			{
				this.dateOfEstablishment = arguments.dateOfEstablishment;
			}  
				
			public numeric function getdateOfEstablishment()
			{
				return this.dateOfEstablishment;
			} 
			
			
			public void function setbusinessType(numeric businessType)
			{
				this.businessType = arguments.businessType;
			}  
				
			public numeric function getbusinessType()
			{
				return this.businessType;
			} 
			
			
			public void function setbusinessSubtype(numeric businessSubtype)
			{
				this.businessSubtype = arguments.businessSubtype;
			}  
				
			public numeric function getbusinessSubtype()
			{
				return this.businessSubtype;
			} 
			
			
			public void function setincorporationId(string incorporationId)
			{
				this.incorporationId = arguments.incorporationId;
			}  
				
			public string function getincorporationId()
			{
				return this.incorporationId;
			} 
			
			
			public void function setaveragePrice(numeric averagePrice)
			{
				this.averagePrice = arguments.averagePrice;
			}  
				
			public numeric function getaveragePrice()
			{
				return this.averagePrice;
			} 
			
			
			public void function setaverageMonthlyVolume(numeric averageMonthlyVolume)
			{
				this.averageMonthlyVolume = arguments.averageMonthlyVolume;
			}  
				
			public numeric function getaverageMonthlyVolume()
			{
				return this.averageMonthlyVolume;
			} 
			
			
			public void function setpercentageRevenueFromOnline(numeric percentageRevenueFromOnline)
			{
				this.percentageRevenueFromOnline = arguments.percentageRevenueFromOnline;
			}  
				
			public numeric function getpercentageRevenueFromOnline()
			{
				return this.percentageRevenueFromOnline;
			} 
			
			
			public void function setsalesVenue(numeric salesVenue)
			{
				this.salesVenue = arguments.salesVenue;
			}  
				
			public numeric function getsalesVenue()
			{
				return this.salesVenue;
			} 
			
			
			
			public any function addItem(numeric  item)
			{
				if(Compare('numeric','string') eq 0)
				{
					ArrayAppend(variables.items,arguments.item);
				} else {
					ArrayAppend(variables.items,arguments.item.getStruct());
				}
				
			} 
			
			public any function getItems()
			{
				return variables.items;
			} 
			
			public any function clearItems()
			{
				variables.items = ArrayNew(1);
			} 
			
			public void function setsalesVenueDesc(string salesVenueDesc)
			{
				this.salesVenueDesc = arguments.salesVenueDesc;
			}  
				
			public string function getsalesVenueDesc()
			{
				return this.salesVenueDesc;
			} 
			
			
			public void function setvatId(string vatId)
			{
				this.vatId = arguments.vatId;
			}  
				
			public string function getvatId()
			{
				return this.vatId;
			} 
			
			
			public void function setvatCountryCode(string vatCountryCode)
			{
				this.vatCountryCode = arguments.vatCountryCode;
			}  
				
			public string function getvatCountryCode()
			{
				return this.vatCountryCode;
			} 
			
			
			public void function setcommercialRegistrationLocation(string commercialRegistrationLocation)
			{
				this.commercialRegistrationLocation = arguments.commercialRegistrationLocation;
			}  
				
			public string function getcommercialRegistrationLocation()
			{
				return this.commercialRegistrationLocation;
			} 
			
			
			public void function setprincipalPlaceOfBusinessAddress(numeric principalPlaceOfBusinessAddress)
			{
				this.principalPlaceOfBusinessAddress = arguments.principalPlaceOfBusinessAddress;
			}  
				
			public numeric function getprincipalPlaceOfBusinessAddress()
			{
				return this.principalPlaceOfBusinessAddress;
			} 
			
			
			public void function setregisteredOfficeAddress(numeric registeredOfficeAddress)
			{
				this.registeredOfficeAddress = arguments.registeredOfficeAddress;
			}  
				
			public numeric function getregisteredOfficeAddress()
			{
				return this.registeredOfficeAddress;
			} 
			
			
			public void function setestablishmentCountryCode(string establishmentCountryCode)
			{
				this.establishmentCountryCode = arguments.establishmentCountryCode;
			}  
				
			public string function getestablishmentCountryCode()
			{
				return this.establishmentCountryCode;
			} 
			
			
			public void function setestablishmentState(string establishmentState)
			{
				this.establishmentState = arguments.establishmentState;
			}  
				
			public string function getestablishmentState()
			{
				return this.establishmentState;
			} 
			
			
			public void function setbusinessStakeholder(numeric businessStakeholder)
			{
				this.businessStakeholder = arguments.businessStakeholder;
			}  
				
			public numeric function getbusinessStakeholder()
			{
				return this.businessStakeholder;
			} 
			
			
			
			public any function addItem(numeric  item)
			{
				if(Compare('numeric','string') eq 0)
				{
					ArrayAppend(variables.items,arguments.item);
				} else {
					ArrayAppend(variables.items,arguments.item.getStruct());
				}
				
			} 
			
			public any function getItems()
			{
				return variables.items;
			} 
			
			public any function clearItems()
			{
				variables.items = ArrayNew(1);
			} 
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.businessName' ) )
					
						local.struct["businessName"] = getbusinessName();
					
				if(  isDefined( 'this.businessAddress' ) )
					
						local.struct["businessAddress"] = getbusinessAddress();
					
				if(  isDefined( 'this.workPhone' ) )
					
						local.struct["workPhone"] = getworkPhone();
					
				if(  isDefined( 'this.category' ) )
					
						local.struct["category"] = getcategory();
					
				if(  isDefined( 'this.subCategory' ) )
					
						local.struct["subCategory"] = getsubCategory();
					
				if(  isDefined( 'this.merchantCategoryCode' ) )
					
						local.struct["merchantCategoryCode"] = getmerchantCategoryCode();
					
				if(  isDefined( 'this.doingBusinessAs' ) )
					
						local.struct["doingBusinessAs"] = getdoingBusinessAs();
					
				if(  isDefined( 'this.customerServicePhone' ) )
					
						local.struct["customerServicePhone"] = getcustomerServicePhone();
					
				if(  isDefined( 'this.customerServiceEmail' ) )
					
						local.struct["customerServiceEmail"] = getcustomerServiceEmail();
					
				if(  isDefined( 'this.disputeEmail' ) )
					
						local.struct["disputeEmail"] = getdisputeEmail();
					
				if(  isDefined( 'this.webSite' ) )
					
						local.struct["webSite"] = getwebSite();
					
				if(  isDefined( 'this.companyId' ) )
					
						local.struct["companyId"] = getcompanyId();
					
				if(  isDefined( 'this.dateOfEstablishment' ) )
					
						local.struct["dateOfEstablishment"] = getdateOfEstablishment();
					
				if(  isDefined( 'this.businessType' ) )
					
						local.struct["businessType"] = getbusinessType();
					
				if(  isDefined( 'this.businessSubtype' ) )
					
						local.struct["businessSubtype"] = getbusinessSubtype();
					
				if(  isDefined( 'this.incorporationId' ) )
					
						local.struct["incorporationId"] = getincorporationId();
					
				if(  isDefined( 'this.averagePrice' ) )
					
						local.struct["averagePrice"] = getaveragePrice();
					
				if(  isDefined( 'this.averageMonthlyVolume' ) )
					
						local.struct["averageMonthlyVolume"] = getaverageMonthlyVolume();
					
				if(  isDefined( 'this.percentageRevenueFromOnline' ) )
					
						local.struct["percentageRevenueFromOnline"] = getpercentageRevenueFromOnline();
					
				if(  isDefined( 'this.salesVenue' ) )
					
						local.struct["salesVenue"] =getItems();
					
				if(  isDefined( 'this.salesVenueDesc' ) )
					
						local.struct["salesVenueDesc"] = getsalesVenueDesc();
					
				if(  isDefined( 'this.vatId' ) )
					
						local.struct["vatId"] = getvatId();
					
				if(  isDefined( 'this.vatCountryCode' ) )
					
						local.struct["vatCountryCode"] = getvatCountryCode();
					
				if(  isDefined( 'this.commercialRegistrationLocation' ) )
					
						local.struct["commercialRegistrationLocation"] = getcommercialRegistrationLocation();
					
				if(  isDefined( 'this.principalPlaceOfBusinessAddress' ) )
					
						local.struct["principalPlaceOfBusinessAddress"] = getprincipalPlaceOfBusinessAddress();
					
				if(  isDefined( 'this.registeredOfficeAddress' ) )
					
						local.struct["registeredOfficeAddress"] = getregisteredOfficeAddress();
					
				if(  isDefined( 'this.establishmentCountryCode' ) )
					
						local.struct["establishmentCountryCode"] = getestablishmentCountryCode();
					
				if(  isDefined( 'this.establishmentState' ) )
					
						local.struct["establishmentState"] = getestablishmentState();
					
				if(  isDefined( 'this.businessStakeholder' ) )
					
						local.struct["businessStakeholder"] =getItems();
					
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
						
						if('#key#' eq 'businessName') {
						
							this.setbusinessName(local.json[key]);
						}
						
						if('#key#' eq 'businessAddress') {
						
							this.setbusinessAddress(local.json[key]);
						}
						
						if('#key#' eq 'workPhone') {
						
							this.setworkPhone(local.json[key]);
						}
						
						if('#key#' eq 'category') {
						
							this.setcategory(local.json[key]);
						}
						
						if('#key#' eq 'subCategory') {
						
							this.setsubCategory(local.json[key]);
						}
						
						if('#key#' eq 'merchantCategoryCode') {
						
							this.setmerchantCategoryCode(local.json[key]);
						}
						
						if('#key#' eq 'doingBusinessAs') {
						
							this.setdoingBusinessAs(local.json[key]);
						}
						
						if('#key#' eq 'customerServicePhone') {
						
							this.setcustomerServicePhone(local.json[key]);
						}
						
						if('#key#' eq 'customerServiceEmail') {
						
							this.setcustomerServiceEmail(local.json[key]);
						}
						
						if('#key#' eq 'disputeEmail') {
						
							this.setdisputeEmail(local.json[key]);
						}
						
						if('#key#' eq 'webSite') {
						
							this.setwebSite(local.json[key]);
						}
						
						if('#key#' eq 'companyId') {
						
							this.setcompanyId(local.json[key]);
						}
						
						if('#key#' eq 'dateOfEstablishment') {
						
							this.setdateOfEstablishment(local.json[key]);
						}
						
						if('#key#' eq 'businessType') {
						
							this.setbusinessType(local.json[key]);
						}
						
						if('#key#' eq 'businessSubtype') {
						
							this.setbusinessSubtype(local.json[key]);
						}
						
						if('#key#' eq 'incorporationId') {
						
							this.setincorporationId(local.json[key]);
						}
						
						if('#key#' eq 'averagePrice') {
						
							this.setaveragePrice(local.json[key]);
						}
						
						if('#key#' eq 'averageMonthlyVolume') {
						
							this.setaverageMonthlyVolume(local.json[key]);
						}
						
						if('#key#' eq 'percentageRevenueFromOnline') {
						
							this.setpercentageRevenueFromOnline(local.json[key]);
						}
						
						if('#key#' eq 'salesVenue') {
						
							this.setsalesVenue(local.json[key]);
						}
						
						if('#key#' eq 'salesVenueDesc') {
						
							this.setsalesVenueDesc(local.json[key]);
						}
						
						if('#key#' eq 'vatId') {
						
							this.setvatId(local.json[key]);
						}
						
						if('#key#' eq 'vatCountryCode') {
						
							this.setvatCountryCode(local.json[key]);
						}
						
						if('#key#' eq 'commercialRegistrationLocation') {
						
							this.setcommercialRegistrationLocation(local.json[key]);
						}
						
						if('#key#' eq 'principalPlaceOfBusinessAddress') {
						
							this.setprincipalPlaceOfBusinessAddress(local.json[key]);
						}
						
						if('#key#' eq 'registeredOfficeAddress') {
						
							this.setregisteredOfficeAddress(local.json[key]);
						}
						
						if('#key#' eq 'establishmentCountryCode') {
						
							this.setestablishmentCountryCode(local.json[key]);
						}
						
						if('#key#' eq 'establishmentState') {
						
							this.setestablishmentState(local.json[key]);
						}
						
						if('#key#' eq 'businessStakeholder') {
						
							this.setbusinessStakeholder(local.json[key]);
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
							
							this.setbusinessName(local.json[i]);
							
							this.setbusinessAddress(local.json[i]);
							
							this.setworkPhone(local.json[i]);
							
							this.setcategory(local.json[i]);
							
							this.setsubCategory(local.json[i]);
							
							this.setmerchantCategoryCode(local.json[i]);
							
							this.setdoingBusinessAs(local.json[i]);
							
							this.setcustomerServicePhone(local.json[i]);
							
							this.setcustomerServiceEmail(local.json[i]);
							
							this.setdisputeEmail(local.json[i]);
							
							this.setwebSite(local.json[i]);
							
							this.setcompanyId(local.json[i]);
							
							this.setdateOfEstablishment(local.json[i]);
							
							this.setbusinessType(local.json[i]);
							
							this.setbusinessSubtype(local.json[i]);
							
							this.setincorporationId(local.json[i]);
							
							this.setaveragePrice(local.json[i]);
							
							this.setaverageMonthlyVolume(local.json[i]);
							
							this.setpercentageRevenueFromOnline(local.json[i]);
							
							this.setsalesVenue(local.json[i]);
							
							this.setsalesVenueDesc(local.json[i]);
							
							this.setvatId(local.json[i]);
							
							this.setvatCountryCode(local.json[i]);
							
							this.setcommercialRegistrationLocation(local.json[i]);
							
							this.setprincipalPlaceOfBusinessAddress(local.json[i]);
							
							this.setregisteredOfficeAddress(local.json[i]);
							
							this.setestablishmentCountryCode(local.json[i]);
							
							this.setestablishmentState(local.json[i]);
							
							this.setbusinessStakeholder(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'businessName') {
							
								this.setbusinessName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'businessAddress') {
							
								this.setbusinessAddress(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'workPhone') {
							
								this.setworkPhone(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'category') {
							
								this.setcategory(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'subCategory') {
							
								this.setsubCategory(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'merchantCategoryCode') {
							
								this.setmerchantCategoryCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'doingBusinessAs') {
							
								this.setdoingBusinessAs(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'customerServicePhone') {
							
								this.setcustomerServicePhone(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'customerServiceEmail') {
							
								this.setcustomerServiceEmail(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'disputeEmail') {
							
								this.setdisputeEmail(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'webSite') {
							
								this.setwebSite(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'companyId') {
							
								this.setcompanyId(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'dateOfEstablishment') {
							
								this.setdateOfEstablishment(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'businessType') {
							
								this.setbusinessType(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'businessSubtype') {
							
								this.setbusinessSubtype(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'incorporationId') {
							
								this.setincorporationId(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'averagePrice') {
							
								this.setaveragePrice(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'averageMonthlyVolume') {
							
								this.setaverageMonthlyVolume(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'percentageRevenueFromOnline') {
							
								this.setpercentageRevenueFromOnline(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'salesVenue') {
							
								this.setsalesVenue(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'salesVenueDesc') {
							
								this.setsalesVenueDesc(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'vatId') {
							
								this.setvatId(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'vatCountryCode') {
							
								this.setvatCountryCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'commercialRegistrationLocation') {
							
								this.setcommercialRegistrationLocation(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'principalPlaceOfBusinessAddress') {
							
								this.setprincipalPlaceOfBusinessAddress(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'registeredOfficeAddress') {
							
								this.setregisteredOfficeAddress(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'establishmentCountryCode') {
							
								this.setestablishmentCountryCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'establishmentState') {
							
								this.setestablishmentState(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'businessStakeholder') {
							
								this.setbusinessStakeholder(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
