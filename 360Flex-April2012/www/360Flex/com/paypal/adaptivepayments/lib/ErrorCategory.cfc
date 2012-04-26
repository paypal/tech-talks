
<cfscript>
component name="ErrorCategory" output="false"  hint="I define the properties and methods"
{

	property name="ErrorCategory"  type="string" display="ErrorCategory" notempty="true" hint="";
	

	public ErrorCategory function init( string ErrorCategory="")
		hint="I initialize the component and return myself" 
	 	output="false" {
		
		this.setErrorCategory(arguments.ErrorCategory);
		  
		return this;  
	}
	
	public void function setErrorCategory(string ErrorCategory)
	{
		this.ErrorCategory = arguments.ErrorCategory;
	}  
		
	public string function getErrorCategory()
	{
		return this.ErrorCategory;
	} 
	
	public string function listErrorCategory()
	{
		return "System,Application,Request";
	} 

	
	public string function getStruct()
	{
		return getErrorCategory();
	} 
	
	
	public any function deserialize(any jsonObj)
	{
		
		this.setErrorCategory(jsonObj);
	
		return this;
	} 
	
		
}
</cfscript>

