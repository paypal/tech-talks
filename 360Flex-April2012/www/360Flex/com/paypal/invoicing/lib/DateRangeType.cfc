
		<cfscript>
		component name="DateRangeType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="startDate"  type="string" display="startDate" required="no" hint="
								Start of the date range.
							";
			
			property name="endDate"  type="string" display="endDate" required="no" hint="
								End of the date range.
							";
			
			
			public DateRangeType function init( )
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
				
				
				return this;  
			}
			
			public void function setError(ErrorData error)
			{
				this.error = arguments.error;
			}  
				
			public ErrorData function getError()
			{
				return this.error;
			} 
			
			
			public void function setstartDate(string startDate)
			{
				this.startDate = arguments.startDate;
			}  
				
			public string function getstartDate()
			{
				return this.startDate;
			} 
			
			
			public void function setendDate(string endDate)
			{
				this.endDate = arguments.endDate;
			}  
				
			public string function getendDate()
			{
				return this.endDate;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.startDate' ) )
					
						local.struct["startDate"] = getstartDate();
					
				if(  isDefined( 'this.endDate' ) )
					
						local.struct["endDate"] = getendDate();
					
				return local.struct;
			} 
			
			public any function serialize()
			{
				return serializeJSON(this.getStruct());
			} 
			
			public any function deserialize(any jsonObj)
			{
				if(isJSON(jsonObj))
				{
					local.json = deserializeJSON(jsonObj);
				} else {
					local.json = jsonObj;
				}
				
				if(isStruct(local.json))
				{
				
					for(key in local.json)
					{
						
						if('#key#' eq 'startDate') {
						
							this.setstartDate(local.json[key]);
						}
						
						if('#key#' eq 'endDate') {
						
							this.setendDate(local.json[key]);
						}
						
						
						if('#key#' eq 'error')
						{	
							var keyObj = createObject("component",'ErrorData');
							this.setError( keyObj.deserialize(local.json[key]) );	
						}
						
					}
				} else if (isArray(local.json)) {
				
					for( i = 1; i lte ArrayLen(local.json); i = i + 1)
					{
					
						if(NOT isStruct(local.json[i]))
						{
							
							this.setstartDate(local.json[i]);
							
							this.setendDate(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'startDate') {
							
								this.setstartDate(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'endDate') {
							
								this.setendDate(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
