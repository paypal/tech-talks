
		<cfscript>
		component name="GetUserAgreementResponse" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="responseEnvelope"  type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
			
			property name="agreement"  type="string" display="agreement" required="yes" hint="";
			
			
			public GetUserAgreementResponse function init( ResponseEnvelope responseEnvelope="", string agreement="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setresponseEnvelope(arguments.responseEnvelope);
					
						this.setagreement(arguments.agreement);
					
				
				
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
			
			
			public void function setagreement(string agreement)
			{
				this.agreement = arguments.agreement;
			}  
				
			public string function getagreement()
			{
				return this.agreement;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.responseEnvelope' ) )
					
						local.struct["responseEnvelope"] = getresponseEnvelope().getStruct();
					
				if(  isDefined( 'this.agreement' ) )
					
						local.struct["agreement"] = getagreement();
					
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
						
						if('#key#' eq 'agreement') {
						
							this.setagreement(local.json[key]);
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
							
							this.setagreement(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'responseEnvelope') {
							
								
								var keyObj = createObject("component",'#keyCom#');
								this.setresponseEnvelope( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'agreement') {
							
								this.setagreement(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
