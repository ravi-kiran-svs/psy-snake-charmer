class Food{
  Position position;
  int foodWidth;
 
   Food(int x, int y){
     position = new Position(x, y);
     foodWidth = 1;
   }
 
   Food(int x, int y, int foodWidth){
     position = new Position(x, y);
     this.foodWidth = foodWidth;
   }
  
  void display()  {
    fill(foodColor);
    noStroke();
    body(position, 0, 0, 0);
    rect(position.x*tileWidth + (tileWidth-foodWidth)/2, 
        position.y*tileWidth + (tileWidth-foodWidth)/2, 
        foodWidth, foodWidth);
  }
  
  boolean newPosition()  {
    int availableTiles = (boardWidth*boardWidth) - 
      snake.getFullBodyLength();
    int newTile = (int) (Math.random()*availableTiles);
    Position newPosition;
    for(int i=0; i<boardWidth; i++)  {
      for(int j=0; j<boardWidth; j++)  {
        newPosition = new Position(j, i);
        if  (!snake.contains(newPosition))  {
          if  (newTile == 0)  {
            position = newPosition;
            return true;
          }
          newTile--;
        }
      }
    }
    return false;
  }
 
}
