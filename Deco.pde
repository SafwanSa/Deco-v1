class Deco {
 
  DNA dna;
  float x;
  float y;
  
  Deco() {
    this.dna = new DNA();
    this.x = random(width);
    this.y = random(height);
  }
  
  
  Deco crossover(Deco other) {
    Deco child = new Deco();
    child.dna = this.dna.crossover(other.dna);
    return child;
  }
  
  void mutate(float rate) {
    this.dna.mutate(rate);
  }
  
  void move(Food[] food) {
    this.dna.fitness -= 0.09;
    
    if(dna.fitness < 1) { return; }
    
    this.x += this.dna.getXSpeed();
    this.y += this.dna.getYSpeed();
    
    if (x > width-dna.getRadius() || x < dna.getRadius()) {
      float oldXSpeed = this.dna.getXSpeed();
      this.dna.setXSpeed(oldXSpeed *= -1);
    } else if (y > height-dna.getRadius() || y < dna.getRadius()) {
      float oldYSpeed = this.dna.getYSpeed();
      this.dna.setYSpeed(oldYSpeed *= -1);
    } else {
      float minDist = 10000;
      float targetX = 0;
      float targetY = 0;
      for(int i = 0 ; i < food.length ; i++) {
        if (!food[i].isEaten) {
          if(dist(food[i].x, food[i].y, this.x, this.y) < minDist) {
            minDist = dist(food[i].x, food[i].y, this.x, this.y);
            targetX = food[i].x;
            targetY = food[i].y;
          }
        }
      }
    
    
      if(random(1) < 0.001) {    
        this.dna.setXSpeed(targetX-x);
        this.dna.setYSpeed(targetY-y);
      }
      if(random(1) < 0.09) {
        this.dna.setXSpeed(random(-5, 5));
        this.dna.setYSpeed(random(-5, 5));
      }
    }
    


  }
  
  void eat(Food[] food) {
    for(int i = 0 ; i < food.length; i++){
      float xcenter = food[i].x;
      float ycenter = food[i].y;
      if (dist(xcenter, ycenter, abs(x), abs(y)) < dna.getRadius() && !food[i].isEaten){
        food[i].isEaten = true;
        this.dna.calcFitness(food[i].weight);
      }
    }
  }
  
  


}
