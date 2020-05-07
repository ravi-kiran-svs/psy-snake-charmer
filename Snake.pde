class Snake{
  private Position head;
  private Position[] body;
  Position[] food;
  Direction direction;
  
  private int xBoundsMin, xBoundsMax, yBoundsMin, yBoundsMax;
  
  Position fromPosition;
  
  Snake(int x, int y, int xMin, int xMax, int yMin, int yMax, 
    Direction initialDirection)  {
    head = new Position(x, y);
    xBoundsMin = xMin;
    xBoundsMax = xMax;
    yBoundsMin = yMin;
    yBoundsMax = yMax;
    
    body = new Position[(xBoundsMax-xBoundsMin+1)
      *(yBoundsMax-xBoundsMin+1)];
    food = new Position[(xBoundsMax-xBoundsMin+1)];
    
    direction = initialDirection;
    
    fromPosition = new Position(x, y);
  }
  
  Snake(int x, int y, int xMin, int xMax, int yMin, int yMax, 
    Direction initialDirection, Position... body)  {
    head = new Position(x, y);
    xBoundsMin = xMin;
    xBoundsMax = xMax;
    yBoundsMin = yMin;
    yBoundsMax = yMax;
    
    this.body = new Position[(xBoundsMax-xBoundsMin+1)
      *(yBoundsMax-xBoundsMin+1)];
    food = new Position[(xBoundsMax-xBoundsMin+1)];
    
    direction = initialDirection;
    
    for  (int i=0; i<body.length; i++)  {
      this.body[i] = body[i];
    }
    
    fromPosition = new Position(x, y);
  }
  
  void display(float fraction)  {
    noStroke();
    fill(foodColor);
    if (food[0] != null && food[0].equals(head)) {
      body(food[0], 0, 0, 0);
    }

    noStroke();
    fill(snakeColor);
    Position prevCell = (getBodyLength() == 0)? fromPosition: body[0];
    Position drawingPos = getCenter(prevCell, fraction, 
      head.x - prevCell.x, head.y - prevCell.y);
    head(prevCell, fraction, head.x - prevCell.x, head.y - prevCell.y);

    int i = 0;
    while (body[i] != null) {
      prevCell = (body[i+1] == null)? fromPosition: body[i+1];
      drawingPos = getCenter(prevCell, fraction, 
        body[i].x - prevCell.x, body[i].y - prevCell.y);
      body(prevCell, fraction, 
        body[i].x - prevCell.x, body[i].y - prevCell.y);
      i++;
    }

    if (getBodyLength() != 0) {
      drawingPos = getCenter(body[0], fraction, 
        head.x - body[0].x, head.y - body[0].y);
      Position prevPos = getCenter(body[0]);
      body(drawingPos, prevPos, 
        body[0].x - head.x, body[0].y - head.y);

      i = 0;
      while (body[i] != null) {
        if (body[i+1] != null) {
          Position currentPos = getCenter(body[i]);
          prevPos = getCenter(body[i+1]);
          body(currentPos, prevPos, 
            body[i+1].x - body[i].x, body[i+1].y - body[i].y);

        }else {
          Position currentPos = getCenter(body[i]);
          drawingPos = getCenter(fromPosition, fraction, 
            body[i].x - fromPosition.x, body[i].y - fromPosition.y);
          body(currentPos, drawingPos, 
           fromPosition.x - body[i].x, fromPosition.y - body[i].y);
        }
        i++;
      }
    }

    noStroke();
    fill(backGround);
    prevCell = (getBodyLength() == 0)? fromPosition: body[0];
    eyes(prevCell, fraction, head.x - prevCell.x, head.y - prevCell.y);

    noStroke();
    fill(snakeWithFood);
    i = 0;
    while (food[i] != null) {
      if (!food[i].equals(head)) {
        body(food[i], 0, 0, 0);
      }
      i++;
    }
  }
  
  boolean moveToNext()  {
    if  ((direction == Direction.Xp && head.x >= xBoundsMax) || 
      (direction == Direction.Xm && head.x <= xBoundsMin) || 
      (direction == Direction.Yp && head.y >= yBoundsMax) || 
      (direction == Direction.Ym && head.y <= yBoundsMin))  {
      return false;
    }
    
    Position newPosition = new Position(head.x, head.y);
    switch(direction)  {
      case Xp:  {
        newPosition.x++;
        break;
      }
      case Xm:  {
        newPosition.x--;
        break;
      }
      case Yp:  {
        newPosition.y++;
        break;
      }
      case Ym:  {
        newPosition.y--;
        break;
      }
    }
    int i=0;
    while(body[i] != null)  {
      if  (newPosition.equals(body[i]))  {
        return false;
      }
      i++;
    }
    
    if  (getBodyLength() == 0)  {
      fromPosition.duplicate(head);
      if  (head.equals(food[0]))  {
        body[0] = head;
        food[0] = null;
      }
      head = newPosition;
    }else  {
      Position temp = head;
      head = newPosition;
      newPosition = temp;
      i=0;
      while(body[i] != null)  {
        if  (body[i+1] == null)  {
          fromPosition.duplicate(body[i]);
        }
        
        temp = body[i];
        body[i] = newPosition;
        newPosition = temp;
        
        if  (body[i+1] == null && 
          newPosition.equals(food[0])){
          body[i+1] = newPosition;
          int j=0;
          while(food[j] != null)  {
            food[j] = food[j+1];
            j++;
          }
        }
        i++;
      }
    }

    if (isVersionLocked[1] && getFullBodyLength() >= 4*(boardWidth - 1)) {
      boolean snakeInscribesWall = true;
      for (i=0; i<boardWidth; i++) {
        Position p = new Position(0, 0);
        for (int w=0; w<4; w++) {
          if (w == 0) {
            p.setXY(i, 0);
          }else if (w == 1) {
            p.setXY(boardWidth - 1, i);
          }else if (w == 2) {
            p.setXY(boardWidth - 1 - i, boardWidth - 1);
          }else if (w == 3) {
            p.setXY(0, boardWidth - 1 - i);
          }
          boolean doesContain = false;
          if (p.equals(head)) {
            doesContain = true;
          }else {
            for(int j=0; j<getBodyLength(); j++)  {
              if (p.equals(body[j])) {
                doesContain = true;
                break;
              }
            }
          }
          if (!doesContain) {
            snakeInscribesWall = false;
            break;
          }
        }
      }
      if (snakeInscribesWall) {
        unlockVersion(1);
      }
    }

    return true;
  }
  
  void addFoodAtHead()  {
    int i=0;
    while(food[i] != null)  {
      i++;
    }
    food[i] = new Position(head.x, head.y);
  }
  
  int getBodyLength()  {
    int bodyLength = 0;
    while(body[bodyLength] != null)  {
      bodyLength++;
    }
    return bodyLength;
  }
  
  int getFullBodyLength()  {
    return getBodyLength() + 1;
  }
  
  boolean contains(Position p)  {
    if  (head.equals(p))  {
      return true;
    }
    int i=0;
    while(body[i] != null)  {
      if  (body[i].equals(p))  {
        return true;
      }
      i++;
    }
    return false;
  }
  
  void reset()  {
    head.setXY(5, 5);
    int i=0;
    while(body[i] != null)  {
      body[i] = null;
      i++;
    }
    i=0;
    while(food[i] != null)  {
      food[i] = null;
      i++;
    }
    direction = Direction.Xp;
    fromPosition.setXY(5, 5);
  }
  
}
