
			<cfscript>
			component name="ConfirmationType" output="false"  hint="I define the properties and methods"
			{
			
				property name="ConfirmationType"  type="string" display="ConfirmationType" notempty="true" hint="";
				
			
				public ConfirmationType function init( string ConfirmationType="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setConfirmationType(arguments.ConfirmationType);
					  
					return this;  
				}
				
				public void function setConfirmationType(string ConfirmationType)
				{
					this.ConfirmationType = arguments.ConfirmationType;
				}  
					
				public string function getConfirmationType()
				{
					return this.ConfirmationType;
				} 
				
				public string function listConfirmationType()
				{
					return "WEB,MOBILE,NONE";
				} 
			
				
				public string function getStruct()
				{
					return getConfirmationType();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setConfirmationType(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
