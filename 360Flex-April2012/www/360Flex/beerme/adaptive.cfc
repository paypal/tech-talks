<cfcomponent>
	
	<cffunction name="SimplePay" access="remote" returntype="string">
    	<cfargument name="senderEmail" type="string" default="">
        <cfargument name="receiverEmail" type="string" default="">
		<cfargument name="receiverAmount" type="any" default="">
		<cfargument name="preapprovalKey" type="string" default="">
		<cfargument name="password" type="any" default="">
		
		<cfinvoke component="adaptivepayments" method="PayRequest" returnvariable="response">
			<cfinvokeargument name="returnURL" value="#request.serverURL##GetDirectoryFromPath(SCRIPT_NAME)#beeme.cfm?state=return">
			<cfinvokeargument name="cancelURL" value="#request.serverURL##GetDirectoryFromPath(SCRIPT_NAME)#beerme.cfm?state=cancel">
			<cfinvokeargument name="receiverEmail" value="#arguments.receiverEmail#">
			<cfinvokeargument name="receiverAmount" value="#arguments.receiverAmount#">
			<cfinvokeargument name="currencyCode" value="USD">
			<cfinvokeargument name="actionType" value="PAY">
			<cfinvokeargument name="preapprovalKey" value="#arguments.preapprovalKey#">
		</cfinvoke>
	
		<cfreturn response.getResponseEnvelope().getAck().getAckCode()>

	</cffunction>

</cfcomponent>