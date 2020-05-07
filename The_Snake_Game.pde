Snake snake;
Food food;

void setup()  {
  size(360, 360);
  colorMode(HSB, 360, 100, 100);
  
  timeSinceBeginning = millis();
  previousFrame = -1;
  currentFrame = 0;
  dInput = Direction.Xp;
  gameOver = false;
  won = false;
  
  snake = new Snake(1, 1, 0, boardWidth-1, 0, boardWidth-1, 
    Direction.Xp/*, 
    new Position(0, 1), 
    new Position(0, 0), 
    new Position(1, 0), 
    new Position(2, 0), 
    new Position(3, 0), 
    new Position(4, 0), 
    new Position(5, 0), 
    new Position(6, 0), 
    new Position(7, 0), 
    new Position(8, 0), 
    new Position(9, 0), 
    new Position(10, 0), 
    new Position(11, 0), 
    new Position(12, 0), 
    new Position(13, 0), 
    new Position(14, 0), 
    new Position(15, 0), 
    new Position(15, 1), 
    new Position(15, 2), 
    new Position(15, 3), 
    new Position(15, 4), 
    new Position(15, 5), 
    new Position(15, 6), 
    new Position(15, 7), 
    new Position(15, 8), 
    new Position(15, 9), 
    new Position(15, 10), 
    new Position(15, 11), 
    new Position(15, 12), 
    new Position(15, 13), 
    new Position(15, 14), 
    new Position(15, 15), 
    new Position(14, 15), 
    new Position(13, 15), 
    new Position(12, 15), 
    new Position(11, 15), 
    new Position(10, 15), 
    new Position(9, 15), 
    new Position(8, 15), 
    new Position(7, 15), 
    new Position(6, 15), 
    new Position(5, 15), 
    new Position(4, 15), 
    new Position(3, 15), 
    new Position(2, 15), 
    new Position(1, 15), 
    new Position(0, 15), 
    new Position(0, 14), 
    new Position(0, 13), 
    new Position(0, 12), 
    new Position(0, 11), 
    new Position(0, 10), 
    new Position(0, 9), 
    new Position(0, 8), 
    new Position(0, 7), 
    new Position(0, 6), 
    new Position(0, 5), 
    new Position(0, 4), 
    new Position(0, 3), 
    new Position(0, 2), 
    new Position(1, 2), 
    new Position(2, 2), 
    new Position(3, 2), 
    new Position(4, 2), 
    new Position(5, 2), 
    new Position(6, 2), 
    new Position(7, 2)*/);
  
  food = new Food(8, 5, 10);

  loadImages();

  getData();

  gameVersion = Version.CHILD;

  setScoreSystem();
  setUpFoodAtDir();

  setNewMonochromaticColor();

  initializeSoundSetup();

  frameRate(60);
}

void draw()  {
  timeSinceBeginning = millis();
  
  if (screenState == Screen.VERSION) {
    displayVersionScreen();

  }else if (screenState == Screen.INTRO) {
    timeSinceIntroStart = timeSinceBeginning - timeAtIntroStart;
    displayIntroScreen(timeSinceIntroStart/millisForIntroAnim);
    
  }else if (screenState == Screen.GAME) {
    if  (!gameOver)  {
      timeSinceGamePlay = timeSinceBeginning - timeAtGamePlayStart;
      currentFrame = timeSinceGamePlay / millisPerFrame;
      if  (currentFrame - previousFrame == 1)  {
        timeAtFrameStart = timeSinceGamePlay;
        snake.direction = dInput;
        if  (snake.moveToNext())  {
          if  (snake.head.equals(food.position))  {

            Position snakePos = (snake.getBodyLength() == 0)? snake.fromPosition: snake.body[0];
            int incBy = 0;
            if (snakePos.y - food.position.y == -1) {
              incBy = foodAtDir[0];
            }else if (snakePos.x - food.position.x == 1) {
              incBy = foodAtDir[1];
            }else if (snakePos.y - food.position.y == 1) {
              incBy = foodAtDir[2];
            }else if (snakePos.x - food.position.x == -1) {
              incBy = foodAtDir[3];
            }
            foodPoints += incBy;
            setPointAddition(food.position, timeSinceBeginning, incBy);
            if (foodPoints > foodPointMax) {
              foodPoints -= 2*foodPointMax;
            }
            if (incBy != 0 && foodPoints == goal) {
              scoreCount++;
            }

            updateSpeed();

            food.newPosition();
            snake.addFoodAtHead();
            setNewMonochromaticColor();

            nextFreq();
          }
        setPan((float)(snake.head.x - food.position.x)/16);
        }else  {
          gameOver();
        }
      }
      previousFrame = currentFrame;

      if (!gameOver) {
        animationTimePosition = timeSinceGamePlay - timeAtFrameStart;
        drawBoard((float) animationTimePosition/millisPerFrame);
        translate(tileWidth, tileWidth);
        snake.display((float) animationTimePosition/millisPerFrame);
        food.display();
        displayScore((float) (timeSinceBeginning - prevPointTime)/millisForPointAnim);
      }
    }else  {
      drawBoard(0);
      translate(tileWidth, tileWidth);
      snake.display(1);
      food.display();
      displayScore(1);

      if (won) {
        tint(backGround);
        image(go_congrats_outline, 97 - tileWidth, 80 - tileWidth);
        image(go_enter_outline, 72 - tileWidth, 250 - tileWidth);
        image(go_quote_outline, 103 - tileWidth, 310 - tileWidth);
        tint(snakeColor);
        image(go_congrats, 97 - tileWidth, 80 - tileWidth);
        image(go_enter, 72 - tileWidth, 250 - tileWidth);
        image(go_quote, 103 - tileWidth, 310 - tileWidth);

        if (unlockedColor < 8) {
          tint(backGround);
          image(go_unlocked_outline, 141 - tileWidth, 204 - tileWidth);
          tint(snakeColor);
          image(go_unlocked, 141 - tileWidth, 204 - tileWidth);

          switch (unlockedColor) {
            case 0: {
              tint(snakeColor);
              image(go_colors_outline[hue.getInt()], 162 - tileWidth, 167 - tileWidth);
              tint(backGround);
              image(go_colors[hue.getInt()], 162 - tileWidth, 167 - tileWidth);
              break;
            }
            case 1:  {
              tint(snakeColor);
              image(go_colors_outline[hue.getInt()], 141 - tileWidth, 167 - tileWidth);
              tint(backGround);
              image(go_colors[hue.getInt()], 141 - tileWidth, 167 - tileWidth);
              break;
            }
            case 2:  {
              tint(snakeColor);
              image(go_colors_outline[hue.getInt()], 140 - tileWidth, 167 - tileWidth);
              tint(backGround);
              image(go_colors[hue.getInt()], 140 - tileWidth, 167 - tileWidth);
              break;
            }
            case 3: {
              tint(snakeColor);
              image(go_colors_outline[hue.getInt()], 149 - tileWidth, 167 - tileWidth);
              tint(backGround);
              image(go_colors[hue.getInt()], 149 - tileWidth, 167 - tileWidth);
              break;
            }
            case 4:  {
              tint(snakeColor);
              image(go_colors_outline[hue.getInt()], 155 - tileWidth, 167 - tileWidth);
              tint(backGround);
              image(go_colors[hue.getInt()], 155 - tileWidth, 167 - tileWidth);
              break;
            }
            case 5:  {
              tint(snakeColor);
              image(go_colors_outline[hue.getInt()], 156 - tileWidth, 167 - tileWidth);
              tint(backGround);
              image(go_colors[hue.getInt()], 156 - tileWidth, 167 - tileWidth);
              break;
            }
            case 6:  {
              tint(snakeColor);
              image(go_colors_outline[hue.getInt()], 146 - tileWidth, 167 - tileWidth);
              tint(backGround);
              image(go_colors[hue.getInt()], 146 - tileWidth, 167 - tileWidth);
              break;
            }
            case 7: {
              tint(snakeColor);
              image(go_colors_outline[hue.getInt()], 135 - tileWidth, 167 - tileWidth);
              tint(backGround);
              image(go_colors[hue.getInt()], 135 - tileWidth, 167 - tileWidth);
              break;
            } 
          }
        }else {
          if (gameVersion != Version.ADULT) {
            fill(snakeColor);
            rect(64 - tileWidth, 166 - tileWidth, 232, 28);
            tint(backGround);
            image(go_snakeC, 64 - tileWidth, 166 - tileWidth);

          }else {
            fill(snakeColor);
            rect(74 - tileWidth, 166 - tileWidth, 213, 28);
            tint(backGround);
            image(go_snakeF, 74 - tileWidth, 166 - tileWidth);
          }
        }
        noTint();
        
      }else {
        tint(backGround);
        image(go_title_outline, 98 - tileWidth, 80 - tileWidth);
        image(go_enter_outline, 72 - tileWidth, 167 - tileWidth);
        image(go_quote_outline, 103 - tileWidth, 310 - tileWidth);
        tint(snakeColor);
        image(go_title, 98 - tileWidth, 80 - tileWidth);
        image(go_enter, 72 - tileWidth, 167 - tileWidth);
        image(go_quote, 103 - tileWidth, 310 - tileWidth);
        noTint();
      }
    }
  }
  
  //println(frameRate + " fps");
}

void keyPressed()  {
  if (screenState == Screen.VERSION) {
    if (keyCode == UP) {
      if (pointerAt > 0) {
        pointerAt--;
      }
    }else if (keyCode == DOWN) {
      if (pointerAt < 2) {
        pointerAt++;
      }
    }else if (keyCode == ENTER) {
      if (!isVersionLocked[pointerAt]) {
        if (pointerAt == 0) {
          gameVersion = Version.CHILD;
        }else if (pointerAt == 1) {
          gameVersion = Version.ADULT;
        }else if (pointerAt == 2) {
          gameVersion = Version.HEX;
        }
        timeAtIntroStart = timeSinceBeginning;
        screenState = Screen.INTRO;
        nextFreq();
      }
    }
  }else if (screenState == Screen.INTRO) {
    if (keyCode == ENTER) {
      timeAtGamePlayStart = timeSinceBeginning;
      timeAtFrameStart = timeAtGamePlayStart;
      screenState = Screen.GAME;
      nextFreq();
    }
  }else if (screenState == Screen.GAME) {
    if  (!gameOver)  {
      switch(keyCode)  {
        case UP:  {
          if  (snake.getBodyLength() == 0 || (snake.getBodyLength() > 0 && snake.direction != Direction.Yp))  {
            dInput = Direction.Ym;
          }
          break;
        }
        case DOWN:  {
          if  (snake.getBodyLength() == 0 || (snake.getBodyLength() > 0 && snake.direction != Direction.Ym))  {
            dInput = Direction.Yp;
          }
          break;
        }
        case RIGHT:  {
          if  (snake.getBodyLength() == 0 || (snake.getBodyLength() > 0 && snake.direction != Direction.Xm))  {
            dInput = Direction.Xp;
          }
          break;
        }
        case LEFT:  {
          if  (snake.getBodyLength() == 0 || (snake.getBodyLength() > 0 && snake.direction != Direction.Xp))  {
            dInput = Direction.Xm;
          }
          break;
        }
      }
    }else  {
      if  (keyCode == ENTER)  {
        restartGame();
      }
    }
  }
}
