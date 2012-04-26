
			<cfscript>
			component name="DayOfWeek" output="false"  hint="I define the properties and methods"
			{
			
				property name="DayOfWeek"  type="string" display="DayOfWeek" notempty="true" hint="";
				
			
				public DayOfWeek function init( string DayOfWeek="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setDayOfWeek(arguments.DayOfWeek);
					  
					return this;  
				}
				
				public void function setDayOfWeek(string DayOfWeek)
				{
					this.DayOfWeek = arguments.DayOfWeek;
				}  
					
				public string function getDayOfWeek()
				{
					return this.DayOfWeek;
				} 
				
				public string function listDayOfWeek()
				{
					return "NO_DAY_SPECIFIED,SUNDAY,MONDAY,TUESDAY,WEDNESDAY,THURSDAY,FRIDAY,SATURDAY";
				} 
			
				
				public string function getStruct()
				{
					return getDayOfWeek();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setDayOfWeek(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
