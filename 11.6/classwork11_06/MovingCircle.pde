// MovingCircle shows a baseic extend of the abstract class MovingShape
public class MovingCircle extends MovingShape {
   public void draw()  {
      fill(myColor);
      ellipse(myX, myY, size, size);
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
