// JavaScript Document

var dg = new PAYPAL.apps.DGFlow({});
/*
connection(url,data)
url = the server side connection script
data = the query string to call method or pass variables.
target = the id of the dom element you are targeting.
targetType = either canvas or div
*/



var xconnection = function(url, target) {
	var url, target, state, webToken;
	var xbutton = {itemId : "0",
				   top : "",
	               left : "",
				   height : "",
				   width : ""};
	
	return{
		init: function(url, target){
			this.url = url;
			this.target = target;
		},
		
		setUrl: function(newUrl) { this.url = newUrl; },
		getUrl: function() { return this.url; },
		setTarget: function(newTarget) { this.target = newTarget; },
		getTarget: function() { return this.target; },
		
		connectResult: function(newConnData){
			xconnection.setState(newConnData.state);
			xconnection.setWebToken(newConnData.webToken);
		},
		setState: function(newState) { state = newState; },
		getState: function() { return state; },
		setWebToken: function(newWebToken) { webToken = newWebToken; },
		getWebToken: function() { return webToken; },
		
		xbutton: function(itemId, top, left, height, width,buttonId) {
			this.xbutton.itemId = itemId;
			this.xbutton.top = top;
			this.xbutton.left = left;
			this.xbutton.height = height;
			this.xbutton.width = width;
			this.xbutton.buttonId = buttonId;
		},
		
		setTop: function(newTop) { this.xbutton.top = newTop; },
		getTop: function() { return this.xbutton.top; },
		setLeft: function(newLeft) { this.xbutton.left = newLeft; },
		getLeft: function() { return this.xbutton.left; },
			
		setHeight: function(newHeight) { this.xbutton.height = newHeight; },
		getHeight: function() { return this.xbutton.height; },
		setWidth: function(newWidth) { this.xbutton.width = newWidth; },
		getWidth: function() { return this.xbutton.width; },
		setItemId: function(newItemId) { this.xbutton.itemId = newItemId; },
		getItemId: function() { return this.xbutton.itemId; },
		setButtonId: function(newButtonId) { this.xbutton.buttonId = newButtonId; },
		getButtonId: function() { return this.xbutton.buttonId; },
		
			 
		
		xButtonDisplay: function(){
			var top = xconnection.getTop();
			var left = xconnection.getLeft();
			var h = xconnection.getHeight();
			var w = xconnection.getWidth();
			var itemId = xconnection.getItemId();
		
			var xBC = $('<div id="xButtonContainer" class="xButtonContainer">' + 
			'<div class="xClose" ></div>' + 
			'<div class="xButtonName"></div>' + 
			'<div class="xButtonDesc"></div>' + 
			'<div class="xButtonAmt"></div>' + 
			'<label>Quantity:</label><input type="number" min="0" max="10" step="1" value="2" class="xButtonQty">' + 
			'<div class="xButtonLink">&nbsp;</div></div>').hide().fadeIn(500);
			
			$('#' + xconnection.getTarget()).append(xBC);
			
			$('#xButtonContainer').width(w);
			$('#xButtonContainer').height(h);
			$('#xButtonContainer').css({ "top": top + "px"});
			$('#xButtonContainer').css({ "left": left + "px"});
			
			xconnection.callServer('method=createButton&itemId=' + xconnection.getItemId(),function(data){
				xconnection.setItemId(data.number);
				xconnection.setButtonId(data.buttonId);
				
				$('#xButtonContainer .xButtonLink').attr('id',data.number);
				$('#xButtonContainer .xButtonQty').val(data.qty);
				$('#xButtonContainer .xButtonName').html(data.name);
				$('#xButtonContainer .xButtonDesc').html(data.desc);
				$('#xButtonContainer').attr('id', data.buttonId);
				
				$('#' +  data.buttonId + ' .xClose').live('click', function() {
					$('#' + xconnection.getButtonId()).fadeOut(500);
				});
				
				$('#' +  data.buttonId + ' .xButtonLink').live('click', function() {	
					//console.log(xconnection.getButtonId());
					var qty = $('#' + xconnection.getButtonId() + ' .xButtonQty').val();
					var data = 'method=setExpressCheckout&itemId=' + this.id + "&qty=" + qty;
					xconnection.callServer(data,function(data){
						//console.log(data);
						startDGFlow(data.redirecturl);
					});
				});
			});
			
		},
		
		
		callServer : function(data,callbackFnk){
			$.ajax({
				url: xconnection.getUrl(),
				data: data,
				success: function(data){
					var obj = $.parseJSON(data);
					
					if(typeof callbackFnk == 'function'){
						callbackFnk.call(this, obj);
					}
				}
			});	
		}
		
		
	}
	
}();

function supports_html5_storage() {
  try {
    return 'localStorage' in window && window['localStorage'] !== null;
  } catch (e) {
    return false;
  }
}

startDGFlow = function(url) {	
	dg.startFlow(url);
}
		

function releaseDG(data) {
	//console.log(data);
	localStorage.setItem(xconnection.getButtonId(), JSON.stringify(data));
	dg.closeFlow();
	$('#' + xconnection.getButtonId()).fadeOut(500, function()
	{
		console.log(data);
		//alert('Item Unlocked');
	});
	
	
}

