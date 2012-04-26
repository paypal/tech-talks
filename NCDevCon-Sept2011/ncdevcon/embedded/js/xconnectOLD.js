// JavaScript Document

var dg = new PAYPAL.apps.DGFlow({});

/*
connection(url,data)
url = the server side connection script
data = the query string to call method or pass variables.
target = the id of the dom element you are targeting.
targetType = either canvas or div
*/



xconnection = function(url, data, target) {
	this.setUrl = function(newUrl) { url = newUrl; };
    this.getUrl = function() { return url; };
	this.setData = function(newData) { data = newData; };
	this.getData = function() { return data; }; 
	this.setTarget = function(newTarget) { target = newTarget; };
	this.getTarget = function() { return target; }; 
	
	this.connectResult = function(newConnData){
		this.setState(newConnData.state);
		this.setWebToken(newConnData.webToken);
	}; 
	this.setState = function(newState) { state = newState; };
	this.getState = function() { return state; }; 
	this.setWebToken = function(newWebToken) { webToken = newWebToken; };
	this.getWebToken = function() { return webToken; };
	
	
	this.xbutton = function(x, y,height,width) {
		var setX = function(newX) { x = newX; };
		var getX = function() { return x; };
		var setY = function(newY) { y = newY; };
		var getY = function() { return y; };
		
		var setHeight = function(newHeight) { height = newHeight; };
		var getHeight = function() { return height; };
		var setWidth = function(newWidth) { width = newWidth; };
		var getWidth = function() { return width; };
		 
		var setFrameColor = function(newFrameColor) { frameColor = newFrameColor; };
		var getFrameColor = function() { return frameColor; };  
		
	};
	
}

// CONNECT 
$.extend({
	connect : function(callbackFnk){
		$.ajax({
			url: xconn.getUrl(),
			data: xconn.getData(),
			success: function(data){
				var obj = $.parseJSON(data);
				
				if(typeof callbackFnk == 'function'){
					callbackFnk.call(this, obj);
				}
			}
		});	
	}
});


// BUTTONCREATE
$.extend({
	createButton : function(callbackFnk){
		$.ajax({
			url: xconn.getUrl(),
			data: xconn.getData(),
			success: function(data){
				var obj = $.parseJSON(data);
				
				if(typeof callbackFnk == 'function'){
					callbackFnk.call(this, obj);
				}
			}
		});	
	}
	
});


// SETEXPRESSCHECKOUT
$.extend({
	setExpressCheckout : function(callbackFnk){
		$.ajax({
			url: xconn.getUrl(),
			data: xconn.getData(),
			success: function(data){
				var obj = $.parseJSON(data);
				
				if(typeof callbackFnk == 'function'){
					callbackFnk.call(this, obj);
				}
			}
		});	
	}
});




function releaseDG() {
	
	parent.dg.closeFlow();
	
	var canvas = $("#mainCanvas").get(0);
	var context = canvas.getContext('2d')
	context.clearRect(0, 0, canvas.width, canvas.height);
	var w = canvas.width;
	canvas.width = 1;
	canvas.width = w;
	
	setGame();
		
	context.drawImage(backgroundImage, 0, 0);	
	
}




var canvasContext;
var myButton = new Object();
var myContainer = new Object();
var buttonObj = new Image();

var mouseX = 0;
var mouseY = 0;
var backgroundImage = new Image();
var FRAME_COLOR_DARK_BLUE = "rgb(0, 0, 255)";
var FRAME_COLOR_LIGHT_BLUE = "rgb(0, 0, 128)";
var FRAME_COLOR_WHITE = "rgb(255, 255, 255)";


function showBuyButton() {
	// Offer Container area
	myContainer.x = 350;
	myContainer.y = 250;
	myContainer.width = 180;
	myContainer.height = 100;
	myContainer.rgb = FRAME_COLOR_WHITE;
	drawButton(myContainer);
	
	// Hit Area 
	myButton.x = 375;
	myButton.y = 300;
	myButton.width = 130;
	myButton.height = 30;
	//myButton.rgb = BUTTON_COLOR_LIGHT;
	drawButton(myButton);
	
	buttonObj.src = "https://www.sandbox.paypal.com/en_US/i/btn/btn_buynow_LG.gif";
	buttonObj.onload = function() {
		canvasContext.drawImage(buttonObj, 325,300, 130, 30);
	};
}


function drawButton(buttonObj)
{
	canvasContext.fillStyle = buttonObj.rgb;
	canvasContext.fillRect (buttonObj.x, buttonObj.y, buttonObj.width, buttonObj.height);
}

function clearItem(buttonObj)
{
	canvasContext.clearRect (buttonObj.x, buttonObj.y, buttonObj.width, buttonObj.height);
}

function checkIfInsideButtonCoordinates(buttonObj, mouseX, mouseY)
{
	if(((mouseX > buttonObj.x) && (mouseX < (buttonObj.x + buttonObj.width))) && ((mouseY > buttonObj.y) && (mouseY < (buttonObj.y + buttonObj.height))))
		return true;
	else
		return false;
}


$(function() {
	
	$('#connect').click(function() {	
		$.connect(function(data){
			xconn.connectResult(data);
			console.log(testButton.getX());
		});
	});
	
	$('#createButton').click(function() {	
		xconn.setData('method=createButton');
		$.createButton(function(data){
			xconn.connectResult(data);
			showBuyButton();
		});
	});
	

	$("#" + xconn.getTarget()).click(function(eventObject) {
		
		mouseX = eventObject.pageX - this.offsetLeft;
		mouseY = eventObject.pageY - this.offsetTop;

		if(checkIfInsideButtonCoordinates(myButton, mouseX, mouseY))
		{
			//console.log('hit area');
			
			xconn.setData('method=setExpressCheckout');
			$.setExpressCheckout(function(data){
				console.log(data.redirecturl);
				dg.startFlow(data.redirecturl);
			});
		}
	});


	// Debug code for XY position of mouse remove later
	/*
	$("#mainCanvas").mousemove(function(eventObject) {
		mouseX = eventObject.pageX - this.offsetLeft;
		mouseY = eventObject.pageY - this.offsetTop;

		$("#mouseXYSpan").html("X: " + mouseX + "   Y: " + mouseY);
		
	});
	*/
});



var xconn = new xconnection('/html5-dg/server/coldfusion/connect.cfc','method=connect','mainCanvas');
var testButton = new xconn.xbutton(375,300,120,30);




