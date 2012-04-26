/**
 * Integration JavaScript for PayPal's inline checkout
 *
 * @author jeharrell
 */
if (typeof PAYPAL == 'undefined' || !PAYPAL) {
    var PAYPAL = {};
}

PAYPAL.apps = PAYPAL.apps || {};


(function () {
	
	
	var defaultConfig = {
		// DOM element which triggers the flow
		trigger: null,
		// Experience for the flow; set to 'mini' to force a popup flow
		expType: null,
		// Merchant can control the NameOnButton feature by setting boolean values		
		sole: 'true',
		// To set stage environment
		stage: null,
		// To set port number of stage environment
		port: null
	};


	
	/**
	 * Creates an instance of the in-context UI for the Digital Goods flow
	 *
	 * @param {Object} userConfig Overrides to the default configuration 
	 */
	PAYPAL.apps.DGFlow = function (userConfig) {
		var that = this;
				
		// storage object for UI elements
		that.UI = {};		
				
		// storage object for miniBrowser
		that.miniWin = {};
		
		// setup
		that._init(userConfig);
				
		return {
			/**
			 * Public method to add a trigger outside of the constructor
			 *
			 * @param {HTMLElement|String} el The element to set the click event on
			 */
			setTrigger: function (el) {
				that._setTrigger(el);
			},
			
			/** 
			 * Public method to start the flow without a triggering element, e.g. in a Flash movie
			 *
			 * @param {String} url The URL which starts the flow
			 */
			startFlow: function (url) {
				var win = that._render();
				
				if (win.location) {
					win.location = url;
				} else {
					win.src = url;
				}
			},
			
			/** 
			 * Public method to close the flow's lightbox
			 */
			closeFlow: function () {
				that._destroy();
			},
			
			/**
			 * Public method to determine if the flow is active
			 */
			 isOpen: function () {
				return that.isOpen;
			 }
		};
	};
	
	
	PAYPAL.apps.DGFlow.prototype = {
		
		/**
		 * Name of the iframe that's created
		 */
		name: 'PPDGFrame',
		
		
		/**
		 * Boolean; true if the flow is active
		 */
		isOpen: false,
		

		/**
		 * Boolean; true if NameOnButton feature is active
		 */
		NoB: true,		
		
		
		/**
		 * Initial setup
		 *
		 * @param {Object} userConfig Overrides to the default configuration: see defaultConfig.
		 */
		_init: function (userConfig) {	
			if (userConfig) {
				for (var key in defaultConfig) {
					if (typeof userConfig[key] !== 'undefined') {
						this[key] = userConfig[key];
					} else {
						this[key] = defaultConfig[key];
					}
				}
			}
			
			this.port = (this.port == null) ? "" : ":"+this.port;
			this.stage = (this.stage == null) ? "www.paypal.com" : "www."+this.stage+".paypal.com"+this.port;
			
			if (this.trigger) {
				this._setTrigger(this.trigger);
			}
			
			this._addCSS();
			
			// NoB is started
			if(this.NoB == true && this.sole == 'true'){
				var url = "https://"+ this.stage + "/webapps/checkout/nameOnButton.gif";				
				this._getImage(url, this._addImage);
			}			
		},
		
		
		/**
         * Renders and displays the UI
         *
         * @return {HTMLElement} The window the flow will appear in
         */
		_render: function () {
			var ua = navigator.userAgent,
                win;
            
            // mobile exerience
            if (ua.match(/iPhone|iPod|Android|Blackberry.*WebKit/i)) {
                win = window.open('', this.name);                
                return win;
            
			// popup experience
			} else if (this.expType == 'mini') {

                this._buildMiniDOM();
                this._createMask();
                this._addCSSmini();
                addEvent(this.UI.focus_button, 'click', this._checkMiniWin, this);

                return this._checkMiniWin();

			// default experience
			} else {
                this._buildDOM();
                this._createMask();
                this._centerLightbox();
                this._bindEvents();
            
                this.isOpen = true;
  
                return this.UI.iframe;
            }
		},

		_checkMiniWin: function(){
			if(this.miniWin.state != undefined){
                if(!this.miniWin.twin.closed){
                	this.miniWin.twin.focus();
                	return this.miniWin;
                }
                else{
                	this.miniWin = {};
                	return this._openMiniBrowser();
                }
			}
			else{
                return this._openMiniBrowser();
			}
		},
		
		/**
		 * Opens the mini-browser window
		 *
		 * @return {Object} The mini-browser window object
		 */
		
		_openMiniBrowser: function(){		
			var width = 400,
			height = 550,
			left,
			top,
			win;
			
			var pollingInterval = 0;
            var winOpened = false;
			
			if (window.outerWidth) {
				left = Math.round((window.outerWidth - width) / 2) + window.screenX;
				top = Math.round((window.outerHeight - height) / 2) + window.screenY;
			} else if (window.screen.width) {
				left = Math.round((window.screen.width - width) / 2);
				top = Math.round((window.screen.height - height) / 2);
			}
		
			win = window.open('about:blank', this.name, 'top=' + top + ', left=' + left + ', width=' + width + ', height=' + height + ', location=1, status=1, toolbar=0, menubar=0, resizable=0, scrollbars=1');
			
			try{
				win.document.write("<body style=\"background-color: #EBF2FA;padding:10px;\"><h2 style=\"color: #084482;font:1em Arial,Helvetica,sans-serif;font-weight: bold;\">Loading<span id=\"dotShow\" class=\"show\">...</span></h2><script>document.title=\"PayPal\"; var dotShow = document.getElementById('dotShow'); if(dotShow){setInterval(\"changeDot()\",500);} function changeDot(){if(dotShow.className == 'show'){dotShow.className = 'hide';}else{dotShow.className = 'show';}} window.focus();</script><style>.show{display:inline;}.hide{display:none;}</style></body>");
			}
			catch(err){
				//alert("PayPal mini-browser window has been already opened!!! ");
			}
			
			winOpened = true;
			var tmp = this;
			
			if(winOpened){
				pollingInterval = setInterval(function() {				 
					 if (win && win.closed) {							
							clearInterval(pollingInterval);
							return tmp._destroy();													
					}
				} , 100);
			}

			this.miniWin.state = false;
			this.miniWin.twin = win;
			
			return win;
		},
		
		
		/**
		 * Embeds the CSS for the UI into the document head
		 */
		_addCSS: function () {
			var css = '',
				styleEl = document.createElement('style');

			// write the styles into the page
			css += '#' + this.name + ' { z-index:20002; position:absolute; top:0; left:0; }';
			css += '#' + this.name + ' .panel { z-index:20003; position:relative; }';
			css += '#' + this.name + ' .panel iframe { width:385px; height:550px; border:0; }';
			css += '#' + this.name + ' .mask { z-index:20001; position:absolute; top:0; left:0; background-color:#000; opacity:0.2; filter:alpha(opacity=20); }';
			css += '.nameOnButton { display: inline-block; text-align: center; }';
			css += '.nameOnButton img { border:none; }';
			
			styleEl.type = 'text/css';
			
			if (styleEl.styleSheet) {
				styleEl.styleSheet.cssText = css;
			} else {
				styleEl.appendChild(document.createTextNode(css));
			}
			
			document.getElementsByTagName('head')[0].appendChild(styleEl);
		},

		_addCSSmini: function () {
			var css = '',
				styleEl = document.createElement('style');

			css += '#' + this.name + ' .panel { z-index:20003; position:relative; }';
			css += '#' + this.name + ' .panel .mini_wrapper { position:relative; border:0;background: url("https://www.paypalobjects.com/en_US/i/scr/scr_dg_sliding_door_bdr_wf.png") no-repeat scroll left top transparent; }';
			css += '#' + this.name + ' .panel .mini_wrapper input {margin-left:1em; background: url("https://www.paypalobjects.com/en_US/i/pui/core/btn_bg_submit.gif") repeat-x scroll left center #FFA822; border: 1px solid; border-color: #D5BD98 #935E0D #935E0D #D5BD98; }';
			css += '#' + this.name + ' .panel .sub_wrapper { background: url("https://www.paypalobjects.com/en_US/i/scr/scr_dg_sliding_door_bdr_wf.png") no-repeat scroll right top transparent; margin: 0pt 15px 15px; padding: 10px 10px 0 0; width: 100%; min-height: 290px; }';
			css += '#' + this.name + ' .panel .mini_footer {background: url("https://www.paypalobjects.com/en_US/i/scr/scr_dg_sliding_door_bdr_wf.png") no-repeat scroll right bottom transparent; bottom: -12px; left: 10px; margin: 0pt; padding: 0px 5px 10px 10px; position: absolute; width: 100%;}';
			css += '#' + this.name + ' .panel .sub_wrapper .mini_footer div {background: url("https://www.paypalobjects.com/en_US/i/scr/scr_dg_sliding_door_bdr_wf.png") no-repeat scroll left bottom transparent; bottom: -10px; left: -10px; margin: 0pt 0pt 0pt -10px; padding: 0pt; position: relative; height: 12px}';
			css += '#' + this.name + ' .panel .sub_wrapper .logo {border-bottom: 1px dotted #ccc; text-align: right;}';
			css += '#' + this.name + ' .panel .sub_wrapper p {font: 75% Arial,Helvetica,sans-serif;  color: #333; margin:1em;}';
			
			
			styleEl.type = 'text/css';
			
			if (styleEl.styleSheet) {
				styleEl.styleSheet.cssText = css;
			} else {
				styleEl.appendChild(document.createTextNode(css));
			}
			
			document.getElementsByTagName('head')[0].appendChild(styleEl);		
		},
		
		
		/**
		 * Creates the DOM nodes and adds them to the document body
		 */
		_buildDOM: function () {
			this.UI.wrapper = document.createElement('div');
			this.UI.wrapper.id = this.name;
			
			this.UI.panel = document.createElement('div');
			this.UI.panel.className = 'panel';

			// workaround: IE6 + 7 won't let you name an iframe after you create it
			try {
				this.UI.iframe = document.createElement('<iframe name="' + this.name + '">');
			} catch (e) {
				this.UI.iframe = document.createElement('iframe');
				this.UI.iframe.name = this.name;
			}
				
			this.UI.iframe.frameBorder = '0';
			this.UI.iframe.border = '0';
			this.UI.iframe.scrolling = 'no';
			this.UI.iframe.allowTransparency = 'true';
			
			this.UI.mask = document.createElement('div');
			this.UI.mask.className = 'mask';

			this.UI.panel.appendChild(this.UI.iframe);
			this.UI.wrapper.appendChild(this.UI.mask);
			this.UI.wrapper.appendChild(this.UI.panel);

			document.body.appendChild(this.UI.wrapper);
		},


		_buildMiniDOM: function(){			
			this.UI.wrapper = document.createElement('div');
			this.UI.wrapper.id = this.name;
		
			this.UI.panel = document.createElement('div');
			this.UI.panel.className = 'panel';

			this.UI.mini_wrapper = document.createElement('div');
			this.UI.mini_wrapper.className = 'mini_wrapper';

			this.UI.logo = document.createElement('div');
			this.UI.logo.className = 'logo';

			this.UI.logoImg = document.createElement('img');
			this.UI.logoImg.alt = 'PayPal';
			this.UI.logoImg.src = 'https://www.paypal.com/en_US/i/logo/logo_paypal_140wx50h.gif';
			this.UI.logoImg.title = 'PayPal';


			this.UI.sub_wrapper = document.createElement('div');
			this.UI.sub_wrapper.className = 'sub_wrapper';

			this.UI.mini_footer = document.createElement('div');
			this.UI.mini_footer.className = 'mini_footer';

			this.UI.mini_footer_cap = document.createElement('div');



				var panelWidth = 350,
				panelHeight = 300,
				scrollY;

				this.UI.mini_wrapper.style.width = panelWidth + "px";
				this.UI.mini_wrapper.style.height = panelHeight + "px";
		
				// non-IE browsers
				if (window.innerWidth) {
					width = window.innerWidth;
					height = window.innerHeight;
					scrollY = window.pageYOffset;
				// IE 6+ in standards mode
				} else if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
					width = document.documentElement.clientWidth;
					height = document.documentElement.clientHeight;
					scrollY = document.documentElement.scrollTop; 
				// other browsers
				} else if (document.body && (document.body.clientWidth || document.body.clientHeight)) {
					width = document.body.clientWidth;
					height = document.body.clientHeight;
					scrollY = document.body.scrollTop;
				}
				
				this.UI.panel.style.left = Math.round((width - panelWidth) / 2) + 'px';
				var panelTop = Math.round((height - panelHeight) / 2) + scrollY;
				if(panelTop < 5){
					panelTop = 10;
				}
				this.UI.panel.style.top = panelTop + 'px';



			this.UI.para = document.createElement('p');
			this.UI.para.innerHTML = "Please continue your purchase in the secure window we opened. If you don't see it, click the button below.";

			this.UI.focus_button = document.createElement('input');
			this.UI.focus_button.type = 'button';
			this.UI.focus_button.id = 'bring_mini';
			this.UI.focus_button.value = 'Go';
			this.UI.focus_button.className = 'button_mini';

			this.UI.mask = document.createElement('div');
			this.UI.mask.className = 'mask';
			
			this.UI.panel.appendChild(this.UI.mini_wrapper);
			this.UI.mini_wrapper.appendChild(this.UI.sub_wrapper);
			this.UI.sub_wrapper.appendChild(this.UI.logo);
			this.UI.logo.appendChild(this.UI.logoImg);
			this.UI.sub_wrapper.appendChild(this.UI.para);
			this.UI.sub_wrapper.appendChild(this.UI.focus_button);
			this.UI.sub_wrapper.appendChild(this.UI.mini_footer);
			this.UI.mini_footer.appendChild(this.UI.mini_footer_cap);


			this.UI.wrapper.appendChild(this.UI.mask);
			this.UI.wrapper.appendChild(this.UI.panel);

			document.body.appendChild(this.UI.wrapper);
	},
		
		
		/**
		 * Creates the mask
		 */
		 _createMask: function (e) {
			var windowWidth, windowHeight, scrollWidth, scrollHeight, width, height;
			
		 	// get the scroll dimensions
			if (window.innerHeight && window.scrollMaxY) {
				scrollWidth = window.innerWidth + window.scrollMaxX;
				scrollHeight = window.innerHeight + window.scrollMaxY;
			} else if (document.body.scrollHeight > document.body.offsetHeight) {
				scrollWidth = document.body.scrollWidth;
				scrollHeight = document.body.scrollHeight;
			} else {
				scrollWidth = document.body.offsetWidth;
				scrollHeight = document.body.offsetHeight;
			}

			// get the window dimensions
			// non-IE browsers
			if (window.innerHeight) {
 				windowWidth = window.innerWidth;
				windowHeight = window.innerHeight;
			// IE 6+ in standards mode
			} else if (document.documentElement && document.documentElement.clientHeight) { 
				windowWidth = document.documentElement.clientWidth;
				windowHeight = document.documentElement.clientHeight;
			// other IEs
			} else if (document.body) {
				windowWidth = document.body.clientWidth;
				windowHeight = document.body.clientHeight;
			}	
			
			// take the larger of each
			width = (windowWidth > scrollWidth) ? windowWidth : scrollWidth;
			height = (windowHeight > scrollHeight) ? windowHeight : scrollHeight;
			
			this.UI.mask.style.width = width + 'px';
			this.UI.mask.style.height = height + 'px';
		 },
		 

		/**
		 * Centers the lightbox in the middle of the window
		 */
		_centerLightbox: function (e) {	
			var width, height, scrollY;
			
			// non-IE browsers
			if (window.innerWidth) {
				width = window.innerWidth;
				height = window.innerHeight;
				scrollY = window.pageYOffset;
			// IE 6+ in standards mode
			} else if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
 				width = document.documentElement.clientWidth;
 				height = document.documentElement.clientHeight;
				scrollY = document.documentElement.scrollTop; 
			// other browsers
			} else if (document.body && (document.body.clientWidth || document.body.clientHeight)) {
 				width = document.body.clientWidth;
 				height = document.body.clientHeight;
				scrollY = document.body.scrollTop;
			}
			
			this.UI.panel.style.left = Math.round((width - this.UI.iframe.offsetWidth) / 2) + 'px';
			var panelTop = Math.round((height - this.UI.iframe.offsetHeight) / 2) + scrollY;
			if(panelTop < 5){
				panelTop = 10;
			}
			this.UI.panel.style.top = panelTop + 'px';

		},
		
		
		/**
         * Sets up the events for an instance
         */
        _bindEvents: function () {
            addEvent(window, 'resize', this._createMask, this);
            addEvent(window, 'resize', this._centerLightbox, this);
            addEvent(window, 'unload', this._destroy, this);
        },
		
		
		/**
		 * Adds a click event to an element which initiates the flow
		 *
		 * @param {HTMLElement[]|String[]} el The element to attach the click event to
		 * @return {Boolean} True if the trigger is active and false if it failed
		 */
		_setTrigger: function(el) {
			// process an array if passed 
			if (el.constructor.toString().indexOf('Array') > -1) {
				for (var i = 0; i < el.length; i++) {
					this._setTrigger(el[i]);
				}
		
			// otherwise process a single element	
			} else {	
				el = (typeof el == 'string') ? document.getElementById(el) : el;

				// forms
				if (el && el.form) {
					el.form.target = this.name;
				// links
				} else if (el && el.tagName.toLowerCase() == 'a') {
					el.target = this.name;
				} 
				addEvent(el, 'click', this._triggerClickEvent, this);
								
			}
			
		},
		
		/**
		 * To load the NameOnButton image
		 *
		 * @param {Element} el The trigger is passed
		 */
		
		_getImage: function(url, callback){
		
			// Can be used for addEvent case
			if(typeof this.callback != 'undefined'){
				url = this.url;
				callback = this.callback;				
			}
		
			var self = this;
			var imgElement = new Image();		
			imgElement.src = "";
	
			if(imgElement.readyState){				
				imgElement.onreadystatechange= function(){					
					if (imgElement.readyState == 'complete' || imgElement.readyState == 'loaded'){
						callback(imgElement, self);												
					}				
					
				};		
			}
			else{
				imgElement.onload= function(){					
					callback(imgElement, self);
				};
				
			}
			
			imgElement.src = url;
			
		},		
		
		/**
		 * Place NameOnButton image in on top of the Checkout button
		 *		 
		 * @param {Image} img NameOnButton image is passed
		 * @param {Object} obj Contains config parameters and functions
		 * @param {Element} el The trigger element
		 */			
		
		_addImage: function(img, obj){
		
			if(checkEmptyImage(img)){
			
				var url = "https://"+ obj.stage + "/webapps/checkout/clearNob.gif";				
				
				var wrapperObj = {};			
				wrapperObj.callback = obj._removeImage;
				wrapperObj.url = url;
				wrapperObj.outer = obj;				
			
				var el = obj.trigger;
				
				if(el.constructor.toString().indexOf('Array') > -1){
					for (var i = 0; i < el.length; i++) {
						var tempImg = img.cloneNode(true);
						obj._placeImage(el[i], tempImg, wrapperObj);
					}
				}
				else{
					obj._placeImage(el, img, wrapperObj);
				}
			}
		
		},
		
		/**
		 * Place NameOnButton image in on top of the Checkout button
		 *	
		 * @param {Element} el The trigger element
		 * @param {Image} img NameOnButton image is passed
		 * @param {Object} obj Contains config parameters and logout link		 
		 */		
		
		
		_placeImage: function(el, img, obj){			
			
			el = (typeof el == 'string') ? document.getElementById(el) : el;
			var root = getParent(el);
			
			var spanElement = document.createElement("span");
			spanElement.className = "nameOnButton";
			var lineBreak = document.createElement("br");
			var link = document.createElement("a");
			link.href = "javascript:";

			link.appendChild(img);
			root.insertBefore(spanElement,el);
			spanElement.appendChild(el);
			spanElement.insertBefore(link,el);
			spanElement.insertBefore(lineBreak,el);
			
			obj.span = spanElement;
			obj.link = link;
			obj.lbreak = lineBreak;			
					
			addEvent(link, 'click', obj.outer._getImage, obj);		
		
		},
		
		/**
		 * Place NameOnButton image in on top of the Checkout button
		 *		 
		 * @param {Image} img NameOnButton image is passed
		 * @param {Object} obj Contains config parameters and logout link
		 * @param {Element} el The trigger element
		 */		
		
		_removeImage: function(img, obj){
			if(!checkEmptyImage(img)){
				var el = obj.outer.trigger;				
				if(el.constructor.toString().indexOf('Array') > -1){
					obj.outer._removeMultiImages(obj.outer.trigger);
				}
				else{
					spanElement = obj.span;
					link = obj.link;
					lineBreak = obj.lbreak;
					spanElement.removeChild(link);
					spanElement.removeChild(lineBreak);
				}
			}
		},
		
	
		/**
		 * Place NameOnButton image in on top of the Checkout button
		 *		 
		 * @param {Image} img NameOnButton image is passed
		 */		
		
		_removeMultiImages: function(obj){
		
			for (var i = 0; i < obj.length; i++) {
				obj[i] = (typeof obj[i] == 'string') ? document.getElementById(obj[i]) : obj[i];
				rootNode = getParent(obj[i]);				
				
				if(rootNode.className == 'nameOnButton'){
					lineBreak = getPreviousSibling(obj[i]);
					linkNode = getPreviousSibling(lineBreak);				
					rootNode.removeChild(linkNode);
					rootNode.removeChild(lineBreak);
				}
			}
		},
		
				
		/**
		 * Custom event which fires on click of the trigger element(s)
		 *
		 * @param {Event} e The event object
		 */	
		_triggerClickEvent: function (e) {
			 this._render();
		},
		
		
		/**
		 * Custom event which does some cleanup: all UI DOM nodes, custom events,
		 * and intervals are removed from the current page
		 *
		 * @param {Event} e The event object
		 */
		_destroy: function (e) {

			if (this.isOpen && this.UI.wrapper.parentNode) {
				this.UI.wrapper.parentNode.removeChild(this.UI.wrapper);
			}
			else if(this.UI.wrapper.parentNode){
				this.UI.wrapper.parentNode.removeChild(this.UI.wrapper);
			}
			
			if (this.interval) {
				clearInterval(this.interval);
			}			
			
			removeEvent(window, 'resize', this._createMask);
			removeEvent(window, 'resize', this._centerLightbox);
			removeEvent(window, 'unload', this._destroy);
			removeEvent(window, 'message', this._windowMessageEvent);
			
			this.isOpen = false;
		}
	};
	
	
		
	/* Helper Methods */
	
	
	/**
	 * Storage object for all events; used to obtain exact signature when 
	 * removing events
	 */
	var eventCache = [];
	
	
	/**
	 * Normalized method of adding an event to an element
	 *
	 * @param {HTMLElement} obj The object to attach the event to
	 * @param {String} type The type of event minus the "on"
	 * @param {Function} fn The callback function to add
	 * @param {Object} scope A custom scope to use in the callback (optional)
	 */
	function addEvent(obj, type, fn, scope) {
		scope = scope || obj; 
		
		var wrappedFn;
		
		if (obj.addEventListener) {
			wrappedFn = function (e) { fn.call(scope, e); };
			obj.addEventListener(type, wrappedFn, false);
		} else if (obj.attachEvent) {
			wrappedFn = function () {
				var e = window.event;
				e.target = e.target || e.srcElement;
				
				e.preventDefault = function () {
					window.event.returnValue = false;
				};
				
				fn.call(scope, e);
			};
			
			obj.attachEvent('on' + type, wrappedFn);
		}
		
		eventCache.push([obj, type, fn, wrappedFn]);
	}
	
	
	/**
	 * Normalized method of removing an event from an element
	 *
	 * @param {HTMLElement} obj The object to attach the event to
	 * @param {String} type The type of event minus the "on"
	 * @param {Function} fn The callback function to remove
	 */
	function removeEvent(obj, type, fn) {
		var wrappedFn, item, len, i;
	
		for (i = 0; i < eventCache.length; i++) {
			item = eventCache[i];
			
			if (item[0] == obj && item[1] == type && item[2] == fn) {
				wrappedFn = item[3];
				
				if (wrappedFn) {
					if (obj.removeEventListener) {
						obj.removeEventListener(type, wrappedFn, false);
					} else if (obj.detachEvent) {
						obj.detachEvent('on' + type, wrappedFn);
					}
				}
			}
		}
	}
	
	/**
	 * Normalized method of getting the corresponding parent element for an element
	 *
	 * @param {HTMLElement} obj The object to get the corresponding parent element
	 */
	
	function getParent(el) {
		do {
			el = el.parentNode;
		} while (el && el.nodeType != 1);
		return el;
	}
	
	/**
	 * Normalized method of getting the corresponding previous sibling element for an element
	 *
	 * @param {HTMLElement} obj The object to get the corresponding previous sibling element
	 */
	
	function getPreviousSibling(el) {
		do {
			el = el.previousSibling;
		} while (el && el.nodeType != 1);
		return el;
	}	
	
	/**
	 * Normalized method of checking empty image
	 *
	 * @param {HTMLElement} obj The object should be an image object
	 */
	
	function checkEmptyImage(img){		
		return (img.width > 1 || img.height > 1);
	}
	
}());
