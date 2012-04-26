
		<cfscript>
		component name="GetInvoiceDetailsResponse" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="responseEnvelope"  type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
			
			property name="invoice"  type="InvoiceType" display="invoice" required="yes" hint="
								The requested invoice.
							";
			
			property name="invoiceDetails"  type="InvoiceDetailsType" display="invoiceDetails" required="yes" hint="
								The requested invoice details.
							";
			
			property name="paymentDetails"  type="PaymentDetailsType" display="paymentDetails" required="no" hint="
								The requested invoice payment details.
							";
			
			property name="invoiceURL"  type="string" display="invoiceURL" required="yes" hint="
								The URL which lead merchant to view the invoice details on web.
							";
			
			
			public GetInvoiceDetailsResponse function init( ResponseEnvelope responseEnvelope="", InvoiceType invoice="", InvoiceDetailsType invoiceDetails="", string invoiceURL="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setresponseEnvelope(arguments.responseEnvelope);
					
						this.setinvoice(arguments.invoice);
					
						this.setinvoiceDetails(arguments.invoiceDetails);
					
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
			
			
			public void function setinvoice(InvoiceType invoice)
			{
				this.invoice = arguments.invoice;
			}  
				
			public InvoiceType function getinvoice()
			{
				return this.invoice;
			} 
			
			
			public void function setinvoiceDetails(InvoiceDetailsType invoiceDetails)
			{
				this.invoiceDetails = arguments.invoiceDetails;
			}  
				
			public InvoiceDetailsType function getinvoiceDetails()
			{
				return this.invoiceDetails;
			} 
			
			
			public void function setpaymentDetails(PaymentDetailsType paymentDetails)
			{
				this.paymentDetails = arguments.paymentDetails;
			}  
				
			public PaymentDetailsType function getpaymentDetails()
			{
				return this.paymentDetails;
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
					
				if(  isDefined( 'this.invoice' ) )
					
						local.struct["invoice"] = getinvoice().getStruct();
					
				if(  isDefined( 'this.invoiceDetails' ) )
					
						local.struct["invoiceDetails"] = getinvoiceDetails().getStruct();
					
				if(  isDefined( 'this.paymentDetails' ) )
					
						local.struct["paymentDetails"] = getpaymentDetails().getStruct();
					
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
						
						if('#key#' eq 'invoice') {
						
							var keyCom = 'invoice';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setinvoice( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'invoiceDetails') {
						
							var keyCom = 'invoiceDetails';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setinvoiceDetails( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'paymentDetails') {
						
							var keyCom = 'paymentDetails';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setpaymentDetails( keyObj.deserialize(local.json[key]) );
							
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
							
							this.setinvoice(local.json[i]);
							
							this.setinvoiceDetails(local.json[i]);
							
							this.setpaymentDetails(local.json[i]);
							
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
											
							
							if('#key#' eq 'invoice') {
							
                             var keyCom = 'invoice';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setinvoice( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'invoiceDetails') {
							
                             var keyCom = 'invoiceDetails';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setinvoiceDetails( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'paymentDetails') {
							
                             var keyCom = 'paymentDetails';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setpaymentDetails( keyObj.deserialize(local.json[i][key]) );
								
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
		
