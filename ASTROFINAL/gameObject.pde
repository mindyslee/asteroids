abstract class GameObject {
  //abstract class means you cannot Gameobject g = new GameObject

  PVector location;
  PVector velocity;

  boolean alive;

  GameObject() {
    alive = true;
  }

  void show() {
  }


  void act() {
    location.add(velocity);

    if (location.x < -objectsize/2) {
      location.x = width+objectsize/2;
    } 
    if (location.x > width+objectsize/2) {
      location.x = -objectsize/2;
    } 
    if (location.y < -objectsize/2) {
      location.y = height+objectsize/2;
    } 
    if (location.y > height+objectsize/2) {
      location.y = -objectsize/2;
    }
  }

  boolean alive() {
    return alive;
  }
}
