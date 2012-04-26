
			<cfscript>
			component name="ReferrerCode" output="false"  hint="I define the properties and methods"
			{
			
				property name="ReferrerCode"  type="string" display="ReferrerCode" notempty="true" hint="";
				
			
				public ReferrerCode function init( string ReferrerCode="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setReferrerCode(arguments.ReferrerCode);
					  
					return this;  
				}
				
				public void function setReferrerCode(string ReferrerCode)
				{
					this.ReferrerCode = arguments.ReferrerCode;
				}  
					
				public string function getReferrerCode()
				{
					return this.ReferrerCode;
				} 
				
				public string function listReferrerCode()
				{
					return "";
				} 
			
				
				public string function getStruct()
				{
					return getReferrerCode();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setReferrerCode(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
