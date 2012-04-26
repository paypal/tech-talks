
		<cfscript>
		component name="OtherPaymentDetailsType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="method"  type="PaymentMethodsType" display="method" required="no" hint="
								Method used for the offline payment.
							";
			
			property name="note"  type="string" display="note" required="no" hint="
								Optional note associated with the payment.
							";
			
			property name="date"  type="string" display="date" required="no" hint="
								Date when the invoice was paid.
							";
			
			
			public OtherPaymentDetailsType function init( )
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
			
			
			public void function setmethod(PaymentMethodsType method)
			{
				this.method = arguments.method;
			}  
				
			public PaymentMethodsType function getmethod()
			{
				return this.method;
			} 
			
			
			public void function setnote(string note)
			{
				this.note = arguments.note;
			}  
				
			public string function getnote()
			{
				return this.note;
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
						
				
				if(  isDefined( 'this.method' ) )
					
						local.struct["method"] = getmethod().getStruct();
					
				if(  isDefined( 'this.note' ) )
					
						local.struct["note"] = getnote();
					
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
						
						if('#key#' eq 'method') {
						
							var keyCom = 'method';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setmethod( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'note') {
						
							this.setnote(local.json[key]);
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
							
							this.setmethod(local.json[i]);
							
							this.setnote(local.json[i]);
							
							this.setdate(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'method') {
							
                             var keyCom = 'method';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setmethod( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'note') {
							
								this.setnote(local.json[i][key]);
							
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
		
