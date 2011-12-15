package org.alwaysinbeta.games.revengeofthepuffles.worlds {
	import Box2D.Common.Math.b2Vec2;
	import net.box2fp.Box2DWorld;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import org.alwaysinbeta.games.revengeofthepuffles.GameAssets;
	import org.alwaysinbeta.games.revengeofthepuffles.entities.Block;
	import org.alwaysinbeta.games.revengeofthepuffles.entities.Penguin;
	import org.alwaysinbeta.games.revengeofthepuffles.entities.Puffle;
	import org.alwaysinbeta.games.revengeofthepuffles.entities.Wall;




	/**
	 * @author McFamily
	 */
	public class GameWorld extends Box2DWorld {
		private static const FLOOR_Y : int = 470;

		public function GameWorld() {
			super();

			setGravity(new b2Vec2(0, 10));

			if (FP.console.debug) doDebug();
		}

		override public function get scale() : Number {
			return 25;
		}

		override public function begin() : void {

			addGraphic(new Image(GameAssets.BG));

			add(new Wall(0, FLOOR_Y, 640, 20)).type = "floor";
			add(new Wall(-40, 0, 20, 480));
			add(new Wall(660, 0, 20, 480));
			add(new Wall(0, -40, 640, 20));

			constructDefences();

			add(new Puffle(50, 50));
		}

		private function constructDefences() : void {
			add(new Block(400, FLOOR_Y - 92, GameAssets.BOX_V));
			add(new Block(500, FLOOR_Y - 92, GameAssets.BOX_V));
			add(new Block(600, FLOOR_Y - 92, GameAssets.BOX_V));

			add(new Block(415, FLOOR_Y - 115, GameAssets.BOX_H));
			add(new Block(515, FLOOR_Y - 115, GameAssets.BOX_H));

			add(new Block(450, FLOOR_Y - 210, GameAssets.BOX_V));
			add(new Block(550, FLOOR_Y - 210, GameAssets.BOX_V));

			add(new Block(465, FLOOR_Y - 240, GameAssets.BOX_H));

			add(new Penguin(485, FLOOR_Y - 320));
		}
	}
}
