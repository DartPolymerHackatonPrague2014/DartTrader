import 'game.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('ma-game')
class MaGame extends PolymerElement {
  
  @observable Game game = null;
  
  @published Planet selectedPlanet;
  
  @observable List<Planet> sortedPlanets;
    
  MaGame.created() : super.created() {
    game = new Game(); 
    sortedPlanets = toObservable(game.planets, deep:false);    
    _sortPlanets();
  }
  
  void _sortPlanets() {
    sortedPlanets.sort((a,b) => a.distance.compareTo(b.distance));    
  }
  
  void selectPlanet(Event e, var detail, Node sender) {
    selectedPlanet = detail["planet"];
    print("Selected ${selectedPlanet}");
  }
  
  void warp(Event e, var detail, Node sender) {
    print("Warping to ${selectedPlanet}");
    Planet warpTo = detail["planet"];
    game.warpTo(warpTo);
    _sortPlanets();
  }    
    
}
