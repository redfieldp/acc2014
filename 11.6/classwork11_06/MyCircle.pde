// MovingShape provides and abstract class that defines most of a shape's basic behavior
public abstract class MovingShape implements BasicMovingShape {
  // Variables all shapes share
  int myX, myY, size, speed = 1;
  color myColor;
  
  // Constructor for a shape 
  public MovingShape() {
    myX = (int)random(0,width);
    myY = (int)random(0,height);
    size = (int)random(10,200);
    myColor = color(255);
    setSpeed(300);
  }
  
  public MovingShape(int _myX, int _myY, int _size) {
    myX = _myX;
    myY = _myY;
    size = _size;
    myColor = color((int)random(0,255),(int)random(0,255),(int)random(0,255));
  }
  
  public MovingShape(int _myX, int _myY, int _size, color _color) {
    myX = _myX;
    myY = _myY;
    size = _size;
    myColor = _color;
  }
  
  public MovingShape(int _myX, int _myY, int _size, color _color, int _speed) {
    myX = _myX;
    myY = _myY;
    size = _size;
    myColor = _color;
    setSpeed(_speed);
  }
  
  public int getXPosition() {
    return myX;
  }
  
  
  // Abstract methods that differentiate shapes
  public abstract void draw();
  
  public abstract void setSpeed(int newSpeed);
}
