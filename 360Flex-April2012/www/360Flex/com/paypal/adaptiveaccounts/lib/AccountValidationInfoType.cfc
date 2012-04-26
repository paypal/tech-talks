
		<cfscript>
		component name="AccountValidationInfoType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="firstName"  type="string" display="firstName" required="no" hint="";
			
			property name="lastName"  type="string" display="lastName" required="no" hint="";
			
			property name="addressLine1"  type="string" display="addressLine1" required="no" hint="";
			
			property name="postalCode"  type="string" display="postalCode" required="no" hint="";
			
			property name="phoneNumber"  type="string" display="phoneNumber" required="no" hint="";
			
			
			public AccountValidationInfoType function init( )
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
			
			
			public void function setaddressLine1(string addressLine1)
			{
				this.addressLine1 = arguments.addressLine1;
			}  
				
			public string function getaddressLine1()
			{
				return this.addressLine1;
			} 
			
			
			public void function setpostalCode(string postalCode)
			{
				this.postalCode = arguments.postalCode;
			}  
				
			public string function getpostalCode()
			{
				return this.postalCode;
			} 
			
			
			public void function setphoneNumber(string phoneNumber)
			{
				this.phoneNumber = arguments.phoneNumber;
			}  
				
			public string function getphoneNumber()
			{
				return this.phoneNumber;
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
					
				if(  isDefined( 'this.addressLine1' ) )
					
						local.struct["addressLine1"] = getaddressLine1();
					
				if(  isDefined( 'this.postalCode' ) )
					
						local.struct["postalCode"] = getpostalCode();
					
				if(  isDefined( 'this.phoneNumber' ) )
					
						local.struct["phoneNumber"] = getphoneNumber();
					
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
						
						if('#key#' eq 'addressLine1') {
						
							this.setaddressLine1(local.json[key]);
						}
						
						if('#key#' eq 'postalCode') {
						
							this.setpostalCode(local.json[key]);
						}
						
						if('#key#' eq 'phoneNumber') {
						
							this.setphoneNumber(local.json[key]);
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
							
							this.setaddressLine1(local.json[i]);
							
							this.setpostalCode(local.json[i]);
							
							this.setphoneNumber(local.json[i]);
							
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
											
							
							if('#key#' eq 'addressLine1') {
							
								this.setaddressLine1(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'postalCode') {
							
								this.setpostalCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'phoneNumber') {
							
								this.setphoneNumber(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
