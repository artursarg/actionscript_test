package
{
	import flash.display.Sprite;
	import flash.events.Event;
    import flash.events.MouseEvent;
	
    public class Main extends Sprite
    {
		private var p:Orbiter;
        public var play_pause:ControlButton = new ControlButton();
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
		
		
		function onAddedToStage(event: Event): void {
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			Init();
		}
		
		private function Init() :void {
			stage.addEventListener(Event.RESIZE, resizeListener);
			p = new Orbiter(250, 0, 0, 0, false);
            play_pause.addEventListener(MouseEvent.CLICK, stopAnimation);
            addChild(p);
			resizeListener();
		}
		
		function resizeListener(e:Event = null):void {
			p.x = stage.stageWidth/2;
			p.y = stage.stageHeight/2;
		}

        function stopAnimation(e:MouseEvent):void {
            if(stage.frameRate == 30) {
                stage.frameRate = 0;
                play_pause_text.text = "Play";
            }
            else {
                stage.frameRate = 30;
                play_pause_text.text = "Pause";
            }
            trace('Clicked');
        }
        
    }
}