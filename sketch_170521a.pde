ArrayList<Sphere> balls = new ArrayList();
PImage background;
String[] images = {"earth.jpg", "moon.jpg", "jupiter.jpg", "mars.jpg", "pluto.jpg", "saturn.jpg", "neptune.jpg"};

float gravity = 0.1;

void setup() {
  size (640, 480, P3D);
  smooth();
  background = loadImage("background.jpg");
}

void mouseClicked() {
  int randFile = (int) random(0, images.length);
  Sphere temp_ball = new Sphere(images[randFile]);
  balls.add(temp_ball);
}

void draw() {
  background(background);
  squareSetUp();

  stroke(255);
  for (Sphere currBall : balls) {
    pushMatrix();
    currBall.location.add(currBall.velocity);
    currBall.velocity.add(currBall.gravity);
    translate (currBall.location.x, currBall.location.y, -currBall.location.z);
    currBall.sphereShape = createShape(SPHERE, 50);
    currBall.sphereShape.setStroke(false);
    currBall.sphereShape.setTexture(currBall.image);
    shape(currBall.sphereShape);
    cornerDetection(currBall);
    popMatrix();
  }
}

class Sphere {
  PVector location = new PVector(mouseX, mouseY, random(0, 1));
  PVector velocity = new PVector(random(-5, 5), random(-3.5, 3.5), 1);
  PVector gravity = new PVector(0, 0.2);
  String fileName;
  PImage image;
  PShape sphereShape;

  Sphere(String fileNameArg) {
    fileName = fileNameArg;
    image = loadImage(fileName);
  }
}

void cornerDetection(Sphere currBall) {
  if (currBall.location.x>width-50 || currBall.location.x<50) {
    currBall.velocity.x *= -0.95;
  }

  if (currBall.location.y>height-50) {
    currBall.velocity.y *= -0.95;
  }

  if (currBall.location.y<50) {
    currBall.velocity.y *= -0.95;
    currBall.location.y = height;
  }

  if (currBall.location.z<0 || currBall.location.z>500) {
    currBall.velocity.z *= -1;
  }
}

void squareSetUp() {
  // create perspective lines
  line(0, 0, -500, 0, 0, 0);
  line(width, 0, -500, width, 0, 0);
  line(0, height, -500, 0, height, 0);
  line(width, height, -500, width, height, 0);
  
  // create the background square
  line(0, 0, -500, width, 0, -500);
  line(0, 0, -500, 0, height, -500);
  line(0, height, -500, width, height, -500);
  line(width, height, -500, width, 0, -500);
}