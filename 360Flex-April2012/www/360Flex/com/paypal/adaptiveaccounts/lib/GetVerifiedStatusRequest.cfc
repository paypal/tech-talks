
		<cfscript>
		component name="GetVerifiedStatusRequest" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
			
			property name="emailAddress"  type="string" display="emailAddress" required="yes" hint="";
			
			property name="matchCriteria"  type="string" display="matchCriteria" required="yes" hint="
								matchCriteria determines which field(s)
								in addition to emailAddress is used to
								locate the account. Currently, we support 
								matchCriteria of 'NAME' and 'NONE'.
							";
			
			property name="firstName"  type="string" display="firstName" required="no" hint="
								Required if matchCriteria is NAME
								Optional if matchCriteria is NONE
							";
			
			property name="lastName"  type="string" display="lastName" required="no" hint="
								Required if matchCriteria is NAME
								Optional if matchCriteria is NONE
							";
			
			
			public GetVerifiedStatusRequest function init( RequestEnvelope requestEnvelope="", string emailAddress="", string matchCriteria="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setrequestEnvelope(arguments.requestEnvelope);
					
						this.setemailAddress(arguments.emailAddress);
					
						this.setmatchCriteria(arguments.matchCriteria);
					
				
				
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
			
			
			public void function setmatchCriteria(string matchCriteria)
			{
				this.matchCriteria = arguments.matchCriteria;
			}  
				
			public string function getmatchCriteria()
			{
				return this.matchCriteria;
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
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.requestEnvelope' ) )
					
						local.struct["requestEnvelope"] = getrequestEnvelope().getStruct();
					
				if(  isDefined( 'this.emailAddress' ) )
					
						local.struct["emailAddress"] = getemailAddress();
					
				if(  isDefined( 'this.matchCriteria' ) )
					
						local.struct["matchCriteria"] = getmatchCriteria();
					
				if(  isDefined( 'this.firstName' ) )
					
						local.struct["firstName"] = getfirstName();
					
				if(  isDefined( 'this.lastName' ) )
					
						local.struct["lastName"] = getlastName();
					
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
						
						if('#key#' eq 'matchCriteria') {
						
							this.setmatchCriteria(local.json[key]);
						}
						
						if('#key#' eq 'firstName') {
						
							this.setfirstName(local.json[key]);
						}
						
						if('#key#' eq 'lastName') {
						
							this.setlastName(local.json[key]);
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
							
							this.setmatchCriteria(local.json[i]);
							
							this.setfirstName(local.json[i]);
							
							this.setlastName(local.json[i]);
							
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
											
							
							if('#key#' eq 'matchCriteria') {
							
								this.setmatchCriteria(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'firstName') {
							
								this.setfirstName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'lastName') {
							
								this.setlastName(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
