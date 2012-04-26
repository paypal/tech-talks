
		<cfscript>
		component name="InvoiceSummaryListType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="invoice"  type="InvoiceSummaryType" display="invoice" required="no" hint="";
			variables.items= ArrayNew(1);
			
			public InvoiceSummaryListType function init( )
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
			
			
			public void function setinvoice(InvoiceSummaryType invoice)
			{
				this.invoice = arguments.invoice;
			}  
				
			public InvoiceSummaryType function getinvoice()
			{
				return this.invoice;
			} 
			
			
			
			public any function addItem(InvoiceSummaryType  item)
			{
				if(Compare('InvoiceSummaryType','string') eq 0)
				{
					ArrayAppend(variables.items,arguments.item);
				} else {
					ArrayAppend(variables.items,arguments.item.getStruct());
				}
				
			} 
			
			public any function getItems()
			{
				return variables.items;
			} 
			
			public any function clearItems()
			{
				variables.items = ArrayNew(1);
			} 
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.invoice' ) )
					
						local.struct["invoice"] =getItems();
					
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
						
						if('#key#' eq 'invoice') {
						
							var keyCom = 'invoice';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setinvoice( keyObj.deserialize(local.json[key]) );
							
							this.addItem(keyObj.deserialize(local.json[key]));
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
							
							this.setinvoice(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'invoice') {
							
                             var keyCom = 'invoice';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setinvoice( keyObj.deserialize(local.json[i][key]) );
								
									this.addItem(keyObj.deserialize(local.json[i][key]));
								
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
