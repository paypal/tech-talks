
		<cfscript>
		component name="CreateAccountWebOptionsType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="returnUrl"  type="string" display="returnUrl" required="no" hint="";
			
			property name="showAddCreditCard"  type="boolean" display="showAddCreditCard" required="no" hint="";
			
			property name="showMobileConfirm"  type="boolean" display="showMobileConfirm" required="no" hint="
								Ask end-user to also initiate confirmation of their mobile phone. 
								This number must be supplied by the API caller (using mobilePhoneNumber)
								Default=false.
							";
			
			property name="returnUrlDescription"  type="string" display="returnUrlDescription" required="no" hint="";
			
			property name="useMiniBrowser"  type="boolean" display="useMiniBrowser" required="no" hint="
								If provided, end user will go through a  
								single page sign-up flow on a Mini Browser.
								If not provided, flow defaults to the 
								Multi-page flow that is full size.
							";
			
			
			public CreateAccountWebOptionsType function init( )
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
			
			
			public void function setreturnUrl(string returnUrl)
			{
				this.returnUrl = arguments.returnUrl;
			}  
				
			public string function getreturnUrl()
			{
				return this.returnUrl;
			} 
			
			
			public void function setshowAddCreditCard(boolean showAddCreditCard)
			{
				this.showAddCreditCard = arguments.showAddCreditCard;
			}  
				
			public boolean function getshowAddCreditCard()
			{
				return this.showAddCreditCard;
			} 
			
			
			public void function setshowMobileConfirm(boolean showMobileConfirm)
			{
				this.showMobileConfirm = arguments.showMobileConfirm;
			}  
				
			public boolean function getshowMobileConfirm()
			{
				return this.showMobileConfirm;
			} 
			
			
			public void function setreturnUrlDescription(string returnUrlDescription)
			{
				this.returnUrlDescription = arguments.returnUrlDescription;
			}  
				
			public string function getreturnUrlDescription()
			{
				return this.returnUrlDescription;
			} 
			
			
			public void function setuseMiniBrowser(boolean useMiniBrowser)
			{
				this.useMiniBrowser = arguments.useMiniBrowser;
			}  
				
			public boolean function getuseMiniBrowser()
			{
				return this.useMiniBrowser;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.returnUrl' ) )
					
						local.struct["returnUrl"] = getreturnUrl();
					
				if(  isDefined( 'this.showAddCreditCard' ) )
					
						local.struct["showAddCreditCard"] = getshowAddCreditCard();
					
				if(  isDefined( 'this.showMobileConfirm' ) )
					
						local.struct["showMobileConfirm"] = getshowMobileConfirm();
					
				if(  isDefined( 'this.returnUrlDescription' ) )
					
						local.struct["returnUrlDescription"] = getreturnUrlDescription();
					
				if(  isDefined( 'this.useMiniBrowser' ) )
					
						local.struct["useMiniBrowser"] = getuseMiniBrowser();
					
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
						
						if('#key#' eq 'returnUrl') {
						
							this.setreturnUrl(local.json[key]);
						}
						
						if('#key#' eq 'showAddCreditCard') {
						
							this.setshowAddCreditCard(local.json[key]);
						}
						
						if('#key#' eq 'showMobileConfirm') {
						
							this.setshowMobileConfirm(local.json[key]);
						}
						
						if('#key#' eq 'returnUrlDescription') {
						
							this.setreturnUrlDescription(local.json[key]);
						}
						
						if('#key#' eq 'useMiniBrowser') {
						
							this.setuseMiniBrowser(local.json[key]);
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
							
							this.setreturnUrl(local.json[i]);
							
							this.setshowAddCreditCard(local.json[i]);
							
							this.setshowMobileConfirm(local.json[i]);
							
							this.setreturnUrlDescription(local.json[i]);
							
							this.setuseMiniBrowser(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'returnUrl') {
							
								this.setreturnUrl(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'showAddCreditCard') {
							
								this.setshowAddCreditCard(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'showMobileConfirm') {
							
								this.setshowMobileConfirm(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'returnUrlDescription') {
							
								this.setreturnUrlDescription(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'useMiniBrowser') {
							
								this.setuseMiniBrowser(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
