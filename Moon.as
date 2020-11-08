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
			//this.addEventListener(MouseEvent.CLICK, OrbiterClicked)
		}
		
		protected function setSize() :void
		{
			this.width = sizeWidth;
			this.height = sizeHeight;
		}

		// public function OrbiterClicked (e:MouseEvent) : void {
		// 	var child :Orbiter = new Orbiter(60, 250 + Math.floor(Math.random()*200), 1, this.depth + 1, this.depth%2 == 0);
		// 	this.addChild(child);
		// }
	}
}