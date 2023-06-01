Ball[] b = new Ball[5];
Liquid liquid;

void setup() {
  size(1080, 1080);
  liquid = new Liquid();
  for (int i=0; i<b.length; i++) {
    b[i] = new Ball();
  }
}

void draw() {

  background(255);
  liquid.display();

  for (Ball ball : b) {

    if (liquid.inLiquid(ball)) {
      PVector force = liquid.calcDrag(ball);
      ball.applyForce(force);
    }
    PVector gravity = new PVector(0, 0.1);
    gravity.mult(ball.mass);
    ball.applyForce(gravity);


    ball.update();
    ball.edges();
    ball.display();
  }
}
