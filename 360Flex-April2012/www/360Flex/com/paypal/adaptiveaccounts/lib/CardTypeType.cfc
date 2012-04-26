
			<cfscript>
			component name="CardTypeType" output="false"  hint="I define the properties and methods"
			{
			
				property name="CardTypeType"  type="string" display="CardTypeType" notempty="true" hint="";
				
			
				public CardTypeType function init( string CardTypeType="")
					hint="I initialize the component and return myself" 
				 	output="false" {
					
					this.setCardTypeType(arguments.CardTypeType);
					  
					return this;  
				}
				
				public void function setCardTypeType(string CardTypeType)
				{
					this.CardTypeType = arguments.CardTypeType;
				}  
					
				public string function getCardTypeType()
				{
					return this.CardTypeType;
				} 
				
				public string function listCardTypeType()
				{
					return "Visa,MasterCard,AmericanExpress,Discover,SwitchMaestro,Solo,CarteAurore,CarteBleue,Cofinoga,4etoiles,CartaAura,TarjetaAurora,JCB";
				} 
			
				
				public string function getStruct()
				{
					return getCardTypeType();
				} 
				
				
				public any function deserialize(any jsonObj)
				{
					
					this.setCardTypeType(jsonObj);
				
					return this;
				} 
				
					
			}
			</cfscript>
			
