/**
 Oscillating objects
 
 @Author - Nagashree R H
 Version - 1.0 
 Description - Demonstration of array of balls oscillating in x and y axis. 
 */




Balls[] balls = new Balls[12];

void setup() {
  size(1080, 1080);
  for (int i =0; i<balls.length; i++) {
    balls[i] = new Balls();
  }
}


void draw() {

  background(0);
  for (int i =0; i<balls.length; i++) {


    balls[i].calculate();
    balls[i].display();
  }
}
