//  public static void main( String args[] ) {
//   PApplet.main( new String[] { "--present", "superbooth8511" } );
// }
//import fullscreen.*;
//import japplemenubar.*;
//import processing.serial.*;

/* (made by Tjerk in 10 minutes  ) */

import processing.video.*;
//Serial myPort;  // Create object from Serial class
//char val;      // Data received from the serial port

Capture myCapture;
int a = 640; // width of window
int b = 480;  // height of window
int x = 100;  // x- position text
int y = 700; // y- position text
int capnum = 0;
int countdowntimer = 10;
int globalframecount = 0;
PImage aj;
PImage bj;
PImage cj;
PImage dj;
//FullScreen fs;

void setup() {

  //print(Serial.list()[0]);
  //  String portName = Serial.list()[0];
  //  myPort = new Serial(this, portName, 9600);
  //  val = 'o';
  frameRate(25);
  size(a, b);
  // fs = new FullScreen(this);

  // setFullScreen(true);
  background(0);

  //PFont fontB = loadFont("Ziggurat-HTF-Black-32.vlw");
  //textFont(fontB, 100);
  myCapture = new Capture(this, a, b, 30);
  myCapture.start();
}
void captureEvent(Capture myCapture) {
  myCapture.read();
  //fs.enter();
}
void draw() {
  // PFont fontA = loadFont("Ziggurat-HTF-Black-32.vlw");
  // textFont(fontA);
  //println("start");
  //if ( myPort.available() > 0) {  // If data is available,
  //    val = (myPort.readChar());
  //println('1');
  //println(val);    // read it and store it in val
  // }
  if (mousePressed== true) {
    globalframecount = 1;
  }

  //background(255);
  fill(0);

  //switch(val) {
  //
  //  case 's':
  //  globalframecount = 1;
  ////  background(0);
  //
  // break;
  //
  //  case 't':
  ////null
  //    break;
  //  default:
  //    //println("Zulu");   // Prints "Zulu"
  //    break;
  //}

  if (globalframecount == 25) {
    countdowntimer = 9;
  }
  if (globalframecount == 50) {
    countdowntimer = 8;
  }
  if (globalframecount == 75) {
    countdowntimer = 7;
  }
  if (globalframecount == 100) {
    countdowntimer = 6;
  }
  if (globalframecount == 125) {
    countdowntimer = 5;
  }
  if (globalframecount == 150) {
    countdowntimer = 4;
  }
  if (globalframecount == 175) {
    countdowntimer = 3;
  }
  if (globalframecount == 200) {
    countdowntimer = 2;
  }
  if (globalframecount == 225) {
    countdowntimer = 1;
  } 

  if ((globalframecount < 250) & (globalframecount > 0)) {
    image (myCapture, 0, 0);
    //       textFont(fontA, 30);
    fill(0);
    text ("Preview! Get ready for your photo in "+str(countdowntimer), x+2, y);
    text ("Preview! Get ready for your photo in "+str(countdowntimer), x, y+2);
    text ("Preview! Get ready for your photo in "+str(countdowntimer), x-2, y);
    text ("Preview! Get ready for your photo in "+str(countdowntimer), x, y-2);
    //       textFont(fontA, 30);
    fill(255);
    text ("Preview! Get ready for your photo in "+str(countdowntimer), x, y);
    //text (countdowntimer, width-250, y);
    globalframecount++;
  }

  if ((globalframecount >= 250) & (globalframecount < 500)) {
    image (myCapture, 0, 0);

    if ((globalframecount > 250) & (globalframecount < 311))
    {
      // textFont(fontA, 100);
      fill(0);
      text (str(countdowntimer), width/2+2, height/2);

      text (str(countdowntimer), width/2, height/2+2);

      text (str(countdowntimer), width/2-2, height/2);

      text (str(countdowntimer), width/2, height/2-2);

      fill(255);
      text (str(countdowntimer), width/2, height/2-2);
    }
    if (globalframecount == 250)
    {
      countdowntimer = 3;
    }

    if (globalframecount == 270)
    {
      countdowntimer = 2;
    }

    if (globalframecount == 290)
    {
      countdowntimer = 1;
    }

    if (globalframecount == 312) {
      background(255);
    }
    if (globalframecount == 313) {
      saveFrame(capnum+".jpeg");
      aj = loadImage(capnum+".jpeg");
      capnum++;
    }

    if ((globalframecount > 314) & (globalframecount < 373))
    {
      // textFont(fontA, 100);
      fill(0);
      text (str(countdowntimer), width/2+2, height/2);

      text (str(countdowntimer), width/2, height/2+2);

      text (str(countdowntimer), width/2-2, height/2);

      text (str(countdowntimer), width/2, height/2-2);

      fill(255);
      text (str(countdowntimer), width/2, height/2-2);
    }
    if (globalframecount == 314)
    {
      countdowntimer = 3;
    }

    if (globalframecount == 335)
    {
      countdowntimer = 2;
    }

    if (globalframecount == 355)
    {
      countdowntimer = 1;
    }

    if (globalframecount == 374) {
      background(255);
    }

    if (globalframecount == 375) {
      saveFrame(capnum+".jpeg");
      bj = loadImage(capnum+".jpeg");
      capnum++;
    }

    if ((globalframecount > 375) & (globalframecount < 436))
    {
      // textFont(fontA, 100);
      fill(0);
      text (str(countdowntimer), width/2+2, height/2);

      text (str(countdowntimer), width/2, height/2+2);

      text (str(countdowntimer), width/2-2, height/2);

      text (str(countdowntimer), width/2, height/2-2);

      fill(255);
      text (str(countdowntimer), width/2, height/2-2);
    }
    if (globalframecount == 376)
    {
      countdowntimer = 3;
    }

    if (globalframecount == 401)
    {
      countdowntimer = 2;
    }

    if (globalframecount == 420)
    {
      countdowntimer = 1;
    }

    if (globalframecount == 438) {
      background(255);
    }

    if (globalframecount == 439) {
      saveFrame(capnum+".jpeg");
      cj = loadImage(capnum+".jpeg");
      capnum++;
    }

    if ((globalframecount > 440) & (globalframecount < 497))
    {
      // textFont(fontA, 100);
      fill(0);
      text (str(countdowntimer), width/2+2, height/2);

      text (str(countdowntimer), width/2, height/2+2);

      text (str(countdowntimer), width/2-2, height/2);

      text (str(countdowntimer), width/2, height/2-2);

      fill(255);
      text (str(countdowntimer), width/2, height/2-2);
    }
    if (globalframecount == 440)
    {
      countdowntimer = 3;
    }

    if (globalframecount == 460)
    {
      countdowntimer = 2;
    }

    if (globalframecount == 480)
    {
      countdowntimer = 1;
    }

    if (globalframecount == 497) {
      background(255);
    }    

    if (globalframecount == 498) {
      saveFrame(capnum+".jpeg");
      dj = loadImage(capnum+".jpeg");
      capnum++;
    }

    if (globalframecount == 499) {
      fill(255);
      background(0);
      rect(0, 0, (width), (height));
      image(aj, width/8, height/8, width/3, height/3);
      image(bj, 4*(width/8), height/8, width/3, height/3);
      image(cj, width/8, 4*(height/8), width/3, height/3);
      image(dj, 4*(width/8), 4*(height/8), width/3, height/3);
      fill(255);
      text ("Press button to take some more!", x, y);
      saveFrame("multipage"+capnum+".jpeg");
      globalframecount = -1;
    }

    //delay(50);
    globalframecount++;
  }
}

