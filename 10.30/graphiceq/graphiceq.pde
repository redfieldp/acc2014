import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput mic;
FFT fft;
String windowName;
int eqBars = 5;

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
  fill(255,0,0);
  noStroke();
  
  fft.forward(mic.mix);
  for (int i = 0; i < eqBars; i++) {
    float fftAvg = 0;
    for (int j = (i * (fft.specSize()/eqBars)); j < ((i + 1) * (fft.specSize()/eqBars)); j++){
      fftAvg += fft.getBand(j);
    }
    
    fftAvg = (fftAvg/(fft.specSize()/eqBars)) * 10;
    
    rect(i * (width/eqBars), (height - fftAvg), width/eqBars, fftAvg);
  }
}

void stop()
{
  // always close Minim audio classes when you finish with them
  mic.close();
  minim.stop();
  
  super.stop();
}
