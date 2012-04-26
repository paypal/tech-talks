
			<cfscript>
			component name="ActorType" output="false"  hint="I define the properties and methods"
			{
			
				property name="ActorType"  type="string" display="ActorType" notempty="true" hint="";
				
			
				public ActorType function init( string ActorType="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setActorType(arguments.ActorType);
					  
					return this;  
				}
				
				public void function setActorType(string ActorType)
				{
					this.ActorType = arguments.ActorType;
				}  
					
				public string function getActorType()
				{
					return this.ActorType;
				} 
				
				public string function listActorType()
				{
					return "Merchant,Payer";
				} 
			
				
				public string function getStruct()
				{
					return getActorType();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setActorType(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
