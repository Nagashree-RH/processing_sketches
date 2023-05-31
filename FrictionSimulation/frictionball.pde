Ice ice;
Mud mud;
Ball b;

void setup() {

  size(1080, 500);
  float heightOfSurafce = 80;
  float ballDimension = 50;
  ice = new Ice(heightOfSurafce,0, height-heightOfSurafce);
  mud = new Mud(heightOfSurafce,width/2, height-heightOfSurafce);
  b= new Ball(ballDimension,0,height-(heightOfSurafce+ballDimension));
}



void draw() {

  background(128); 
  ice.display(); 
  mud.display();

  PVector gravity = new PVector(0.2, 0);
  gravity.mult(b.mass);
  b.applyForce(gravity);

  float coEfficient;

  if (b.location.x<width/2) {

    coEfficient= ice.c;
  } else
    coEfficient=mud.c;
    

  //Friction force = -1*mu(co-effiient of friction)*v^ (unit vector)
  
  PVector friction = b.velocity.get();
  friction.normalize();
  friction.mult(-1);
  friction.mult(coEfficient);
  println(friction);
  b.applyForce(friction);

  b.display();
  b.update();
}
