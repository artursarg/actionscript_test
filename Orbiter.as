package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;


	public class Orbiter extends Sprite
	{
		public var size :int;
		public var radius :int;
		public var speed :Number;
		public var depth :int;
		
		public var angle :int;
		public var reverse :Boolean;
		
	
		public function Orbiter(size :int, radius :int, speed :Number, depth: int, reverse :Boolean)
		{
			super();
			this.angle  = 0;
			this.size = size;
			this.radius = radius;
			this.speed = speed;
			this.reverse = reverse;
			this.depth = depth;

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
			if(Math.abs(speed) > 0) {
				this.addEventListener(Event.ENTER_FRAME, move);
			}
			this.setSize();
			this.addEventListener(MouseEvent.CLICK, OrbiterClicked)
		}
		
		protected function setSize() :void
		{
			this.width = this.height = size;
		}
		
	
		protected function move(e :Event) :void
		{
			var rad :Number = this.angle * (Math.PI / 180);
			this.x = this.radius * Math.cos(rad);
			this.y = this.radius * Math.sin(rad);
			
			if (this.reverse == false)
			{
				this.angle += this.speed + this.speed * this.depth*0.5;
			}
			else
			{
				this.angle -= this.speed + this.speed * this.depth*0.5;
			}
						
			this.angle %= 360;
		}

		public function OrbiterClicked (e:MouseEvent) : void {
			var child :Orbiter = new Orbiter(60, 250 + Math.floor(Math.random()*200), 1, this.depth + 1, this.depth%2 == 0);
			this.addChild(child);
		}
	}
}