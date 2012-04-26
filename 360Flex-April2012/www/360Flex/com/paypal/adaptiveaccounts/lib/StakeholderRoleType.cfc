
			<cfscript>
			component name="StakeholderRoleType" output="false"  hint="I define the properties and methods"
			{
			
				property name="StakeholderRoleType"  type="string" display="StakeholderRoleType" notempty="true" hint="";
				
			
				public StakeholderRoleType function init( string StakeholderRoleType="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setStakeholderRoleType(arguments.StakeholderRoleType);
					  
					return this;  
				}
				
				public void function setStakeholderRoleType(string StakeholderRoleType)
				{
					this.StakeholderRoleType = arguments.StakeholderRoleType;
				}  
					
				public string function getStakeholderRoleType()
				{
					return this.StakeholderRoleType;
				} 
				
				public string function listStakeholderRoleType()
				{
					return "CHAIRMAN,SECRETARY,TREASURER,BENEFICIAL_OWNER,PRIMARY_CONTACT,INDIVIDUAL_PARTNER,NON_INDIVIDUAL_PARTNER,PRIMARY_INDIVIDUAL_PARTNER,DIRECTOR,NO_BENEFICIAL_OWNER";
				} 
			
				
				public string function getStruct()
				{
					return getStakeholderRoleType();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setStakeholderRoleType(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
