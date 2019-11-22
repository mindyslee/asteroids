//fix poiunts
//fix asteroids

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

ArrayList<GameObject> objects;

boolean w, a, s, d, e, space, alive;
int shipsize;
int bulletsize, objectsize;
int mode;
int lives;
int score;
int x, y;
PImage shippic;
PImage battlefield;
PImage asteroidpic;
PImage mars;
PImage[] gif;
PImage UFO;
int asteroidcount;
spaceship ship;
Asteroid asteroids;
UFO ufos;
Minim myMinim;
AudioPlayer music1;
AudioPlayer music2;
AudioPlayer music3;
AudioPlayer music4;
AudioPlayer music5;

AudioPlayer pew;

void setup() {
  size(800, 600); 
  shippic = loadImage("ship.png");
  battlefield = loadImage("battlefield.jpg");
  asteroidpic = loadImage("asteroidpic.png");
  mars = loadImage("mars.jpg");
  UFO = loadImage("UFO.png");
  battlefield.resize(800, 600);  
  mars.resize(800, 600);
  shippic.resize(84, 60);
  ship = new spaceship();
  asteroids = new Asteroid();
  ufos = new UFO();
  imageMode(CENTER);
  mode = 1;

  gif = new PImage[9];
  int index = 0;
  while (index < 9) {
    gif[index] = loadImage("explosion/frame_" + index + "_delay-0.1s.png");
    index++;
  }
  myMinim = new Minim(this);
  music1 = myMinim.loadFile("universal.mp3"); //intromusic
  music2 = myMinim.loadFile("pubgtrap.mp3"); //ll
  music3 = myMinim.loadFile("finalbattle.mp3"); //x
  music4 = myMinim.loadFile("Fanfare.mp3"); //ta
  pew = myMinim.loadFile("pew.mp3"); //bullet sound

  //the list
  objects = new ArrayList<GameObject>();
  objects.add(ship);
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
} 

void draw() {
  background(battlefield);
  println(mouseX, mouseY);

  shipsize = 50;
  objectsize = 50;

  int i = 0;
  while (i < objects.size()) {

    GameObject currentObject = objects.get(i);
    currentObject.show();
    currentObject.act();
    if (currentObject.alive() == false ) {
      objects.remove(i);
      i = i - 1;
    }
    i = i + 1;
  }

  if (mode == 1) {
    intro();
    music4.pause();
    music3.pause();
    pew.pause();
    music1.play();
  } else if (mode == 2) {
    playing();
    music1.pause();
    music2.play();
  } else if (mode == 3) {
    music2.pause();
    music3.play();
    gameover();
    pew.pause();
  } else if (mode ==4) {
    winner();
    music3.pause();
    music4.play();
    music2.pause();
    pew.pause();
  } else if (mode ==5) {
    pause();
  }
}

void keyPressed() {
  if (keyCode == 'W') w = true;
  if (keyCode == 'S') s = true;
  if (keyCode == 'A') a = true;
  if (keyCode == 'D') d = true;
  if (keyCode == 'E') e = true;
  if (key == ' ') space = true;
}

void keyReleased() {
  if (keyCode == 'W') w = false;
  if (keyCode == 'S') s = false;
  if (keyCode == 'A') a = false;
  if (keyCode == 'D') d = false;
  if (keyCode == 'E') e = false;
  if (key == ' ') space = false;
  if (key == 'e' || key == 'E') {
    if (mode == 2) {
      mode = 5;
    } else if (mode == 5) {
      mode = 2;
    }
  }
}
