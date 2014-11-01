library ma_game;
import 'dart:math';
import 'package:observe/observe.dart';

Random random = new Random();

int SPACE_SIZE= 1000;
int PLANETS= 10;

class Game {
  
  Player player = new Player();
  
  List<Planet> planets = [];

  Game() {
    for (int i=0; i<PLANETS; i++) {
      planets.add(_createRandomPlanet());
    }
    planets[0].x = 0;
    planets[0].y = 0;
    player.onPlanet = planets[0];
  }

  Planet _createRandomPlanet() {
    return new Planet(this);
  }  
  
  
  void warpTo(Planet warpTo) {
    player.fuel -= warpTo.distance;
    player.x = warpTo.x;
    player.y = warpTo.y;
    player.onPlanet = warpTo;
  }
}

class Player extends Observable {
  
  @observable int money = 100;
  @observable int fuel = 1000;
  
  int x = 0;
  int y = 0;
  
  @observable Planet onPlanet;
  
}

class Planet extends Observable {
  
  static List<String> NAME1 = [
                               "Big",
                               "Little",
                               "Blue",
                               "Far",
                               "New",
                               "Old",
                               "Alpha",
                               "Beta",
                               "Proxima",
                               "Nova",
                               "Sweet",
                               "Burger",
                               "Fried",
                               "Last",
                               "First",
                               "Dart",
                               "Dark"
                            ];
  
  static List<String> NAME2 = [
                               "Terra",
                               "Centauri",
                               "World",
                               "Goliath",
                               "Dwarf",
                               "Colony",
                               "Planet",
                               "Ball",
                               "Paradise",
                               "Country",
                               "Fortress",
                               "Watch",
                               "Tower"
                            ];  
  
  Game game;
  
  String name;
  
  int x;
  int y;
  
  int size;
  int level;
     
  Planet(this.game) {
    name = "${NAME1[random.nextInt(NAME1.length)]} ${NAME2[random.nextInt(NAME2.length)]}";
    x = random.nextInt(SPACE_SIZE) - SPACE_SIZE~/2;
    y = random.nextInt(SPACE_SIZE) - SPACE_SIZE~/2;
    size = random.nextInt(3)+1;
    level = random.nextInt(10)+1;
  }
  
  int get distance {    
    return sqrt(pow(x-game.player.x, 2) + pow(y-game.player.y, 2)).round();    
  }
    
  
}