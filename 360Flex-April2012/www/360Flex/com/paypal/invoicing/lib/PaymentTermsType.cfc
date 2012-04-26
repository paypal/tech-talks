
			<cfscript>
			component name="PaymentTermsType" output="false"  hint="I define the properties and methods"
			{
			
				property name="PaymentTermsType"  type="string" display="PaymentTermsType" notempty="true" hint="";
				
			
				public PaymentTermsType function init( string PaymentTermsType="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setPaymentTermsType(arguments.PaymentTermsType);
					  
					return this;  
				}
				
				public void function setPaymentTermsType(string PaymentTermsType)
				{
					this.PaymentTermsType = arguments.PaymentTermsType;
				}  
					
				public string function getPaymentTermsType()
				{
					return this.PaymentTermsType;
				} 
				
				public string function listPaymentTermsType()
				{
					return "DueOnReceipt,DueOnDateSpecified,Net10,Net15,Net30,Net45";
				} 
			
				
				public string function getStruct()
				{
					return getPaymentTermsType();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setPaymentTermsType(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
