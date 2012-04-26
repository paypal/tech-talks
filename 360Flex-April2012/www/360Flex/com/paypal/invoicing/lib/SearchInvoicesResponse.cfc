
		<cfscript>
		component name="SearchInvoicesResponse" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="responseEnvelope"  type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
			
			property name="count"  type="numeric" display="count" required="yes" hint="
								Number of invoices that matched the search.
							";
			
			property name="invoiceList"  type="InvoiceSummaryListType" display="invoiceList" required="no" hint="
								Page of invoice summaries that matched the search.
							";
			
			property name="page"  type="numeric" display="page" required="yes" hint="
								Page number of result set.
							";
			
			property name="hasNextPage"  type="boolean" display="hasNextPage" required="yes" hint="
								True if another page of invoice summary results exists.
							";
			
			property name="hasPreviousPage"  type="boolean" display="hasPreviousPage" required="yes" hint="
								True if a previous page of invoice summary results exists.
							";
			
			
			public SearchInvoicesResponse function init( ResponseEnvelope responseEnvelope="", numeric count="", numeric page="", boolean hasNextPage="", boolean hasPreviousPage="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setresponseEnvelope(arguments.responseEnvelope);
					
						this.setcount(arguments.count);
					
						this.setpage(arguments.page);
					
						this.sethasNextPage(arguments.hasNextPage);
					
						this.sethasPreviousPage(arguments.hasPreviousPage);
					
				
				
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
			
			
			public void function setresponseEnvelope(ResponseEnvelope responseEnvelope)
			{
				this.responseEnvelope = arguments.responseEnvelope;
			}  
				
			public ResponseEnvelope function getresponseEnvelope()
			{
				return this.responseEnvelope;
			} 
			
			
			public void function setcount(numeric count)
			{
				this.count = arguments.count;
			}  
				
			public numeric function getcount()
			{
				return this.count;
			} 
			
			
			public void function setinvoiceList(InvoiceSummaryListType invoiceList)
			{
				this.invoiceList = arguments.invoiceList;
			}  
				
			public InvoiceSummaryListType function getinvoiceList()
			{
				return this.invoiceList;
			} 
			
			
			public void function setpage(numeric page)
			{
				this.page = arguments.page;
			}  
				
			public numeric function getpage()
			{
				return this.page;
			} 
			
			
			public void function sethasNextPage(boolean hasNextPage)
			{
				this.hasNextPage = arguments.hasNextPage;
			}  
				
			public boolean function gethasNextPage()
			{
				return this.hasNextPage;
			} 
			
			
			public void function sethasPreviousPage(boolean hasPreviousPage)
			{
				this.hasPreviousPage = arguments.hasPreviousPage;
			}  
				
			public boolean function gethasPreviousPage()
			{
				return this.hasPreviousPage;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.responseEnvelope' ) )
					
						local.struct["responseEnvelope"] = getresponseEnvelope().getStruct();
					
				if(  isDefined( 'this.count' ) )
					
						local.struct["count"] = getcount();
					
				if(  isDefined( 'this.invoiceList' ) )
					
						local.struct["invoiceList"] = getinvoiceList().getStruct();
					
				if(  isDefined( 'this.page' ) )
					
						local.struct["page"] = getpage();
					
				if(  isDefined( 'this.hasNextPage' ) )
					
						local.struct["hasNextPage"] = gethasNextPage();
					
				if(  isDefined( 'this.hasPreviousPage' ) )
					
						local.struct["hasPreviousPage"] = gethasPreviousPage();
					
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
						
						if('#key#' eq 'responseEnvelope') {
						
							var keyCom = 'responseEnvelope';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setresponseEnvelope( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'count') {
						
							this.setcount(local.json[key]);
						}
						
						if('#key#' eq 'invoiceList') {
						
							var keyCom = 'invoiceList';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setinvoiceList( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'page') {
						
							this.setpage(local.json[key]);
						}
						
						if('#key#' eq 'hasNextPage') {
						
							this.sethasNextPage(local.json[key]);
						}
						
						if('#key#' eq 'hasPreviousPage') {
						
							this.sethasPreviousPage(local.json[key]);
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
							
							this.setresponseEnvelope(local.json[i]);
							
							this.setcount(local.json[i]);
							
							this.setinvoiceList(local.json[i]);
							
							this.setpage(local.json[i]);
							
							this.sethasNextPage(local.json[i]);
							
							this.sethasPreviousPage(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'responseEnvelope') {
							
                             var keyCom = 'responseEnvelope';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setresponseEnvelope( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'count') {
							
								this.setcount(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'invoiceList') {
							
                             var keyCom = 'invoiceList';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setinvoiceList( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'page') {
							
								this.setpage(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'hasNextPage') {
							
								this.sethasNextPage(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'hasPreviousPage') {
							
								this.sethasPreviousPage(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
