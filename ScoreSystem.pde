PImage score, h_score;
PImage[] nums = new PImage[10];
PImage minus;
PImage[] pointAdd = new PImage[4];
PImage[] pointAddOutline = new PImage[4];

int scoreCount = 0;
int foodPoints = 0;
int goal = 12;
int hScore = 0;

int[] foodAtDir = new int[4];

final int foodPointMax = 8;

void displayScore(float fraction)	{
	tint(backGround);
	image(score, 246 - tileWidth, 5 - tileWidth);

	image(nums[(scoreCount/10)%10], 280 - tileWidth, 5 - tileWidth);
	image(nums[scoreCount%10], 286 - tileWidth, 5 - tileWidth);

	if (foodPoints < 0) {
		image(minus, 324 - tileWidth, 10 - tileWidth);
	}
	image(nums[(abs(foodPoints)/10)%10], 328 - tileWidth, 5 - tileWidth);
	image(nums[abs(foodPoints)%10], 334 - tileWidth, 5 - tileWidth);

	image(nums[(goal/10)%10], 344 - tileWidth, 5 - tileWidth);
	image(nums[goal%10], 350 - tileWidth, 5 - tileWidth);

	if (gameOver) {
		image(h_score, 186 - tileWidth, 5 - tileWidth);
		image(nums[(hScore/10)%10], 226 - tileWidth, 5 - tileWidth);
		image(nums[hScore%10], 232 - tileWidth, 5 - tileWidth);
	}

	if (fraction <= 1 && prevPointAdd != null) {
		if (foodAtDir[0] == prevPointDir) {
			tint(backGround);
			image(pointAddOutline[prevPointDir], 
				prevPointAdd.x*tileWidth, 
				(float) (prevPointAdd.y + 1 + fraction)*tileWidth);
			tint(wallColor);
			image(pointAdd[prevPointDir], 
				prevPointAdd.x*tileWidth, 
				(float) (prevPointAdd.y + 1 + fraction)*tileWidth);
		}else if (foodAtDir[1] == prevPointDir) {
			tint(backGround);
			image(pointAddOutline[prevPointDir], 
				(float) (prevPointAdd.x - 1 - fraction)*tileWidth, 
				prevPointAdd.y*tileWidth);
			tint(wallColor);
			image(pointAdd[prevPointDir], 
				(float) (prevPointAdd.x - 1 - fraction)*tileWidth, 
				prevPointAdd.y*tileWidth);
		}else if (foodAtDir[2] == prevPointDir) {
			tint(backGround);
			image(pointAddOutline[prevPointDir], 
				prevPointAdd.x*tileWidth, 
				(float) (prevPointAdd.y - 1 - fraction)*tileWidth);
			tint(wallColor);
			image(pointAdd[prevPointDir], 
				prevPointAdd.x*tileWidth, 
				(float) (prevPointAdd.y - 1 - fraction)*tileWidth);
		}else if (foodAtDir[3] == prevPointDir) {
			tint(backGround);
			image(pointAddOutline[prevPointDir], 
				(float) (prevPointAdd.x + 1 + fraction)*tileWidth, 
				prevPointAdd.y*tileWidth);
			tint(wallColor);
			image(pointAdd[prevPointDir], 
				(float) (prevPointAdd.x + 1 + fraction)*tileWidth, 
				prevPointAdd.y*tileWidth);
		}
	}
	noTint();
}

void setScoreSystem()	{
  scoreCount = 0;
  do {
    goal = foodPointMax/2 + (int)random(foodPointMax/2 + 1);
  }while(goal == foodPoints);
  prevPointAdd = null;
  prevPointTime = 0;
}

void setUpFoodAtDir()	{
	int scoreAt = (int) random(4);
	for(int i=0; i<4; i++)	{
		if (scoreAt == 4) {
			scoreAt = 0;
		}
		foodAtDir[i] = scoreAt;
		scoreAt++;
	}
}

int millisForPointAnim = 500;
Position prevPointAdd;
int prevPointTime;
int prevPointDir;
void setPointAddition(Position p, int time, int dir)	{
	prevPointAdd = p;
	prevPointTime = time;
	prevPointDir = dir;
}