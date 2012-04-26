
			<cfscript>
			component name="SalesVenueType" output="false"  hint="I define the properties and methods"
			{
			
				property name="SalesVenueType"  type="string" display="SalesVenueType" notempty="true" hint="";
				
			
				public SalesVenueType function init( string SalesVenueType="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setSalesVenueType(arguments.SalesVenueType);
					  
					return this;  
				}
				
				public void function setSalesVenueType(string SalesVenueType)
				{
					this.SalesVenueType = arguments.SalesVenueType;
				}  
					
				public string function getSalesVenueType()
				{
					return this.SalesVenueType;
				} 
				
				public string function listSalesVenueType()
				{
					return "WEB,EBAY,OTHER_MARKETPLACE,OTHER";
				} 
			
				
				public string function getStruct()
				{
					return getSalesVenueType();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setSalesVenueType(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
