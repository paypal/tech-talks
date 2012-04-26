// JavaScript Document

var canvasContext;
var myButton = new Object();
var myContainer = new Object();
var buttonObj = new Image();

var mouseX = 0;
var mouseY = 0;
var backgroundImage = new Image();
// This Code would be specific to the game developer
function setGame() {
	var canvas = $("#mainCanvas").get(0);
	canvasContext = canvas.getContext('2d');
	backgroundImage.src = "/html5-dg/client/images/angrybirds.png";
	
	$(backgroundImage).load(function() {
		canvasContext.drawImage(backgroundImage, 0, 0);
	});
	  
}

$(function() {
	
	setGame();
	
});