PVector[] blockMove = new PVector[5];
PVector[] blockVel = new PVector[5];
int[] blockColorR = new int[5]; 
int[] blockColorG = new int[5]; 
int[] blockColorB = new int[5]; 
float[] blockSize = new float[5];
Boolean[] blockHit = new Boolean[5]; 
int moveSpeed = 30;
float playerSize = 15; 
float posX; 
float posY; 

void setup() { 
  size(600, 600); 
   for (int i=0; i<5; i++) {
   blockMove[i] = new PVector(int(random(50,100)),int(random(50,100))); 
   blockVel[i] = new PVector(int(random(2,4)),int(random(2,4)));
   blockSize[i] = 10*(i);
   blockColorR[i] = 255; 
   blockColorG[i] = 0;
   blockColorB[i] = 255; 
   blockHit[i] = false; 
   posX = 299;
   posY = 299;    
  }
  
}
void draw() {
  background(255); 
  for (int i=0; i<5; i++) {
    blockMove[i].add(blockVel[i]); 
    
    if ((blockMove[i].x > width) || (blockMove[i].x < 0)) {
      blockVel[i].x = blockVel[i].x * -1; 
    } 
    if ((blockMove[i].y > height) || (blockMove[i].y < 0)) {
      blockVel[i].y = blockVel
      [i].y * -1; 
    }   
    
    stroke(0); 
    fill(blockColorR[i], blockColorG[i], blockColorB[i]); 
    ellipse(blockMove[i].x, blockMove[i].y, blockSize[i], blockSize[i]); 
  }
  
    fill(255, 255, 0);
    ellipse(posX, posY, playerSize, playerSize);
    
   
    for(int i=0; i<5; i++){
      float distance = dist(posX,posY,blockMove[i].x, blockMove[i].y);
       
       if(distance < (playerSize/2 + blockSize[i]/2) && blockHit[i] == false) {      
         if(playerSize > blockSize[i]) {
           blockColorR[i] = 255; blockColorG[i] = 255; blockColorB[i] = 255;
           playerSize += 10;
           blockHit[i] = true;  
           println("Hit block " + i + " ."); 
         } else if (playerSize < blockSize[i]) {
           setup();
       } 
    } 
  }
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == UP) {
      println("Up Pressed"); 
      posY -= moveSpeed;
    } 
    if(keyCode == DOWN) {
      posY += moveSpeed;
    }
    if(keyCode == LEFT) {
      posX -= moveSpeed;
    }
    if(keyCode == RIGHT) {
      posX += moveSpeed;  
    }

  }
}
