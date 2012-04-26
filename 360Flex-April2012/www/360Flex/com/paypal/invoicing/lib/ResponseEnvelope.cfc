
		<cfscript>
		component name="ResponseEnvelope" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="timestamp"  type="string" display="timestamp" required="yes" hint="";
			
			property name="ack"  type="AckCode" display="ack" required="yes" hint="
								Application level acknowledgment code.
							";
			
			property name="correlationId"  type="string" display="correlationId" required="yes" hint="";
			
			property name="build"  type="string" display="build" required="yes" hint="";
			
			
			public ResponseEnvelope function init( string timestamp="", AckCode ack="", string correlationId="", string build="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.settimestamp(arguments.timestamp);
					
						this.setack(arguments.ack);
					
						this.setcorrelationId(arguments.correlationId);
					
						this.setbuild(arguments.build);
					
				
				
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
			
			
			public void function settimestamp(string timestamp)
			{
				this.timestamp = arguments.timestamp;
			}  
				
			public string function gettimestamp()
			{
				return this.timestamp;
			} 
			
			
			public void function setack(AckCode ack)
			{
				this.ack = arguments.ack;
			}  
				
			public AckCode function getack()
			{
				return this.ack;
			} 
			
			
			public void function setcorrelationId(string correlationId)
			{
				this.correlationId = arguments.correlationId;
			}  
				
			public string function getcorrelationId()
			{
				return this.correlationId;
			} 
			
			
			public void function setbuild(string build)
			{
				this.build = arguments.build;
			}  
				
			public string function getbuild()
			{
				return this.build;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.timestamp' ) )
					
						local.struct["timestamp"] = gettimestamp();
					
				if(  isDefined( 'this.ack' ) )
					
						local.struct["ack"] = getack().getStruct();
					
				if(  isDefined( 'this.correlationId' ) )
					
						local.struct["correlationId"] = getcorrelationId();
					
				if(  isDefined( 'this.build' ) )
					
						local.struct["build"] = getbuild();
					
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
						
						if('#key#' eq 'timestamp') {
						
							this.settimestamp(local.json[key]);
						}
						
						if('#key#' eq 'ack') {
						
							var keyCom = 'ack';
							
							keyCom = 'ackCode'; 
							var keyObj = createObject("component",'#keyCom#');
							this.setack( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'correlationId') {
						
							this.setcorrelationId(local.json[key]);
						}
						
						if('#key#' eq 'build') {
						
							this.setbuild(local.json[key]);
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
							
							this.settimestamp(local.json[i]);
							
							this.setack(local.json[i]);
							
							this.setcorrelationId(local.json[i]);
							
							this.setbuild(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'timestamp') {
							
								this.settimestamp(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'ack') {
							
                             var keyCom = 'ack';
								
								keyCom = 'ackCode';
								
								var keyObj = createObject("component",'#keyCom#');
								this.setack( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'correlationId') {
							
								this.setcorrelationId(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'build') {
							
								this.setbuild(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
