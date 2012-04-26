
			<cfscript>
			component name="AckCode" output="false"  hint="I define the properties and methods"
			{
			
				property name="AckCode"  type="string" display="AckCode" notempty="true" hint="";
				
			
				public AckCode function init( string AckCode="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setAckCode(arguments.AckCode);
					  
					return this;  
				}
				
				public void function setAckCode(string AckCode)
				{
					this.AckCode = arguments.AckCode;
				}  
					
				public string function getAckCode()
				{
					return this.AckCode;
				} 
				
				public string function listAckCode()
				{
					return "Success,Failure,Warning,SuccessWithWarning,FailureWithWarning";
				} 
			
				
				public string function getStruct()
				{
					return getAckCode();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setAckCode(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
