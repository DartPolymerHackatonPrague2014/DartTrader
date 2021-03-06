library ma_game;
import 'dart:math';
import 'package:observe/observe.dart';

Random random = new Random();

int SPACE_SIZE= 1000;
int PLANETS= 100;

int BASE_FUEL_PRICE = 10;

List<Comodity> COMODITIES = [
    new Comodity("Smartphones", 100, 5, 2.0),
    new Comodity("Minerals", 10, 1, -5.0),
    new Comodity("Food", 10, 1, -10.0),
    new Comodity("Androids", 1000, 9, 3.0)
];


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
  
  @observable int money = 5000;
  @observable int fuel = 1000;
  
  int x = 0;
  int y = 0;
  
  @observable Planet onPlanet;
  
  @observable Map<Comodity, int> comodities = { };
  
  Player() {
    COMODITIES.forEach((c) {
      comodities[c] = 0;
    });
    comodities = toObservable(comodities);
  }
  
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
                               "Proxima",
                               "Nova",
                               "Sweet",
                               "Burger",
                               "Fried",
                               "Last",
                               "First",
                               "Dart",
                               "Dark",
                               "Evil",
                               "Shadow",
                               "Pulsing",
                               "Green"
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
                               "Tower",
                               "Castle",
                               "Apple",
                               "Google",
                               "Settlement"
                            ];  
  
  Game game;
  
  String name;
  
  int x;
  int y;
  
  int size;
  int level;
  
  Map<Comodity, ComodityStatus> comodities = { };
     
  Planet(this.game) {
    name = "${NAME1[random.nextInt(NAME1.length)]} ${NAME2[random.nextInt(NAME2.length)]}";
    x = random.nextInt(SPACE_SIZE) - SPACE_SIZE~/2;
    y = random.nextInt(SPACE_SIZE) - SPACE_SIZE~/2;
    size = random.nextInt(3)+1;
    level = random.nextInt(10)+1;
    
    COMODITIES.forEach((c) {
      ComodityStatus s = new ComodityStatus();
      comodities[c] = s;
      if (c.level > level) {
        s..available = false
         ..amount = 0
         ..priceBuy = 0
         ..priceSell = 0;
        
      } else {
        s..available = true
         ..amount = 100*size + random.nextInt(300*size)
         ..priceSell = (countPrice(c.basePrice, c.levelCoeficient) * 1.05).round()
         ..priceBuy = (countPrice(c.basePrice, c.levelCoeficient) * 0.95).round();
      }
    });    
  }
  
  int get fuelPrice {
    return countPrice(BASE_FUEL_PRICE, 1.0);
  }
    
  int countPrice(int base, double coeficient) {
    double price = base / ((size * 0.5)+0.5);    
    price = price - (level * coeficient);
    int toReturn = price.round();
    if (toReturn <= 0) return 1;
    return toReturn;    
  }
  
  int get distance {    
    return sqrt(pow(x-game.player.x, 2) + pow(y-game.player.y, 2)).round();    
  }    
  
}

class Comodity {
  
  String name;
  int basePrice;
  int level;
  double levelCoeficient;
  
  Comodity(this.name, this.basePrice, this.level, this.levelCoeficient);
   
}

class ComodityStatus extends Observable {
  bool available;
  @observable int amount;
  @observable int priceBuy;
  @observable int priceSell;
}
