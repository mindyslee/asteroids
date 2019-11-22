class Shotgun extends GameObject {

  int age = 0;
  int hue;
  float r = random(-5, 5);

  Shotgun() {
    super();
    location = ship.location.copy();
    velocity = ship.direction.copy();
    velocity.setMag(5);
  }


  void show() {
    colorMode(HSB);
    fill(hue, 255, 255);
    stroke(255, 0, 0);
    ellipse(location.x, location.y, r,25);
    ellipse(location.x, location.y, r,25);
    ellipse(location.x, location.y, r,25);
    hue = hue + 1;
    if (hue > 255) {
      hue = 0;
    }

    }
  

  void act() {
    super.act();
    age++;
  }

  boolean alive() {
    if (age < 200 && alive == true) {
      return true;
    } else {
      return false;
    }
  }
}
