
		<cfscript>
		component name="FaultMessage" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="responseEnvelope"  type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
			
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			variables.items= ArrayNew(1);
			
			public FaultMessage function init( ResponseEnvelope responseEnvelope="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setresponseEnvelope(arguments.responseEnvelope);
					
				
				
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
			
			
			public void function setresponseEnvelope(ResponseEnvelope responseEnvelope)
			{
				this.responseEnvelope = arguments.responseEnvelope;
			}  
				
			public ResponseEnvelope function getresponseEnvelope()
			{
				return this.responseEnvelope;
			} 
			
			
			public void function seterror(ErrorData error)
			{
				this.error = arguments.error;
			}  
				
			public ErrorData function geterror()
			{
				return this.error;
			} 
			
			
			
			public any function addItem(ErrorData  item)
			{
				if(Compare('ErrorData','string') eq 0)
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
						
				
				if(  isDefined( 'this.responseEnvelope' ) )
					
						local.struct["responseEnvelope"] = getresponseEnvelope().getStruct();
					
				if(  isDefined( 'this.error' ) )
					
						local.struct["error"] =getItems();
					
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
						
						if('#key#' eq 'responseEnvelope') {
						
							var keyCom = 'responseEnvelope';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setresponseEnvelope( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'error') {
						
							var keyCom = 'error';
							
							keyCom = 'ErrorData'; 
							var keyObj = createObject("component",'#keyCom#');
							this.seterror( keyObj.deserialize(local.json[key]) );
							
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
							
							this.setresponseEnvelope(local.json[i]);
							
							this.seterror(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'responseEnvelope') {
							
                             var keyCom = 'responseEnvelope';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setresponseEnvelope( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'error') {
							
                             var keyCom = 'error';
								
								keyCom = 'ErrorData';
								
								var keyObj = createObject("component",'#keyCom#');
								this.seterror( keyObj.deserialize(local.json[i][key]) );
								
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
		
