<cfcomponent>
	<cffunction name="purchase" access="remote" returntype="any">
    	<cfargument name="amt" type="string" default="">
        <cfargument name="acct" type="any" default="">
		<cfargument name="expdate" type="any" default="">
		
		<cfinvoke method="payFlowPro" returnvariable="myResult">
			<cfinvokeargument name="hostaddress" value="pilot-payflowpro.paypal.com">
			<cfinvokeargument name="hostport" value="443">
			<cfinvokeargument name="timeout" value="30">
			<cfinvokeargument name="trxtype" value="S">
			<cfinvokeargument name="tender" value="C">
			<cfinvokeargument name="partner" value="PayPal">
			<cfinvokeargument name="vendor" value="">
			<cfinvokeargument name="user" value="smaestre">
			<cfinvokeargument name="pwd" value="Admin47tac">
			<cfinvokeargument name="acct" value="#arguments.acct#">
			<cfinvokeargument name="expdate" value="#dateformat(arguments.expdate,"mmyy")#">
			<cfinvokeargument name="amt" value="#arguments.amt#">
			<cfinvokeargument name="comment1" value="">
			<cfinvokeargument name="comment2" value="">
			<cfinvokeargument name="email" value="">
			<cfinvokeargument name="name" value="">
			<cfinvokeargument name="street" value="">
			<cfinvokeargument name="city" value="">
			<cfinvokeargument name="state" value="">
			<cfinvokeargument name="zip" value="">
		</cfinvoke>
		
		<cfreturn myResult.RESPMSG>
	</cffunction>
    
    
     <cffunction name="payFlowPro" access="private" returntype="any">
		<cfargument name="term" type="string" default="0">
		<cfargument name="requestID" type="string" default="#CreateUUID()#">
		<cfargument name="hostaddress" type="string" default="0">
		<cfargument name="hostport" type="string" default="443">
		<cfargument name="timeout" type="string" default="0"> 
		<cfargument name="trxtype" type="string" default="0">
		<cfargument name="tender" type="string" default="0"> 
		<cfargument name="partner" type="string" default="0">
		<cfargument name="vendor" type="string" default="">
		<cfargument name="user" type="string" default="0">
		<cfargument name="pwd" type="string" default="0"> 
		<cfargument name="acct" type="string" default="0">
		<cfargument name="expdate" type="string" default="0"> 
		<cfargument name="amt" type="string" default="0">
		<cfargument name="comment1" type="string" default=""> 
		<cfargument name="comment2" type="string" default="">
		<cfargument name="email" type="string" default=""> 
		<cfargument name="name" type="string" default="">
		<cfargument name="street" type="string" default=""> 
		<cfargument name="city" type="string" default="">
		<cfargument name="state" type="string" default=""> 
		<cfargument name="zip" type="string" default="">
		<cfif arguments.vendor EQ "">
			<cfset arguments.vendor = arguments.user>
		</cfif>
		
		<cfset var nvpStr = "">
		<cfloop list="#structKeyList(arguments)#" index="key">
			<cfoutput>
				<cfif StructKeyExists(arguments,key) AND Len(arguments[key])>
					<cfif Len(nvpStr)>
						<cfset nvpStr = nvpStr & "&">
					</cfif>
					<cfset nvpStr = nvpStr & "#key#[#len(arguments[key])#]=#arguments[key]#">
				</cfif>
			</cfoutput>
		</cfloop>
		
       	<cfhttp method="POST" url="https://#arguments.hostaddress#/transaction" resolveurl="no" timeout="#arguments.TIMEOUT#" port="#arguments.HOSTPORT#">
		   <cfhttpparam type="header" name="Content-Type" VALUE="text/namevalue">
		   <cfhttpparam type="header" name="Content-Length" VALUE="#Len(nvpStr)#">
		   <cfhttpparam type="header" name="Host" value="#arguments.hostaddress#">
		   <cfhttpparam type="header" name="X-VPS-REQUEST-ID" VALUE="#arguments.requestID#">
		   <cfhttpparam type="header" name="X-VPS-CLIENT-TIMEOUT" VALUE="#arguments.TIMEOUT#">
		   <cfhttpparam type="header" name="X-VPS-VITCLIENTCERTIFICATION-ID" VALUE="#arguments.PARTNER##arguments.USER#">
		   <cfhttpparam type="body" value="#nvpStr#">
		</cfhttp>
		
				
		<cfset tmpResponse = QueryNew("")>
		<cfset QueryAddRow(tmpResponse, 1)>
		
		<cfloop list="#cfhttp.FileContent#" index="i" delimiters="&">
			<!--- <cfset QueryAddColumn(tmpResponse, listfirst(i,'=') , ListToArray(listlast(i,"=")))> --->
			<cfset QueryAddColumn(tmpResponse, Replace(listfirst(i,'='), ' ', '_', 'all') , ListToArray(listlast(i,"=")))>
		</cfloop>
		
		<cfset QueryAddColumn(tmpResponse, 'resultStr' , ListToArray(cfhttp.FileContent))>
		
    	<cfreturn tmpResponse>
   
	 </cffunction>
    <cffunction name="myTest" access="remote" returntype="string">
	
    	<cfset myResult= 'goodbye'>
		<cfreturn myResult>
	</cffunction>
</cfcomponent>