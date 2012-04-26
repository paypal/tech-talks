
		<cfscript>
		component name="WebOptionsType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="returnUrl"  type="string" display="returnUrl" required="no" hint="";
			
			property name="cancelUrl"  type="string" display="cancelUrl" required="no" hint="";
			
			property name="returnUrlDescription"  type="string" display="returnUrlDescription" required="no" hint="";
			
			property name="cancelUrlDescription"  type="string" display="cancelUrlDescription" required="no" hint="";
			
			
			public WebOptionsType function init( )
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
			
			
			public void function setcancelUrl(string cancelUrl)
			{
				this.cancelUrl = arguments.cancelUrl;
			}  
				
			public string function getcancelUrl()
			{
				return this.cancelUrl;
			} 
			
			
			public void function setreturnUrlDescription(string returnUrlDescription)
			{
				this.returnUrlDescription = arguments.returnUrlDescription;
			}  
				
			public string function getreturnUrlDescription()
			{
				return this.returnUrlDescription;
			} 
			
			
			public void function setcancelUrlDescription(string cancelUrlDescription)
			{
				this.cancelUrlDescription = arguments.cancelUrlDescription;
			}  
				
			public string function getcancelUrlDescription()
			{
				return this.cancelUrlDescription;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.returnUrl' ) )
					
						local.struct["returnUrl"] = getreturnUrl();
					
				if(  isDefined( 'this.cancelUrl' ) )
					
						local.struct["cancelUrl"] = getcancelUrl();
					
				if(  isDefined( 'this.returnUrlDescription' ) )
					
						local.struct["returnUrlDescription"] = getreturnUrlDescription();
					
				if(  isDefined( 'this.cancelUrlDescription' ) )
					
						local.struct["cancelUrlDescription"] = getcancelUrlDescription();
					
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
						
						if('#key#' eq 'cancelUrl') {
						
							this.setcancelUrl(local.json[key]);
						}
						
						if('#key#' eq 'returnUrlDescription') {
						
							this.setreturnUrlDescription(local.json[key]);
						}
						
						if('#key#' eq 'cancelUrlDescription') {
						
							this.setcancelUrlDescription(local.json[key]);
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
							
							this.setcancelUrl(local.json[i]);
							
							this.setreturnUrlDescription(local.json[i]);
							
							this.setcancelUrlDescription(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'returnUrl') {
							
								this.setreturnUrl(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'cancelUrl') {
							
								this.setcancelUrl(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'returnUrlDescription') {
							
								this.setreturnUrlDescription(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'cancelUrlDescription') {
							
								this.setcancelUrlDescription(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
