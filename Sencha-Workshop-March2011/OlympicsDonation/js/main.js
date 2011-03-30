
	new Ext.Application({
	launch: function() {
		
		 var makeAjaxRequest = function() {
		   Ext.getBody().mask('Loading...', 'x-mask-loading', true);
			Ext.Ajax.request({
				url: 'Order.cfm',
				success: function(response, opts) {
					// redirect to PayPal with Token
					window.location.href = response.responseText;
				}
			});
		};
		
		var donateButton = new Ext.Button({
			text:"Donate $10",
			ui:"round",
			handler: makeAjaxRequest,
			width:150,
		})
		
		
		var middle = {
			dock:" middle",
			style:"background-color:#e2e2e2",
			html:"<img src='images/1329_Olympics_40.jpg'>",	
			items: [donateButton]								
		
		}
		
	
		var header = new Ext.Toolbar({
			dock:"top",
			style:"background-color:#E2e2e2",
			title:"Olympics 2012"	
		})
		
		
		new Ext.Panel({
			fullscreen: true,
			id: 'content',
			layout:{type:"vbox",
				align:"stretch",
				pack:"end"},
			defaults:{flex:1},
			cardSwitchAnimation:{type:"slide",duration:500},
			items:[middle],
			dockedItems: [header]
		});
		
		
	}
});
