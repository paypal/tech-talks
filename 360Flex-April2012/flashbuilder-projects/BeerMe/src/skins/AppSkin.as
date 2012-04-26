package skins
{
	import mx.core.BitmapAsset;
	import spark.components.Image;
	import spark.skins.mobile.ViewNavigatorApplicationSkin;
	
	public class AppSkin extends ViewNavigatorApplicationSkin
	{
		private var image:Image;
		
		[Embed(source="beer.jpg")]
		private var background:Class;
		
		public function AppSkin()
		{
			super();
		}
		
		override protected function createChildren():void {
			image = new Image();
			//Replace the right side below with your source (including URL)
			image.source = (new background() as BitmapAsset);
			image.height = 436; //Set image size here
			image.width = 338;
			this.addChild(image);
			
			super.createChildren();
		}
	}
}