
		<cfscript>
		component name="GetInvoiceDetailsRequest" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
			
			property name="invoiceID"  type="string" display="invoiceID" required="yes" hint="
								ID of the invoice to retrieve.
							";
			
			
			public GetInvoiceDetailsRequest function init( RequestEnvelope requestEnvelope="", string invoiceID="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setrequestEnvelope(arguments.requestEnvelope);
					
						this.setinvoiceID(arguments.invoiceID);
					
				
				
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
			
			
			public void function setinvoiceID(string invoiceID)
			{
				this.invoiceID = arguments.invoiceID;
			}  
				
			public string function getinvoiceID()
			{
				return this.invoiceID;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.requestEnvelope' ) )
					
						local.struct["requestEnvelope"] = getrequestEnvelope().getStruct();
					
				if(  isDefined( 'this.invoiceID' ) )
					
						local.struct["invoiceID"] = getinvoiceID();
					
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
						
						if('#key#' eq 'invoiceID') {
						
							this.setinvoiceID(local.json[key]);
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
							
							this.setinvoiceID(local.json[i]);
							
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
											
							
							if('#key#' eq 'invoiceID') {
							
								this.setinvoiceID(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
