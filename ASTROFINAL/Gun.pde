abstract class Gun {
  int cooldown, threshold; 


  Gun() {
  }

  void recharge() {
    if (cooldown < threshold) 
      cooldown = cooldown + 1;
  }

  void shoot() {
    if (cooldown >= threshold) {
      objects.add(new Bullet());
      cooldown = 0;
    }
  }
}

class BasicGun extends Gun {
  BasicGun() {
    threshold = 50;
 
  }
}

class SecondGun extends Gun {
  SecondGun() {
    threshold = 20;
  }
}

class ThirdGun extends Gun {
  ThirdGun() {
    threshold = 5;
  }
}
