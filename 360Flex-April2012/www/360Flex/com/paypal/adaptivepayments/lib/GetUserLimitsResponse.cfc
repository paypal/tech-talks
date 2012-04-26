
<cfscript>
component name="GetUserLimitsResponse" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="responseEnvelope"  type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
	
	property name="userLimit"  type="UserLimit" display="userLimit" required="yes" hint="";
	
	property name="warningDataList"  type="WarningDataList" display="warningDataList" required="no" hint="";
	variables.items= ArrayNew(1);
	
	public GetUserLimitsResponse function init( ResponseEnvelope responseEnvelope="", UserLimit userLimit="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setresponseEnvelope(arguments.responseEnvelope);
			
				this.setuserLimit(arguments.userLimit);
			
				addItem(arguments.userLimit);
			
		
		
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
	
	
	public void function setuserLimit(UserLimit userLimit)
	{
		this.userLimit = arguments.userLimit;
	}  
		
	public UserLimit function getuserLimit()
	{
		return this.userLimit;
	} 
	
	
	
	public any function addItem(UserLimit  item)
	{
		if(Compare('UserLimit','string') eq 0)
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
	
	public void function setwarningDataList(WarningDataList warningDataList)
	{
		this.warningDataList = arguments.warningDataList;
	}  
		
	public WarningDataList function getwarningDataList()
	{
		return this.warningDataList;
	} 
	
	
	
	public struct function getStruct()
	{
		local.struct = structNew();
		
		if(  isDefined( 'this.error' ) )
			local.struct["error"] = getError().getStruct();
				
		
		if(  isDefined( 'this.responseEnvelope' ) )
			
				local.struct["responseEnvelope"] = getresponseEnvelope().getStruct();
			
		if(  isDefined( 'this.userLimit' ) )
			
				local.struct["userLimit"] =getItems();
			
		if(  isDefined( 'this.warningDataList' ) )
			
				local.struct["warningDataList"] = getwarningDataList().getStruct();
			
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
				
				if('#key#' eq 'userLimit') {
				
					var keyCom = 'userLimit';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setuserLimit( keyObj.deserialize(local.json[key]) );
					
					this.addItem(keyObj.deserialize(local.json[key]));
				}
				
				if('#key#' eq 'warningDataList') {
				
					var keyCom = 'warningDataList';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setwarningDataList( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setuserLimit(local.json[i]);
					
					this.setwarningDataList(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'responseEnvelope') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setresponseEnvelope( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
					if('#key#' eq 'userLimit') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setuserLimit( keyObj.deserialize(local.json[i][key]) );
						
							this.addItem(keyObj.deserialize(local.json[i][key]));
						
					}
									
					
					if('#key#' eq 'warningDataList') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setwarningDataList( keyObj.deserialize(local.json[i][key]) );
						
					}
									
					
						
					}
				}
			
			}
		
		}
		
		return this;
	} 
	
}
</cfscript>

