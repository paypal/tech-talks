// JavaScript Document

var dg = new PAYPAL.apps.DGFlow({});

var pptransact = function(url) {
	var languageCenters = {"php": "server/php/pptransact.php",
	                       "py": "server/python/pptransact.py",
						   "cf": "server/coldfusion/pptransact.cfc",
						   "java": "server/java/pptransact.jsp"};
	var url;
	var mobile;
	
	return{
		init: function(language, mobileFlag){
			this.mobile = (mobileFlag == true) ? true : false;
			
			this.url = (languageCenters[language.toLowerCase()]) ?
			            languageCenters[language.toLowerCase()]:
				        languageCenters['php'];
			pptransact.setUserId(0);
		},
		
		setUrl: function(newUrl) { this.url = newUrl; },
		getUrl: function() { return this.url; },
		
		bill: function(inputArgs){
			var userId = encodeURIComponent(inputArgs.userId);
			pptransact.setUserId(userId);
			pptransact.setSuccessBillCallBack(inputArgs.successCallback);
			pptransact.setFailBillCallBack(inputArgs.failCallback);
			
			var data = 'method=getToken&itemId=' + encodeURIComponent(inputArgs.itemId) + "&qty=" + encodeURIComponent(inputArgs.itemQty) + "&userId=" + userId + "&mobile=" + this.mobile;
			pptransact.callServer(data,function(data){
				if(data.error){
					alert('error starting bill flow');
				} else {
					if(typeof inputArgs.successCallback == 'function'){
						inputArgs.successCallback.call();
					}
					pptransact.startDGFlow(data.redirecturl);
				}
			}, inputArgs.failCallback);
		},
		setSuccessBillCallBack: function(newSuccessBillCallBack) { this.successBillCallBack = newSuccessBillCallBack; },
		getSuccessBillCallBack : function() {return this.successBillCallBack; },
		setFailBillCallBack: function(newFailBillCallBack) { this.failBillCallBack = newFailBillCallBack; },
		getFailBillCallBack : function() {return this.failBillCallBack; },
		
		setState: function(newState) { state = newState; },
		getState: function() { return state; },
		setUserId: function(newUserId) { userId = newUserId; },
		getUserId: function() { return userId; },
		
		setVerifyData: function(newVerifyData) { verifyData = newVerifyData; },
		getVerifyData: function() { return verifyData; },
		
		verify: function(inputArgs){
			var userId = encodeURIComponent(inputArgs.userId);
			
			pptransact.setUserId(userId);
			data = localStorage.getItem(userId);
			
			
			if (data == null){ 
				data= '[{"transactionId":null,"orderTime":null,"paymentStatus":null,"itemId":"0","userId":"0"}]';
				//return {'error' : 'no local storage record found'}; 
			} 
			
			data = data.replace(/\\/g, "");
			
			pptransact.callServer('method=verifyPayment&userId=' + userId + '&transactions=' + encodeURIComponent(data) + '&itemId=' + encodeURIComponent(inputArgs.itemId),function(data){
				pptransact.setVerifyData(data);
					
				if(data.success){
					if(pptransact.check_for_html5_storage){
						var dataArray = $.parseJSON(localStorage.getItem(pptransact.getUserId()));
						
						if(dataArray !== null){
							//REMOVE ANY NULL TransactionIDs
							for (var i = 0; i < dataArray.length; i++) {
								if(!dataArray[i].transactionId){
									dataArray.splice(i,1);
								} 
							}
							
							//UPDATE any Existing  TransactionIDs which match.
							for (var i = 0; i < dataArray.length; i++) {
								if(data.transactionId == dataArray[i].transactionId){
									dataArray.splice(i,1,data);
									
									localStorage.setItem(pptransact.getUserId(), JSON.stringify(dataArray));
								} 
								
							}
							
						}
					}
					
					if(typeof inputArgs.successCallback == 'function'){
						inputArgs.successCallback.call();
					}
					
				} else {
					if(typeof inputArgs.failCallback == 'function'){
						inputArgs.failCallback.call();
					}
				}
			}, inputArgs.failCallback);
		},
		
		startDGFlow : function(url){
			(this.mobile) ? window.location = url + "&cmd=_express-checkout" : dg.startFlow(url);
		},
		
		releaseDG : function(data) {
		
			if(data != undefined) {	
				if(pptransact.check_for_html5_storage){
					
					pptransact.saveToLocalStorage(pptransact.getUserId(),data,null);
					
					if(typeof pptransact.getSuccessBillCallBack() == 'function'){
						pptransact.getSuccessBillCallBack().call();
					}
				}
			} else {
				if(typeof pptransact.getFailBillCallBack == 'function'){
					pptransact.getFailBillCallBack().call();
				}
			}
			
			dg.closeFlow();
			
		},
		
		check_for_html5_storage: function() {
		  try {
			return 'localStorage' in window && window['localStorage'] !== null;
		  } catch (e) {
			return false;
		  }
		},
		
		
		
		saveToLocalStorage : function(userId, data, redirect) {
			var dataArray = $.parseJSON(localStorage.getItem(userId));
			
			if(!dataArray){
				var dataArray = new Array();
				dataArray.push(data);
			} else {
				
				dataArray.push(data);
			}
			
			localStorage.setItem(userId, JSON.stringify(dataArray));
			
			if(redirect != null){
				window.location.href = redirect;
			}
			
		},
		
		callServer : function(data, callbackFnk, failCallback){
			$.ajax({
				url: pptransact.getUrl(),
				data: data,
				success: function(data){
					var obj = $.parseJSON(data);
					
					if(typeof callbackFnk == 'function'){
						callbackFnk.call(this, obj);
					}
				},
				error: function(request, textStatus, error){
					failCallback.call(this, {
						'request': request,
						'status': textStatus,
						'error': error
					});
				}
			});	
		}
		
	}
}();

