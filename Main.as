package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Main extends Sprite
	{
		private var counter:int = 0;

		private var p:Sun;
		public function Main()
		
		{
			if(stage) 
			{
				Init();
			}
			else 
			{
				addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
				trace('init');
			}
		}
		
		
		function onAddedToStage(e: Event): void {
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			Init();
		}
		// Getting sure that set size and new project add is initializing after addedToStage
		private function Init() :void {
			stage.addEventListener(Event.RESIZE, resizeListener);
			p = new Sun;
			p.addEventListener(MouseEvent.CLICK, SunClicked);
			play_pause_text.addEventListener(MouseEvent.CLICK, AnimationController);
			addChild(p);
			resizeListener();
		}
		
		//Centering Sun
		function resizeListener(e:Event = null):void {
			p.x = stage.stageWidth/2;
			p.y = stage.stageHeight/2;
		}

		//Animation play/pause controller
		function AnimationController(e:MouseEvent):void {
			if(stage.frameRate == 30) {
				stage.frameRate = 0;
				play_pause_text.text = "Play";
			}
			else {
				stage.frameRate = 30;
				play_pause_text.text = "Pause";
			}
		}

		//Creating planet object
		private function SunClicked (e:MouseEvent) : void {
			e.stopImmediatePropagation();
			var child :Orbiter = new Orbiter(p,100,100, 250 +Math.floor(Math.random()*100), 1, false,360/this.counter);
			this.addChild(child);
			this.counter++;
		}
	}
}