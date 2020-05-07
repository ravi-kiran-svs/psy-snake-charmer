void point(Position p)	{
	point(p.x, p.y);
}

void line(Position p1, Position p2)	{
	line(p1.x, p1.y, p2.x, p2.y);
}

void vertex(Position p)	{
	vertex(p.x, p.y);
}

void ellipse(Position p, int s)	{
	ellipse(p.x, p.y, s, s);
}

void eyes(Position p, float f, int x, int y)	{
	int eyeSize = 3;
	if (x == 1) {
		ellipse(getInnerRightCenter(p, f, x, y), eyeSize);
	}else if (x == -1) {
		ellipse(getInnerLeftCenter(p, f, x, y), eyeSize);
	}else if (y == 1) {
		ellipse(getInnerBottomCenter(p, f, x, y), eyeSize);
	}else if (y == -1) {
		ellipse(getInnerTopCenter(p, f, x, y), eyeSize);
	}
}

void head(Position p, float f, int x, int y)	{
	beginShape();
	vertex(getEdgeTopLeft(p, f, x, y));
	vertex(getEdgeTopRight(p, f, x, y));
	vertex(getEdgeRightTop(p, f, x, y));
	vertex(getEdgeRightBottom(p, f, x, y));
	vertex(getEdgeBottomRight(p, f, x, y));
	vertex(getEdgeBottomLeft(p, f, x, y));
	vertex(getEdgeLeftBottom(p, f, x, y));
	vertex(getEdgeLeftTop(p, f, x, y));
	endShape(CLOSE);
}

void body(Position p, float f, int x, int y)	{
	beginShape();
	vertex(getInnerTopLeft(p, f, x, y));
	vertex(getTopCenterCenter(p, f, x, y));
	vertex(getInnerTopRight(p, f, x, y));
	vertex(getRightCenterCenter(p, f, x, y));
	vertex(getInnerBottomRight(p, f, x, y));
	vertex(getBottomCenterCenter(p, f, x, y));
	vertex(getInnerBottomLeft(p, f, x, y));
	vertex(getLeftCenterCenter(p, f, x, y));
	endShape(CLOSE);
}

void body(Position p1, Position p2, int x, int y)	{
	int factor = 2;
	beginShape();
	vertex(p1.x - (y*bodyWidth)/factor - (x*bodyWidth)/factor, 
		p1.y + (x*bodyWidth)/factor - (y*bodyWidth)/factor);
	vertex(p1.x + (y*bodyWidth)/factor - (x*bodyWidth)/factor, 
		p1.y - (x*bodyWidth)/factor - (y*bodyWidth)/factor);
	vertex(p2.x + (y*bodyWidth)/factor + (x*bodyWidth)/factor, 
		p2.y - (x*bodyWidth)/factor + (y*bodyWidth)/factor);
	vertex(p2.x - (y*bodyWidth)/factor + (x*bodyWidth)/factor, 
		p2.y + (x*bodyWidth)/factor + (y*bodyWidth)/factor);
	endShape(CLOSE);
}