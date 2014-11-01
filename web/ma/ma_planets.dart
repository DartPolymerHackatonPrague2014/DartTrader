import 'game.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('ma-planets')
class MaPlanets extends PolymerElement {
  
  @published List<Planet> planets;
    
  MaPlanets.created() : super.created() {
  }      

  void onPlanetClick(Event e, var detail, Node sender) {
    fire("select-planet", detail:{"planet": planets[int.parse(sender.dataset["index"])] } );
  }
    
}