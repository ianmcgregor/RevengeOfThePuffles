package 
{
	import net.box2fp.Box2DWorld;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import org.alwaysinbeta.games.revengeofthepuffles.worlds.TitleWorld;


	public class Main extends Engine
	{
		public function Main()
		{
			super(640, 480, Box2DWorld.DEFAULT_FRAMERATE, true);
		}
		
		override public function init() : void {
			//FP.console.enable();
			FP.world = new TitleWorld();
		}
	}
}
