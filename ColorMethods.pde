TrueColor hue;

color black = color(0);

color backGround;
color wallColor;
color snakeColor;
color foodColor;
color snakeWithFood;

void setNewMonochromaticColor()	{
	TrueColor[] hues = new TrueColor[] {TrueColor.RED, TrueColor.ORANGE, TrueColor.YELLOW, 
	TrueColor.GREEN, TrueColor.CYAN, TrueColor.BLUE, TrueColor.VIOLET, TrueColor.MAGENTA};

	if (gameVersion != Version.HEX) {
		hue = hues[(int) random(8)];
		backGround = color(hue.getHue(), 25, 100);
		snakeColor = color(hue.getHue(), 100, 25);
		wallColor = color(hue.getHue(), 25, 25);
		foodColor = color(hue.getHue(), 100, 75);
		snakeWithFood = color(hue.getHue(), 100, 50);
		
	}else {
		if (random(10) < 8) {
			hue = hues[(int) random(8)];
			backGround = color(hue.getHue(), 100, 100);
			hue = hue.getAdditiveComplementary();
			snakeColor = color(hue.getHue(), 100, 75);
			wallColor = color(hue.getHue(), 100, 75);
			foodColor = color(hue.getHue(), 100, 75);
			snakeWithFood = snakeColor;
			
		}else {
			hue = hues[(int) random(8)];
			backGround = color(hue.getHue(), 100, 100);
			hue = hues[(int) random(8)];
			snakeColor = color(hue.getHue(), 100, 50);
			hue = hues[(int) random(8)];
			wallColor = color(hue.getHue(), 100, 50);
			hue = hues[(int) random(8)];
			foodColor = color(hue.getHue(), 100, 75);
			snakeWithFood = snakeColor;
		}

	}
}

void gameOverColors()	{
	color temp = backGround;
	backGround = snakeColor;
	snakeColor = temp;
	wallColor = temp;
}

enum TrueColor	{
	RED, ORANGE, YELLOW, 
	GREEN, CYAN, BLUE, VIOLET, MAGENTA;

	int getHue()	{
		switch (this) {
			case RED:	{
				return 0;
			}
			case ORANGE:	{
				return 30;
			}
			case YELLOW:	{
				return 60;
			}
			case GREEN:	{
				return 120;
			}
			case CYAN:	{
				return 180;
			}
			case BLUE:	{
				return 240;
			}
			case VIOLET:	{
				return 270;
			}
			case MAGENTA:	{
				return 300;
			}
			default :	{
				return 330;
			}	
		}
	}

	int getInt()	{
		switch (this) {
			case RED:	{
				return 0;
			}
			case ORANGE:	{
				return 1;
			}
			case YELLOW:	{
				return 2;
			}
			case GREEN:	{
				return 3;
			}
			case CYAN:	{
				return 4;
			}
			case BLUE:	{
				return 5;
			}
			case VIOLET:	{
				return 6;
			}
			case MAGENTA:	{
				return 7;
			}
			default :	{
				return 8;
			}	
		}
	}

	TrueColor getAdditiveComplementary()	{
		switch (this) {
			case RED:	{
				return CYAN;
			}
			case ORANGE:	{
				return VIOLET;
			}
			case YELLOW:	{
				return BLUE;
			}
			case GREEN:	{
				return MAGENTA;
			}
			case CYAN:	{
				return RED;
			}
			case BLUE:	{
				return YELLOW;
			}
			case VIOLET:	{
				return ORANGE;
			}
			case MAGENTA:	{
				return GREEN;
			}
			default :	{
				return null;
			}	
		}
	}
}