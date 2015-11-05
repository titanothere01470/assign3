final int GAME_START= 0 , GAME_RUN = 1 ; 
final int COUNT = 5;
PImage shipImg;
PImage background1;
PImage background2;
PImage hp;
PImage enemy;
PImage treasure;
PImage start1;
PImage start2;

int x;
int ex,ey;   // enemy x.y coordinate
int tx,ty;   // treasure x.y coordinate
int sx,sy;   // ship x.y coordinate
int z;       // hp width
int speed;
int gameState;
int spacingX;
int spacingY;
boolean upPressed = false; 
boolean downPressed = false; 
boolean rightPressed = false; 
boolean leftPressed = false; 


void setup () {
  size(640, 480) ;
  x =  0;
  ex = 0;
  ey = floor(random(0,400));
  tx = floor(random(0,600));   
  ty = floor(random(0,450));
  z = 40; 
  sx = 580;
  sy = 240;
  speed = 3;
  spacingX = width/(2*COUNT);
  spacingY = height/(2*COUNT);
  shipImg = loadImage("img/fighter.png");
  background1 = loadImage("img/bg1.png");
  background2 = loadImage("img/bg2.png");
  hp = loadImage("img/hp.png");
  enemy = loadImage("img/enemy.png");
  treasure = loadImage("img/treasure.png");
  start1= loadImage("img/start1.png");
  start2= loadImage("img/start2.png");
  gameState =  GAME_START;
}

void draw() {
  //game start
  switch(gameState){
    case GAME_START:
      image (start1,0,0);
      if( mouseX>200 && mouseX<460 && mouseY>358 && mouseY<415  ){
        image (start2,0,0);
        if(mousePressed){
          gameState = GAME_RUN;
        }
      }
      break;
    case GAME_RUN:
      //background
      image (background1,x,0);
      image (background2,x-640,0);
      image (background1,x-1280,0);
      x ++;
      x%=1280;
 
      // blood           
      stroke(255,0,0);
      fill(255,0,0);
      rect(10,13,z,25);
      image (hp,5,10);         
      
      //ship
      image (shipImg,sx,sy);
      //ship control
      if(upPressed){
        sy += -speed;            
      }
      if(downPressed){
        sy += speed;        
      }
      if(rightPressed){
        sx += speed;
      }
      if(leftPressed){
        sx += -speed;
      }
     
     // boundry detection
     if(sy < 5){              // ship Y boundry detection
          sy = 5;
      }  
      if(sy > height-55){       // ship Y boundry detection
          sy = height-55;
      }
      if(sx > width-50){        // ship X boundry detection
          sx = width-50;
      }  
      if(sx < 5){              // ship X boundry detection
          sx = 5;
      }             
          
      //treasure
      image (treasure,tx,ty);
      
      //enemy
      for(int i = 0;i<COUNT;i++){
         ex = i*spacingX;
         image (enemy,ex,ey); 
      }  
      
      if(x>320){
         ex = width/2-spacingX;  
        for(int i = 0;i<COUNT;i++){
          ey = i*spacingY;
          image (enemy,ex,ey);
          ex -= spacingX;  
      }
       
  }
   }
}
  

void keyPressed(){
  if(key == CODED){ 
    switch(keyCode){
      case UP:
        upPressed = true;        
        break;
      case DOWN:
        downPressed = true;        
        break;
      case RIGHT:
        rightPressed = true;        
        break;
      case LEFT:
        leftPressed = true;        
        break;      
    } 
  }
}

void keyReleased(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;      
    } 
  }
}    
