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
		
		private function Init() :void {
			stage.addEventListener(Event.RESIZE, resizeListener);
			p = new Sun;
			p.addEventListener(MouseEvent.CLICK, SunClicked);
            play_pause_text.addEventListener(MouseEvent.CLICK, AnimationController);
            addChild(p);
			resizeListener();
		}
		
		function resizeListener(e:Event = null):void {
			p.x = stage.stageWidth/2;
			p.y = stage.stageHeight/2;
		}

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

		private function SunClicked (e:MouseEvent) : void {
			e.stopImmediatePropagation();
			var child :Orbiter = new Orbiter(p,100,100, 250 + 60*this.counter, 1, false);
			this.addChild(child);
			this.counter++;
		}

		private function RadiusCounter(radius:int,numberOfPlanets:int):int {
			var correctRadius:int = 0
			return correctRadius;
		}
        
    }
}