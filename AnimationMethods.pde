int timeSinceBeginning;
int timeAtGamePlayStart;
int timeSinceGamePlay;
int timeAtFrameStart;
int animationTimePosition;

int previousFrame, currentFrame;
Direction dInput;

int millisPerFrame = 250;

void updateSpeed()	{
	if(timeSinceBeginning >= 60000)	{
		millisPerFrame = 100;
	}else if (timeSinceBeginning >= 40000) {
		millisPerFrame = 150;
	}else if (timeSinceBeginning >= 20000) {
		millisPerFrame = 200;
	}
}