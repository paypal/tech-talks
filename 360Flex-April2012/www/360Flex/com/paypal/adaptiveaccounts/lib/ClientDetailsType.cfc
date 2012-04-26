
		<cfscript>
		component name="ClientDetailsType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="ipAddress"  type="string" display="ipAddress" required="no" hint="";
			
			property name="deviceId"  type="string" display="deviceId" required="no" hint="";
			
			property name="applicationId"  type="string" display="applicationId" required="no" hint="";
			
			property name="model"  type="string" display="model" required="no" hint="";
			
			property name="geoLocation"  type="string" display="geoLocation" required="no" hint="";
			
			property name="customerType"  type="string" display="customerType" required="no" hint="";
			
			property name="partnerName"  type="string" display="partnerName" required="no" hint="";
			
			property name="customerId"  type="string" display="customerId" required="no" hint="";
			
			
			public ClientDetailsType function init( )
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
			
			
			public void function setipAddress(string ipAddress)
			{
				this.ipAddress = arguments.ipAddress;
			}  
				
			public string function getipAddress()
			{
				return this.ipAddress;
			} 
			
			
			public void function setdeviceId(string deviceId)
			{
				this.deviceId = arguments.deviceId;
			}  
				
			public string function getdeviceId()
			{
				return this.deviceId;
			} 
			
			
			public void function setapplicationId(string applicationId)
			{
				this.applicationId = arguments.applicationId;
			}  
				
			public string function getapplicationId()
			{
				return this.applicationId;
			} 
			
			
			public void function setmodel(string model)
			{
				this.model = arguments.model;
			}  
				
			public string function getmodel()
			{
				return this.model;
			} 
			
			
			public void function setgeoLocation(string geoLocation)
			{
				this.geoLocation = arguments.geoLocation;
			}  
				
			public string function getgeoLocation()
			{
				return this.geoLocation;
			} 
			
			
			public void function setcustomerType(string customerType)
			{
				this.customerType = arguments.customerType;
			}  
				
			public string function getcustomerType()
			{
				return this.customerType;
			} 
			
			
			public void function setpartnerName(string partnerName)
			{
				this.partnerName = arguments.partnerName;
			}  
				
			public string function getpartnerName()
			{
				return this.partnerName;
			} 
			
			
			public void function setcustomerId(string customerId)
			{
				this.customerId = arguments.customerId;
			}  
				
			public string function getcustomerId()
			{
				return this.customerId;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.ipAddress' ) )
					
						local.struct["ipAddress"] = getipAddress();
					
				if(  isDefined( 'this.deviceId' ) )
					
						local.struct["deviceId"] = getdeviceId();
					
				if(  isDefined( 'this.applicationId' ) )
					
						local.struct["applicationId"] = getapplicationId();
					
				if(  isDefined( 'this.model' ) )
					
						local.struct["model"] = getmodel();
					
				if(  isDefined( 'this.geoLocation' ) )
					
						local.struct["geoLocation"] = getgeoLocation();
					
				if(  isDefined( 'this.customerType' ) )
					
						local.struct["customerType"] = getcustomerType();
					
				if(  isDefined( 'this.partnerName' ) )
					
						local.struct["partnerName"] = getpartnerName();
					
				if(  isDefined( 'this.customerId' ) )
					
						local.struct["customerId"] = getcustomerId();
					
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
						
						if('#key#' eq 'ipAddress') {
						
							this.setipAddress(local.json[key]);
						}
						
						if('#key#' eq 'deviceId') {
						
							this.setdeviceId(local.json[key]);
						}
						
						if('#key#' eq 'applicationId') {
						
							this.setapplicationId(local.json[key]);
						}
						
						if('#key#' eq 'model') {
						
							this.setmodel(local.json[key]);
						}
						
						if('#key#' eq 'geoLocation') {
						
							this.setgeoLocation(local.json[key]);
						}
						
						if('#key#' eq 'customerType') {
						
							this.setcustomerType(local.json[key]);
						}
						
						if('#key#' eq 'partnerName') {
						
							this.setpartnerName(local.json[key]);
						}
						
						if('#key#' eq 'customerId') {
						
							this.setcustomerId(local.json[key]);
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
							
							this.setipAddress(local.json[i]);
							
							this.setdeviceId(local.json[i]);
							
							this.setapplicationId(local.json[i]);
							
							this.setmodel(local.json[i]);
							
							this.setgeoLocation(local.json[i]);
							
							this.setcustomerType(local.json[i]);
							
							this.setpartnerName(local.json[i]);
							
							this.setcustomerId(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'ipAddress') {
							
								this.setipAddress(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'deviceId') {
							
								this.setdeviceId(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'applicationId') {
							
								this.setapplicationId(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'model') {
							
								this.setmodel(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'geoLocation') {
							
								this.setgeoLocation(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'customerType') {
							
								this.setcustomerType(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'partnerName') {
							
								this.setpartnerName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'customerId') {
							
								this.setcustomerId(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
