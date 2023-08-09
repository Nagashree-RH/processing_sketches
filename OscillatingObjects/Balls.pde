class Balls {

  PVector angle;
  PVector amplitude;
  PVector velocity;
  float x, y;
  Balls() {

    angle =  new PVector(0, 0);
    amplitude = new PVector(random(0, width/2), random(0, height/2));
    velocity = new PVector(random(-0.05, 0.005), random(-0.02, 0.02));
  }


  void calculate() {
  angle.add(velocity);
  }

  void display() {

    x = amplitude.x*sin(angle.x);
    y  = amplitude.y*sin(angle.y);

    pushMatrix();
    translate(width/2, height/2); 
    fill(255);
    stroke(255);
    ellipse(x, y, 50, 50);
    line(0, 0, x, y);
    popMatrix();
  }
}
