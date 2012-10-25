// Daniel Shiffman
// <http://www.shiffman.net>
// May 2006

// Create and upload JPG to web server
// Not particularly flexible code, could use some improvement
// Might be nice to have separate class for JPG Creation and HTTP Post
// Might be nice to create flexible HTTP Post that could take various parameters
// See http://www.devx.com/Java/Article/17679/1954?pf=true for a nice example of more comprehensive HTTPClientRequest

PImage img;

String filename = "jpgfilename"; // don't use .jpg extension
String url = "http://www.dannewoo.com/itp/itp_halloween/myphp.php";

void setup() {
  size(200,200);
  // Draw a blank PImage
  img = new PImage(200,200);
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) img.pixels[i] = color(100,50,250);
  img.updatePixels();
  
  // Construction an object that will deal with file creation and HTTP Post
  JPGMakerUploader jpger = new JPGMakerUploader(img,filename,url);
  jpger.saveJPG();
  jpger.upload();
  image(img,0,0);
  noLoop();
}

