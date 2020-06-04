import processing.embroider.*;

PEmbroiderGraphics E;

void setup(){
  
 size(512,512);
 E =  new PEmbroiderGraphics(this,width,height);
 E.setPath("/Users/studio/out.vp3"); // full path, vp3 or dst

 test_hatch_parallel();
 
 E.visualize();
 E.endDraw(); // write out

}

void draw(){

}

void test_hatch_parallel(){
 E.fill(0);
 E.circle(50,50,50);
 E.circle(120,30,120);
 E.quad(10,10,80,3,30,60,0,40);
 
 E.HATCH_MODE = PEmbroiderGraphics.CROSS;
 E.noStroke();
 
 E.beginShape();
 E.vertex(120,120);
 E.vertex(150,250);
 E.vertex(50,240);
 E.vertex(50,200);
 E.vertex(100,220);
 E.vertex(100,120);
 E.endShape(CLOSE);
 
 E.ellipse(200,60,100,50);
 
 E.HATCH_ANGLE = 0;
 E.HATCH_SPARSITY = 8;
 E.HATCH_MODE = PEmbroiderGraphics.PARALLEL;
 E.triangle(250,200,150,250,300,280);
}


void test_hatch_concentric(){
 E.HATCH_MODE = PEmbroiderGraphics.CONCENTRIC;
 E.fill(0,0,255);
 E.stroke(0);
 E.beginShape();
 E.vertex(100,200);
 E.vertex(150,100);
 E.vertex(120,50);
 E.vertex(150,30);
 E.vertex(200,50);
 E.vertex(180,120);
 E.vertex(180,180);
 E.endShape(CLOSE);
 
 
}




void test_cull(){
 E.beginCull();
 test_hatch_concentric();
 E.CIRCLE_DETAIL = 20;
 E.fill(255,0,0);
 E.HATCH_MODE = PEmbroiderGraphics.CONCENTRIC;
 E.circle(50,20,100);
 
 E.circle(50,50,40);
 
 E.endCull();
}


void test_cull2(){
 E.fill(0);
 E.HATCH_MODE = PEmbroiderGraphics.CONCENTRIC;
 E.beginCull();
 for (int i = 0; i < 200; i++){
   E.circle(random(width),random(height),random(30,120));
 }
 E.endCull();
  
}
void test_spiral(){
 E.HATCH_MODE = PEmbroiderGraphics.SPIRAL;
 E.HATCH_SPARSITY = 4;
 E.fill(0,0,255);
 E.noStroke();
 E.beginShape();
 E.vertex(100,200);
 E.vertex(150,100);
 E.vertex(120,50);
 E.vertex(150,30);
 E.vertex(200,50);
 E.vertex(180,120);
 E.vertex(180,180);
 E.endShape(CLOSE);
 
 E.circle(30,30,100);
 
  E.beginShape();
 E.vertex(200,180);
 E.vertex(230,190);
 E.vertex(250,240);
 E.vertex(200,280);
 E.vertex(150,240);
 E.endShape(CLOSE);
 
 E.rect(200,30,90,70);
}


void test_image(){
 E.beginCull();
 stroke(0);
 
 E.fill(255,100,0);
 E.HATCH_MODE = PEmbroiderGraphics.SPIRAL;
 E.circle(0,0,width);
 
 PImage im = loadImage("/Users/studio/Downloads/matisse.png");
 E.fill(0,0,255);

 E.image(im,0,0,width,height);
 
 E.endCull();

}

void test_perlin(){
 E.HATCH_MODE = PEmbroiderGraphics.PERLIN;
 E.noStroke();
 E.fill(0);
 
 E.circle(100,100,500);
 
 E.quad(10,10,80,20,50,90,5,30);
 
 E.rect(100,5,100,100);
}

void test_perlin2(){
 E.HATCH_MODE = PEmbroiderGraphics.PERLIN;
 E.noStroke();
 E.fill(0);
 
 E.circle(0,0,200);
 
 E.HATCH_SPARSITY = 8;
 E.circle(200,0,200);
 
 E.HATCH_SPARSITY = 2;
 E.circle(0,200,200);
 
 E.HATCH_SPARSITY = 4;
 E.HATCH_SCALE = 0.2;
 E.circle(200,200,200);
}


void test_field(){
   class MyVecField implements PEmbroiderGraphics.VectorField{
   public PVector get(float x, float y){
     x*=0.01;
     y*=0.01;
     return new PVector(1,noise(x,y)-0.5).mult(10);
   }
 }

 MyVecField mvf = new MyVecField();
 E.HATCH_MODE = PEmbroiderGraphics.VECFIELD;
 E.HATCH_VECFIELD = mvf;
 
 E.noStroke();
 E.fill(0);
 
 E.circle(100,100,500);
 E.quad(10,10,80,20,50,90,5,30);
 E.rect(100,5,100,100);
 
}
