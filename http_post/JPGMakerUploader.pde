// Daniel Shiffman
// <http://www.shiffman.net>
// May 2006

// Class to create a JPG file from a PImage
// and post to a PHP script which uploads to server
// HTTP Post code based heavily on examples from Vlad Patryshev (http://www.devx.com/Java/Article/17679/1954?pf=true)

import java.awt.image.BufferedImage;
import java.io.*;
import java.net.*;
import java.util.*;
import javax.imageio.*;
import processing.core.*;

public class JPGMakerUploader {

  File file;			// Reference to JPG File
  String filename;		// Local filename (not upload name)
  BufferedImage bImg;	        // Need a BufferedImage to make fine
  String uploadURL;		// URL for php script
  Random generator;		// generate random number for "boundary"

  URL url;			
  URLConnection connection;
  OutputStream os;

  // Constructor
  JPGMakerUploader(PImage img, String f, String url) {
    filename = f;
    // Create BufferedImage from PImage
    bImg = new BufferedImage(img.width, img.height, BufferedImage.TYPE_INT_RGB);
    bImg.setRGB(0,0,img.width,img.height,img.pixels,0,img.width);
    uploadURL = url;
    generator = new Random();
  }

  // Save JPG file to sketch folder
  public void saveJPG() {
    String filepath = sketchPath + "/" + filename + ".jpg";
    file = new File(filepath);
    try {
      ImageIO.write(bImg, "jpg", file);
      System.out.println("wrote file to: " + filepath);
    } 
    catch (IOException e) {
      System.out.println("Problem writing file.");
      e.printStackTrace();
    }
  }


  // Post to PHP upload script
  // PHP Source available here: http://www.shiffman.net/ants/upload/upload.phps
  public void upload() {
    try {
      System.out.println("posting to " + uploadURL);
      String boundary = "---------------------------" + randomString() + randomString() + randomString();
      url = new URL(uploadURL);
      connection = url.openConnection();
      connection.setDoOutput(true);
      connection.setRequestProperty("Content-Type","multipart/form-data; boundary=" + boundary);
      System.out.println("Opening connection. . .");
      os = connection.getOutputStream();
      writeParameter("form","true",boundary);
      writeParameter("submit","submit",boundary);
      writeFile("bytes",file,boundary);
      boundary(boundary);
      writeln("--");
      System.out.println("Closing connection . . .");
      os.close();
      InputStream is = connection.getInputStream();

      BufferedReader rd = new BufferedReader(new InputStreamReader(is));
      String line;
      while ((line = rd.readLine()) != null) {
        System.out.println(line);
      } 
    } 
    catch (MalformedURLException e) {
      System.out.println("Bad url:  " + uploadURL);                
      e.printStackTrace();
    } 
    catch (IOException e) {
      System.out.println("Problem posting to:  " + uploadURL);                
      e.printStackTrace();
    }    
  }

  // Functions for writing to OutputStream (thanks again to Vlad Patryshev (http://www.devx.com/Java/Article/17679/1954?pf=true)
  private String randomString() {
    return Long.toString(generator.nextLong(), 36);
  }

  private void write(String s) throws IOException {
    os.write(s.getBytes());
  }

  private void writeln(String s) throws IOException {
    os.write(s.getBytes());
    newline();
  }

  private void writeParameter(String name, String value, String b) throws IOException {
    boundary(b);
    newline();
    write("Content-Disposition: form-data; name=\"");
    write(name);
    write("\"");
    newline(); 
    newline();
    writeln(value);
  }

  private void pipe(InputStream in, OutputStream out) throws IOException {
    byte[] buf = new byte[500000];
    int nread;
    int navailable;
    int total = 0;
    //synchronized (in) {
    while((nread = in.read(buf, 0, buf.length)) >= 0) {
      out.write(buf, 0, nread);
      total += nread;
    }
    //}
    out.flush();
    in.close();
    buf = null;
  }

  private void writeFile(String name, File file,String b) throws IOException {
    boundary(b);
    newline();
    write("Content-Disposition: form-data; name=\"");
    write(name);
    write("\"");
    write("; filename=\"");
    write(file.getPath());
    write("\"");
    newline();
    write("Content-Type: ");
    String type = URLConnection.guessContentTypeFromName(file.getPath());
    if (type == null) type = "application/octet-stream";
    writeln(type);
    InputStream is = new FileInputStream(file);
    newline();
    pipe(is, os);
    newline();
  }

  private void newline() throws IOException {
    write("\r\n");
  }

  private void boundary(String b) throws IOException {
    write("--");
    write(b);
  }
} 


