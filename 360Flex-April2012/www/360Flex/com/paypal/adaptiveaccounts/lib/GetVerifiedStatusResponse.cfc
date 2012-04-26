
		<cfscript>
		component name="GetVerifiedStatusResponse" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="responseEnvelope"  type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
			
			property name="accountStatus"  type="string" display="accountStatus" required="yes" hint="
								Returned values are:
								VERIFIED|UNVERIFIED.
							";
			
			property name="countryCode"  type="string" display="countryCode" required="no" hint="
								Returns countryCode belonging to PayPal account.
							";
			
			property name="userInfo"  type="numeric" display="userInfo" required="no" hint="
		                        Info about PayPal user such as emailAddress,
								accountId, firstName, lastName etc. 
							";
			
			
			public GetVerifiedStatusResponse function init( ResponseEnvelope responseEnvelope="", string accountStatus="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setresponseEnvelope(arguments.responseEnvelope);
					
						this.setaccountStatus(arguments.accountStatus);
					
				
				
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
			
			
			public void function setresponseEnvelope(ResponseEnvelope responseEnvelope)
			{
				this.responseEnvelope = arguments.responseEnvelope;
			}  
				
			public ResponseEnvelope function getresponseEnvelope()
			{
				return this.responseEnvelope;
			} 
			
			
			public void function setaccountStatus(string accountStatus)
			{
				this.accountStatus = arguments.accountStatus;
			}  
				
			public string function getaccountStatus()
			{
				return this.accountStatus;
			} 
			
			
			public void function setcountryCode(string countryCode)
			{
				this.countryCode = arguments.countryCode;
			}  
				
			public string function getcountryCode()
			{
				return this.countryCode;
			} 
			
			
			public void function setuserInfo(numeric userInfo)
			{
				this.userInfo = arguments.userInfo;
			}  
				
			public numeric function getuserInfo()
			{
				return this.userInfo;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.responseEnvelope' ) )
					
						local.struct["responseEnvelope"] = getresponseEnvelope().getStruct();
					
				if(  isDefined( 'this.accountStatus' ) )
					
						local.struct["accountStatus"] = getaccountStatus();
					
				if(  isDefined( 'this.countryCode' ) )
					
						local.struct["countryCode"] = getcountryCode();
					
				if(  isDefined( 'this.userInfo' ) )
					
						local.struct["userInfo"] = getuserInfo();
					
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
						
						if('#key#' eq 'responseEnvelope') {
						
							var keyCom = 'responseEnvelope';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setresponseEnvelope( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'accountStatus') {
						
							this.setaccountStatus(local.json[key]);
						}
						
						if('#key#' eq 'countryCode') {
						
							this.setcountryCode(local.json[key]);
						}
						
						if('#key#' eq 'userInfo') {
						
							this.setuserInfo(local.json[key]);
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
							
							this.setresponseEnvelope(local.json[i]);
							
							this.setaccountStatus(local.json[i]);
							
							this.setcountryCode(local.json[i]);
							
							this.setuserInfo(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'responseEnvelope') {
							
								
								var keyObj = createObject("component",'#keyCom#');
								this.setresponseEnvelope( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'accountStatus') {
							
								this.setaccountStatus(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'countryCode') {
							
								this.setcountryCode(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'userInfo') {
							
								this.setuserInfo(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
