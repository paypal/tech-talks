
		<cfscript>
		component name="CancelInvoiceRequest" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="requestEnvelope"  type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
			
			property name="invoiceID"  type="string" display="invoiceID" required="no" hint="
								invoice's ID
							";
			
			property name="subject"  type="string" display="subject" required="no" hint="
								Subject of the cancellation notification
							";
			
			property name="noteForPayer"  type="string" display="noteForPayer" required="no" hint="
								Note to send payer within the cancellation notification
							";
			
			property name="sendCopyToMerchant"  type="boolean" display="sendCopyToMerchant" required="no" hint="
								send a copy of cancellation notification to merchant
							";
			
			
			public CancelInvoiceRequest function init( RequestEnvelope requestEnvelope="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setrequestEnvelope(arguments.requestEnvelope);
					
				
				
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
			
			
			public void function setsubject(string subject)
			{
				this.subject = arguments.subject;
			}  
				
			public string function getsubject()
			{
				return this.subject;
			} 
			
			
			public void function setnoteForPayer(string noteForPayer)
			{
				this.noteForPayer = arguments.noteForPayer;
			}  
				
			public string function getnoteForPayer()
			{
				return this.noteForPayer;
			} 
			
			
			public void function setsendCopyToMerchant(boolean sendCopyToMerchant)
			{
				this.sendCopyToMerchant = arguments.sendCopyToMerchant;
			}  
				
			public boolean function getsendCopyToMerchant()
			{
				return this.sendCopyToMerchant;
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
					
				if(  isDefined( 'this.subject' ) )
					
						local.struct["subject"] = getsubject();
					
				if(  isDefined( 'this.noteForPayer' ) )
					
						local.struct["noteForPayer"] = getnoteForPayer();
					
				if(  isDefined( 'this.sendCopyToMerchant' ) )
					
						local.struct["sendCopyToMerchant"] = getsendCopyToMerchant();
					
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
						
						if('#key#' eq 'subject') {
						
							this.setsubject(local.json[key]);
						}
						
						if('#key#' eq 'noteForPayer') {
						
							this.setnoteForPayer(local.json[key]);
						}
						
						if('#key#' eq 'sendCopyToMerchant') {
						
							this.setsendCopyToMerchant(local.json[key]);
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
							
							this.setsubject(local.json[i]);
							
							this.setnoteForPayer(local.json[i]);
							
							this.setsendCopyToMerchant(local.json[i]);
							
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
											
							
							if('#key#' eq 'subject') {
							
								this.setsubject(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'noteForPayer') {
							
								this.setnoteForPayer(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'sendCopyToMerchant') {
							
								this.setsendCopyToMerchant(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
