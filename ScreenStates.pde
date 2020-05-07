enum Screen{
	VERSION, INTRO, GAME
}

enum Version{
	CHILD, ADULT, HEX
}

PImage version, child, adult, locked, pointer;
PImage hWhite, eWhite, xWhite, aWhite, dWhite, iWhite, kWhite, cWhite;
PImage hColor, eColor, xColor, aColor, dColor, iColor, kColor, cColor;
PImage lockedColor[] = new PImage[8];

boolean[] isVersionLocked = new boolean[3];
boolean[] isColorLocked = new boolean[8];
int pointerAt = 0;

void displayVersionScreen()	{
	background(black);

	image(version, 101, 73, 158, 23);

	image(child, 120, 150, 58, 23);

	image(adult, 120, 190, 58, 23);
	if (isVersionLocked[1]) {
		image(lockedColor[0], 188, 190, 73, 23);
	}

	int colorsUnlocked = 0;
	if (isColorLocked[0]) {
		image(hWhite, 120, 230, 11, 23);
	}else {
		image(hColor, 120, 230, 11, 23);
		colorsUnlocked++;
	}
	if (isColorLocked[1]) {
		image(eWhite, 131, 230, 10, 23);
	}else {
		image(eColor, 131, 230, 10, 23);
		colorsUnlocked++;
	}
	if (isColorLocked[2]) {
		image(xWhite, 141, 230, 13, 23);
	}else {
		image(xColor, 141, 230, 13, 23);
		colorsUnlocked++;
	}
	if (isColorLocked[3]) {
		image(aWhite, 154, 230, 13, 23);
	}else {
		image(aColor, 154, 230, 13, 23);
		colorsUnlocked++;
	}
	if (isColorLocked[4]) {
		image(dWhite, 167, 230, 13, 23);
	}else {
		image(dColor, 167, 230, 13, 23);
		colorsUnlocked++;
	}
	if (isColorLocked[5]) {
		image(iWhite, 180, 230, 6, 23);
	}else {
		image(iColor, 180, 230, 6, 23);
		colorsUnlocked++;
	}
	if (isColorLocked[6]) {
		image(kWhite, 186, 230, 12, 23);
	}else {
		image(kColor, 186, 230, 12, 23);
		colorsUnlocked++;
	}
	if (isColorLocked[7]) {
		image(cWhite, 198, 230, 9, 23);
	}else {
		image(cColor, 198, 230, 9, 23);
		colorsUnlocked++;
	}
	if (isVersionLocked[2]) {
		image(lockedColor[colorsUnlocked], 217, 230, 73, 23);
	}

	image(pointer, 101, 153 + pointerAt*40, 9, 17);

}

PImage psy, snakeText, charmer, faquer, arrows, enterText, cheat;
PImage[] arrowsColor = new PImage[4];

Version gameVersion;

int timeAtIntroStart;
int timeSinceIntroStart;
int millisForIntroAnim = 200;

void displayIntroScreen(int frame)	{
	background(black);

	if (frame == 0) {
		image(psy, random(360) - 100, random(360) - 100, 195, 37);
		image(snakeText, random(360) - 100, random(360) - 100, 91, 37);
		if (gameVersion != Version.ADULT) {
			image(charmer, random(360) - 100, random(360) - 100, 137, 37);
		}else {
			image(faquer, random(360) - 100, random(360) - 100, 110, 37);
		}
		image(arrows, random(360) - 100, random(360) - 100, 77, 51);
		image(enterText, random(360) - 100, random(360) - 100, 260, 24);
		
	}else {
		image(psy, 83, 25, 195, 37);
		image(snakeText, 135, 75, 91, 37);
		if (gameVersion != Version.ADULT) {
			image(charmer, 111, 125, 137, 37);
		}else {
			image(faquer, 125, 125, 110, 37);
		}
		image(arrowsColor[frame%4], 142, 204, 77, 51);
		image(enterText, 50, 270, 260, 24);
	}
	image(cheat, 104, 330, 152, 29);

}