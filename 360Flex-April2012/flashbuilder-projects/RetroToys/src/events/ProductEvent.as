package events
{
	import flash.events.Event;
	
	import valueObjects.Model;
	
	public class ProductEvent extends Event
	{
		public var productData:Model = new Model();
		public function ProductEvent(type:String,productData:Model)
		{
			super(type);
			this.productData = productData;
		}
	}
}