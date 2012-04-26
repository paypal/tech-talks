
		<cfscript>
		component name="BusinessInfoType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="firstName"  type="string" display="firstName" required="no" hint="
								First name of the company contact.
							";
			
			property name="lastName"  type="string" display="lastName" required="no" hint="
								Last name of the company contact.
							";
			
			property name="businessName"  type="string" display="businessName" required="no" hint="
								Business name of the company.
							";
			
			property name="phone"  type="string" display="phone" required="no" hint="
								Phone number for contacting the company.
							";
			
			property name="fax"  type="string" display="fax" required="no" hint="
								Fax number used by the company.
							";
			
			property name="website"  type="string" display="website" required="no" hint="
								Website used by the company.
							";
			
			property name="customValue"  type="string" display="customValue" required="no" hint="
								Custom value to be displayed in the contact information details.
							";
			
			property name="address"  type="BaseAddress" display="address" required="no" hint="
								Street address of the company.
							";
			
			
			public BusinessInfoType function init( )
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
			
			
			public void function setfirstName(string firstName)
			{
				this.firstName = arguments.firstName;
			}  
				
			public string function getfirstName()
			{
				return this.firstName;
			} 
			
			
			public void function setlastName(string lastName)
			{
				this.lastName = arguments.lastName;
			}  
				
			public string function getlastName()
			{
				return this.lastName;
			} 
			
			
			public void function setbusinessName(string businessName)
			{
				this.businessName = arguments.businessName;
			}  
				
			public string function getbusinessName()
			{
				return this.businessName;
			} 
			
			
			public void function setphone(string phone)
			{
				this.phone = arguments.phone;
			}  
				
			public string function getphone()
			{
				return this.phone;
			} 
			
			
			public void function setfax(string fax)
			{
				this.fax = arguments.fax;
			}  
				
			public string function getfax()
			{
				return this.fax;
			} 
			
			
			public void function setwebsite(string website)
			{
				this.website = arguments.website;
			}  
				
			public string function getwebsite()
			{
				return this.website;
			} 
			
			
			public void function setcustomValue(string customValue)
			{
				this.customValue = arguments.customValue;
			}  
				
			public string function getcustomValue()
			{
				return this.customValue;
			} 
			
			
			public void function setaddress(BaseAddress address)
			{
				this.address = arguments.address;
			}  
				
			public BaseAddress function getaddress()
			{
				return this.address;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.firstName' ) )
					
						local.struct["firstName"] = getfirstName();
					
				if(  isDefined( 'this.lastName' ) )
					
						local.struct["lastName"] = getlastName();
					
				if(  isDefined( 'this.businessName' ) )
					
						local.struct["businessName"] = getbusinessName();
					
				if(  isDefined( 'this.phone' ) )
					
						local.struct["phone"] = getphone();
					
				if(  isDefined( 'this.fax' ) )
					
						local.struct["fax"] = getfax();
					
				if(  isDefined( 'this.website' ) )
					
						local.struct["website"] = getwebsite();
					
				if(  isDefined( 'this.customValue' ) )
					
						local.struct["customValue"] = getcustomValue();
					
				if(  isDefined( 'this.address' ) )
					
						local.struct["address"] = getaddress().getStruct();
					
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
						
						if('#key#' eq 'firstName') {
						
							this.setfirstName(local.json[key]);
						}
						
						if('#key#' eq 'lastName') {
						
							this.setlastName(local.json[key]);
						}
						
						if('#key#' eq 'businessName') {
						
							this.setbusinessName(local.json[key]);
						}
						
						if('#key#' eq 'phone') {
						
							this.setphone(local.json[key]);
						}
						
						if('#key#' eq 'fax') {
						
							this.setfax(local.json[key]);
						}
						
						if('#key#' eq 'website') {
						
							this.setwebsite(local.json[key]);
						}
						
						if('#key#' eq 'customValue') {
						
							this.setcustomValue(local.json[key]);
						}
						
						if('#key#' eq 'address') {
						
							var keyCom = 'address';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setaddress( keyObj.deserialize(local.json[key]) );
							
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
							
							this.setfirstName(local.json[i]);
							
							this.setlastName(local.json[i]);
							
							this.setbusinessName(local.json[i]);
							
							this.setphone(local.json[i]);
							
							this.setfax(local.json[i]);
							
							this.setwebsite(local.json[i]);
							
							this.setcustomValue(local.json[i]);
							
							this.setaddress(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'firstName') {
							
								this.setfirstName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'lastName') {
							
								this.setlastName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'businessName') {
							
								this.setbusinessName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'phone') {
							
								this.setphone(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'fax') {
							
								this.setfax(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'website') {
							
								this.setwebsite(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'customValue') {
							
								this.setcustomValue(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'address') {
							
                             var keyCom = 'address';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setaddress( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
