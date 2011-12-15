package org.alwaysinbeta.games.revengeofthepuffles.worlds {
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import org.alwaysinbeta.games.revengeofthepuffles.GameAssets;

	/**
	 * @author McFamily
	 */
	public class TitleWorld extends World {
		public function TitleWorld() {
		}
		
		override public function begin() : void {
			addGraphic(new Image(GameAssets.TITLE));
		}

		override public function update() : void {
			super.update();
			if (Input.mouseDown) {
				FP.world = new GameWorld();
			}
		}
	}
}
