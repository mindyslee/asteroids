void playing() {
  //colorMode(RGB);
  fill(255, 0, 255);
  textSize(20);
  text(score, 415, 31);

  text(lives, 680, 30);
  text("lives:", 630, 30);
  //text(asteroidcount, 100, 450);
  textSize(15);
  text("SHOOT 100 SUCCESSFULLY TO WIN. CURRENT SCORE:", 10, 30);

  if (frameCount % 300 == 0) {
    objects.add(new UFO());
  }
  if (score>=100) {
    mode = 4;
  } else if (lives <= 0) {
    alive = false;
    mode = 3;
  }
  ship.alive();
  ship.act();
  ship.show();
}
