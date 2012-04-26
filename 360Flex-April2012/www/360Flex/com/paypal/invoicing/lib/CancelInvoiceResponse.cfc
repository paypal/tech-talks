
		<cfscript>
		component name="CancelInvoiceResponse" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="responseEnvelope"  type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
			
			property name="invoiceID"  type="string" display="invoiceID" required="yes" hint="
								The canceled invoice's ID.
							";
			
			property name="invoiceNumber"  type="string" display="invoiceNumber" required="yes" hint="
								The canceled invoice's number.
							";
			
			property name="invoiceURL"  type="string" display="invoiceURL" required="yes" hint="
								The URL which lead merchant to view the invoice details on web.
							";
			
			
			public CancelInvoiceResponse function init( ResponseEnvelope responseEnvelope="", string invoiceID="", string invoiceNumber="", string invoiceURL="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setresponseEnvelope(arguments.responseEnvelope);
					
						this.setinvoiceID(arguments.invoiceID);
					
						this.setinvoiceNumber(arguments.invoiceNumber);
					
						this.setinvoiceURL(arguments.invoiceURL);
					
				
				
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
			
			
			public void function setinvoiceID(string invoiceID)
			{
				this.invoiceID = arguments.invoiceID;
			}  
				
			public string function getinvoiceID()
			{
				return this.invoiceID;
			} 
			
			
			public void function setinvoiceNumber(string invoiceNumber)
			{
				this.invoiceNumber = arguments.invoiceNumber;
			}  
				
			public string function getinvoiceNumber()
			{
				return this.invoiceNumber;
			} 
			
			
			public void function setinvoiceURL(string invoiceURL)
			{
				this.invoiceURL = arguments.invoiceURL;
			}  
				
			public string function getinvoiceURL()
			{
				return this.invoiceURL;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.responseEnvelope' ) )
					
						local.struct["responseEnvelope"] = getresponseEnvelope().getStruct();
					
				if(  isDefined( 'this.invoiceID' ) )
					
						local.struct["invoiceID"] = getinvoiceID();
					
				if(  isDefined( 'this.invoiceNumber' ) )
					
						local.struct["invoiceNumber"] = getinvoiceNumber();
					
				if(  isDefined( 'this.invoiceURL' ) )
					
						local.struct["invoiceURL"] = getinvoiceURL();
					
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
						
						if('#key#' eq 'invoiceID') {
						
							this.setinvoiceID(local.json[key]);
						}
						
						if('#key#' eq 'invoiceNumber') {
						
							this.setinvoiceNumber(local.json[key]);
						}
						
						if('#key#' eq 'invoiceURL') {
						
							this.setinvoiceURL(local.json[key]);
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
							
							this.setinvoiceID(local.json[i]);
							
							this.setinvoiceNumber(local.json[i]);
							
							this.setinvoiceURL(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'responseEnvelope') {
							
                             var keyCom = 'responseEnvelope';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setresponseEnvelope( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'invoiceID') {
							
								this.setinvoiceID(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'invoiceNumber') {
							
								this.setinvoiceNumber(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'invoiceURL') {
							
								this.setinvoiceURL(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
