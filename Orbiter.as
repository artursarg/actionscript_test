package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;


	public class Orbiter extends MovingObject
	{
		public function Orbiter(origin:Object, sizeWidth :int, sizeHeight :int, radius :int, speed :Number, reverse :Boolean,angle:int)
		{
			super(origin,sizeWidth,sizeHeight,radius,speed,reverse,angle);
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
			this.addEventListener(Event.ENTER_FRAME, moveStatic);
			this.setSize();
			this.addEventListener(MouseEvent.CLICK, OrbiterClicked);
		}
		
		protected function setSize() :void
		{
			this.width = sizeWidth;
			this.height = sizeHeight;
		}


		private function OrbiterClicked (event:MouseEvent) : void {
			event.stopImmediatePropagation();
			var child :Moon = new Moon(this,60,60,150 + Math.floor(Math.random() * 100), 2, true,0);
			this.addChild(child);
		}
	}
}