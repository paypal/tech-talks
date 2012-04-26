
		<cfscript>
		component name="SetFundingSourceConfirmedRequest" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
			
			property name="emailAddress"  type="string" display="emailAddress" required="no" hint="
								Identifying the PayPal account to which this request is targetted to.
								Caller of this API has to either provided an emailAddress or an accountId.
							";
			
			property name="accountId"  type="string" display="accountId" required="no" hint="
								Identifying the PayPal account to which this request is targetted to.
								Caller of this API has to either provided an emailAddress or an accountId.
							";
			
			property name="fundingSourceKey"  type="string" display="fundingSourceKey" required="yes" hint="";
			
			
			public SetFundingSourceConfirmedRequest function init( RequestEnvelope requestEnvelope="", string fundingSourceKey="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setrequestEnvelope(arguments.requestEnvelope);
					
						this.setfundingSourceKey(arguments.fundingSourceKey);
					
				
				
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
			
			
			public void function setaccountId(string accountId)
			{
				this.accountId = arguments.accountId;
			}  
				
			public string function getaccountId()
			{
				return this.accountId;
			} 
			
			
			public void function setfundingSourceKey(string fundingSourceKey)
			{
				this.fundingSourceKey = arguments.fundingSourceKey;
			}  
				
			public string function getfundingSourceKey()
			{
				return this.fundingSourceKey;
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
					
				if(  isDefined( 'this.accountId' ) )
					
						local.struct["accountId"] = getaccountId();
					
				if(  isDefined( 'this.fundingSourceKey' ) )
					
						local.struct["fundingSourceKey"] = getfundingSourceKey();
					
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
						
						if('#key#' eq 'accountId') {
						
							this.setaccountId(local.json[key]);
						}
						
						if('#key#' eq 'fundingSourceKey') {
						
							this.setfundingSourceKey(local.json[key]);
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
							
							this.setaccountId(local.json[i]);
							
							this.setfundingSourceKey(local.json[i]);
							
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
											
							
							if('#key#' eq 'accountId') {
							
								this.setaccountId(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'fundingSourceKey') {
							
								this.setfundingSourceKey(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
