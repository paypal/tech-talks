
		<cfscript>
		component name="PayPalPaymentDetailsType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="transactionID"  type="string" display="transactionID" required="yes" hint="
								Transaction ID of the PayPal payment.
							";
			
			property name="date"  type="string" display="date" required="no" hint="
								Date when the invoice was paid.
							";
			
			
			public PayPalPaymentDetailsType function init( string transactionID="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.settransactionID(arguments.transactionID);
					
				
				
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
			
			
			public void function settransactionID(string transactionID)
			{
				this.transactionID = arguments.transactionID;
			}  
				
			public string function gettransactionID()
			{
				return this.transactionID;
			} 
			
			
			public void function setdate(string date)
			{
				this.date = arguments.date;
			}  
				
			public string function getdate()
			{
				return this.date;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.transactionID' ) )
					
						local.struct["transactionID"] = gettransactionID();
					
				if(  isDefined( 'this.date' ) )
					
						local.struct["date"] = getdate();
					
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
						
						if('#key#' eq 'transactionID') {
						
							this.settransactionID(local.json[key]);
						}
						
						if('#key#' eq 'date') {
						
							this.setdate(local.json[key]);
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
							
							this.settransactionID(local.json[i]);
							
							this.setdate(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'transactionID') {
							
								this.settransactionID(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'date') {
							
								this.setdate(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
