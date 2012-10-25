import gifAnimation.*;
import processing.video.*;

GifMaker gifExport;
Capture video;
int globalframecount = 0;
int countdowntimer = 10;
int x = 100;  // x- position text
int y = height-50; // y- position text
long timestamp;

float a = (0);
float b = (255);
float changea = 2.5;
float changeb = -2.5;

void setup() {
  size(640, 480, P2D);
  background(0);
  rectMode(CENTER);
  Date d = new Date();
  timestamp = d.getTime();
  video = new Capture(this, width, height, 30);
  video.start();
  gifExport = new GifMaker(this, timestamp + ".gif");
  gifExport.setRepeat(0);
}
void captureEvent(Capture myCapture) {
  video.read();
  //fs.enter();
}

void draw() {
  //  for (int i = 50; i <=450; i+=3) {
  //    for (int j = 50; j<=450; j+=3) {
  //      stroke(255, 0, i-a);    
  //      point(i, j);
  //      a += changea;
  //      b += changeb;
  //
  //      if ((a<0)||(a>255)) {
  //        changea *= -1;
  //      }
  //      if ((b<0)||(b>255)) {
  //        changeb *= -1;
  //      }
  //    }
  //  }
  background(0);
  image (video, 0, 0);

  if (keyPressed == true && key == 'S') {
    gifExport.finish();
  } 
  else {
    gifExport.addFrame();
  }
}

