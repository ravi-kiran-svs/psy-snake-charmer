//Center
Position getCenter(Position p)	{
	return new Position((p.x)*tileWidth + tileWidth/2, 
		(p.y)*tileWidth + tileWidth/2);
}

Position getCenter(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth + tileWidth/2), 
		(int) ((p.y + f*y)*tileWidth + tileWidth/2));
}

//Corners of the Tile
Position getTopLeft(Position p)	{
	return new Position((p.x)*tileWidth, (p.y)*tileWidth);
}

Position getTopRight(Position p)	{
	return new Position((p.x+1)*tileWidth, (p.y)*tileWidth);
}

Position getBottomLeft(Position p)	{
	return new Position((p.x)*tileWidth, (p.y+1)*tileWidth);
}

Position getBottomRight(Position p)	{
	return new Position((p.x+1)*tileWidth, (p.y+1)*tileWidth);
}

//Corners of the Inner Body
Position getInnerTopLeft(Position p)	{
	return new Position((p.x)*tileWidth + (tileWidth-bodyWidth)/2, 
		(p.y)*tileWidth + (tileWidth-bodyWidth)/2);
}

Position getInnerTopRight(Position p)	{
	return new Position((p.x+1)*tileWidth - (tileWidth-bodyWidth)/2, 
		(p.y)*tileWidth + (tileWidth-bodyWidth)/2);
}

Position getInnerBottomLeft(Position p)	{
	return new Position((p.x)*tileWidth + (tileWidth-bodyWidth)/2, 
		(p.y+1)*tileWidth - (tileWidth-bodyWidth)/2);
}

Position getInnerBottomRight(Position p)	{
	return new Position((p.x+1)*tileWidth - (tileWidth-bodyWidth)/2, 
		(p.y+1)*tileWidth - (tileWidth-bodyWidth)/2);
}

Position getInnerTopLeft(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth + (tileWidth-bodyWidth)/2), 
		(int) ((p.y + f*y)*tileWidth + (tileWidth-bodyWidth)/2));
}

Position getInnerTopRight(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + 1 + f*x)*tileWidth - (tileWidth-bodyWidth)/2), 
		(int) ((p.y + f*y)*tileWidth + (tileWidth-bodyWidth)/2));
}

Position getInnerBottomLeft(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth + (tileWidth-bodyWidth)/2), 
		(int) ((p.y + 1 + f*y)*tileWidth - (tileWidth-bodyWidth)/2));
}

Position getInnerBottomRight(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + 1 + f*x)*tileWidth - (tileWidth-bodyWidth)/2), 
		(int) ((p.y + 1 + f*y)*tileWidth - (tileWidth-bodyWidth)/2));
}

//Top Edge
Position getEdgeTopLeft(Position p)	{
	return new Position((p.x)*tileWidth + (tileWidth-bodyWidth)/2, 
		(p.y)*tileWidth);
}

Position getEdgeTopRight(Position p)	{
	return new Position((p.x+1)*tileWidth - (tileWidth-bodyWidth)/2, 
		(p.y)*tileWidth);
}

Position getEdgeTopLeft(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth + (tileWidth-bodyWidth)/2), 
		(int) ((p.y + f*y)*tileWidth));
}

Position getEdgeTopRight(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x +  1 + f*x)*tileWidth - (tileWidth-bodyWidth)/2), 
		(int) ((p.y + f*y)*tileWidth));
}

//Bottom Edge
Position getEdgeBottomLeft(Position p)	{
	return new Position((p.x)*tileWidth + (tileWidth-bodyWidth)/2, 
		(p.y+1)*tileWidth);
}

Position getEdgeBottomRight(Position p)	{
	return new Position((p.x+1)*tileWidth - (tileWidth-bodyWidth)/2, 
		(p.y+1)*tileWidth);
}

Position getEdgeBottomLeft(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth + (tileWidth-bodyWidth)/2), 
		(int) ((p.y + 1 + f*y)*tileWidth));
}

Position getEdgeBottomRight(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + 1 + f*x)*tileWidth - (tileWidth-bodyWidth)/2), 
		(int) ((p.y + 1 + f*y)*tileWidth));
}

//Right Edge
Position getEdgeRightTop(Position p)	{
	return new Position((p.x+1)*tileWidth, 
		(p.y)*tileWidth + (tileWidth-bodyWidth)/2);
}

Position getEdgeRightBottom(Position p)	{
	return new Position((p.x+1)*tileWidth, 
		(p.y+1)*tileWidth - (tileWidth-bodyWidth)/2);
}

Position getEdgeRightTop(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + 1 + f*x)*tileWidth), 
		(int) ((p.y + f*y)*tileWidth + (tileWidth-bodyWidth)/2));
}

Position getEdgeRightBottom(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + 1 + f*x)*tileWidth), 
		(int) ((p.y + 1 + f*y)*tileWidth - (tileWidth-bodyWidth)/2));
}

//Left Edge
Position getEdgeLeftTop(Position p)	{
	return new Position((p.x)*tileWidth, 
		(p.y)*tileWidth + (tileWidth-bodyWidth)/2);
}

Position getEdgeLeftBottom(Position p)	{
	return new Position((p.x)*tileWidth, 
		(p.y+1)*tileWidth - (tileWidth-bodyWidth)/2);
}

Position getEdgeLeftTop(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth), 
		(int) ((p.y + f*y)*tileWidth + (tileWidth-bodyWidth)/2));
}

Position getEdgeLeftBottom(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth), 
		(int) ((p.y + 1 + f*y)*tileWidth - (tileWidth-bodyWidth)/2));
}

//Edge centers
Position getTopCenter(Position p)	{
	return new Position((p.x)*tileWidth + tileWidth/2, 
		(p.y)*tileWidth);
}

Position getBottomCenter(Position p)	{
	return new Position((p.x)*tileWidth + tileWidth/2, 
		(p.y+1)*tileWidth);
}

Position getLeftCenter(Position p)	{
	return new Position((p.x)*tileWidth, 
		(p.y)*tileWidth + tileWidth/2);
}

Position getRightCenter(Position p)	{
	return new Position((p.x+1)*tileWidth, 
		(p.y)*tileWidth + tileWidth/2);
}

Position getTopCenter(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth + tileWidth/2), 
		(int) ((p.y + f*y)*tileWidth));
}

Position getBottomCenter(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth + tileWidth/2), 
		(int) ((p.y + 1 + f*y)*tileWidth));
}

Position getLeftCenter(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth), 
		(int) ((p.y + f*y)*tileWidth + tileWidth/2));
}

Position getRightCenter(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + 1 + f*x)*tileWidth), 
		(int) ((p.y + f*y)*tileWidth + tileWidth/2));
}

//Edge centers of centers
Position getTopCenterCenter(Position p)	{
	return new Position((p.x)*tileWidth + tileWidth/2, 
		(p.y)*tileWidth + (tileWidth-bodyWidth)/4);
}

Position getBottomCenterCenter(Position p)	{
	return new Position((p.x)*tileWidth + tileWidth/2, 
		(p.y+1)*tileWidth - (tileWidth-bodyWidth)/4);
}

Position getLeftCenterCenter(Position p)	{
	return new Position((p.x)*tileWidth + (tileWidth-bodyWidth)/4, 
		(p.y)*tileWidth + tileWidth/2);
}

Position getRightCenterCenter(Position p)	{
	return new Position((p.x+1)*tileWidth - (tileWidth-bodyWidth)/4, 
		(p.y)*tileWidth + tileWidth/2);
}

Position getTopCenterCenter(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth + tileWidth/2), 
		(int) ((p.y + f*y)*tileWidth + (tileWidth-bodyWidth)/4));
}

Position getBottomCenterCenter(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth + tileWidth/2), 
		(int) ((p.y + 1 + f*y)*tileWidth - (tileWidth-bodyWidth)/4));
}

Position getLeftCenterCenter(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth + (tileWidth-bodyWidth)/4), 
		(int) ((p.y + f*y)*tileWidth + tileWidth/2));
}

Position getRightCenterCenter(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + 1 + f*x)*tileWidth - (tileWidth-bodyWidth)/4), 
		(int) ((p.y + f*y)*tileWidth + tileWidth/2));
}

//Inner edge centers
Position getInnerTopCenter(Position p)	{
	return new Position((p.x)*tileWidth + tileWidth/2, 
		(p.y)*tileWidth + (tileWidth-bodyWidth)/2);
}

Position getInnerBottomCenter(Position p)	{
	return new Position((p.x)*tileWidth + tileWidth/2, 
		(p.y+1)*tileWidth - (tileWidth-bodyWidth)/2);
}

Position getInnerLeftCenter(Position p)	{
	return new Position((p.x)*tileWidth + (tileWidth-bodyWidth)/2, 
		(p.y)*tileWidth + tileWidth/2);
}

Position getInnerRightCenter(Position p)	{
	return new Position((p.x+1)*tileWidth - (tileWidth-bodyWidth)/2, 
		(p.y)*tileWidth + tileWidth/2);
}

Position getInnerTopCenter(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth + tileWidth/2), 
		(int) ((p.y + f*y)*tileWidth + (tileWidth-bodyWidth)/2));
}

Position getInnerBottomCenter(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth + tileWidth/2), 
		(int) ((p.y + 1 + f*y)*tileWidth - (tileWidth-bodyWidth)/2));
}

Position getInnerLeftCenter(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + f*x)*tileWidth + (tileWidth-bodyWidth)/2), 
		(int) ((p.y + f*y)*tileWidth + tileWidth/2));
}

Position getInnerRightCenter(Position p, float f, int x, int y)	{
	return new Position((int) ((p.x + 1 + f*x)*tileWidth - (tileWidth-bodyWidth)/2), 
		(int) ((p.y + f*y)*tileWidth + tileWidth/2));
}