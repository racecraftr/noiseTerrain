//3d terrain generation program. 
//works well with good gpu.
float xoff = 0;
float yoff = 0;
float zoff = 0;
float change = 0.01;
void setup() {
  size(600, 600, P3D);
  pixelDensity(1);
  frameRate(1000);
}

void draw() {
  pushMatrix();
  rotateX(radians(45));
  rotateZ(radians(0));
  translate(width, 0, -10);
  background(20);
  xoff = 0.0;
  for (int x = -1*width; x < width; x+=4) {
    xoff += change;
    yoff = 0.0;
    for (int y = -1*width; y < height; y+=4) {
      yoff+=change;
      float bright = noise(xoff, yoff, zoff/10)*255;
      //pixels[x+y*width] = color(0, 0, bright);
      stroke(0, bright, 255-bright);
      fill(0, bright, 255-bright);
      strokeWeight(4);
      point((x)-(width/2), (y)-(height/2), (bright-600)*1);
    }
  }
  if (mousePressed) {
    zoff+=0.3;
  } else {
    zoff +=0;
  }
  popMatrix();
}
