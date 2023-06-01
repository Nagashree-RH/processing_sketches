class Ball {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass=0;
  float ballDimension=40;

  Ball() {

    location = new PVector(random(width), 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(0.5, 3);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(0); 
    ellipse(location.x, location.y, ballDimension*mass, ballDimension*mass);
  }

  void edges() {
    if (location.y>=height) {
      location.y=height;
      velocity.y*=-1;
    }
  }

  void applyForce(PVector f) {
    PVector force = PVector.div(f, mass);
    acceleration.add(force);
  }
}
