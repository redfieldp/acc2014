/**
 * A dynamic Box2D object that is affected by physics
 */
public class SquareObject implements Box2DObject {
  Body body;
  int myWidth, myHeight;
  boolean destroyed = false;
  
  // Create the square
  public SquareObject(int x, int y, int w, int h) {
    myWidth = w;
    myHeight = h;
    createBody(x, y);
  }
  
  // Create the pieces Box2D needs to see the object
  public void createBody(float xCoord, float yCoord) {
    // Make body
    BodyDef bodyDef = new BodyDef();
    bodyDef.type = BodyType.DYNAMIC;
    bodyDef.position.set(box2d.coordPixelsToWorld(xCoord, yCoord));
    body = box2d.createBody(bodyDef);
    
    // Make shape
    // This is the code that changes most often when changing
    // the physical composition of the object
    PolygonShape shapeDef = new PolygonShape();
    float boxW = box2d.scalarPixelsToWorld(myWidth/2);
    float boxH = box2d.scalarPixelsToWorld(myHeight/2);
    shapeDef.setAsBox(boxW, boxH);
    
    // Make fixture
    FixtureDef fixtureDef = new FixtureDef();
    fixtureDef.shape = shapeDef;

    
    body.createFixture(fixtureDef);
    body.setLinearVelocity(new Vec2(random(-5,5), random(2,5)));
    body.setAngularVelocity(random(-5,5));
  }
  
  // Get rid of a dynamic object that has left the screen
  public void destroyObject() {
    box2d.destroyBody(body);
    destroyed = true;
  }
  
  // Draw the object
  // Remember the actions you take here must match the shape you 
  // attached to the body
  // This is also where you can "skin" the object (rather than just using normal Processing shapes)
  public void display() {
    Vec2 position = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    
    // Check if we should destroy this object
    if (position.y > height + myHeight) {
      destroyObject();
    }
    else {
      pushMatrix();
      translate(position.x, position.y);
      rotate(-angle);
      fill(128);
      stroke(0);
      rectMode(CENTER);
      rect(0,0,myWidth,myHeight);    
      popMatrix();
    }
  }
}
