class explosion extends GameObject {

  int currentPic = 0;
  float x, y;

  explosion(float _x, float _y) {
    super();
    x = _x;
    y = _y;
  }

  void act() {
    if(currentPic > 8)  objects.remove(this);
  }
  void show() {
    image(gif[currentPic], x, y, 100, 100);
    currentPic++;
  }
}
