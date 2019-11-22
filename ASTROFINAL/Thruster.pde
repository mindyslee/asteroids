class thruster extends GameObject {
  float red, orange;
  int hue;
  float dying;

  thruster(PVector loc) {
    super();
    location = loc.copy();
    velocity = ship.direction.copy();
    velocity.rotate(radians(180));
   
    velocity.setMag(random(1, 3));

    dying = 255;
    red = 255;
    orange = random(0, 255);
  }


  void show() {
    colorMode(HSB);

    noStroke();
    fill(hue, 255, 255,dying);
    ellipse(location.x, location.y, 5, 5);
  }

  void act() {
    location.add(velocity);



    dying = dying - 10;
    if (dying<=0) {
      alive = false;
    }
    hue = hue + 1;
    if (hue > 255) {
      hue = 0;
    }
  }
}
