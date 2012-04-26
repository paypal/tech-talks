
		<cfscript>
		component name="ErrorData" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="errorId"  type="numeric" display="errorId" required="no" hint="";
			
			property name="domain"  type="string" display="domain" required="no" hint="";
			
			property name="subdomain"  type="string" display="subdomain" required="no" hint="";
			
			property name="severity"  type="ErrorSeverity" display="severity" required="no" hint="";
			
			property name="category"  type="ErrorCategory" display="category" required="no" hint="";
			
			property name="message"  type="string" display="message" required="no" hint="";
			
			property name="exceptionId"  type="string" display="exceptionId" required="no" hint="";
			
			property name="parameter"  type="ErrorParameter" display="parameter" required="no" hint="";
			variables.items= ArrayNew(1);
			
			public ErrorData function init( )
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
			
			
			public void function seterrorId(numeric errorId)
			{
				this.errorId = arguments.errorId;
			}  
				
			public numeric function geterrorId()
			{
				return this.errorId;
			} 
			
			
			public void function setdomain(string domain)
			{
				this.domain = arguments.domain;
			}  
				
			public string function getdomain()
			{
				return this.domain;
			} 
			
			
			public void function setsubdomain(string subdomain)
			{
				this.subdomain = arguments.subdomain;
			}  
				
			public string function getsubdomain()
			{
				return this.subdomain;
			} 
			
			
			public void function setseverity(ErrorSeverity severity)
			{
				this.severity = arguments.severity;
			}  
				
			public ErrorSeverity function getseverity()
			{
				return this.severity;
			} 
			
			
			public void function setcategory(ErrorCategory category)
			{
				this.category = arguments.category;
			}  
				
			public ErrorCategory function getcategory()
			{
				return this.category;
			} 
			
			
			public void function setmessage(string message)
			{
				this.message = arguments.message;
			}  
				
			public string function getmessage()
			{
				return this.message;
			} 
			
			
			public void function setexceptionId(string exceptionId)
			{
				this.exceptionId = arguments.exceptionId;
			}  
				
			public string function getexceptionId()
			{
				return this.exceptionId;
			} 
			
			
			public void function setparameter(ErrorParameter parameter)
			{
				this.parameter = arguments.parameter;
			}  
				
			public ErrorParameter function getparameter()
			{
				return this.parameter;
			} 
			
			
			
			public any function addItem(ErrorParameter  item)
			{
				if(Compare('ErrorParameter','string') eq 0)
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
						
				
				if(  isDefined( 'this.errorId' ) )
					
						local.struct["errorId"] = geterrorId();
					
				if(  isDefined( 'this.domain' ) )
					
						local.struct["domain"] = getdomain();
					
				if(  isDefined( 'this.subdomain' ) )
					
						local.struct["subdomain"] = getsubdomain();
					
				if(  isDefined( 'this.severity' ) )
					
						local.struct["severity"] = getseverity().getStruct();
					
				if(  isDefined( 'this.category' ) )
					
						local.struct["category"] = getcategory().getStruct();
					
				if(  isDefined( 'this.message' ) )
					
						local.struct["message"] = getmessage();
					
				if(  isDefined( 'this.exceptionId' ) )
					
						local.struct["exceptionId"] = getexceptionId();
					
				if(  isDefined( 'this.parameter' ) )
					
						local.struct["parameter"] =getItems();
					
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
						
						if('#key#' eq 'errorId') {
						
							this.seterrorId(local.json[key]);
						}
						
						if('#key#' eq 'domain') {
						
							this.setdomain(local.json[key]);
						}
						
						if('#key#' eq 'subdomain') {
						
							this.setsubdomain(local.json[key]);
						}
						
						if('#key#' eq 'severity') {
						
							var keyCom = 'severity';
							
							keyCom = 'ErrorSeverity'; 
							var keyObj = createObject("component",'#keyCom#');
							this.setseverity( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'category') {
						
							var keyCom = 'category';
							
							keyCom = 'ErrorCategory'; 
							var keyObj = createObject("component",'#keyCom#');
							this.setcategory( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'message') {
						
							this.setmessage(local.json[key]);
						}
						
						if('#key#' eq 'exceptionId') {
						
							this.setexceptionId(local.json[key]);
						}
						
						if('#key#' eq 'parameter') {
						
							var keyCom = 'parameter';
							
							keyCom = 'ErrorParameter'; 
							var keyObj = createObject("component",'#keyCom#');
							this.setparameter( keyObj.deserialize(local.json[key]) );
							
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
							
							this.seterrorId(local.json[i]);
							
							this.setdomain(local.json[i]);
							
							this.setsubdomain(local.json[i]);
							
							this.setseverity(local.json[i]);
							
							this.setcategory(local.json[i]);
							
							this.setmessage(local.json[i]);
							
							this.setexceptionId(local.json[i]);
							
							this.setparameter(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'errorId') {
							
								this.seterrorId(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'domain') {
							
								this.setdomain(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'subdomain') {
							
								this.setsubdomain(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'severity') {
							
                             var keyCom = 'severity';
								
								keyCom = 'ErrorSeverity';
								
								var keyObj = createObject("component",'#keyCom#');
								this.setseverity( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'category') {
							
                             var keyCom = 'category';
								
								keyCom = 'ErrorCategory';
								
								var keyObj = createObject("component",'#keyCom#');
								this.setcategory( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'message') {
							
								this.setmessage(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'exceptionId') {
							
								this.setexceptionId(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'parameter') {
							
                             var keyCom = 'parameter';
								
								keyCom = 'ErrorParameter';
								
								var keyObj = createObject("component",'#keyCom#');
								this.setparameter( keyObj.deserialize(local.json[i][key]) );
								
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
		
