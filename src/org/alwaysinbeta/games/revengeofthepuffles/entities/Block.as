package org.alwaysinbeta.games.revengeofthepuffles.entities {
	import Box2D.Dynamics.b2Body;

	import net.box2fp.Box2DEntity;
	import net.box2fp.Box2DShapeBuilder;
	import net.box2fp.graphics.SuperGraphiclist;
	import net.flashpunk.graphics.Image;

	/**
	 * @author McFamily
	 */
	public class Block extends Box2DEntity {
		public function Block(x : Number, y : Number, imageClass: Class) {
			var image : Image = new Image(imageClass);
			image.centerOrigin();
			var trim : int = 8;
			image.x = ( image.width - trim ) * 0.5;
			image.y = ( image.height - trim ) * 0.5;

			super(x, y, image.width - trim, image.height - trim, b2Body.b2_dynamicBody);

			( graphic as SuperGraphiclist ).add(image);
		}

		override public function buildShapes(friction : Number, density : Number, restitution : Number, group : int, category : int, collmask : int) : void {
			Box2DShapeBuilder.buildRectangle(body, hw, hh, 0.3, 1, 0.3);
		}

		override public function added() : void {
			super.added();
			body.SetAngularVelocity(2);
		}
	}
}
