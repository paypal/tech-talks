<cfscript>

component {

	public RecurringPayment function init() {
	
		return this;
	}
	
	public struct  function setRecurringPaymentData(required struct form,required struct request,struct data) {
		var result = structNew();
		
		structAppend(result,form,false);
		structAppend(result,request,false);
		structAppend(result,data,false);
		result.expDate = form.expDateMonth & form.expDateYear;
		result.SUBJECT = request.UNIPAYSUBJECT;
		result.PROFILESTARTDATE = Form.profileStartDateYear &"-"& Form.profileStartDateMonth &"-"& Form.profileStartDateDay & "T01:00:00,0Z";

		return result;	
	}
	
	
	public struct  function setRecurringPaymentStatusData(required struct form,required struct request,struct data) {
		var result = structNew();
		
		structAppend(result,form,false);
		structAppend(result,request,false);
		structAppend(result,data,false);
		
		result.SUBJECT = "";
	
		return result;	
	}
	
	public struct  function setBillOutstandingData(required struct form,required struct request,struct data) {
		var result = structNew();
		
		structAppend(result,form,false);
		structAppend(result,request,false);
		structAppend(result,data,false);
		
		result.SUBJECT = "";
	
		return result;	
	}
	
}
</cfscript>