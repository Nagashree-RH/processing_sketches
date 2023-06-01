class Liquid {

  float x;
  float y;
  float widthRect;
  float heightRect;

  Liquid() {
    x=0;
    y=height/2;
    widthRect = width;
    heightRect=height/2;
  }

  /**
   *Calculation of drag force inside liquid = -1/2*ro*||v2||*A*v^*Cd
   * 1/2, ro(density of the liquid), A surface area considered to be 1 
   *Cd - co eifficient of drag , all this becomes a constant
   *so exp boils down to force = -C*||v^2||*v^;
   *direction = -1*unit vector of velocity
   *magnitude = v^2*constant
   **/

  PVector calcDrag(Ball b) {

    PVector drag = b.velocity.get();
    float speed  = drag.magSq();

    //Direction
    drag.setMag(-1);

    //Magnitude
    float constantOfDrag=0.03;
    drag.mult(constantOfDrag*speed);

    return drag;
  }

  void display() {

    fill(125);
    rect(x, y, widthRect, heightRect);
    fill(0);
    textSize(40);
    text("Liquid", x+50, y+50);
  }

  /**
   *Checking if the ball is in the liquid
   *
   **/
  boolean inLiquid(Ball b) {
    if (b.location.x>=x && b.location.x <x+widthRect && b.location.y>=y && b.location.y<y+heightRect)
      return true;
    else 
    return false;
  }
}
