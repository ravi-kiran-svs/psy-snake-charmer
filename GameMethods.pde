void drawBoard(float fraction)  {
  background(backGround);

  fill(wallColor);
  noStroke();
  for(int i=0; i<boardWidth+1; i++) {
    body(new Position(i, 0), fraction, 1, 0);
    body(new Position(boardWidth + 1, i), fraction, 0, 1);
    body(new Position(boardWidth + 1 - i, boardWidth + 1), fraction, -1, 0);
    body(new Position(0, boardWidth + 1 - i), fraction, 0, -1);
  }

  body(new Position(tileWidth/2, tileWidth/2), 
    new Position((boardWidth+1)*tileWidth + tileWidth/2, tileWidth/2), 
    1, 0);
  body(new Position((boardWidth+1)*tileWidth + tileWidth/2, tileWidth/2), 
    new Position((boardWidth+1)*tileWidth + tileWidth/2, (boardWidth+1)*tileWidth + tileWidth/2), 
    0, 1);
  body(new Position((boardWidth+1)*tileWidth + tileWidth/2, (boardWidth+1)*tileWidth + tileWidth/2), 
    new Position(tileWidth/2, (boardWidth+1)*tileWidth + tileWidth/2), 
    -1, 0);
  body(new Position(tileWidth/2, (boardWidth+1)*tileWidth + tileWidth/2), 
    new Position(tileWidth/2, tileWidth/2), 
    0, -1);

}

PImage go_title, go_title_outline;
PImage go_quote, go_quote_outline;
PImage go_enter, go_enter_outline;
PImage go_congrats, go_congrats_outline;
PImage go_unlocked, go_unlocked_outline;
PImage[] go_colors = new PImage[8];
PImage[] go_colors_outline = new PImage[8];
PImage go_snakeC, go_snakeF;

void gameOver()  {
  if (foodPoints == goal) {
    won = true;
  }
  if (won) {
    if (scoreCount > hScore) {
      updateHScore(scoreCount);
    }
  }
  if (won && isColorLocked[hue.getInt()]) {
    unlockedColor = hue.getInt();
    unlockColor(hue.getInt());
  }
  gameOver = true;
  gameOverColors();

  nextFreq();
}

void restartGame()  {
  timeAtGamePlayStart = timeSinceBeginning;
  previousFrame = -1;
  currentFrame = 0;
  dInput = Direction.Xp;
  snake.reset();
  food.newPosition();

  setScoreSystem();

  setNewMonochromaticColor();

  nextFreq();

  gameOver = false;
  won = false;
  unlockedColor = 8;
}

int boardWidth = 16;
int tileWidth = 20;
int bodyWidth = 12;

Screen screenState = Screen.VERSION;
boolean gameOver, won;
int unlockedColor = 8;