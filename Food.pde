class Food {
  float x;
  float y;
  float weight;
  boolean isEaten = false;
  
  Food() {
    this.x = random(width);
    this.y = random(height);
    this.weight = random(5, 100);
  }

}
