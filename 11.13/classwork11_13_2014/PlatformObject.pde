/**
 * This is a static object that will create a mid-air platform in our system
 */
public class PlatformObject implements Box2DObject {
  Body body;
  int myWidth, myHeight;
  boolean destroyed = false;
  
  // Create the platform
  public PlatformObject(int x, int y, int w) {
    myWidth = w;
    myHeight = 20;
    createBody(x, y);
  }
  
  // Assemble the pieces for Box2D to use
  public void createBody(float xCoord, float yCoord) {
    // Make body
    BodyDef bodyDef = new BodyDef();
    bodyDef.type = BodyType.STATIC;
    bodyDef.position.set(box2d.coordPixelsToWorld(xCoord, yCoord));
    body = box2d.createBody(bodyDef);
    
    // Make shape
    PolygonShape shapeDef = new PolygonShape();
    float boxW = box2d.scalarPixelsToWorld(myWidth/2);
    float boxH = box2d.scalarPixelsToWorld(myHeight/2);
    shapeDef.setAsBox(boxW, boxH);
    
    // Make fixture
    FixtureDef fixtureDef = new FixtureDef();
    fixtureDef.shape = shapeDef;
    
    body.createFixture(fixtureDef);
  }
  
  // Not really necessary since these platforms never leave the screen
  public void destroyObject() {
    box2d.destroyBody(body);
    destroyed = true;
  }
  
  // Draw the representation of the platform
  public void display() {
    Vec2 position = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    
    if (position.y > height + myHeight) {
      destroyObject();
    }
    else {
      pushMatrix();
      translate(position.x, position.y);
      rotate(-angle);
      fill(0);
      stroke(0);
      rectMode(CENTER);
      rect(0,0,myWidth,myHeight);    
      popMatrix();
    }
  }
}
