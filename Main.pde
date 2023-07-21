int pop = 30;
float rate = 0.02;
Population population;
Food[] food;


void setup() {
  size(1000, 1000);
  background(102);
  
  population = new Population(rate, pop);
  generateFood();   
}

void draw() {
  background(102);
  
  drawFood();
  
  drawPop();
  
  if(isFoodFinished()) {
    // Natural selection
    population.naturalSelection();
    
    // Generate new pop
    population.generate();
    
    // Generate new Food
      generateFood();
  }
  

  
}

boolean isFoodFinished() {
  for(int i = 0 ; i < food.length ; i++){
    if (!food[i].isEaten) {
      return false;
    }
  }
  return true;
}


void generateFood() {
    food = new Food[pop];
    for(int i = 0; i < food.length ; i++){
      food[i] = new Food();
    }
}

void drawFood() {
for(int i = 0; i < food.length ; i++){
    fill(159, 158, 123);
    if(!food[i].isEaten) {
      circle(food[i].x, food[i].y, food[i].weight/10);
    }
  }
}

void drawPop() {
for(int i = 0; i < population.population.length ; i++){
    Deco creature = this.population.population[i];
    if(creature.dna.fitness > 0) {
      fill(creature.dna.fitness);
      creature.move(food);
      creature.eat(food);
      circle(creature.x, creature.y, creature.dna.getRadius());
    }
  }
}
