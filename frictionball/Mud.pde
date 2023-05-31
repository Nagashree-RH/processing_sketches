class Mud {

  float c = 0.8;
  float x;
  float y;
  float rectWidth;
  float rectHeight;
  PFont f;
  
  
  Mud(float heightOfSurface,float xloc, float yloc) {
    f= createFont("Arial", 36, false);

    x=xloc;
    y=yloc;
    rectWidth = width/2;
    rectHeight =  heightOfSurface;
  }

  void display() {

    noStroke();
    fill(112, 84, 62);
    rect(x, y, rectWidth, rectHeight);
    fill(0);
    text("Mud", x+rectWidth/3, y+rectHeight/2);
  }
}
