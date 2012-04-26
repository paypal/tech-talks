
		<cfscript>
		component name="CardDateType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="month"  type="numeric" display="month" required="yes" hint="
                                Month in integer format, between 1 and 12
                            ";
			
			property name="year"  type="numeric" display="year" required="yes" hint="
                                Year in four digit format- YYYY
                            ";
			
			
			public CardDateType function init( numeric month="", numeric year="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setmonth(arguments.month);
					
						this.setyear(arguments.year);
					
				
				
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
			
			
			public void function setmonth(numeric month)
			{
				this.month = arguments.month;
			}  
				
			public numeric function getmonth()
			{
				return this.month;
			} 
			
			
			public void function setyear(numeric year)
			{
				this.year = arguments.year;
			}  
				
			public numeric function getyear()
			{
				return this.year;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.month' ) )
					
						local.struct["month"] = getmonth();
					
				if(  isDefined( 'this.year' ) )
					
						local.struct["year"] = getyear();
					
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
						
						if('#key#' eq 'month') {
						
							this.setmonth(local.json[key]);
						}
						
						if('#key#' eq 'year') {
						
							this.setyear(local.json[key]);
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
							
							this.setmonth(local.json[i]);
							
							this.setyear(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'month') {
							
								this.setmonth(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'year') {
							
								this.setyear(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
