//3d terrain generation program. 
//works well with good gpu.
float xoff = 0;
float yoff = 0;
float zoff = 0;
float change = 0.01;
int factor = 13;
void setup(){
  size(600, 600, P3D);
  pixelDensity(1);
  frameRate(1000);
}

void draw(){
  pushMatrix();
  rotateX(radians(45));
  rotateZ(radians(0));
  translate(width, height/-2, 0);
  background(20);
  xoff = 0.0;
  for(int x = -1*width; x < width; x+=4){
    xoff += change;
    yoff = 0.0;
    for(int y = -1*height; y < height; y+=4){
      yoff+=change;
      float bright = noise(xoff, yoff, zoff/10)*255;
      //pixels[x+y*width] = color(0, 0, bright);
      stroke((int)(bright*1.5/factor)*factor,0, (int)((200-bright)*1.5/factor)*factor);
      strokeWeight(3.5);
      point((x*2)-(width/2), (y*2)-(height/2), (int)((bright-590)*2.4/factor)*factor);
    }
  }
  if(mousePressed){
    zoff+=0.25;
  }
  else{
    zoff +=0;
  }
  popMatrix();
}