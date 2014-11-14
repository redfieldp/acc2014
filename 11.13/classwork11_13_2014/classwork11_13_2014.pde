import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

// Array lists with Generics for our objects
ArrayList<SquareObject> mySquares = new ArrayList<SquareObject>();
ArrayList<PlatformObject> platforms = new ArrayList<PlatformObject>();


void setup() {
  size(1024, 768);
  
  // Create the engine
  // Change gravity here if you want
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  // Add some permanent platforms
  platforms.add(new PlatformObject(width/2, height/2, width/5));
  platforms.add(new PlatformObject((width/5) * 2, 3 * (height/4), width/5));
  platforms.add(new PlatformObject((width/5) * 4, 3 * (height/4), width/5));
}

void draw() {
  background(255);
  
  // Move the engine forward
  box2d.step();
  
  
  // Draw the platforms
  for (PlatformObject po : platforms) {
    po.display();
  }
  ArrayList<SquareObject> toDestroy = new ArrayList();
  
  // Draw the squares and note those that have left the screen
  for (SquareObject so : mySquares) {
    if (so.destroyed) {
      toDestroy.add(so);
    }
    else{
      so.display();
    }
  }
  // Get rid of destroyed squares in our array so that they clear memory
  for (SquareObject so : toDestroy) {
    mySquares.remove(so);
  }
}

// Add a new square
void mouseClicked() {
  mySquares.add(
  new SquareObject(mouseX, mouseY, (int)random(10, 30), (int)random(1,10)));
}
