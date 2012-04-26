
		<cfscript>
		component name="BusinessStakeholderType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="role"  type="numeric" display="role" required="yes" hint="";
			
			property name="name"  type="numeric" display="name" required="no" hint="";
			
			property name="fullLegalName"  type="string" display="fullLegalName" required="no" hint="";
			
			property name="address"  type="numeric" display="address" required="no" hint="";
			
			property name="dateOfBirth"  type="numeric" display="dateOfBirth" required="no" hint="";
			
			
			public BusinessStakeholderType function init( numeric role="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setrole(arguments.role);
					
				
				
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
			
			
			public void function setrole(numeric role)
			{
				this.role = arguments.role;
			}  
				
			public numeric function getrole()
			{
				return this.role;
			} 
			
			
			public void function setname(numeric name)
			{
				this.name = arguments.name;
			}  
				
			public numeric function getname()
			{
				return this.name;
			} 
			
			
			public void function setfullLegalName(string fullLegalName)
			{
				this.fullLegalName = arguments.fullLegalName;
			}  
				
			public string function getfullLegalName()
			{
				return this.fullLegalName;
			} 
			
			
			public void function setaddress(numeric address)
			{
				this.address = arguments.address;
			}  
				
			public numeric function getaddress()
			{
				return this.address;
			} 
			
			
			public void function setdateOfBirth(numeric dateOfBirth)
			{
				this.dateOfBirth = arguments.dateOfBirth;
			}  
				
			public numeric function getdateOfBirth()
			{
				return this.dateOfBirth;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.role' ) )
					
						local.struct["role"] = getrole();
					
				if(  isDefined( 'this.name' ) )
					
						local.struct["name"] = getname();
					
				if(  isDefined( 'this.fullLegalName' ) )
					
						local.struct["fullLegalName"] = getfullLegalName();
					
				if(  isDefined( 'this.address' ) )
					
						local.struct["address"] = getaddress();
					
				if(  isDefined( 'this.dateOfBirth' ) )
					
						local.struct["dateOfBirth"] = getdateOfBirth();
					
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
						
						if('#key#' eq 'role') {
						
							this.setrole(local.json[key]);
						}
						
						if('#key#' eq 'name') {
						
							this.setname(local.json[key]);
						}
						
						if('#key#' eq 'fullLegalName') {
						
							this.setfullLegalName(local.json[key]);
						}
						
						if('#key#' eq 'address') {
						
							this.setaddress(local.json[key]);
						}
						
						if('#key#' eq 'dateOfBirth') {
						
							this.setdateOfBirth(local.json[key]);
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
							
							this.setrole(local.json[i]);
							
							this.setname(local.json[i]);
							
							this.setfullLegalName(local.json[i]);
							
							this.setaddress(local.json[i]);
							
							this.setdateOfBirth(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'role') {
							
								this.setrole(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'name') {
							
								this.setname(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'fullLegalName') {
							
								this.setfullLegalName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'address') {
							
								this.setaddress(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'dateOfBirth') {
							
								this.setdateOfBirth(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
