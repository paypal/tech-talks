
			<cfscript>
			component name="BankAccountType" output="false"  hint="I define the properties and methods"
			{
			
				property name="BankAccountType"  type="string" display="BankAccountType" notempty="true" hint="";
				
			
				public BankAccountType function init( string BankAccountType="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setBankAccountType(arguments.BankAccountType);
					  
					return this;  
				}
				
				public void function setBankAccountType(string BankAccountType)
				{
					this.BankAccountType = arguments.BankAccountType;
				}  
					
				public string function getBankAccountType()
				{
					return this.BankAccountType;
				} 
				
				public string function listBankAccountType()
				{
					return "CHECKING,SAVINGS,BUSINESS_CHECKING,BUSINESS_SAVINGS,NORMAL,UNKNOWN";
				} 
			
				
				public string function getStruct()
				{
					return getBankAccountType();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setBankAccountType(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
