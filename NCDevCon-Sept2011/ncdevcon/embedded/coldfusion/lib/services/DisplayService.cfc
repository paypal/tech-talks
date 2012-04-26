<cfscript>
/*
DisplayService.cfc
This ColdFusion component reused by all sample page to display the returned
name value response as well as error messages
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