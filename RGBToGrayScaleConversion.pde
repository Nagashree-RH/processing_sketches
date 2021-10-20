PImage image;
PImage grayscaleImage;
void setup() {

  size(3840, 2160);

  //loading the image from the data folder
  image = loadImage("image.jpg");
  grayscaleImage=  createImage(image.width, image.height, ALPHA);
}


void draw() {

  //displaying the image on the screen
  image(image, 0, 0);

  image.loadPixels();
  //Need to consider every pixel and change the color value of the pixel to gray scale.

  for (int x =0; x<image.width; x++) {
    for (int y =0; y< image.height; y++) {
      int loc = x+y*image.width;
      float r = red(image.pixels[loc]);
      float g = green(image.pixels[loc]);
      float b = blue(image.pixels[loc]);

      //Weighted or luminosity method
      float weightedValue = 0.299*r + 0.587*g + 0.114*b;
      grayscaleImage.pixels[loc] = color(weightedValue);
    }
  }
}

void keyPressed() {

  //press the letter l to display the grayscale image on the screen
  if (keyCode =='l'|| keyCode == 'L') {
    image(grayscaleImage, 0, 0);
  }
}
