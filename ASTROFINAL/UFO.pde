//class Alien extends GameObject{

//  Alien(){
//    super();


//  }



//}
class UFO extends GameObject {

  int size;
  UFO() {
    super();
    size = 60;
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(random(-1, 1), random(-5, 5));
  }

  UFO(PVector loc, PVector vel, int s) {
    super();
    location = loc.copy();
    velocity = vel.copy();
    float angle = random(-45, 45);
    velocity.rotate(radians(angle));
    float speed = random(5, 10);

    velocity.setMag(speed);
    size = s;
  }

  void show() {
  }

  void act() {
    super.act();
    pushMatrix();
    translate(location.x, 100);
    fill(0, 202, 250);
    image(UFO, -10, 0, 100, size-30);
    //ellipse(-10, 0, size, size-30);
    popMatrix();
    location.add(velocity);

    int i = 0;
    while ( i < objects.size()) {
      GameObject currentobject = objects.get(i);
      if ( currentobject instanceof Bullet) {
        float x = location.x;
        float y = location.y;
        float bx = currentobject.location.x;
        float by = currentobject.location.y;
        if (dist(x, y, bx, by)< size - 10) {
          alive = false;
          currentobject.alive = false;
          score = score + 10;
          objects.add(new explosion(location.x, location.y));
          objects.add(new particle(location));
        }
      }
      i++;
    }
  }
}
