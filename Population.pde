class Population {
  
  float mutationRate = 0.0;
  int popNum = 0;
  int generation = 0;
  Deco[] matingPool;
  Deco[] population;
  
  
  Population(float rate, int popNum) {
    this.mutationRate = rate;
    this.popNum = popNum;
    this.population = new Deco[this.popNum];
    
    for (int i = 0 ; i < this.popNum ; i++) {
      this.population[i] = new Deco();
    }
  }
  
  
  void naturalSelection() {
    float maxFitness = 0;
    for(int i = 0; i < population.length ; i++) {
      if (population[i].dna.fitness > maxFitness) {
        maxFitness = population[i].dna.fitness;
      }
    }
    
    
    float fitness = 0;
    for(int i = 0; i < population.length ; i++) {
      if(maxFitness != 0) {
        fitness = population[i].dna.fitness;
      }
      
      int n = (int)fitness*100;
      this.matingPool = new Deco[n];
      for(int j = 0; j < n ; j++) {
        this.matingPool[j] = population[i];
      }
    }
    
    
    
    
    
    
  
  }
  
  
  void generate() {
    this.generation+=1;
    
    if(matingPool.length != 0) {
      for(int i = 0 ; i < this.population.length ; i++){
        int a = (int)random(matingPool.length);
        int b = (int)random(matingPool.length);
        
        
        Deco parent_a = matingPool[a];
        Deco parent_b = matingPool[b];
        
        if(parent_a.dna.fitness == 0 || parent_b.dna.fitness == 0) {
          return;
        }
        
        Deco child = parent_a.crossover(parent_b);
        
        child.mutate(mutationRate);
        
        this.population[i] = child;
      }
    }


  }
  
  void evaluate() {
  
  
  }

}
