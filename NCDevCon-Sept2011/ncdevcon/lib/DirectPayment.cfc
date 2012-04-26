<cfscript>
/** @accessors true */

component {

	public DirectPayment function init() {
	
		return this;
	}
	
	public struct  function setDirectPaymentData(required struct form,required struct request,struct data) {
		var result = structNew();
		
		structAppend(result,form,false);
		structAppend(result,request,false);
		structAppend(result,data,false);
		result.expDate = form.expDateMonth & form.expDateYear;
		result.SUBJECT = request.UNIPAYSUBJECT;
	
		return result;	
	}
	
	public struct  function setDirectPayment3DData(required struct form,required struct request,struct data) {
		var result = structNew();
		
		structAppend(result,form,false);
		structAppend(result,request,false);
		structAppend(result,data,false);
		
		result.startDate =  Form.startDateMonth & Form.startDateYear;
		result.expDate = form.expDateMonth & form.expDateYear;
		result.SUBJECT = request.UNIPAYSUBJECT;
	
		return result;	
	}
	
}
</cfscript>