package org.alwaysinbeta.games.revengeofthepuffles.entities {
	import net.box2fp.Box2DEntity;
	import net.box2fp.Box2DShapeBuilder;

	/**
	 * @author McFamily
	 */
	public class Wall extends Box2DEntity {
		public function Wall(x : Number, y : Number, w : uint, h : uint) {
			super(x, y, w, h);
		}
		
		override public function buildShapes(friction : Number, density : Number, restitution : Number, group : int, category : int, collmask : int) : void {
//			super.buildShapes(friction, density, restitution, group, category, collmask);
			Box2DShapeBuilder.buildRectangle(body, width / ( 2 * box2dworld.scale ), height / ( 2 * box2dworld.scale ), 0.3, 1, 0.3);
		}

//		override public function update() : void {
//			super.update();
//		
//			if(collide(Penguin.TYPE, x, y)){
//				//collide("penguin", x, y).
//				FP.console.log('KILL');
//				Penguin(collide(Penguin.TYPE, x, y)).die();
//			}
//		}

	}
}
