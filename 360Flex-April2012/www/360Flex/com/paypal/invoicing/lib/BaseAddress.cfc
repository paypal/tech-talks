
		<cfscript>
		component name="BaseAddress" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="line1"  type="string" display="line1" required="yes" hint="";
			
			property name="line2"  type="string" display="line2" required="no" hint="";
			
			property name="city"  type="string" display="city" required="yes" hint="";
			
			property name="state"  type="string" display="state" required="no" hint="";
			
			property name="postalCode"  type="string" display="postalCode" required="no" hint="";
			
			property name="countryCode"  type="string" display="countryCode" required="yes" hint="";
			
			property name="type"  type="string" display="type" required="no" hint="";
			
			
			public BaseAddress function init( string line1="", string city="", string countryCode="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setline1(arguments.line1);
					
						this.setcity(arguments.city);
					
						this.setcountryCode(arguments.countryCode);
					
				
				
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
			
			
			public void function setline1(string line1)
			{
				this.line1 = arguments.line1;
			}  
				
			public string function getline1()
			{
				return this.line1;
			} 
			
			
			public void function setline2(string line2)
			{
				this.line2 = arguments.line2;
			}  
				
			public string function getline2()
			{
				return this.line2;
			} 
			
			
			public void function setcity(string city)
			{
				this.city = arguments.city;
			}  
				
			public string function getcity()
			{
				return this.city;
			} 
			
			
			public void function setstate(string state)
			{
				this.state = arguments.state;
			}  
				
			public string function getstate()
			{
				return this.state;
			} 
			
			
			public void function setpostalCode(string postalCode)
			{
				this.postalCode = arguments.postalCode;
			}  
				
			public string function getpostalCode()
			{
				return this.postalCode;
			} 
			
			
			public void function setcountryCode(string countryCode)
			{
				this.countryCode = arguments.countryCode;
			}  
				
			public string function getcountryCode()
			{
				return this.countryCode;
			} 
			
			
			public void function settype(string type)
			{
				this.type = arguments.type;
			}  
				
			public string function gettype()
			{
				return this.type;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.line1' ) )
					
						local.struct["line1"] = getline1();
					
				if(  isDefined( 'this.line2' ) )
					
						local.struct["line2"] = getline2();
					
				if(  isDefined( 'this.city' ) )
					
						local.struct["city"] = getcity();
					
				if(  isDefined( 'this.state' ) )
					
						local.struct["state"] = getstate();
					
				if(  isDefined( 'this.postalCode' ) )
					
						local.struct["postalCode"] = getpostalCode();
					
				if(  isDefined( 'this.countryCode' ) )
					
						local.struct["countryCode"] = getcountryCode();
					
				if(  isDefined( 'this.type' ) )
					
						local.struct["type"] = gettype();
					
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
						
						if('#key#' eq 'line1') {
						
							this.setline1(local.json[key]);
						}
						
						if('#key#' eq 'line2') {
						
							this.setline2(local.json[key]);
						}
						
						if('#key#' eq 'city') {
						
							this.setcity(local.json[key]);
						}
						
						if('#key#' eq 'state') {
						
							this.setstate(local.json[key]);
						}
						
						if('#key#' eq 'postalCode') {
						
							this.setpostalCode(local.json[key]);
						}
						
						if('#key#' eq 'countryCode') {
						
							this.setcountryCode(local.json[key]);
						}
						
						if('#key#' eq 'type') {
						
							this.settype(local.json[key]);
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
							
							this.setline1(local.json[i]);
							
							this.setline2(local.json[i]);
							
							this.setcity(local.json[i]);
							
							this.setstate(local.json[i]);
							
							this.setpostalCode(local.json[i]);
							
							this.setcountryCode(local.json[i]);
							
							this.settype(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'line1') {
							
								this.setline1(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'line2') {
							
								this.setline2(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'city') {
							
								this.setcity(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'state') {
							
								this.setstate(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'postalCode') {
							
								this.setpostalCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'countryCode') {
							
								this.setcountryCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'type') {
							
								this.settype(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
