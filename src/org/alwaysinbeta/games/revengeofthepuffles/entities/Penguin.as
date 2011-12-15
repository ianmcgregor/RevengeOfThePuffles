package org.alwaysinbeta.games.revengeofthepuffles.entities {
	import Box2D.Dynamics.b2Body;
	import net.box2fp.Box2DEntity;
	import net.box2fp.Box2DShapeBuilder;
	import net.box2fp.graphics.SuperGraphiclist;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import org.alwaysinbeta.games.revengeofthepuffles.GameAssets;


	/**
	 * @author McFamily
	 */
	public class Penguin extends Box2DEntity {
		public static const TYPE : String = "penguin";
		public function Penguin(x : Number, y : Number) {
			var image: Image = new Image(GameAssets.PENGUIN);
			image.centerOrigin();
			image.x = image.width * 0.5;
			image.y = image.height * 0.5;
			
			super(x, y, image.width, image.height, b2Body.b2_dynamicBody);
			
			( graphic as SuperGraphiclist ).add(image);
			
			type = TYPE;
		}
		
		override public function buildShapes(friction : Number, density : Number, restitution : Number, group : int, category : int, collmask : int) : void {
//			super.buildShapes(friction, density, restitution, group, category, collmask);
			//Box2DShapeBuilder.buildRectangle(body, hw, hh, 0.3, 1, 0.3);
			Box2DShapeBuilder.buildCircle(body, hh, 0.4, 1, 0.8);
		}
		
		
		override public function added() : void {
			super.added();
		//	body.SetAngularVelocity(2);
		}

		public function die() : void {
			FP.console.log("DIE!");
		}
		
		override public function update() : void {
			super.update();
		
			if(collide("floor", x, y)){
				FP.console.log('KILL');
				die();
			}
		}
		
	}
}
