import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

//Objects
Player p1;
Platform platform1;
Platform platform2;
Platform platform3;
Platform platform4;

//Images
PImage playerImg;
PImage icePlatformImg;
void setup()
{
  fullScreen(P3D);
  colorMode(HSB);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -100);
  box2d.setContinuousPhysics(true);
  
  playerImg = loadImage("Prithvi.png");
  icePlatformImg = loadImage("ice_platform.png");
  playerImg.resize(200,300);
  p1 = new Player(width/2, 0, playerImg, true);
  
  int w = icePlatformImg.width;
  
  platform1 = new Platform(0, height, icePlatformImg, true);
  platform2 = new Platform(w, height, icePlatformImg, true);
  platform3 = new Platform(2*w, height, icePlatformImg, true);
  platform4 = new Platform(3*w, height, icePlatformImg, true);
}

void draw()
{
  background(200);
  
  box2d.step();
  
  p1.Draw();
  p1.Update();
  
  platform1.Draw();
  platform2.Draw();
  platform3.Draw();
  platform4.Draw();
  
}