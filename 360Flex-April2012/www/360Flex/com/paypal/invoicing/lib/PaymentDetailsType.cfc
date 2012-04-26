
		<cfscript>
		component name="PaymentDetailsType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="viaPayPal"  type="boolean" display="viaPayPal" required="yes" hint="
								True if the invoice was paid using PayPal.
							";
			
			property name="paypalPayment"  type="PayPalPaymentDetailsType" display="paypalPayment" required="no" hint="
								PayPal payment details.
							";
			
			property name="otherPayment"  type="OtherPaymentDetailsType" display="otherPayment" required="no" hint="
								PayPal payment details.
							";
			
			
			public PaymentDetailsType function init( boolean viaPayPal="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setviaPayPal(arguments.viaPayPal);
					
				
				
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
			
			
			public void function setviaPayPal(boolean viaPayPal)
			{
				this.viaPayPal = arguments.viaPayPal;
			}  
				
			public boolean function getviaPayPal()
			{
				return this.viaPayPal;
			} 
			
			
			public void function setpaypalPayment(PayPalPaymentDetailsType paypalPayment)
			{
				this.paypalPayment = arguments.paypalPayment;
			}  
				
			public PayPalPaymentDetailsType function getpaypalPayment()
			{
				return this.paypalPayment;
			} 
			
			
			public void function setotherPayment(OtherPaymentDetailsType otherPayment)
			{
				this.otherPayment = arguments.otherPayment;
			}  
				
			public OtherPaymentDetailsType function getotherPayment()
			{
				return this.otherPayment;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.viaPayPal' ) )
					
						local.struct["viaPayPal"] = getviaPayPal();
					
				if(  isDefined( 'this.paypalPayment' ) )
					
						local.struct["paypalPayment"] = getpaypalPayment().getStruct();
					
				if(  isDefined( 'this.otherPayment' ) )
					
						local.struct["otherPayment"] = getotherPayment().getStruct();
					
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
						
						if('#key#' eq 'viaPayPal') {
						
							this.setviaPayPal(local.json[key]);
						}
						
						if('#key#' eq 'paypalPayment') {
						
							var keyCom = 'paypalPayment';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setpaypalPayment( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'otherPayment') {
						
							var keyCom = 'otherPayment';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setotherPayment( keyObj.deserialize(local.json[key]) );
							
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
							
							this.setviaPayPal(local.json[i]);
							
							this.setpaypalPayment(local.json[i]);
							
							this.setotherPayment(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'viaPayPal') {
							
								this.setviaPayPal(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'paypalPayment') {
							
                             var keyCom = 'paypalPayment';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setpaypalPayment( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'otherPayment') {
							
                             var keyCom = 'otherPayment';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setotherPayment( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
