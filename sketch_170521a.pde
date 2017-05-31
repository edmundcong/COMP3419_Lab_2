Sphere init_ball;
ArrayList<Sphere> balls = new ArrayList();
// end of variables

float gravity = 0.1;

void setup() {
  init_ball = new Sphere((int) random(0, 640), (int) random(0, 480), 1);
  balls.add(init_ball);
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
    currBall.location.add(currBall.velocity);
    currBall.velocity.add(currBall.gravity);
    translate (currBall.location.x, currBall.location.y, -currBall.location.z);
    sphere(50);
    noFill();

    cornerDetection(currBall);
  }
}

class Sphere {
  PVector location = new PVector(100, 100, 1);
  PVector velocity = new PVector(1.5, 2.1, 1);
  PVector gravity = new PVector(0, 0.2);

  Sphere(int x, int y, int z) {
    x = y = z = 5;
  }
}

void cornerDetection(Sphere currBall) {
  if (currBall.location.x>width-50) {
    currBall.velocity.x *= -0.95;
  }

  if (currBall.location.y>height-50) {
    currBall.velocity.y *= -0.95;
  }

  if (currBall.location.z>500) {
    currBall.velocity.z *= -1;
  }

  if (currBall.location.x<50) {
    currBall.velocity.x *= -0.95;
  }

  if (currBall.location.y<50) {
    currBall.velocity.y *= -0.95;
    currBall.location.y = height;
  }

  if (currBall.location.z<0) {
    currBall.velocity.z *= -1;
  }
  //println("x speed: " + currBall.xSpeed);
  //println("y speed: " + currBall.ySpeed);
  //println("z speed: " + currBall.zSpeed);
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