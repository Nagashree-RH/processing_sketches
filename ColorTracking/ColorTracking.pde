import processing.video.*;

private Movie video;
private color trackingColor;
private int threshold = 30;
private float tr, tg, tb;
void setup() {

  size(1500, 1000);
  //There are two videos, any video can be used.
  video = new Movie(this, "pen.mp4");
  video.play();
}

void movieEvent(Movie video) {
  video.read();
}

void draw() {
  video.loadPixels();
  image(video, 0, 0);


  int sumX = 0;
  int sumY = 0;
  int count = 0;

  for (int x =0; x<video.width; x++) {
    for (int y=0; y<video.height; y++) {

      int loc = x+y*video.width;
      color currentColor = video.pixels[loc];
      //faster way to get rgb values
      float cr =  currentColor >> 16 & 0xFF;
      float cg = currentColor >> 8 & 0xFF;
      float cb = currentColor & 0xFF;
      float d = distanceSquare(cr, cg, cb, tr, tg, tb);

      if (d<threshold*threshold) {
        sumX+=x;
        sumY+=y;
        count++;
      }
    }
  }

  if (count>5) {
    int avgX = sumX/count;
    int avgY = sumY/count;
    stroke(0);
    strokeWeight(3);
    fill(255, 0, 0);
    ellipse(avgX, avgY, 30, 30);
  }
}

/** Using the below function instead of dist function which gives squareroot.
 This is faster in terms of calculation.
 */
float distanceSquare(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1)+(y2-y1)*(y2-y1)+(z2-z1)*(z2-z1);
  return d;
}

//Click on the color you want to track. In this example, using the blue part of the pen end to track.
void mousePressed() {
  video.loadPixels();
  int loc = mouseX+mouseY*video.width;
  trackingColor = video.pixels[loc];
  tr =  trackingColor >> 16 & 0xFF;
  tg = trackingColor >> 8 & 0xFF;
  tb = trackingColor & 0xFF;
}
