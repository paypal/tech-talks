
<cfscript>
component name="DetailLevelCode" output="false"  hint="I define the properties and methods"
{

	property name="DetailLevelCode"  type="string" display="DetailLevelCode" notempty="true" hint="";
	

	public DetailLevelCode function init( string DetailLevelCode="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		this.setDetailLevelCode(arguments.DetailLevelCode);
		  
		return this;  
	}
	
	public void function setDetailLevelCode(string DetailLevelCode)
	{
		this.DetailLevelCode = arguments.DetailLevelCode;
	}  
		
	public string function getDetailLevelCode()
	{
		return this.DetailLevelCode;
	} 
	
	public string function listDetailLevelCode()
	{
		return "ReturnAll";
	} 

	
	public string function getStruct()
	{
		return getDetailLevelCode();
	} 
	
	
	public any function deserialize(any jsonObj)
	{
		
		this.setDetailLevelCode(jsonObj);
	
		return this;
	} 
	
		
}
</cfscript>

