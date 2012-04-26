
<cfscript>
component name="DisplayOptions" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="emailHeaderImageUrl"  type="string" display="emailHeaderImageUrl" required="no" hint="";
	
	property name="emailMarketingImageUrl"  type="string" display="emailMarketingImageUrl" required="no" hint="";
	
	property name="headerImageUrl"  type="string" display="headerImageUrl" required="no" hint="";
	
	property name="businessName"  type="string" display="businessName" required="no" hint="";
	
	
	public DisplayOptions function init( )
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
	
	
	public void function setemailHeaderImageUrl(string emailHeaderImageUrl)
	{
		this.emailHeaderImageUrl = arguments.emailHeaderImageUrl;
	}  
		
	public string function getemailHeaderImageUrl()
	{
		return this.emailHeaderImageUrl;
	} 
	
	
	public void function setemailMarketingImageUrl(string emailMarketingImageUrl)
	{
		this.emailMarketingImageUrl = arguments.emailMarketingImageUrl;
	}  
		
	public string function getemailMarketingImageUrl()
	{
		return this.emailMarketingImageUrl;
	} 
	
	
	public void function setheaderImageUrl(string headerImageUrl)
	{
		this.headerImageUrl = arguments.headerImageUrl;
	}  
		
	public string function getheaderImageUrl()
	{
		return this.headerImageUrl;
	} 
	
	
	public void function setbusinessName(string businessName)
	{
		this.businessName = arguments.businessName;
	}  
		
	public string function getbusinessName()
	{
		return this.businessName;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.emailHeaderImageUrl' ) )
			
				local.struct["emailHeaderImageUrl"] = getemailHeaderImageUrl();
			
		if(  isDefined( 'this.emailMarketingImageUrl' ) )
			
				local.struct["emailMarketingImageUrl"] = getemailMarketingImageUrl();
			
		if(  isDefined( 'this.headerImageUrl' ) )
			
				local.struct["headerImageUrl"] = getheaderImageUrl();
			
		if(  isDefined( 'this.businessName' ) )
			
				local.struct["businessName"] = getbusinessName();
			
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
				
				if('#key#' eq 'emailHeaderImageUrl') {
				
					this.setemailHeaderImageUrl(local.json[key]);
				}
				
				if('#key#' eq 'emailMarketingImageUrl') {
				
					this.setemailMarketingImageUrl(local.json[key]);
				}
				
				if('#key#' eq 'headerImageUrl') {
				
					this.setheaderImageUrl(local.json[key]);
				}
				
				if('#key#' eq 'businessName') {
				
					this.setbusinessName(local.json[key]);
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
					
					this.setemailHeaderImageUrl(local.json[i]);
					
					this.setemailMarketingImageUrl(local.json[i]);
					
					this.setheaderImageUrl(local.json[i]);
					
					this.setbusinessName(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'emailHeaderImageUrl') {
					
						this.setemailHeaderImageUrl(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'emailMarketingImageUrl') {
					
						this.setemailMarketingImageUrl(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'headerImageUrl') {
					
						this.setheaderImageUrl(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'businessName') {
					
						this.setbusinessName(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

