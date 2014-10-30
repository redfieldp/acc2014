import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput mic;
FFT fft;
String windowName;

void setup()
{
  size(512, 200, P3D);
  textMode(SCREEN);
  
  minim = new Minim(this);
  
  mic = minim.getLineIn(Minim.MONO, 1024);
  
  fft = new FFT(mic.bufferSize(), mic.sampleRate());
  
  windowName = "None";
}

void draw()
{
  background(0);
  stroke(255);
  
  fft.forward(mic.mix);
  for(int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
    line(i, height, i, height - fft.getBand(i)*10);
  }
  fill(255);
}

void stop()
{
  // always close Minim audio classes when you finish with them
  mic.close();
  minim.stop();
  
  super.stop();
}
