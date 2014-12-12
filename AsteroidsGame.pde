SpaceShip Bubba;

ArrayList <Asteroid> Flubba;
ArrayList <Bullet> Bulla;
//Asteroid[] Flubba;

//your variable declarations here
public void setup() 
{
  size(800,800);
  Bubba = new SpaceShip();
  Bulla = new ArrayList <Bullet>();
  Flubba = new ArrayList <Asteroid>();
  //Flubba = new Asteroid[30];
  
  for(int nI = 0; nI < 50; nI++){
    Flubba.add(new Asteroid());
  }//your code here
}

public void draw() 
{
  background(0,0,0);
  Bubba.show();
  Bubba.move();
  
  for(int nI = 0; nI<Bulla.size(); nI++){
      Bulla.get(nI).show();
      Bulla.get(nI).move();
      
      //flubba loop
    }
  for (int nJ = 0; nJ < Flubba.size(); nJ++){
      Flubba.get(nJ).show();
      Flubba.get(nJ).move();
  }  
  for(int nI = 0; nI < Bulla.size(); nI++) {
    for(int nJ = 0; nJ < Flubba.size(); nJ++){
      if(dist((float)Bulla.get(nI).getX(), (float)Bulla.get(nI).getY(), (float)Flubba.get(nJ).getX(), (float)Flubba.get(nJ).getY()) < 20){
        Flubba.remove(nJ);
      }
    }
  } 
  }  

  
  
  
  

  //your code here



public void keyPressed()
{
    float accelSpeed = .5;
    if (keyCode == LEFT){
      Bubba.myPointDirection -= 20;
      
    } else if (keyCode == RIGHT){
      Bubba.myPointDirection += 20;
    } if (keyCode == UP){
      Bubba.accelerate(accelSpeed);
    } else if (keyCode == DOWN){
      Bubba.accelerate(-accelSpeed);
    } 
    if (key == '2' ){
      
      Bubba.myCenterX = Math.random()*500;
      Bubba.myCenterY = Math.random()*500;
    }
    if(key == '1'){
      
        Bulla.add(new Bullet(Bubba));
      

    }

} 

class SpaceShip extends Floater  
{   
    private SpaceShip(){
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = (int)myCenterX-8;
      yCorners[0] = (int)myCenterY-8;
      xCorners[1] = (int)myCenterX+16;
      yCorners[1] = (int)myCenterY;
      xCorners[2] = (int)myCenterX-8;
      yCorners[2] = (int)myCenterY+8;
      xCorners[3] = (int)myCenterX-2;
      yCorners[3] = (int)myCenterY;
      myColor = color(255,0,0);
      myCenterX =  240;
      myCenterY =  240;
      myPointDirection = 50;
      myDirectionX = 0;
      myDirectionY = 0;
      

    }

    public void setX(int x){myCenterX = x;}
    public void setY(int y){myCenterY = y;}
    public void setDirectionX(double dirx){myDirectionX = dirx;}
    public void setDirectionY(double diry){myDirectionY = diry;}
    public void setPointDirection(int degrees){myPointDirection = degrees;} 

    public int getX(){return (int)myCenterX;}
    public int getY(){return (int)myCenterY;}
    public double getDirectionX(){return myDirectionX;}
    public double getDirectionY(){return myDirectionY;}
    public double getPointDirection(){return myPointDirection;}



}

class Asteroid extends Floater
{
    int holdSpeed;
    private Asteroid(){
      corners = 6;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = (int)myCenterX-5;
      yCorners[0] = (int)myCenterY-5;
      xCorners[1] = (int)myCenterX+5;
      yCorners[1] = (int)myCenterY-5;
      xCorners[2] = (int)myCenterX+10;
      yCorners[2] = (int)myCenterY;
      xCorners[3] = (int)myCenterX+5;
      yCorners[3] = (int)myCenterY+5;
      xCorners[4] = (int)myCenterX-5;
      yCorners[4] = (int)myCenterY+5;
      xCorners[5] = (int)myCenterX-10;
      yCorners[5] = (int)myCenterY;
      myColor = color(255,0,0);
      myCenterX =  Math.random()*800;
      myCenterY =  0;
      myPointDirection = Math.random()*6-3;

      myDirectionX = Math.random()*3 - 1;
      myDirectionY = Math.random()*3 - 1;
      

      
      holdSpeed = (int)(Math.random()*5+1);
       if (Math.random() < .5){
         holdSpeed = -1 * holdSpeed;
       } else
       {
        holdSpeed = holdSpeed;
       }
    }



    public void setX(int x){myCenterX = x;}
    public void setY(int y){myCenterY = y;}
    public void setDirectionX(double dirx){myDirectionX = dirx;}
    public void setDirectionY(double diry){myDirectionY = diry;}
    public void setPointDirection(int degrees){myPointDirection = degrees;} 

    public int getX(){return (int)myCenterX;}
    public int getY(){return (int)myCenterY;}
    public double getDirectionX(){return myDirectionX;}
    public double getDirectionY(){return myDirectionY;}
    public double getPointDirection(){return myPointDirection;}

     public void move(){
       myPointDirection+=holdSpeed;
       myCenterX += myDirectionX;    
       myCenterY += myDirectionY; 
       super.move();
      }

};

class Bullet extends Floater
{
    
    
    private Bullet(SpaceShip theShip){
      corners = 5;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = (int)myCenterX+2;
      yCorners[0] = (int)myCenterY;
      xCorners[1] = (int)myCenterX+1;
      yCorners[1] = (int)myCenterY+1;
      xCorners[2] = (int)myCenterX-2;
      yCorners[2] = (int)myCenterY+1;
      xCorners[3] = (int)myCenterX-2;
      yCorners[3] = (int)myCenterY-1;
      
      xCorners[4] = (int)myCenterX+1;
      yCorners[4] = (int)myCenterY-1;
      myColor = color(255,0,0);
      myCenterX =  theShip.getX();
      myCenterY =  theShip.getY();
      myPointDirection = theShip.getPointDirection();
      double dRadians = myPointDirection*(Math.PI/180);
      myDirectionX = 5*Math.cos(dRadians)+theShip.getDirectionX();
      myDirectionY = 5*Math.sin(dRadians)+theShip.getDirectionY();
      
      
    }

    public void setX(int x){myCenterX = x;}
    public void setY(int y){myCenterY = y;}
    public void setDirectionX(double dirx){myDirectionX = dirx;}
    public void setDirectionY(double diry){myDirectionY = diry;}
    public void setPointDirection(int degrees){myPointDirection = degrees;} 

    public int getX(){return (int)myCenterX;}
    public int getY(){return (int)myCenterY;}
    public double getDirectionX(){return myDirectionX;}
    public double getDirectionY(){return myDirectionY;}
    public double getPointDirection(){return myPointDirection;}
    
    


    
      public void move(){
       
       myCenterX += myDirectionX;    
       myCenterY += myDirectionY; 
       super.move();
       
      }


};

    //your code here

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE); 
    fill(255,20,60);
    
  }
    
} 


