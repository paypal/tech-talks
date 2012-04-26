
<cfscript>
component name="InstitutionCustomer" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="institutionId"  type="string" display="institutionId" required="yes" hint="
								The unique identifier as assigned to the
								institution.
							";
	
	property name="firstName"  type="string" display="firstName" required="yes" hint="
								The first (given) name of the end
								consumer as known by the institution.
							";
	
	property name="lastName"  type="string" display="lastName" required="yes" hint="
								The last (family) name of the end
								consumer as known by the institution.
							";
	
	property name="displayName"  type="string" display="displayName" required="yes" hint="
								The full name of the end consumer as
								known by the institution.
							";
	
	property name="institutionCustomerId"  type="string" display="institutionCustomerId" required="yes" hint="
								The unique identifier as assigned to the
								end consumer by the institution.
							";
	
	property name="countryCode"  type="string" display="countryCode" required="yes" hint="
								The two-character ISO country code of
								the home country of the end consumer
							";
	
	property name="email"  type="string" display="email" required="no" hint="";
	
	
	public InstitutionCustomer function init( string institutionId="", string firstName="", string lastName="", string displayName="", string institutionCustomerId="", string countryCode="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setinstitutionId(arguments.institutionId);
			
				this.setfirstName(arguments.firstName);
			
				this.setlastName(arguments.lastName);
			
				this.setdisplayName(arguments.displayName);
			
				this.setinstitutionCustomerId(arguments.institutionCustomerId);
			
				this.setcountryCode(arguments.countryCode);
			
		
		
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
	
	
	public void function setinstitutionId(string institutionId)
	{
		this.institutionId = arguments.institutionId;
	}  
		
	public string function getinstitutionId()
	{
		return this.institutionId;
	} 
	
	
	public void function setfirstName(string firstName)
	{
		this.firstName = arguments.firstName;
	}  
		
	public string function getfirstName()
	{
		return this.firstName;
	} 
	
	
	public void function setlastName(string lastName)
	{
		this.lastName = arguments.lastName;
	}  
		
	public string function getlastName()
	{
		return this.lastName;
	} 
	
	
	public void function setdisplayName(string displayName)
	{
		this.displayName = arguments.displayName;
	}  
		
	public string function getdisplayName()
	{
		return this.displayName;
	} 
	
	
	public void function setinstitutionCustomerId(string institutionCustomerId)
	{
		this.institutionCustomerId = arguments.institutionCustomerId;
	}  
		
	public string function getinstitutionCustomerId()
	{
		return this.institutionCustomerId;
	} 
	
	
	public void function setcountryCode(string countryCode)
	{
		this.countryCode = arguments.countryCode;
	}  
		
	public string function getcountryCode()
	{
		return this.countryCode;
	} 
	
	
	public void function setemail(string email)
	{
		this.email = arguments.email;
	}  
		
	public string function getemail()
	{
		return this.email;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.institutionId' ) )
			
				local.struct["institutionId"] = getinstitutionId();
			
		if(  isDefined( 'this.firstName' ) )
			
				local.struct["firstName"] = getfirstName();
			
		if(  isDefined( 'this.lastName' ) )
			
				local.struct["lastName"] = getlastName();
			
		if(  isDefined( 'this.displayName' ) )
			
				local.struct["displayName"] = getdisplayName();
			
		if(  isDefined( 'this.institutionCustomerId' ) )
			
				local.struct["institutionCustomerId"] = getinstitutionCustomerId();
			
		if(  isDefined( 'this.countryCode' ) )
			
				local.struct["countryCode"] = getcountryCode();
			
		if(  isDefined( 'this.email' ) )
			
				local.struct["email"] = getemail();
			
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
				
				if('#key#' eq 'institutionId') {
				
					this.setinstitutionId(local.json[key]);
				}
				
				if('#key#' eq 'firstName') {
				
					this.setfirstName(local.json[key]);
				}
				
				if('#key#' eq 'lastName') {
				
					this.setlastName(local.json[key]);
				}
				
				if('#key#' eq 'displayName') {
				
					this.setdisplayName(local.json[key]);
				}
				
				if('#key#' eq 'institutionCustomerId') {
				
					this.setinstitutionCustomerId(local.json[key]);
				}
				
				if('#key#' eq 'countryCode') {
				
					this.setcountryCode(local.json[key]);
				}
				
				if('#key#' eq 'email') {
				
					this.setemail(local.json[key]);
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
					
					this.setinstitutionId(local.json[i]);
					
					this.setfirstName(local.json[i]);
					
					this.setlastName(local.json[i]);
					
					this.setdisplayName(local.json[i]);
					
					this.setinstitutionCustomerId(local.json[i]);
					
					this.setcountryCode(local.json[i]);
					
					this.setemail(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'institutionId') {
					
						this.setinstitutionId(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'firstName') {
					
						this.setfirstName(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'lastName') {
					
						this.setlastName(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'displayName') {
					
						this.setdisplayName(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'institutionCustomerId') {
					
						this.setinstitutionCustomerId(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'countryCode') {
					
						this.setcountryCode(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'email') {
					
						this.setemail(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

