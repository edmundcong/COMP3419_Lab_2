Sphere init_ball;
ArrayList<Sphere> balls = new ArrayList();
// end of variables

float gravity = 0.1;

void setup() {
  init_ball = new Sphere((int) random(0, 640), (int) random(0, 480), 1);
  balls.add(init_ball);
  //Sphere second_ball = new Sphere(250, 150, 1);
  //balls.add(second_ball);
  size (640, 480, P3D);
  smooth();
}

void mouseClicked() {
  Sphere temp_ball = new Sphere((int) random(0, 640), (int) random(0, 480), 1);
  balls.add(temp_ball);
}

void draw() {
  background(1);

  squareSetUp();

  // box setup

  stroke(255);
  for (Sphere currBall : balls) {
    translate (currBall.xPos, currBall.yPos, -currBall.zPos);
    sphere(50);
    noFill();

    // location
    currBall.xPos = currBall.xPos + (currBall.xSpeed * currBall.xDirection);  
    currBall.yPos = currBall.yPos + (currBall.ySpeed * currBall.yDirection); 
    currBall.zPos = currBall.zPos + (currBall.zSpeed * currBall.zDirection);

    // speed
    currBall.xSpeed = currBall.xSpeed + gravity;
    currBall.ySpeed = currBall.ySpeed + gravity;
    currBall.zSpeed = currBall.zSpeed + gravity;


    cornerDetection(currBall);
  }
}

class Sphere {
  float xPos=320;
  float yPos=240;
  float zPos=1;

  float xSpeed=2;
  float ySpeed=2;
  float zSpeed=2;

  int xDirection=1;
  int yDirection=1;
  int zDirection=1;

  Sphere(int x, int y, int z) {
    xPos = x;
    yPos = y;
    zPos = z;
  }
}

void cornerDetection(Sphere currBall) {
  if (currBall.xPos>width-50) {
    currBall.xSpeed *= 0.98;
    currBall.ySpeed *= 0.98;
    currBall.zSpeed *= 0.98;
    currBall.xDirection*=-1;
  }

  if (currBall.yPos>height-50) {
    currBall.xSpeed *= 0.98;
    currBall.ySpeed *= 0.98;
    currBall.zSpeed *= 0.98;    
    currBall.yDirection*=-1;
  }

  if (currBall.zPos>500) {
    currBall.xSpeed *= 0.98;
    currBall.ySpeed *= 0.98;
    currBall.zSpeed *= 0.98;    
    currBall.zDirection*=-1;
  }

  if (currBall.xPos<50) {
    currBall.xSpeed *= 0.98;
    currBall.ySpeed *= 0.98;
    currBall.zSpeed *= 0.98;
    currBall.xDirection*=-1;
  }

  if (currBall.yPos<50) {
    currBall.xSpeed *= 0.98;
    currBall.ySpeed *= 0.98;
    currBall.zSpeed *= 0.98;
    currBall.yDirection*=-1;
  }

  if (currBall.zPos<0) {
    currBall.xSpeed *= 0.98;
    currBall.ySpeed *= 0.98;
    currBall.zSpeed *= 0.98;
    currBall.zDirection*=-1;
  }
  println("x speed: " + currBall.xSpeed);
  println("y speed: " + currBall.ySpeed);
  println("z speed: " + currBall.zSpeed);
}

void squareSetUp() {
  // background square

  line(0, 0, -500, width, 0, -500);
  line(0, 0, -500, 0, height, -500);
  line(0, height, -500, width, height, -500);
  line(width, height, -500, width, 0, -500);

  // perspective lines

  line(0, 0, -500, 0, 0, 0);
  line(width, 0, -500, width, 0, 0);
  line(0, height, -500, 0, height, 0);
  line(width, height, -500, width, height, 0);
}