import 'game.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('ma-game')
class MaGame extends PolymerElement {
  
  @published Game game;
  
  @published Planet selectedPlanet;
  
  MaGame.created() : super.created() {
    game = new Game();
  }
  
  void selectPlanet(Event e, var detail, Node sender) {
    selectedPlanet = detail["planet"];
    print("Selected ${selectedPlanet}");
  }  
    
}
