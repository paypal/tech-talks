package valueObjects
{
	import mx.collections.ArrayCollection;

	public class Model
	{
		
		public var id:String;
		public var name:String;
		public var price:String;
		public var qty:Number;
		public var item:Item;
		public var cart:ArrayCollection = new ArrayCollection();
		
		public function Model()
		{
		}
	}
}