
		<cfscript>
		component name="InvoiceItemType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="name"  type="string" display="name" required="yes" hint="
								SKU or item name.
							";
			
			property name="description"  type="string" display="description" required="no" hint="
								Description of the item.
							";
			
			property name="date"  type="string" display="date" required="no" hint="
								Date on which the product or service was provided.
							";
			
			property name="quantity"  type="numeric" display="quantity" required="yes" hint="
								Item count.
							";
			
			property name="unitPrice"  type="numeric" display="unitPrice" required="yes" hint="
								Price of the item, in the currency specified by the invoice.
							";
			
			property name="taxName"  type="string" display="taxName" required="no" hint="
								Name of an applicable tax, if any.
							";
			
			property name="taxRate"  type="numeric" display="taxRate" required="no" hint="
								Rate of an applicable tax, if any.
							";
			
			
			public InvoiceItemType function init( string name="", numeric quantity="", numeric unitPrice="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setname(arguments.name);
					
						this.setquantity(arguments.quantity);
					
						this.setunitPrice(arguments.unitPrice);
					
				
				
				return this;  
			}
			
			public void function setError(ErrorData error)
			{
				this.error = arguments.error;
			}  
				
			public ErrorData function getError()
			{
				return this.error;
			} 
			
			
			public void function setname(string name)
			{
				this.name = arguments.name;
			}  
				
			public string function getname()
			{
				return this.name;
			} 
			
			
			public void function setdescription(string description)
			{
				this.description = arguments.description;
			}  
				
			public string function getdescription()
			{
				return this.description;
			} 
			
			
			public void function setdate(string date)
			{
				this.date = arguments.date;
			}  
				
			public string function getdate()
			{
				return this.date;
			} 
			
			
			public void function setquantity(numeric quantity)
			{
				this.quantity = arguments.quantity;
			}  
				
			public numeric function getquantity()
			{
				return this.quantity;
			} 
			
			
			public void function setunitPrice(numeric unitPrice)
			{
				this.unitPrice = arguments.unitPrice;
			}  
				
			public numeric function getunitPrice()
			{
				return this.unitPrice;
			} 
			
			
			public void function settaxName(string taxName)
			{
				this.taxName = arguments.taxName;
			}  
				
			public string function gettaxName()
			{
				return this.taxName;
			} 
			
			
			public void function settaxRate(numeric taxRate)
			{
				this.taxRate = arguments.taxRate;
			}  
				
			public numeric function gettaxRate()
			{
				return this.taxRate;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.name' ) )
					
						local.struct["name"] = getname();
					
				if(  isDefined( 'this.description' ) )
					
						local.struct["description"] = getdescription();
					
				if(  isDefined( 'this.date' ) )
					
						local.struct["date"] = getdate();
					
				if(  isDefined( 'this.quantity' ) )
					
						local.struct["quantity"] = getquantity();
					
				if(  isDefined( 'this.unitPrice' ) )
					
						local.struct["unitPrice"] = getunitPrice();
					
				if(  isDefined( 'this.taxName' ) )
					
						local.struct["taxName"] = gettaxName();
					
				if(  isDefined( 'this.taxRate' ) )
					
						local.struct["taxRate"] = gettaxRate();
					
				return local.struct;
			} 
			
			public any function serialize()
			{
				return serializeJSON(this.getStruct());
			} 
			
			public any function deserialize(any jsonObj)
			{
				if(isJSON(jsonObj))
				{
					local.json = deserializeJSON(jsonObj);
				} else {
					local.json = jsonObj;
				}
				
				if(isStruct(local.json))
				{
				
					for(key in local.json)
					{
						
						if('#key#' eq 'name') {
						
							this.setname(local.json[key]);
						}
						
						if('#key#' eq 'description') {
						
							this.setdescription(local.json[key]);
						}
						
						if('#key#' eq 'date') {
						
							this.setdate(local.json[key]);
						}
						
						if('#key#' eq 'quantity') {
						
							this.setquantity(local.json[key]);
						}
						
						if('#key#' eq 'unitPrice') {
						
							this.setunitPrice(local.json[key]);
						}
						
						if('#key#' eq 'taxName') {
						
							this.settaxName(local.json[key]);
						}
						
						if('#key#' eq 'taxRate') {
						
							this.settaxRate(local.json[key]);
						}
						
						
						if('#key#' eq 'error')
						{	
							var keyObj = createObject("component",'ErrorData');
							this.setError( keyObj.deserialize(local.json[key]) );	
						}
						
					}
				} else if (isArray(local.json)) {
				
					for( i = 1; i lte ArrayLen(local.json); i = i + 1)
					{
					
						if(NOT isStruct(local.json[i]))
						{
							
							this.setname(local.json[i]);
							
							this.setdescription(local.json[i]);
							
							this.setdate(local.json[i]);
							
							this.setquantity(local.json[i]);
							
							this.setunitPrice(local.json[i]);
							
							this.settaxName(local.json[i]);
							
							this.settaxRate(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'name') {
							
								this.setname(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'description') {
							
								this.setdescription(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'date') {
							
								this.setdate(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'quantity') {
							
								this.setquantity(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'unitPrice') {
							
								this.setunitPrice(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'taxName') {
							
								this.settaxName(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'taxRate') {
							
								this.settaxRate(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
