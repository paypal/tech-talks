package events
{
	import flash.events.Event;
	
	public class ArtistEvent extends Event
	{
		public static var UPDATE:String = "update";
		
		public function ArtistEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}