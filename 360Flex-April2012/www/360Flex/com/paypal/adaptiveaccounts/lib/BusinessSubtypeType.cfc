
			<cfscript>
			component name="BusinessSubtypeType" output="false"  hint="I define the properties and methods"
			{
			
				property name="BusinessSubtypeType"  type="string" display="BusinessSubtypeType" notempty="true" hint="";
				
			
				public BusinessSubtypeType function init( string BusinessSubtypeType="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setBusinessSubtypeType(arguments.BusinessSubtypeType);
					  
					return this;  
				}
				
				public void function setBusinessSubtypeType(string BusinessSubtypeType)
				{
					this.BusinessSubtypeType = arguments.BusinessSubtypeType;
				}  
					
				public string function getBusinessSubtypeType()
				{
					return this.BusinessSubtypeType;
				} 
				
				public string function listBusinessSubtypeType()
				{
					return "ENTITY,EMANATION,ESTD_COMMONWEALTH,ESTD_UNDER_STATE_TERRITORY,ESTD_UNDER_FOREIGN_COUNTRY,INCORPORATED,NON_INCORPORATED";
				} 
			
				
				public string function getStruct()
				{
					return getBusinessSubtypeType();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setBusinessSubtypeType(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
