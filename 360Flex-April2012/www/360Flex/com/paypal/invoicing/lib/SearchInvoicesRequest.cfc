
		<cfscript>
		component name="SearchInvoicesRequest" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
			
			property name="merchantEmail"  type="string" display="merchantEmail" required="yes" hint="
								Invoice creator's email.
							";
			
			property name="parameters"  type="SearchParametersType" display="parameters" required="yes" hint="
								Parameters constraining the search.
							";
			
			property name="page"  type="numeric" display="page" required="yes" hint="
								Page number of result set, starting with 1.
							";
			
			property name="pageSize"  type="numeric" display="pageSize" required="yes" hint="
								Number of results per page, between 1 and 100.
							";
			
			
			public SearchInvoicesRequest function init( RequestEnvelope requestEnvelope="", string merchantEmail="", SearchParametersType parameters="", numeric page="", numeric pageSize="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setrequestEnvelope(arguments.requestEnvelope);
					
						this.setmerchantEmail(arguments.merchantEmail);
					
						this.setparameters(arguments.parameters);
					
						this.setpage(arguments.page);
					
						this.setpageSize(arguments.pageSize);
					
				
				
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
			
			
			public void function setmerchantEmail(string merchantEmail)
			{
				this.merchantEmail = arguments.merchantEmail;
			}  
				
			public string function getmerchantEmail()
			{
				return this.merchantEmail;
			} 
			
			
			public void function setparameters(SearchParametersType parameters)
			{
				this.parameters = arguments.parameters;
			}  
				
			public SearchParametersType function getparameters()
			{
				return this.parameters;
			} 
			
			
			public void function setpage(numeric page)
			{
				this.page = arguments.page;
			}  
				
			public numeric function getpage()
			{
				return this.page;
			} 
			
			
			public void function setpageSize(numeric pageSize)
			{
				this.pageSize = arguments.pageSize;
			}  
				
			public numeric function getpageSize()
			{
				return this.pageSize;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.requestEnvelope' ) )
					
						local.struct["requestEnvelope"] = getrequestEnvelope().getStruct();
					
				if(  isDefined( 'this.merchantEmail' ) )
					
						local.struct["merchantEmail"] = getmerchantEmail();
					
				if(  isDefined( 'this.parameters' ) )
					
						local.struct["parameters"] = getparameters().getStruct();
					
				if(  isDefined( 'this.page' ) )
					
						local.struct["page"] = getpage();
					
				if(  isDefined( 'this.pageSize' ) )
					
						local.struct["pageSize"] = getpageSize();
					
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
						
						if('#key#' eq 'merchantEmail') {
						
							this.setmerchantEmail(local.json[key]);
						}
						
						if('#key#' eq 'parameters') {
						
							var keyCom = 'parameters';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setparameters( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'page') {
						
							this.setpage(local.json[key]);
						}
						
						if('#key#' eq 'pageSize') {
						
							this.setpageSize(local.json[key]);
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
							
							this.setmerchantEmail(local.json[i]);
							
							this.setparameters(local.json[i]);
							
							this.setpage(local.json[i]);
							
							this.setpageSize(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'requestEnvelope') {
							
                             var keyCom = 'requestEnvelope';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setrequestEnvelope( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'merchantEmail') {
							
								this.setmerchantEmail(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'parameters') {
							
                             var keyCom = 'parameters';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setparameters( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'page') {
							
								this.setpage(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'pageSize') {
							
								this.setpageSize(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
