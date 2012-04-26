<cfcomponent>
	<cffunction name="CreateAndSendInvoice" access="remote" returntype="string">
    	<cfargument name="payerId" type="string" default="">
        <cfargument name="unitprice" type="any" default="">
		<cfargument name="paymentTerms" type="any" default="">
		<cfargument name="service" type="any" default="">
		
		<cfscript>	
			itemType = createObject("component","InvoiceItemType").init(arguments.service,"1",arguments.unitprice);
			itemList = createObject("component","InvoiceItemListType").init(itemType);
			paymentTermsType = createObject("component","paymentTermsType").init(arguments.paymentTerms);
			
			invoice = createObject("component","InvoiceType").init("sidney_1311957058_biz@x.com",arguments.payerId,itemList,"USD",paymentTermsType);
			
			requestEnvelope = createObject("component","RequestEnvelope").init("USD");
			
			createInvoiceRequest = createObject("component","CreateAndSendInvoiceRequest").init(requestEnvelope,invoice);
		
			payload = createInvoiceRequest.serialize();
		
			service = createObject("component","service").init();
			results = service.doHttppost('Invoice','CreateAndSendInvoice',payload);
			
			CreateInvoiceResponse = createObject("component","CreateInvoiceResponse");
			response = CreateInvoiceResponse.deserialize(results);
			var result = "";
			if(response.getResponseEnvelope().getAck().getAckCode() eq "SUCCESS") {
				result = response.getInvoiceNumber();
			} else {
				
				result = response.getError().getMessage();
			}
					
			</cfscript>
			
		<cfreturn result>
	</cffunction>
    
</cfcomponent>