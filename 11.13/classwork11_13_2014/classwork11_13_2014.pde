import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<SquareObject> mySquares = new ArrayList<SquareObject>();

void setup() {
  size(1024, 768);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
}

void draw() {
  background(255);
  box2d.step();
  
  ArrayList<SquareObject> toDestroy = new ArrayList();
  
  for (SquareObject so : mySquares) {
    if (so.destroyed) {
      toDestroy.add(so);
    }
    else{
      so.display();
    }
  }
  
  for (SquareObject so : toDestroy) {
    mySquares.remove(so);
  }
}

void mouseClicked() {
  mySquares.add(
  new SquareObject(mouseX, mouseY, (int)random(10, 30), (int)random(1,10)));
}
