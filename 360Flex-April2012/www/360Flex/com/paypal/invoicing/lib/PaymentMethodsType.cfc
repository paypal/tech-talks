
			<cfscript>
			component name="PaymentMethodsType" output="false"  hint="I define the properties and methods"
			{
			
				property name="PaymentMethodsType"  type="string" display="PaymentMethodsType" notempty="true" hint="";
				
			
				public PaymentMethodsType function init( string PaymentMethodsType="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setPaymentMethodsType(arguments.PaymentMethodsType);
					  
					return this;  
				}
				
				public void function setPaymentMethodsType(string PaymentMethodsType)
				{
					this.PaymentMethodsType = arguments.PaymentMethodsType;
				}  
					
				public string function getPaymentMethodsType()
				{
					return this.PaymentMethodsType;
				} 
				
				public string function listPaymentMethodsType()
				{
					return "BankTransfer,Cash,Check,CreditCard,DebitCard,Other,PayPal,WireTransfer";
				} 
			
				
				public string function getStruct()
				{
					return getPaymentMethodsType();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setPaymentMethodsType(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
