package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;


	public class Moon extends MovingObject
	{
		
		public function Moon(origin:Object, sizeWidth :int, sizeHeight :int, radius :int, speed :Number, reverse :Boolean)
		{
			super(origin,sizeWidth,sizeHeight,radius,speed,reverse);
			if(stage) 
			{
				Init();
			}
			else 
			{
				addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			}
		}
		
		private function onAddedToStage(event: Event): void {
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			Init();
		}
		
		private function Init() :void {
            this.addEventListener(Event.ENTER_FRAME, moveDynamic);
			this.setSize();
			this.addEventListener(MouseEvent.CLICK, ClickHandler)
		}
		
		protected function setSize() :void
		{
			this.width = sizeWidth;
			this.height = sizeHeight;
		}

		private function ClickHandler (e:MouseEvent) : void {
			e.stopImmediatePropagation();
			var sattelite:Sattelite = new Sattelite(this,40,40,70, 3, false);
			this.addChild(sattelite);
			trace(typeof(sattelite) != typeof(this));
			trace(typeof(sattelite));
			trace(typeof(this));
		}
	}
}