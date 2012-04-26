<cfscript>

component {

	public Administrative function init() {
	
		return this;
	}
	
	public struct  function setAdministrativeData(required struct form,required struct request,struct data,struct url) {
	
		var result = structNew();
		
		structAppend(result,form,false);
		structAppend(result,request,false);
		structAppend(result,data,false);
		result.subject = "";
		result.transactionID = "";
		if (StructKeyExists(Form, "transactionID"))
		{
			result.transactionID = Form.transactionID;
		}
		
		if(StructKeyExists(URL, "transactionID"))
		{
			result.transactionID = URL.transactionID;
		}
	
		return result;
	}
	
	public struct  function setVoidData(required struct form,required struct request,struct data) {
	
		var result = structNew();
		
		structAppend(result,form,false);
		structAppend(result,request,false);
		structAppend(result,data,false);
		result.subject = request.UNIPAYSUBJECT;
		
		return result;
	}
	
	
	public struct  function setBalanceData(required struct request,required struct data) {
		var result = structNew();
		
		structAppend(result,request,false);
		structAppend(result,data,false);
		result.subject = request.UNIPAYSUBJECT;
		
		return result;
	}
	
	
	public struct  function setMassPayData(required struct form,required struct request,struct data) {
		var	caller = createObject("CallerService");
	
		var result = structNew();
		var email = "";
		var amt = "";
		var uniqueid = "";
		
		structAppend(result,form,false);
		structAppend(result,request,false);
		structAppend(result,data,false);
		result.subject = request.UNIPAYSUBJECT;
		
		var receivermailArray = ListToArray(form.receiveremail);
		var amtArray = ListToArray(form.amt);
		var uidArray = ListToArray(form.uniqueID);
		var noteArray = ListToArray(form.note);
		var size = ArrayLen(receivermailArray);
		
		var note = caller.populateEmptyValue(noteORuid=#noteArray#,size=#size#);
		noteArray = note;

		var uid = caller.populateEmptyValue(noteORuid=#uidArray#,size=#size#);
		uidArray = uid;
		
		for (i=1; i LTE size; i = i+1)
		{
			email = "L_EMAIL" & (i-1);
			amt = "L_Amt" & (i-1);
			uniqueid = "L_UNIQUEID" & (i-1);
			note = "L_NOTE" & (i-1);
			
			StructInsert(result, email, receivermailArray[i]);
			StructInsert(result, amt, amtArray[i]);
			if(#ArrayLen(uidArray)# is not 0)
			{
				StructInsert(result, uniqueid, uidArray[i]);
			}
			if(#ArrayLen(noteArray)# is not 0)
			{
				StructInsert(result, note, noteArray[i]);
			}
		}

		return result;
	}
	
	public struct  function setTransactionSearchData(required struct form,required struct request,required struct data) {
	
		var result = structNew();
		var toDate = '';
		
		structAppend(result,form,false);
		structAppend(result,request,false);
		structAppend(result,data,false);
		result.subject = request.UNIPAYSUBJECT;
		
    	var fromDate = DateFormat(Form.startDateStr, "mm-dd-yyyy");
    	var month = month(fromDate);
    	var day = day(fromDate);
    	var year = year(fromDate);
    	result.STARTDATE = year &"-"& month &"-"& day & "T00:00:00Z";
    	if(Form.endDateStr IS NOT "")
		{
			toDate = DateFormat(#Form.endDateStr#, "mm-dd-yyyy");
	    	month = month(toDate);
	    	day = day(toDate);
	    	year = year(toDate);
	    	result.ENDDATE = year &"-"& month &"-"& day & "T23:00:00Z";
		}
	    
		return result;
	}
	
	public struct  function setRefundData(required struct form,required struct request,required struct data) {
	
		var result = structNew();
		
		structAppend(result,form,false);
		structAppend(result,request,false);
		structAppend(result,data,false);
		result.subject = request.UNIPAYSUBJECT;
		
		if (Form.refundType is "Partial")
		{
			result.AMT = Form.amt;
		}
		
		return result;
	}
	
	public struct  function setReauthorizationData(required struct form,required struct request,required struct data) {
	
		var result = structNew();
		
		structAppend(result,form,false);
		structAppend(result,request,false);
		structAppend(result,data,false);
		result.subject = request.UNIPAYSUBJECT;
		
		return result;
	}
	
}
</cfscript>