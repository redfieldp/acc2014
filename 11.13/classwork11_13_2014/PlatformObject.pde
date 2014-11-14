public class PlatformObject implements Box2DObject {
  Body body;
  int myWidth, myHeight;
  boolean destroyed = false;
  
  public PlatformObject(int x, int y, int w) {
    myWidth = w;
    myHeight = 20;
    createBody(x, y);
  }
  
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
  
  public void destroyObject() {
    box2d.destroyBody(body);
    destroyed = true;
  }
  
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
