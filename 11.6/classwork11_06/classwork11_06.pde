
ArrayList<BasicMovingShape> shapeList = new ArrayList<BasicMovingShape>();

void setup() {
  size(1024,768,P3D);
  
  // Commented code here is for when each shape was its own object
  
//  for (int i = 0; i < 100; i++) {
//    circleList.add(new MovingCircle((int)random(0, width), (int)random(0,height), 100));
//  }
//  for (int i = 0; i < 100; i++) {
//    circleList.add(new MovingCircle((int)random(0, width), (int)random(0,height), 100, color(255,0,0), 300));
//  }
//  for (int i = 0; i < 100; i++) {
//    circleList.add(new BackCircle());
//  }
//  for (int i = 0; i < 100; i++) {
//    squareList.add(new MovingSquare());
//  }

  // In this final iterationa all the classes share the interface BasicMovingShape, so they can be sued in parallel
  shapeList.add(new BackCircle());
  shapeList.add(new MovingCircle());
  shapeList.add(new MovingSquare());
}

void draw() {
  background(0);
  noStroke();
  fill(255);
  
  // Once the shapes have a shared interface they can all be drawn together
  for (BasicMovingShape m : shapeList) {
    m.draw();
  }
  
  // Draw each type of shape separately
  
//  for (BackCircle c : circleList) {
//    c.draw();
//  }
//  for (MovingSquare s : squareList) {
//    s.draw();
//  }
}
