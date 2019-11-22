class particle extends GameObject {

  float death;
  float red, orange;

  particle(PVector loc) {
    super();
    colorMode(RGB);
    location = loc.copy();
    velocity = new PVector(0, 1);
    velocity.rotate(random(0, 2*3));
    velocity.setMag(random(1, 3));

    red = 255;
    orange = random(0, 255);
    death = 255;
  }

  void show() {
    colorMode(RGB);

    noStroke();
    fill(220, 220, 220, death);
    ellipse(location.x, location.y, 10, 10);

    ellipse(location.x, location.y, 5, 5);
  }

  void act() {
    location.add(velocity);
       
    death = death - 10;
    if (death<=0) {
      alive = false;
    }
  }
}
