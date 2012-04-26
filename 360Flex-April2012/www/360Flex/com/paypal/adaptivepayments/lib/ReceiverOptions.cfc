
<cfscript>
component name="ReceiverOptions" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="description"  type="string" display="description" required="no" hint="";
	
	property name="customId"  type="string" display="customId" required="no" hint="";
	
	property name="invoiceData"  type="InvoiceData" display="invoiceData" required="no" hint="";
	
	property name="receiver"  type="AccountIdentifier" display="receiver" required="yes" hint="";
	
	property name="referrerCode"  type="string" display="referrerCode" required="no" hint="";
	
	
	public ReceiverOptions function init( AccountIdentifier receiver="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setreceiver(arguments.receiver);
			
		
		
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
	
	
	public void function setdescription(string description)
	{
		this.description = arguments.description;
	}  
		
	public string function getdescription()
	{
		return this.description;
	} 
	
	
	public void function setcustomId(string customId)
	{
		this.customId = arguments.customId;
	}  
		
	public string function getcustomId()
	{
		return this.customId;
	} 
	
	
	public void function setinvoiceData(InvoiceData invoiceData)
	{
		this.invoiceData = arguments.invoiceData;
	}  
		
	public InvoiceData function getinvoiceData()
	{
		return this.invoiceData;
	} 
	
	
	public void function setreceiver(AccountIdentifier receiver)
	{
		this.receiver = arguments.receiver;
	}  
		
	public AccountIdentifier function getreceiver()
	{
		return this.receiver;
	} 
	
	
	public void function setreferrerCode(string referrerCode)
	{
		this.referrerCode = arguments.referrerCode;
	}  
		
	public string function getreferrerCode()
	{
		return this.referrerCode;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.description' ) )
			
				local.struct["description"] = getdescription();
			
		if(  isDefined( 'this.customId' ) )
			
				local.struct["customId"] = getcustomId();
			
		if(  isDefined( 'this.invoiceData' ) )
			
				local.struct["invoiceData"] = getinvoiceData().getStruct();
			
		if(  isDefined( 'this.receiver' ) )
			
				local.struct["receiver"] = getreceiver().getStruct();
			
		if(  isDefined( 'this.referrerCode' ) )
			
				local.struct["referrerCode"] = getreferrerCode();
			
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
				
				if('#key#' eq 'description') {
				
					this.setdescription(local.json[key]);
				}
				
				if('#key#' eq 'customId') {
				
					this.setcustomId(local.json[key]);
				}
				
				if('#key#' eq 'invoiceData') {
				
					var keyCom = 'invoiceData';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setinvoiceData( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'receiver') {
				
					var keyCom = 'receiver';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setreceiver( keyObj.deserialize(local.json[key]) );
					
				}
				
				if('#key#' eq 'referrerCode') {
				
					this.setreferrerCode(local.json[key]);
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
					
					this.setdescription(local.json[i]);
					
					this.setcustomId(local.json[i]);
					
					this.setinvoiceData(local.json[i]);
					
					this.setreceiver(local.json[i]);
					
					this.setreferrerCode(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'description') {
					
						this.setdescription(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'customId') {
					
						this.setcustomId(local.json[i][key]);
					
					}
									
					
					if('#key#' eq 'invoiceData') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setinvoiceData( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'receiver') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setreceiver( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'referrerCode') {
					
						this.setreferrerCode(local.json[i][key]);
					
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

