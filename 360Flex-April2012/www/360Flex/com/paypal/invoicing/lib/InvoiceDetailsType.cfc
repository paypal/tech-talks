
		<cfscript>
		component name="InvoiceDetailsType" output="false"  hint="I define the properties and methods"
		{
			property name="error"  type="ErrorData" display="error" required="no" hint="";
			
			property name="status"  type="StatusType" display="status" required="yes" hint="
								Status of the invoice.
							";
			
			property name="totalAmount"  type="numeric" display="totalAmount" required="no" hint="
								The total amount of the invoice (cost of items, shipping and tax, less any discount).
								This field is set by the invoicing system and will ignore any changes made by API callers.
							";
			
			property name="origin"  type="OriginType" display="origin" required="yes" hint="
								Whether the invoice was created via the website or via an API call.
							";
			
			property name="createdDate"  type="string" display="createdDate" required="yes" hint="
								Date when the invoice was created.
							";
			
			property name="createdBy"  type="string" display="createdBy" required="no" hint="
								Account that created the invoice.
							";
			
			property name="canceledDate"  type="string" display="canceledDate" required="no" hint="
								If canceled, date when the invoice was canceled.
							";
			
			property name="canceledByActor"  type="ActorType" display="canceledByActor" required="no" hint="
								Actor who canceled the invoice.
							";
			
			property name="canceledBy"  type="string" display="canceledBy" required="no" hint="
								Account that canceled the invoice.
							";
			
			property name="lastUpdatedDate"  type="string" display="lastUpdatedDate" required="no" hint="
								Date when the invoice was last edited.
							";
			
			property name="lastUpdatedBy"  type="string" display="lastUpdatedBy" required="no" hint="
								Account that last edited the invoice.
							";
			
			property name="firstSentDate"  type="string" display="firstSentDate" required="no" hint="
								Date when the invoice was first sent.
							";
			
			property name="lastSentDate"  type="string" display="lastSentDate" required="no" hint="
								Date when the invoice was last sent.
							";
			
			property name="lastSentBy"  type="string" display="lastSentBy" required="no" hint="
								Account that last sent the invoice.
							";
			
			property name="paidDate"  type="string" display="paidDate" required="no" hint="
								If the invoice was paid, date when the invoice was paid.
							";
			
			
			public InvoiceDetailsType function init( StatusType status="", OriginType origin="", string createdDate="")
				hint="I initialize the component and return myself" 
			 	output="false" {
				
				
						this.setstatus(arguments.status);
					
						this.setorigin(arguments.origin);
					
						this.setcreatedDate(arguments.createdDate);
					
				
				
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
			
			
			public void function setstatus(StatusType status)
			{
				this.status = arguments.status;
			}  
				
			public StatusType function getstatus()
			{
				return this.status;
			} 
			
			
			public void function settotalAmount(numeric totalAmount)
			{
				this.totalAmount = arguments.totalAmount;
			}  
				
			public numeric function gettotalAmount()
			{
				return this.totalAmount;
			} 
			
			
			public void function setorigin(OriginType origin)
			{
				this.origin = arguments.origin;
			}  
				
			public OriginType function getorigin()
			{
				return this.origin;
			} 
			
			
			public void function setcreatedDate(string createdDate)
			{
				this.createdDate = arguments.createdDate;
			}  
				
			public string function getcreatedDate()
			{
				return this.createdDate;
			} 
			
			
			public void function setcreatedBy(string createdBy)
			{
				this.createdBy = arguments.createdBy;
			}  
				
			public string function getcreatedBy()
			{
				return this.createdBy;
			} 
			
			
			public void function setcanceledDate(string canceledDate)
			{
				this.canceledDate = arguments.canceledDate;
			}  
				
			public string function getcanceledDate()
			{
				return this.canceledDate;
			} 
			
			
			public void function setcanceledByActor(ActorType canceledByActor)
			{
				this.canceledByActor = arguments.canceledByActor;
			}  
				
			public ActorType function getcanceledByActor()
			{
				return this.canceledByActor;
			} 
			
			
			public void function setcanceledBy(string canceledBy)
			{
				this.canceledBy = arguments.canceledBy;
			}  
				
			public string function getcanceledBy()
			{
				return this.canceledBy;
			} 
			
			
			public void function setlastUpdatedDate(string lastUpdatedDate)
			{
				this.lastUpdatedDate = arguments.lastUpdatedDate;
			}  
				
			public string function getlastUpdatedDate()
			{
				return this.lastUpdatedDate;
			} 
			
			
			public void function setlastUpdatedBy(string lastUpdatedBy)
			{
				this.lastUpdatedBy = arguments.lastUpdatedBy;
			}  
				
			public string function getlastUpdatedBy()
			{
				return this.lastUpdatedBy;
			} 
			
			
			public void function setfirstSentDate(string firstSentDate)
			{
				this.firstSentDate = arguments.firstSentDate;
			}  
				
			public string function getfirstSentDate()
			{
				return this.firstSentDate;
			} 
			
			
			public void function setlastSentDate(string lastSentDate)
			{
				this.lastSentDate = arguments.lastSentDate;
			}  
				
			public string function getlastSentDate()
			{
				return this.lastSentDate;
			} 
			
			
			public void function setlastSentBy(string lastSentBy)
			{
				this.lastSentBy = arguments.lastSentBy;
			}  
				
			public string function getlastSentBy()
			{
				return this.lastSentBy;
			} 
			
			
			public void function setpaidDate(string paidDate)
			{
				this.paidDate = arguments.paidDate;
			}  
				
			public string function getpaidDate()
			{
				return this.paidDate;
			} 
			
			
			
			public struct function getStruct()
			{
				local.struct = structNew();
				
				if(  isDefined( 'this.error' ) )
					local.struct["error"] = getError().getStruct();
						
				
				if(  isDefined( 'this.status' ) )
					
						local.struct["status"] = getstatus().getStruct();
					
				if(  isDefined( 'this.totalAmount' ) )
					
						local.struct["totalAmount"] = gettotalAmount();
					
				if(  isDefined( 'this.origin' ) )
					
						local.struct["origin"] = getorigin().getStruct();
					
				if(  isDefined( 'this.createdDate' ) )
					
						local.struct["createdDate"] = getcreatedDate();
					
				if(  isDefined( 'this.createdBy' ) )
					
						local.struct["createdBy"] = getcreatedBy();
					
				if(  isDefined( 'this.canceledDate' ) )
					
						local.struct["canceledDate"] = getcanceledDate();
					
				if(  isDefined( 'this.canceledByActor' ) )
					
						local.struct["canceledByActor"] = getcanceledByActor().getStruct();
					
				if(  isDefined( 'this.canceledBy' ) )
					
						local.struct["canceledBy"] = getcanceledBy();
					
				if(  isDefined( 'this.lastUpdatedDate' ) )
					
						local.struct["lastUpdatedDate"] = getlastUpdatedDate();
					
				if(  isDefined( 'this.lastUpdatedBy' ) )
					
						local.struct["lastUpdatedBy"] = getlastUpdatedBy();
					
				if(  isDefined( 'this.firstSentDate' ) )
					
						local.struct["firstSentDate"] = getfirstSentDate();
					
				if(  isDefined( 'this.lastSentDate' ) )
					
						local.struct["lastSentDate"] = getlastSentDate();
					
				if(  isDefined( 'this.lastSentBy' ) )
					
						local.struct["lastSentBy"] = getlastSentBy();
					
				if(  isDefined( 'this.paidDate' ) )
					
						local.struct["paidDate"] = getpaidDate();
					
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
						
						if('#key#' eq 'status') {
						
							var keyCom = 'status';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setstatus( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'totalAmount') {
						
							this.settotalAmount(local.json[key]);
						}
						
						if('#key#' eq 'origin') {
						
							var keyCom = 'origin';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setorigin( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'createdDate') {
						
							this.setcreatedDate(local.json[key]);
						}
						
						if('#key#' eq 'createdBy') {
						
							this.setcreatedBy(local.json[key]);
						}
						
						if('#key#' eq 'canceledDate') {
						
							this.setcanceledDate(local.json[key]);
						}
						
						if('#key#' eq 'canceledByActor') {
						
							var keyCom = 'canceledByActor';
							
							var keyObj = createObject("component",'#keyCom#');
							this.setcanceledByActor( keyObj.deserialize(local.json[key]) );
							
						}
						
						if('#key#' eq 'canceledBy') {
						
							this.setcanceledBy(local.json[key]);
						}
						
						if('#key#' eq 'lastUpdatedDate') {
						
							this.setlastUpdatedDate(local.json[key]);
						}
						
						if('#key#' eq 'lastUpdatedBy') {
						
							this.setlastUpdatedBy(local.json[key]);
						}
						
						if('#key#' eq 'firstSentDate') {
						
							this.setfirstSentDate(local.json[key]);
						}
						
						if('#key#' eq 'lastSentDate') {
						
							this.setlastSentDate(local.json[key]);
						}
						
						if('#key#' eq 'lastSentBy') {
						
							this.setlastSentBy(local.json[key]);
						}
						
						if('#key#' eq 'paidDate') {
						
							this.setpaidDate(local.json[key]);
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
							
							this.setstatus(local.json[i]);
							
							this.settotalAmount(local.json[i]);
							
							this.setorigin(local.json[i]);
							
							this.setcreatedDate(local.json[i]);
							
							this.setcreatedBy(local.json[i]);
							
							this.setcanceledDate(local.json[i]);
							
							this.setcanceledByActor(local.json[i]);
							
							this.setcanceledBy(local.json[i]);
							
							this.setlastUpdatedDate(local.json[i]);
							
							this.setlastUpdatedBy(local.json[i]);
							
							this.setfirstSentDate(local.json[i]);
							
							this.setlastSentDate(local.json[i]);
							
							this.setlastSentBy(local.json[i]);
							
							this.setpaidDate(local.json[i]);
							
						}
					
						if(isStruct(local.json[i]))
						{
							for(key in local.json[i])
							{
							
							if('#key#' eq 'status') {
							
                             var keyCom = 'status';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setstatus( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'totalAmount') {
							
								this.settotalAmount(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'origin') {
							
                             var keyCom = 'origin';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setorigin( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'createdDate') {
							
								this.setcreatedDate(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'createdBy') {
							
								this.setcreatedBy(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'canceledDate') {
							
								this.setcanceledDate(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'canceledByActor') {
							
                             var keyCom = 'canceledByActor';
								
								
								var keyObj = createObject("component",'#keyCom#');
								this.setcanceledByActor( keyObj.deserialize(local.json[i][key]) );
								
							}
											
							
							if('#key#' eq 'canceledBy') {
							
								this.setcanceledBy(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'lastUpdatedDate') {
							
								this.setlastUpdatedDate(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'lastUpdatedBy') {
							
								this.setlastUpdatedBy(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'firstSentDate') {
							
								this.setfirstSentDate(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'lastSentDate') {
							
								this.setlastSentDate(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'lastSentBy') {
							
								this.setlastSentBy(local.json[i][key]);
							
							}
											
							
							if('#key#' eq 'paidDate') {
							
								this.setpaidDate(local.json[i][key]);
							
							}
											
							
								
							}
						}
					
					}
				
				}
				
				return this;
			} 
			
		}
		</cfscript>
		
