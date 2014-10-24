ArrayList<RotationSphere> planets = new ArrayList<RotationSphere>();
int sunSize = 100;

void setup() {
  size(1024, 768, P3D);
  planets.add(new RotationSphere(10, (2*PI)/100, (2*PI)/1000, 20, color(0,128,128), 50, .25f));
  planets.add(new RotationSphere(15, (2*PI)/200, (2*PI)/50, 50, color(255,128,0), 100, 1f));
  planets.add(new RotationSphere(20, (2*PI)/300, (2*PI)/200, 100, color(0,128,255), 200, .1f));
  planets.add(new RotationSphere(25, (2*PI)/400, (2*PI)/600, 150, color(128,128,0), 25, .5f));
  planets.add(new RotationSphere(30, (2*PI)/500, (2*PI)/1200, 200, color(255,64,0), 60, .6f));
  planets.add(new RotationSphere(35, (2*PI)/600, (2*PI)/3000, 300, color(255,164,0), 300, .8f));
  planets.add(new RotationSphere(40, (2*PI)/700, (2*PI)/100, 400, color(0,64,255), 150, .3f));
  planets.add(new RotationSphere(50, (2*PI)/800, (2*PI)/800, 500, color(0,128,64), 20, .1f));
}

void draw() {
  background(0);
  translate(width/2, height/2, -300);
  lights();
  noStroke();
  fill(255,255,0);
  sphere(sunSize);
  for (RotationSphere rs: planets) {
    rs.draw();
  }
}

public class RotationSphere {
  float orbitSpeed, rotationSpeed, orbitVariance, varianceSpeed;
  float orbit = 0, rotate = 0, variance = 0;
  int orbitSize, size;
  color fillColor;
  boolean varianceDirection = false;

  public RotationSphere(int size, float orbitSpeed, float rotationSpeed, int orbitSize, color fillColor, float orbitVariance, float varianceSpeed) {
    this.orbitSpeed = orbitSpeed;
    this.rotationSpeed = rotationSpeed;
    this.orbitSize = orbitSize;
    this.fillColor = fillColor;
    this.orbitVariance = orbitVariance;
    this.varianceSpeed = varianceSpeed;
    this.size = size;
  }

  public void draw() {
    fill(fillColor);
    pushMatrix();
    rotateY(orbit);
    translate(orbitSize + sunSize + 50, variance, 0);
    rotateY(rotate);
    sphere(size);
    popMatrix();
    orbit = (orbit + orbitSpeed) % (2 * PI);
    rotate = (rotate + rotationSpeed) % (2 * PI);
    if (varianceDirection) {
      if (variance < orbitVariance) {
        variance+=varianceSpeed;
      }
      else {
        varianceDirection = !varianceDirection;
      }
    }
    else {
      if (variance > (orbitVariance * -1)) {
        variance-=varianceSpeed;
      }
      else {
        varianceDirection = !varianceDirection;
      }
    }
  }
}
