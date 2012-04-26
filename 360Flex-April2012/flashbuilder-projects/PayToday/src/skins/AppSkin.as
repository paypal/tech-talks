package skins
{
	import mx.core.BitmapAsset;
	import spark.components.Image;
	import spark.skins.mobile.ViewNavigatorApplicationSkin;
	
	public class AppSkin extends ViewNavigatorApplicationSkin
	{
		private var image:Image;
		
		[Embed(source="dollars-roll.jpg")]
		private var background:Class;
		
		public function AppSkin()
		{
			super();
		}
		
		override protected function createChildren():void {
			image = new Image();
			//Replace the right side below with your source (including URL)
			image.source = (new background() as BitmapAsset);
			image.height = 400; //Set image size here
			image.width = 600;
			image.alpha=.5;
			this.addChild(image);
			
			super.createChildren();
		}
	}
}
