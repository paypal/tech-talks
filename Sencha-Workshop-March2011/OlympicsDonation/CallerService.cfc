<!-- 
*************************************************
CallerService.cfc

This coldufion component reused by all sample page to get credential information and 
it has getNVPResponse method which takes nvpString as parameter and return Nvpresponse 
as CF Struct object. using this object we can pring the response values in Display.cfm page

*************************************************
--->
<CFCOMPONENT>

	<!---
		This method will take response from the server and display accordingly in the browser 
	--->
	<cffunction name="getNVPResponse" access="public" returntype="struct">
		<cfargument name="nvpString" type="string" required="yes" >
		<cfset var responseStruct = StructNew()>
		<cfset var keyValStruct = StructNew()>
		<cfset var keys = "">
		<cfset var Values = "">
		<cfset nvpArray = ArrayNew(1) >
		<cfset keyArray = ArrayNew(1) >
		<cfset valueArray = ArrayNew(1) >
		<cfset key = "">
		<cfset value = "">
		<cfset currentValue = "">
		<cfset tempVal = "">
		<cfset count = 1 >
		<cfset tempvalue = "">
		<cfset  lennvp =  0>

		<cfloop from="1" to="#len(nvpString)#" index="i">
			<cfset lennvp = lennvp + 1>
			<cfset index = 1>
			<cfif #Mid(nvpString, i, 1)# is not "&">
			<cfset tempVal = tempVal & #Mid(nvpString, i, 1)#>
			</cfif>

			<cfif #Mid(nvpString, i, 1)# is "&" OR "#lennvp#" is "#len(nvpString)#">
			<cfset nvpArray[count] = #trim(tempVal)#>
			<cfset count =  count + 1>
			
			<cfset tempVal = "">
			
			</cfif>
		</cfloop>
		<cfloop from="1" to="#ArrayLen(nvpArray)#" index="i">
			<cfset currentValue = #nvpArray[i]#>
			
			<cfloop from="1" to= "#len(currentValue)#" index="i">
				<cfif #Mid(currentValue, i, 1)# is "=">
				<cfbreak>
				<cfelse>	
				<cfset tempValue = tempValue & #Mid(currentValue, i, 1)#>
				
				</cfif>
			</cfloop>
			<cfset keyArray[index] = #trim(tempValue)#>
			<cfset index = #index# + 1>
			<cfset tempValue = "">
		</cfloop>
		
			<cfset vals = "">
			<cfset key = "">
			<cfloop from="1" to="#ArrayLen(nvpArray)#" index="i">
			<cfset vals  = #nvpArray[i]# >
			<cfset key = #keyArray[i]#>
			<cfset value = #RemoveChars(vals ,1, (len(key) +1))#>
			<cfset valueArray[i] = value>
			<cfset x = StructInsert(responseStruct,#trim(key)#,#trim(value)#)>
		
		</cfloop>
		<cfreturn responseStruct>
	</cffunction>

	<!---
		This method has following parameters
		Request Data - Hold the NVP request String
		ServerURL - End Point
		useProxy - If Merchant wants to use proxy need to set “useProxy” as true in Application.cfm. 
			   By default “useProxy” set to false
		proxyName - need to pass proxy hostName 
		proxyPort - need to pass proxy port name
	--->

	<cffunction name="doHttppost" access="public" returntype="string">
		<cfargument name="requestData" type="struct" required="yes" >
		<cfargument name="serverURL" type="string" required="yes" >
		<cfargument name="useProxy" type="boolean" required="yes" >
		<cfargument name="proxyName" type="string" required="no" >
		<cfargument name="proxyPort" type="string" required="no" >

		<cfif useProxy is "true">
			<CFHTTP URL="#serverURL#" METHOD="POST" proxyserver=#proxyName# proxyport="#proxyPort#">
			  <cfloop collection=#requestData# item="key">
				  <CFHTTPPARAM NAME="#key#" VALUE="#requestData[key]#" TYPE="FormField" ENCODED="YES">
			  </cfloop>
			</CFHTTP>
		<cfelse>
			<CFHTTP URL="#serverURL#" METHOD="POST">
			  <cfloop collection=#requestData# item="key">
				  <CFHTTPPARAM NAME="#key#" VALUE="#requestData[key]#" TYPE="FormField" ENCODED="YES">
			  </cfloop>
			</CFHTTP>
		</cfif>
		<cfreturn #cfhttp.FileContent#>
	</cffunction>
	
		<!---
		This is method check whether note and uniqueid is null or not
		if it is null, it will create empty object
	--->
	<cffunction name="populateEmptyValue" returntype="array" output="no">
		<cfargument name="noteORuid" type="any" required="true">
		<cfargument name="size" type="any" required="true">
		<cfif ArrayIsEmpty(noteORuid)>
			<cfloop index = "i" from = "1" to = #size#>
				<cfset noteORuid[i] = "">
			</cfloop>
		<cfelse> 
			<cfloop index = "i" from = "1" to = #size#>
				<cfif  ArrayLen(noteORuid) not equal size>
					<cfscript>
						ArrayAppend(noteORuid, "");
					</cfscript>
				</cfif>
			</cfloop>
		</cfif>
		<cfreturn #noteORuid#>
	</cffunction>

</CFCOMPONENT>