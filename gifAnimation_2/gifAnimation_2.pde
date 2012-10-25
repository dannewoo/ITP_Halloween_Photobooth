import gifAnimation.*;
import processing.video.*;
                    
GifMaker gifExport;
Capture video;
int globalframecount = 0;
int countdowntimer = 10;
int imageName = 0;
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
  video = new Capture(this, width, height, 30);
  video.start();
}
void captureEvent(Capture myCapture) {
  video.read();
  //fs.enter();
}

void draw() {
  background(0);
  rectMode(CENTER);
  noStroke();
  textAlign(CENTER);
  textSize(24);
  image (video, 0, 0);

  if (mousePressed == true) {
    globalframecount = 1;
  }
  if (globalframecount == 0) {
    fill(255);
    rect(640, 480, width*2, height*2);
    fill(0);
    text("Click to start", width/2, height/2);
  }
  if (globalframecount < 1100 && globalframecount > 0 ) {
    if (globalframecount == 100) {
      Date d = new Date();
      timestamp = d.getTime();
      gifExport = new GifMaker(this, "images/" + timestamp + ".gif");
      gifExport.setQuality(256);
      gifExport.setRepeat(0);
    }
    fill(255);
    if (globalframecount > 0 && globalframecount < 50) {
      text("3", width/2, height/2);
    }
    if (globalframecount > 50 && globalframecount < 100) {
      text("2", width/2, height/2);
    }
    if (globalframecount > 100 && globalframecount < 150) {
      text("1", width/2, height/2);
    }
    if (globalframecount == 151) {
      fill(255);
      rect(640, 480, width*2, height*2);
    }
    if (globalframecount == 152) {
      gifExport.setDelay(300);
      gifExport.addFrame();
    }
    if (globalframecount > 160 && globalframecount < 210) {
      text("3", width/2, height/2);
    }
    if (globalframecount > 210 && globalframecount < 260) {
      text("2", width/2, height/2);
    }
    if (globalframecount > 260 && globalframecount < 310) {
      text("1", width/2, height/2);
    }
    if (globalframecount == 311) {
      fill(255);
      rect(640, 480, width*2, height*2);
    }
    if (globalframecount == 312) {
      gifExport.setDelay(300);
      gifExport.addFrame();
    }
    if (globalframecount > 320 && globalframecount < 370) {
      text("3", width/2, height/2);
    }
    if (globalframecount > 370 && globalframecount < 420) {
      text("2", width/2, height/2);
    }
    if (globalframecount > 420 && globalframecount < 470) {
      text("1", width/2, height/2);
    }
    if (globalframecount == 471) {
      fill(255);
      rect(640, 480, width*2, height*2);
    }
    if (globalframecount == 472) {
      gifExport.setDelay(300);
      gifExport.addFrame();
    }
    if (globalframecount > 480 && globalframecount < 530) {
      text("3", width/2, height/2);
    }
    if (globalframecount > 530 && globalframecount < 580) {
      text("2", width/2, height/2);
    }
    if (globalframecount > 580 && globalframecount < 630) {
      text("1", width/2, height/2);
    }
    if (globalframecount == 631) {
      fill(255);
      rect(640, 480, width*2, height*2);
    }
    if (globalframecount == 632) {
      gifExport.setDelay(300);
      gifExport.addFrame();
    }
    if (globalframecount == 633) {
      gifExport.finish();
    }
    globalframecount++;
    if (globalframecount == 634) {
      globalframecount = 0;
    }
  }
  println(globalframecount);
}

