
		<cfscript>
		component name="InvoiceItemListType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="item"  type="InvoiceItemType" display="item" required="yes" hint="";
			variables.items= ArrayNew(1);
			
			public InvoiceItemListType function init( InvoiceItemType item="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setitem(arguments.item);
					
						addItem(arguments.item);
					
				
				
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
			
			
			public void function setitem(InvoiceItemType item)
			{
				this.item = arguments.item;
			}  
				
			public InvoiceItemType function getitem()
			{
				return this.item;
			} 
			
			
			
			public any function addItem(InvoiceItemType  item)
			{
				if(Compare('InvoiceItemType','string') eq 0)
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
						
				
				if(  isDefined( 'this.item' ) )
					
						local.struct["item"] =getItems();
					
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
						
						if('#key#' eq 'item') {
						
							var keyCom = 'item';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setitem( keyObj.deserialize(local.json[key]) );
							
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
							
							this.setitem(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'item') {
							
                             var keyCom = 'item';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setitem( keyObj.deserialize(local.json[i][key]) );
								
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
		
