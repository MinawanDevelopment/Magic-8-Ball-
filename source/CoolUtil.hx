package;

import flixel.util.FlxTimer;

class CoolUtil
{
	public static function delayedLoop(dur, onComplete)
	{
		new FlxTimer().start(dur, (timer:FlxTimer) ->
		{
			onComplete();
			delayedLoop(dur, onComplete);
		});
	}
}