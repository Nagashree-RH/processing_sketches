PImage srcImage;
PImage grayscaleImage;
void setup() {

  size(3840, 2160);

  //loading the image from the data folder
  srcImage = loadImage("image.jpg");
  grayscaleImage=  createImage(srcImage.width, srcImage.height, ALPHA);
}

void draw() {

  //displaying the image on the screen
  image(srcImage, 0, 0);

  srcImage.loadPixels();
  //Need to consider every pixel and change the color value of the pixel to gray scale.

  for (int x =0; x<srcImage.width; x++) {
    for (int y =0; y< srcImage.height; y++) {
      int loc = x+y*srcImage.width;
      float r = red(srcImage.pixels[loc]);
      float g = green(srcImage.pixels[loc]);
      float b = blue(srcImage.pixels[loc]);

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
