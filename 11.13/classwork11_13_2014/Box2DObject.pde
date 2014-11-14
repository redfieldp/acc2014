/**
 * This interface helps us to remember the required 
 * methods for a Box2D object to work successfully
 */
public interface Box2DObject {
  public void display();
  public void createBody(float xCoord, float yCoord);
  public void destroyObject();
}
