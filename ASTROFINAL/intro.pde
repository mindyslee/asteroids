int hue;
void intro() {
  background(mars);

  colorMode(RGB);
  fill(255, hue, hue);
  textSize(40);
  text("BATTLE OF ASTEROIDS", 175, 200);
  
  textSize(30);
  text("CLICK IF YOU DARE TO ENTER", 170,300);
    hue = hue + 1;  
  if (hue > 255) {
    hue = 0;
  }
  

}
