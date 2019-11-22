class spaceship extends GameObject {

  Gun myGun;
  Gun SecondGun= new SecondGun();
  Gun ThirdGun = new ThirdGun();
  //Gun thirdGun = new FinalGun(); 

  PVector direction;
  PVector ndirection;
  PVector thrusterd;


  spaceship() {
    super();
    lives = 20;
    location = new PVector(300, 300);
    velocity = new PVector(0, 0);
    direction = new PVector(-0.1, 0);
    ndirection = new PVector(0, 0.1);
    myGun = new BasicGun();
  }

  void show() {
    colorMode(RGB);
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());    
    image(shippic, 0, 0);
    popMatrix();
  }

  void act() {

    myGun.recharge();

    if (myGun!=SecondGun&&score == 30) {

      myGun = SecondGun;
    }
    if (myGun!=ThirdGun&&score == 60) {

      myGun = ThirdGun;
    }


    //if  (score == 100&&myGun!=thirdGun) {
    //  myGun = thirdGun;
    //}
    super.act();
    if (w) {
      velocity.add(direction);
      objects.add(new thruster(location));
    } else velocity.mult(0.99);
    if (a) direction.rotate(radians(-5));
    if (d) direction.rotate(radians(5));
    if (s) velocity.add(ndirection);
    else velocity.mult(0.99);
    if (space) { 
      myGun.shoot();
      pew.rewind();
      pew.play();
    }





    //{ 
    //  if (space && cooldown >= 100) { 
    //    objects.add(new Bullet()); 


    //    cooldown = 10;
    //  }
    //  cooldown = cooldown + 6;
    //}

    int i = 0;
    while (i < objects.size()) {
      GameObject currentObject = objects.get(i);
      if (currentObject instanceof Asteroid) {
        float x = location.x;
        float y = location.y;
        float bx = currentObject.location.x;
        float by = currentObject.location.y;
        if (dist(x, y, bx, by) < 60) {
          lives = lives - 1;
          currentObject.alive = false;
          score = score + 1;
          asteroidcount= asteroidcount - 5;
          objects.add(new explosion(location.x, location.y));
          objects.add(new particle(location));
          objects.add(new particle(location));

          objects.add(new particle(location));

          objects.add(new particle(location));

          objects.add(new particle(location));
        }
      }
      i = i + 1;
    }
  }
}
