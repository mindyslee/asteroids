class Bullet extends GameObject {
  
  int age = 0;
  //int hue;
  
  Bullet() {
    super();
    location = ship.location.copy();
    velocity = ship.direction.copy();
    velocity.setMag(5);
  }


  void show() {
    colorMode(HSB);
    //fill(hue, 255, 255);
    fill(255);
    stroke(#F70202);
    ellipse(location.x, location.y, 10, 10);
    //hue = hue + 1;
    //if (hue > 255) {
    //  hue = 0;
   // }
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
