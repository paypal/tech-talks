
		<cfscript>
		component name="UserInfoType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="emailAddress"  type="string" display="emailAddress" required="no" hint="
								Returns emailAddress belonging to PayPal account.
							";
			
			property name="accountType"  type="string" display="accountType" required="no" hint="
								Valid values are: Personal, Premier, and
								Business (not case-sensitive).
							";
			
			property name="accountId"  type="string" display="accountId" required="no" hint="
								Identifies a PayPal account. Only premier and business 
								accounts have an accountId
							";
			
			property name="name"  type="numeric" display="name" required="no" hint="
								Identifies a PayPal user, like firstName, lastName.
							";
			
			property name="businessName"  type="string" display="businessName" required="no" hint="
								Business Name of the PayPal account holder.
							";
			
			
			public UserInfoType function init( )
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
			
			
			public void function setemailAddress(string emailAddress)
			{
				this.emailAddress = arguments.emailAddress;
			}  
				
			public string function getemailAddress()
			{
				return this.emailAddress;
			} 
			
			
			public void function setaccountType(string accountType)
			{
				this.accountType = arguments.accountType;
			}  
				
			public string function getaccountType()
			{
				return this.accountType;
			} 
			
			
			public void function setaccountId(string accountId)
			{
				this.accountId = arguments.accountId;
			}  
				
			public string function getaccountId()
			{
				return this.accountId;
			} 
			
			
			public void function setname(numeric name)
			{
				this.name = arguments.name;
			}  
				
			public numeric function getname()
			{
				return this.name;
			} 
			
			
			public void function setbusinessName(string businessName)
			{
				this.businessName = arguments.businessName;
			}  
				
			public string function getbusinessName()
			{
				return this.businessName;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.emailAddress' ) )
					
						local.struct["emailAddress"] = getemailAddress();
					
				if(  isDefined( 'this.accountType' ) )
					
						local.struct["accountType"] = getaccountType();
					
				if(  isDefined( 'this.accountId' ) )
					
						local.struct["accountId"] = getaccountId();
					
				if(  isDefined( 'this.name' ) )
					
						local.struct["name"] = getname();
					
				if(  isDefined( 'this.businessName' ) )
					
						local.struct["businessName"] = getbusinessName();
					
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
						
						if('#key#' eq 'emailAddress') {
						
							this.setemailAddress(local.json[key]);
						}
						
						if('#key#' eq 'accountType') {
						
							this.setaccountType(local.json[key]);
						}
						
						if('#key#' eq 'accountId') {
						
							this.setaccountId(local.json[key]);
						}
						
						if('#key#' eq 'name') {
						
							this.setname(local.json[key]);
						}
						
						if('#key#' eq 'businessName') {
						
							this.setbusinessName(local.json[key]);
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
							
							this.setemailAddress(local.json[i]);
							
							this.setaccountType(local.json[i]);
							
							this.setaccountId(local.json[i]);
							
							this.setname(local.json[i]);
							
							this.setbusinessName(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'emailAddress') {
							
								this.setemailAddress(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'accountType') {
							
								this.setaccountType(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'accountId') {
							
								this.setaccountId(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'name') {
							
								this.setname(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'businessName') {
							
								this.setbusinessName(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
