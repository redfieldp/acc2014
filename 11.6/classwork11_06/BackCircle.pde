// The backcircle demonstrates how the abstract method draw() from 
// moving shape can be written to easily change shape movement
public class BackCircle extends MovingShape {
   public void draw()  {
      fill(myColor);
      ellipse(myX, myY, size, size);
      if (myX < 0) {
        myX = width;
      }
      else {
        myX = (myX - speed);
      }
    } 
    
  public void setSpeed(int newSpeed) {
      if (newSpeed > 10) {
        speed = 10;
      }
      else {
        speed = newSpeed;
      }
  }
}
