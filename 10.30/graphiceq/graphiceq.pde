import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput mic;
FFT fft;
String windowName;
int eqBars = 20;
float[] barHeight;

void setup()
{
  size(1024, 768, P3D);
  
  minim = new Minim(this);
  
  mic = minim.getLineIn(Minim.MONO, 1024);
  
  fft = new FFT(mic.bufferSize(), mic.sampleRate());
  
  barHeight = new float[eqBars];
}

void draw()
{
  background(0);
  fill(255,0,0);
  noStroke();
  
  fft.forward(mic.mix);
  for (int i = 0; i < eqBars; i++) {
    float fftAvg = 0;
    for (int j = (i * ((fft.specSize()/2)/eqBars)); j < ((i + 1) * ((fft.specSize()/2)/eqBars)); j++){
      fftAvg += fft.getBand(j);
    }
    
    fftAvg = (fftAvg/((fft.specSize()/2)/eqBars)) * 10;
    
    if (fftAvg > barHeight[i]) {
      if (fftAvg > 20) {
      barHeight[i] += 20;
      }
    }
    else {
      barHeight[i]-=5;
    }
    
    rect(i * (width/eqBars), (height - barHeight[i]), width/eqBars, barHeight[i]);
  }
}

void stop()
{
  // always close Minim audio classes when you finish with them
  mic.close();
  minim.stop();
  
  super.stop();
}
