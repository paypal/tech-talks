
			<cfscript>
			component name="StatusType" output="false"  hint="I define the properties and methods"
			{
			
				property name="StatusType"  type="string" display="StatusType" notempty="true" hint="";
				
			
				public StatusType function init( string StatusType="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setStatusType(arguments.StatusType);
					  
					return this;  
				}
				
				public void function setStatusType(string StatusType)
				{
					this.StatusType = arguments.StatusType;
				}  
					
				public string function getStatusType()
				{
					return this.StatusType;
				} 
				
				public string function listStatusType()
				{
					return "Draft,Sent,Paid,MarkedAsPaid,Canceled,Refunded,PartiallyRefunded";
				} 
			
				
				public string function getStruct()
				{
					return getStatusType();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setStatusType(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
