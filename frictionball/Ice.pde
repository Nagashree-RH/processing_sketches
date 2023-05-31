class Ice {

  PFont f; 
  float c = 0.3;
  float x;
  float y;
  float rectWidth;
  float rectHeight;
  
  Ice(float heightOfSurface,float xloc, float yloc) {
    f= createFont("Arial", 36, false);
    x=xloc;
    y=yloc;
    rectWidth = width/2;
    rectHeight = heightOfSurface;
  }

  void display() {


    noStroke();
    fill(165, 242, 243);

    rect(x, y, rectWidth, rectHeight);
    fill(0);
    textFont(f, 36);
    text("Ice", x+rectWidth/3, y+rectHeight/2);
  }
}
