package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

// Meant for use globally!
class HexaPreloader extends FlxState
{
	public var logoSprite:FlxSprite;
	public var text:Text; // Change if used in different project

	public var nextState = new PlayState();

	override public function create()
	{
		logoSprite = new FlxSprite(0, 0);
		logoSprite.loadGraphic("assets/images/preloader/hexa.png");
		logoSprite.screenCenter();
		add(logoSprite);

		text = new Text();
		text.size = 30;
		text.text = "Brought to you by Hexa2239!";
		text.screenCenter(X);
		text.y = FlxG.height - 100;
		add(text);

		new FlxTimer().start(3, (timer:FlxTimer) ->
		{
			FlxG.camera.fade(FlxColor.BLACK, 1, false, () ->
			{
				FlxG.switchState(nextState);
			});
		});

		super.create();
	}
}