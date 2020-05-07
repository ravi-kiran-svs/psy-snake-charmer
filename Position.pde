class Position  {
  int x, y;
  
  Position(int x, int y)  {
    this.x = x;
    this.y = y;
  }
  
  boolean equals(Position p)  {
    if  (p == null)  {
      return false;
    }
    if  (x == p.x && y == p.y)  {
      return true;
    }
    return false;
  }
  
  void duplicate(Position p)  {
    x = p.x;
    y = p.y;
  }
  
  void setXY(int x, int y)  {
    this.x = x;
    this.y = y;
  }

  int distanceTo(Position p)  {
    return abs(x - p.x) + abs(y - p.y);
  }
  
}
