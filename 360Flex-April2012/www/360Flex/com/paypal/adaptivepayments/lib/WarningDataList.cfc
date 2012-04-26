
<cfscript>
component name="WarningDataList" output="false"  hint="I define the properties and methods"
{
	property name="error"  type="ErrorData" display="error" required="no" hint="";
	
	property name="warningData"  type="WarningData" display="warningData" required="yes" hint="";
	variables.items= ArrayNew(1);
	
	public WarningDataList function init( WarningData warningData="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		
				this.setwarningData(arguments.warningData);
			
				addItem(arguments.warningData);
			
		
		
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
	
	
	public void function setwarningData(WarningData warningData)
	{
		this.warningData = arguments.warningData;
	}  
		
	public WarningData function getwarningData()
	{
		return this.warningData;
	} 
	
	
	
	public any function addItem(WarningData  item)
	{
		if(Compare('WarningData','string') eq 0)
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
				
		
		if(  isDefined( 'this.warningData' ) )
			
				local.struct["warningData"] =getItems();
			
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
				
				if('#key#' eq 'warningData') {
				
					var keyCom = 'warningData';
					
					var keyObj = createObject("component",'#keyCom#');
					this.setwarningData( keyObj.deserialize(local.json[key]) );
					
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
					
					this.setwarningData(local.json[i]);
					
				}
			
				if(isStruct(local.json[i]))
				{
					for(key in local.json[i])
					{
					
					if('#key#' eq 'warningData') {
					
						
						var keyObj = createObject("component",'#keyCom#');
						this.setwarningData( keyObj.deserialize(local.json[i][key]) );
						
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

