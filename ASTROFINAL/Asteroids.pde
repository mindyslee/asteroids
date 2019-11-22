class Asteroid extends GameObject {

  int size;
  PVector direction;
  PVector ndirection;

  Asteroid() {
    super();
    asteroidcount = 500;
    size = 100;
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(random(-1, 1), random(-5, 5));
  }

  Asteroid(PVector loc, PVector vel, int s) {
    super();
    location = loc.copy();
    velocity = vel.copy();
    float angle = random(-45, 45);
    velocity.rotate(radians(angle));
    float speed = random(1, 5);
    velocity.setMag(speed);
    size = s;
  }

  void show() {
    colorMode(RGB);
    fill(120);
    stroke(255, 0, 0);
    image(asteroidpic, location.x, location.y, size, size);
  }


  void act() {

    super.act();

    int i = 0;
    while (i < objects.size()) {

      GameObject currentObject = objects.get(i);
      if (currentObject instanceof Bullet || currentObject instanceof Shotgun) {
        float x = location.x;
        float y = location.y;
        float bx = currentObject.location.x;
        float by = currentObject.location.y;
        if (dist(x, y, bx, by)<size/2 + 10) {
          alive = false;
          currentObject.alive = false;
          if (size == 100) {
            objects.add(new Asteroid(location, currentObject.velocity, 50));
            objects.add(new Asteroid(location, currentObject.velocity, 50));
            score++;
            asteroidcount = asteroidcount - 2;
            objects.add(new explosion(location.x, location.y));
            objects.add(new particle(location));
            objects.add(new particle(location));
            objects.add(new particle(location));
            objects.add(new particle(location));
            objects.add(new particle(location));
            objects.add(new particle(location));
            objects.add(new particle(location));
            objects.add(new particle(location));
            objects.add(new particle(location));
            objects.add(new particle(location));
            objects.add(new particle(location));
            objects.add(new particle(location));
            objects.add(new particle(location));
            objects.add(new particle(location));
            objects.add(new particle(location));
            objects.add(new particle(location));
          } else if (size == 50) {
            objects.add(new explosion(location.x, location.y));
            objects.add(new Asteroid(location, currentObject.velocity, 25));
            objects.add(new Asteroid(location, currentObject.velocity, 25));
            score++;
            //asteroidcount--;
            objects.add(new particle(location));
          } else {
            objects.add(new explosion(location.x, location.y));
            score++;
            objects.add(new particle(location));
          }
        }
      }
      i = i + 1;
    }
    if (asteroidcount < 1) {
      objects.add(new Asteroid());
      objects.add(new Asteroid());
    }
  }
}
