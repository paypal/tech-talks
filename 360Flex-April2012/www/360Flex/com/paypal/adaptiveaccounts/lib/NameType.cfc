
		<cfscript>
		component name="NameType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="salutation"  type="string" display="salutation" required="no" hint="";
			
			property name="firstName"  type="string" display="firstName" required="yes" hint="";
			
			property name="middleName"  type="string" display="middleName" required="no" hint="";
			
			property name="lastName"  type="string" display="lastName" required="yes" hint="";
			
			property name="suffix"  type="string" display="suffix" required="no" hint="";
			
			
			public NameType function init( string firstName="", string lastName="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setfirstName(arguments.firstName);
					
						this.setlastName(arguments.lastName);
					
				
				
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
			
			
			public void function setsalutation(string salutation)
			{
				this.salutation = arguments.salutation;
			}  
				
			public string function getsalutation()
			{
				return this.salutation;
			} 
			
			
			public void function setfirstName(string firstName)
			{
				this.firstName = arguments.firstName;
			}  
				
			public string function getfirstName()
			{
				return this.firstName;
			} 
			
			
			public void function setmiddleName(string middleName)
			{
				this.middleName = arguments.middleName;
			}  
				
			public string function getmiddleName()
			{
				return this.middleName;
			} 
			
			
			public void function setlastName(string lastName)
			{
				this.lastName = arguments.lastName;
			}  
				
			public string function getlastName()
			{
				return this.lastName;
			} 
			
			
			public void function setsuffix(string suffix)
			{
				this.suffix = arguments.suffix;
			}  
				
			public string function getsuffix()
			{
				return this.suffix;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.salutation' ) )
					
						local.struct["salutation"] = getsalutation();
					
				if(  isDefined( 'this.firstName' ) )
					
						local.struct["firstName"] = getfirstName();
					
				if(  isDefined( 'this.middleName' ) )
					
						local.struct["middleName"] = getmiddleName();
					
				if(  isDefined( 'this.lastName' ) )
					
						local.struct["lastName"] = getlastName();
					
				if(  isDefined( 'this.suffix' ) )
					
						local.struct["suffix"] = getsuffix();
					
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
						
						if('#key#' eq 'salutation') {
						
							this.setsalutation(local.json[key]);
						}
						
						if('#key#' eq 'firstName') {
						
							this.setfirstName(local.json[key]);
						}
						
						if('#key#' eq 'middleName') {
						
							this.setmiddleName(local.json[key]);
						}
						
						if('#key#' eq 'lastName') {
						
							this.setlastName(local.json[key]);
						}
						
						if('#key#' eq 'suffix') {
						
							this.setsuffix(local.json[key]);
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
							
							this.setsalutation(local.json[i]);
							
							this.setfirstName(local.json[i]);
							
							this.setmiddleName(local.json[i]);
							
							this.setlastName(local.json[i]);
							
							this.setsuffix(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'salutation') {
							
								this.setsalutation(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'firstName') {
							
								this.setfirstName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'middleName') {
							
								this.setmiddleName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'lastName') {
							
								this.setlastName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'suffix') {
							
								this.setsuffix(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
