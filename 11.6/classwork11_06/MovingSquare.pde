// MovingSquare shows how the draw method is what controls the type and size of shape that you draw

public class MovingSquare extends MovingShape {
   public void draw()  {
      fill(myColor);
      rect(myX, myY, size, size);
      myX = (myX + speed) % width;
    } 
  public void setSpeed(int newSpeed) {
    if (newSpeed > 20) {
      speed = 20;
    }
    else {
      speed = newSpeed;
    }
  }
}
