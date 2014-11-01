library ma_game;
import 'dart:math';


Random random = new Random();

class Game {
  
  Player player = new Player();
  List<Planet> planets = [];

  Game() {
    for (int i=0; i<100; i++) {
      planets.add(_createRandomPlanet());
    }
    print('planets');
  }

  Planet _createRandomPlanet() {
    return new Planet();
  }  
  
}

class Player {
  
  int money = 23456;
  
}

class Planet {
  String name = "Planeta ${random.nextInt(100)}"; 
}