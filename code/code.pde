Personaggio ron;
Castello hogwarts;
int skyColor = 255;

void setup() {
  fullScreen(P3D);
  ron = new Personaggio("ron.obj", width*0.1, height/2);
  hogwarts = new Castello ("castle.obj", width*0.9, height/2);
}

void draw() {
  background(0,0,skyColor);
  skyColor-=2;
  lights();
  
  ron.display();
  ron.confundo();
  ron.avanza(width*0.1, hogwarts.x);
  ron.ferma(width*0.1, hogwarts.x);
  //ron.ferma(width*0.1,  width*0.9);
  
  hogwarts.display();
}

//classe per creare il personaggio
class Personaggio {
 PShape personaggio;
 float x; 
 float y;
 float xStep = 5;
 
  Personaggio (String filename, float x, float y){
    this.x = x;
    this.y = y;
    
    personaggio = loadShape (filename);
    personaggio.setFill (#FF0000);
  }
  
  void display (){
    
    //text (x, width/2, height/2);
    
    shape ( personaggio, x, y );
  }
  
  void avanza ( float xPersonaggio, float xTragaurdo ){
     
    if ( xPersonaggio < xTragaurdo ){
     
      xStep = 3;
      x += xStep;
    }
  }
  
  void confundo (){
   
    if ( mousePressed ){
     
      personaggio.rotateY(0.5);
      personaggio.rotateX(0.10);
      xStep = 0;
    }
  }
  
  void ferma(float xPersonaggio, float xTragaurdo ){
   
    if ( xPersonaggio > xTragaurdo ){
     
      xStep = 0;
      x += xStep;
    }
  }
}

//Classe per creare il castello
class Castello {
  PShape castello;
  float x; 
  float y;
  
  Castello (String filename, float x, float y){
    
    this.x = x;
    this.y = y;
    
    castello = loadShape (filename);
    castello.setFill (#CBC9C7);
  }
  
   void display (){
    
    shape ( castello, x, y );
  }
}
