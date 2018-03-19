import controlP5.*;
import processing.pdf.*;
boolean record;
ControlP5 cp5;
float r = 250;
float petalLen;
int resolution = 100;
float theta;
float x;
float y;
float k;
float n = 5;
float d = 40;
float c = 0;
int index = 0;
float animationVal1;

void setup() {
  size(600, 600);
  cp5 = new ControlP5(this);

  cp5.addSlider("resolution")
    .setLabel("Number of Points")
    .setPosition(20, 20)
    .setRange(20, 360*2)
    ;

  cp5.addSlider("r")
    .setLabel("Radius")
    .setPosition(20, 32)
    .setRange(20, 300)
    ;

  cp5.addSlider("n")
    .setLabel("n Value")
    .setPosition(20, 44)
    .setRange(0, 50)
    .setNumberOfTickMarks(51);

  cp5.addSlider("d")
    .setLabel("d Value")
    .setPosition(20, 56)
    .setRange(0, 100)
    .setNumberOfTickMarks(51);

  cp5.addSlider("c")
    .setLabel("Offset Value")
    .setPosition(20, 68)
    .setRange(0, 1)
    ;
}

void draw() {
  animationVal1 = d;
  if (record == true) {
    beginRecord(PDF, "testest.pdf");
  }
  background(255);
  pushMatrix();
  translate(width*0.5, height*0.5);
  fill(100);
  stroke(255);
  k = n / d;
  beginShape();
  for (int i = 0; i < resolution; i++) {
    theta = map(i*ceil(animationVal1), 0, resolution, 0, TWO_PI);
    petalLen = sin(n*theta);
    x = r * petalLen * sin(theta);
    y = r * petalLen * cos(theta);
    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
  if (record == true) {
    endRecord();
    record = false;
  }
  if(frameCount % 25 == 0) {
      index = index + 1;
  }
}
void mousePressed() {
  record = true;
}