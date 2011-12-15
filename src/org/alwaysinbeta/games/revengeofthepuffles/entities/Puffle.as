package org.alwaysinbeta.games.revengeofthepuffles.entities {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;

	import net.box2fp.Box2DEntity;
	import net.box2fp.Box2DShapeBuilder;
	import net.box2fp.graphics.SuperGraphiclist;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;

	import org.alwaysinbeta.games.revengeofthepuffles.GameAssets;

	import flash.display.BitmapData;

	/**
	 * @author McFamily
	 */
	public class Puffle extends Box2DEntity {
		// private var _fired : Boolean;
		private var _control : Image;
		private var _isAiming : Boolean;
		private var _angleIndicator : Image;

		public function Puffle(x : Number, y : Number) {
			var image : Image = new Image(GameAssets.PUFFLE);
			image.centerOrigin();
			image.x = image.width * 0.5;
			image.y = image.height * 0.5;

			super(x, y, image.width, image.height, b2Body.b2_dynamicBody);

			( graphic as SuperGraphiclist ).add(image);
		}

		override public function buildShapes(friction : Number, density : Number, restitution : Number, group : int, category : int, collmask : int) : void {
			Box2DShapeBuilder.buildCircle(body, hw, 0.3, 1, 0.3);
		}

		override public function added() : void {
			super.added();

			if (FP.console.debug) {
				_control = addGraphic(new Image(new BitmapData(8, 8, true, 0xFFFF0000))) as Image;
				_angleIndicator = addGraphic(new Image(new BitmapData(4, 4, true, 0xFF00FF00))) as Image;
			}
		}

		override public function update() : void {
			super.update();

			if (Input.mouseDown && collidePoint(x, y, Input.mouseX, Input.mouseY)) {
				_isAiming = true;
			}

			if (Input.mouseUp && _isAiming) {
				_isAiming = false;
				
				// _control.visible = false;
				// _fired = true;

				var controlX : Number = Input.mouseX - this.x;
				var controlY : Number = Input.mouseY - this.y;
				// var angle: Number = FP.angle(_control.x, _control.y, 0, 0);
				var angle : Number = FP.angle(0, 0, controlX, controlY);
				angle *= FP.RAD;

				var distance : Number = FP.distance(controlX, controlY);
				if (distance > 30) distance = 30;

				body.SetAngularVelocity(1);
				body.SetAngularDamping(0.5);
				body.SetLinearVelocity(new b2Vec2(Math.cos(angle) * distance, Math.sin(angle) * distance));
				body.SetAwake(true);
				FP.console.log("FIRE angle:" + angle + " distance:" + distance);
			}

			if (_isAiming && FP.console.debug) {
				_control.x = Input.mouseX - this.x - 4;
				_control.y = Input.mouseY - this.y - 4;
				var aimAngle : Number = FP.angle(_control.x, _control.y, 0, 0);
				FP.console.log('angle: ' + (aimAngle));
				FP.angleXY(_angleIndicator, aimAngle, 100);
			}

			// if(_fired && !body.IsAwake()){
			// _fired = false;
			// _control.visible = true;
			// x = 50;
			// reset
			// FP.world.remove(this);
			// PhysicsWorld(FP.world).addPuffle();
			// x = y = 50;
			// }
		}
	}
}
