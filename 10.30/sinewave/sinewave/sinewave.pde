import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioOutput out;

void setup()
{
  size(512, 200, P3D);
 
  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  Note sine = new Note(440, .2);
}
 
void draw()
{
  background(0);
}

class Note implements AudioSignal
{
     private float freq;
     private float level;
     private SineWave sine;
     
     Note(float pitch, float amplitude)
     {
         freq = pitch;
         level = amplitude;
         sine = new SineWave(freq, level, out.sampleRate());
         out.addSignal(this);
     }

     void generate(float [] samp)
     {
         // generate the next buffer's worth of sinusoid
         sine.generate(samp);
     }
     
    // AudioSignal requires both mono and stereo generate functions
    void generate(float [] sampL, float [] sampR)
    {
        sine.generate(sampL, sampR);
    }

}
