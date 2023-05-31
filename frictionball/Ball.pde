class Ball {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float widthBall;
  float heightBall;

  Ball(float dimension,float x, float y) {
    
    location= new PVector(x,y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass=2;
    widthBall=dimension*mass;
    heightBall=dimension*mass;
    
  }


  void display() {
    stroke(2);
    fill(255, 0, 0);
    ellipse(location.x, location.y, widthBall, heightBall);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector f =PVector.div(force, mass);
    acceleration.add(f);
    println(acceleration);
  }
}
