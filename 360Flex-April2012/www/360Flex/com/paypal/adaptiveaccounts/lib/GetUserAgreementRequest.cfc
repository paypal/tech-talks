
		<cfscript>
		component name="GetUserAgreementRequest" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
			
			property name="createAccountKey"  type="string" display="createAccountKey" required="no" hint="";
			
			property name="countryCode"  type="string" display="countryCode" required="no" hint="";
			
			property name="languageCode"  type="string" display="languageCode" required="no" hint="";
			
			
			public GetUserAgreementRequest function init( RequestEnvelope requestEnvelope="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setrequestEnvelope(arguments.requestEnvelope);
					
				
				
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
			
			
			public void function setcreateAccountKey(string createAccountKey)
			{
				this.createAccountKey = arguments.createAccountKey;
			}  
				
			public string function getcreateAccountKey()
			{
				return this.createAccountKey;
			} 
			
			
			public void function setcountryCode(string countryCode)
			{
				this.countryCode = arguments.countryCode;
			}  
				
			public string function getcountryCode()
			{
				return this.countryCode;
			} 
			
			
			public void function setlanguageCode(string languageCode)
			{
				this.languageCode = arguments.languageCode;
			}  
				
			public string function getlanguageCode()
			{
				return this.languageCode;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.requestEnvelope' ) )
					
						local.struct["requestEnvelope"] = getrequestEnvelope().getStruct();
					
				if(  isDefined( 'this.createAccountKey' ) )
					
						local.struct["createAccountKey"] = getcreateAccountKey();
					
				if(  isDefined( 'this.countryCode' ) )
					
						local.struct["countryCode"] = getcountryCode();
					
				if(  isDefined( 'this.languageCode' ) )
					
						local.struct["languageCode"] = getlanguageCode();
					
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
						
						if('#key#' eq 'createAccountKey') {
						
							this.setcreateAccountKey(local.json[key]);
						}
						
						if('#key#' eq 'countryCode') {
						
							this.setcountryCode(local.json[key]);
						}
						
						if('#key#' eq 'languageCode') {
						
							this.setlanguageCode(local.json[key]);
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
							
							this.setcreateAccountKey(local.json[i]);
							
							this.setcountryCode(local.json[i]);
							
							this.setlanguageCode(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'requestEnvelope') {
							
								
								var keyObj = createObject("component",'#keyCom#');
								this.setrequestEnvelope( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'createAccountKey') {
							
								this.setcreateAccountKey(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'countryCode') {
							
								this.setcountryCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'languageCode') {
							
								this.setlanguageCode(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
