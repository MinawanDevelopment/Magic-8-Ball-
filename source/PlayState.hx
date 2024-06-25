package;

import data.CerberData;
import flixel.FlxG;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.text.FlxText.FlxTextAlign;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var text:Text;

	override public function create()
	{
		var title:Text = new Text();
		title.size = 30;
		title.text = "Cerber's Magic 8 Ball!";
		title.screenCenter(X);
		title.color = FlxColor.WHITE;
		add(title);

		var instructions:Text = new Text();
		instructions.size = 25;
		instructions.text = "Press SPACE to Reroll";
		instructions.screenCenter(X);
		instructions.y = FlxG.height - 70;
		instructions.color = FlxColor.WHITE;
		add(instructions);

		text = new Text();
		text.size = 30;
		text.alignment = FlxTextAlign.CENTER;
		text.text = "Think of a question to ask,\nthen press SPACE to get an answer";
		text.screenCenter();
		text.alpha = 0;
		text.color = FlxColor.WHITE;
		add(text);

		CoolUtil.delayedLoop(0.25, buffAlpha);

		super.create();
	}

	public function buffAlpha()
	{
		if (text.alpha != 1)
		{
			text.alpha += 0.1;
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.SPACE)
		{
			text.text = CerberData.data[FlxG.random.int(0, CerberData.data.length - 1)];
			text.screenCenter();
			text.alpha = 0;
			text.color = FlxColor.WHITE;
		}
	}
}
