// The basic moving shape interface allows many different types
// of shapes to be accessed in the same way
public interface BasicMovingShape {
  public void draw();
  public void setSpeed(int newSpeed);
  public int getXPosition();
}
