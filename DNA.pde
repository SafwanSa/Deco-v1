class DNA {
 
 float fitness = 255;
 float[] gene = {0, 0, 0};
 
 DNA() {
   this.gene = generateGene();
 }
 
 
 float[] generateGene() {
   float xSpeed = random(5);
   float ySpeed = random(5);
   float avgSpeed = (xSpeed + ySpeed)/2;
   float radius = 100/avgSpeed;
   float[] gene = {xSpeed, ySpeed, radius}; 
   return gene;
 }
 
 
 float getXSpeed() {
  return this.gene[0];
 }
  
  float getYSpeed() {
  return this.gene[1];
 }
 
 float getRadius() {
  return this.gene[2];
 }
 
 
 void setXSpeed(float x) {
  this.gene[0] = x;
 }
  
 void setYSpeed(float y) {
  this.gene[1] = y;
 }
 
 void setRadius(float r) {
  this.gene[2] = r;
 }
  
  
 void calcFitness(float foodWeight) {
   this.fitness+=foodWeight;
   
   float oldX = this.getXSpeed() < 0 ? -1 : 1;
   float oldY = this.getYSpeed() < 0 ? -1 : 1;
    
   setXSpeed(foodWeight * 0.1 * oldX);
   setYSpeed(foodWeight * 0.1 * oldY);
 }
  
  DNA crossover(DNA other) {
    DNA child = new DNA();
    child.fitness = (this.fitness + other.fitness)/2;
  
    for(int i = 0 ; i < child.gene.length ; i++){
      if(random(1) < 1) {
       child.gene[i] = other.gene[i]; 
      } else {
       child.gene[i] = this.gene[i]; 
      }
    }
    
    return child;
  }
  
  void mutate(float rate) {
    if(random(0, 1) < rate) {
      this.gene = this.generateGene();
      this.fitness = 255;
    }
  }
}
