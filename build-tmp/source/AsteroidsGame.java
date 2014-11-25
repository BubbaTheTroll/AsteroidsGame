import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class AsteroidsGame extends PApplet {

SpaceShip Bubba;

ArrayList <Asteroid> Flubba;
//Asteroid[] Flubba;

//your variable declarations here
public void setup() 
{
  size(800,800);
  Bubba = new SpaceShip();
  Flubba = new ArrayList <Asteroid>();
  //Flubba = new Asteroid[30];
  
  for(int nI = 0; nI < 10; nI++){
    Flubba.add(new Asteroid());
  }//your code here
}
public void draw() 
{
  background(0,0,0);
  Bubba.show();
  Bubba.move();
  for (int nI = 0; nI < Flubba.size(); nI++){
    Flubba.get(nI).show();
    Flubba.get(nI).move();
    
    if(dist((float)Flubba.get(nI).myCenterX, (float)Flubba.get(nI).myCenterY, (float)Bubba.myCenterX, (float)Bubba.myCenterY) < 20){
      
        Flubba.remove(nI);
      
    }  
  }
  

  //your code here
}
public void keyPressed()
{
    float accelSpeed = .5f;
    if (keyPressed && keyCode == LEFT){
      Bubba.myPointDirection -= 20;
    } else if (keyPressed && keyCode == RIGHT){
      Bubba.myPointDirection += 20;
    } if (keyPressed && keyCode == UP){
      Bubba.accelerate(accelSpeed);
    } else if (keyPressed && keyCode == DOWN){
      Bubba.accelerate(-accelSpeed);
    } 
    if (keyPressed && key == '2' ){
      
      Bubba.myCenterX = Math.random()*500;
      Bubba.myCenterY = Math.random()*500;
    }
} 
class SpaceShip extends Floater  
{   
    private SpaceShip(){
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16;
      yCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = -2;
      yCorners[3] = 0;
      myColor = color(255,0,0);
      myCenterX =  320;
      myCenterY =  240;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = -50;

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
      xCorners[0] = 10;
      yCorners[0] = 10;
      xCorners[1] = 20;
      yCorners[1] = 10;
      xCorners[2] = 25;
      yCorners[2] = 20;
      xCorners[3] = 20;
      yCorners[3] = 30;
      xCorners[4] = 10;
      yCorners[4] = 30;
      xCorners[5] = 5;
      yCorners[5] = 20;
      myColor = color(255,0,0);
      myCenterX =  Math.random()*800;
      myCenterY =  0;
      myPointDirection = Math.random()*6-3;

      myDirectionX = Math.random()*3 - 1;
      myDirectionY = Math.random()*3 - 1;
      

      
      holdSpeed = (int)(Math.random()*5+1);
       if (Math.random() < .5f){
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

}

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


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "AsteroidsGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
