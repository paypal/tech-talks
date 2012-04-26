<cfscript>
/*
CallerService.cfc
This ColdFusion component reused by all sample page to get credential information and 
it has getNVPResponse method which takes nvpString as parameter and return Nvpresponse 
as CF Struct object. using this object we can pring the response values in Display.cfm page
*/
component output="false" {

	public string  function displayText(required struct data) {
		var result = '<div class="displayText">';
		
		for (key in data)
		{
			result = result & '<div class="key">#key#:</div><div class="value" >#data[key]#</div><div class="clear">&nbsp;</div>';
			
		}
		result = result & '</div>';
		return result;	
	}
}
</cfscript>