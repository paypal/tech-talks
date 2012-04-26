
		<cfscript>
		component name="CreateAccountResponse" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="responseEnvelope"  type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
			
			property name="createAccountKey"  type="string" display="createAccountKey" required="no" hint="";
			
			property name="execStatus"  type="string" display="execStatus" required="yes" hint="
								Valid values are: COMPLETED, 
								COMPLETED:MERCHANT_REFERRAL_BONUS_ID_ASSOCIATION_FAILED
							";
			
			property name="redirectURL"  type="string" display="redirectURL" required="no" hint="";
			
			property name="accountId"  type="string" display="accountId" required="no" hint="
								Identifies a PayPal account. Only premier and business accounts have an accountId
							";
			
			
			public CreateAccountResponse function init( ResponseEnvelope responseEnvelope="", string execStatus="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setresponseEnvelope(arguments.responseEnvelope);
					
						this.setexecStatus(arguments.execStatus);
					
				
				
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
			
			
			public void function setcreateAccountKey(string createAccountKey)
			{
				this.createAccountKey = arguments.createAccountKey;
			}  
				
			public string function getcreateAccountKey()
			{
				return this.createAccountKey;
			} 
			
			
			public void function setexecStatus(string execStatus)
			{
				this.execStatus = arguments.execStatus;
			}  
				
			public string function getexecStatus()
			{
				return this.execStatus;
			} 
			
			
			public void function setredirectURL(string redirectURL)
			{
				this.redirectURL = arguments.redirectURL;
			}  
				
			public string function getredirectURL()
			{
				return this.redirectURL;
			} 
			
			
			public void function setaccountId(string accountId)
			{
				this.accountId = arguments.accountId;
			}  
				
			public string function getaccountId()
			{
				return this.accountId;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.responseEnvelope' ) )
					
						local.struct["responseEnvelope"] = getresponseEnvelope().getStruct();
					
				if(  isDefined( 'this.createAccountKey' ) )
					
						local.struct["createAccountKey"] = getcreateAccountKey();
					
				if(  isDefined( 'this.execStatus' ) )
					
						local.struct["execStatus"] = getexecStatus();
					
				if(  isDefined( 'this.redirectURL' ) )
					
						local.struct["redirectURL"] = getredirectURL();
					
				if(  isDefined( 'this.accountId' ) )
					
						local.struct["accountId"] = getaccountId();
					
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
						
						if('#key#' eq 'createAccountKey') {
						
							this.setcreateAccountKey(local.json[key]);
						}
						
						if('#key#' eq 'execStatus') {
						
							this.setexecStatus(local.json[key]);
						}
						
						if('#key#' eq 'redirectURL') {
						
							this.setredirectURL(local.json[key]);
						}
						
						if('#key#' eq 'accountId') {
						
							this.setaccountId(local.json[key]);
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
							
							this.setcreateAccountKey(local.json[i]);
							
							this.setexecStatus(local.json[i]);
							
							this.setredirectURL(local.json[i]);
							
							this.setaccountId(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'responseEnvelope') {
							
								
								var keyObj = createObject("component",'#keyCom#');
								this.setresponseEnvelope( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'createAccountKey') {
							
								this.setcreateAccountKey(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'execStatus') {
							
								this.setexecStatus(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'redirectURL') {
							
								this.setredirectURL(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'accountId') {
							
								this.setaccountId(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
