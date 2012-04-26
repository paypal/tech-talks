
			<cfscript>
			component name="OriginType" output="false"  hint="I define the properties and methods"
			{
			
				property name="OriginType"  type="string" display="OriginType" notempty="true" hint="";
				
			
				public OriginType function init( string OriginType="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setOriginType(arguments.OriginType);
					  
					return this;  
				}
				
				public void function setOriginType(string OriginType)
				{
					this.OriginType = arguments.OriginType;
				}  
					
				public string function getOriginType()
				{
					return this.OriginType;
				} 
				
				public string function listOriginType()
				{
					return "Web,API";
				} 
			
				
				public string function getStruct()
				{
					return getOriginType();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setOriginType(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
