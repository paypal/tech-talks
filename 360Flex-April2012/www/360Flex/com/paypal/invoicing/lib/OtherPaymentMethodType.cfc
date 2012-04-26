
			<cfscript>
			component name="OtherPaymentMethodType" output="false"  hint="I define the properties and methods"
			{
			
				property name="OtherPaymentMethodType"  type="string" display="OtherPaymentMethodType" notempty="true" hint="";
				
			
				public OtherPaymentMethodType function init( string OtherPaymentMethodType="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setOtherPaymentMethodType(arguments.OtherPaymentMethodType);
					  
					return this;  
				}
				
				public void function setOtherPaymentMethodType(string OtherPaymentMethodType)
				{
					this.OtherPaymentMethodType = arguments.OtherPaymentMethodType;
				}  
					
				public string function getOtherPaymentMethodType()
				{
					return this.OtherPaymentMethodType;
				} 
				
				public string function listOtherPaymentMethodType()
				{
					return "Bank_transfer,Cash,Check,Credit_card,Debit_card,PayPal,Wire_transfer,Other";
				} 
			
				
				public string function getStruct()
				{
					return getOtherPaymentMethodType();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setOtherPaymentMethodType(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
