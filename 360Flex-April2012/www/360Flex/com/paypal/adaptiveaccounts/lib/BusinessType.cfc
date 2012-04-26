
			<cfscript>
			component name="BusinessType" output="false"  hint="I define the properties and methods"
			{
			
				property name="BusinessType"  type="string" display="BusinessType" notempty="true" hint="";
				
			
				public BusinessType function init( string BusinessType="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setBusinessType(arguments.BusinessType);
					  
					return this;  
				}
				
				public void function setBusinessType(string BusinessType)
				{
					this.BusinessType = arguments.BusinessType;
				}  
					
				public string function getBusinessType()
				{
					return this.BusinessType;
				} 
				
				public string function listBusinessType()
				{
					return "ASSOCIATION,CORPORATION,GENERAL_PARTNERSHIP,GOVERNMENT,INDIVIDUAL,LIMITED_LIABILITY_PARTNERSHIP,LIMITED_LIABILITY_PRIVATE_CORPORATION,LIMITED_LIABILITY_PROPRIETORS,LIMITED_PARTNERSHIP,LIMITED_PARTNERSHIP_PRIVATE_CORPORATION,NONPROFIT,OTHER_CORPORATE_BODY,PARTNERSHIP,PRIVATE_CORPORATION,PRIVATE_PARTNERSHIP,PROPRIETORSHIP,PROPRIETORSHIP_CRAFTSMAN,PROPRIETARY_COMPANY,PUBLIC_COMPANY,PUBLIC_CORPORATION,PUBLIC_PARTNERSHIP";
				} 
			
				
				public string function getStruct()
				{
					return getBusinessType();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setBusinessType(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
