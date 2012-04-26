
			<cfscript>
			component name="ErrorSeverity" output="false"  hint="I define the properties and methods"
			{
			
				property name="ErrorSeverity"  type="string" display="ErrorSeverity" notempty="true" hint="";
				
			
				public ErrorSeverity function init( string ErrorSeverity="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setErrorSeverity(arguments.ErrorSeverity);
					  
					return this;  
				}
				
				public void function setErrorSeverity(string ErrorSeverity)
				{
					this.ErrorSeverity = arguments.ErrorSeverity;
				}  
					
				public string function getErrorSeverity()
				{
					return this.ErrorSeverity;
				} 
				
				public string function listErrorSeverity()
				{
					return "Error,Warning";
				} 
			
				
				public string function getStruct()
				{
					return getErrorSeverity();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setErrorSeverity(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
