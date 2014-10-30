import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioInput in;

float gain = 200;
float[] myBuffer;

void setup()
{
  size(512, 200, P3D);
 
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO,2048);

  myBuffer = new float[in.bufferSize()];
}
 
void draw()
{
  background(0);
  stroke(255);
  // draw the output waveforms, so there's something to look at
  // first grab a stationary copy
  for (int i = 0; i < in.bufferSize(); ++i) {
    myBuffer[i] = in.left.get(i);
  }
  
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, myBuffer.length, 0, width);
    float x2 = map(i+1, 0, myBuffer.length, 0, width);
    line(x1, 100 - myBuffer[i]*gain, x2, 100 - myBuffer[i+1]*gain);
  }
}
 
void stop()
{
  // always close Minim audio classes when you finish with them
  in.close();
  minim.stop();
 
  super.stop();
}
