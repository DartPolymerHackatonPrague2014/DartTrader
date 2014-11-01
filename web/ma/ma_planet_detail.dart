import 'game.dart' as g;
import 'package:polymer/polymer.dart';
import 'dart:html';


@CustomTag('ma-planet-detail')
class MaPlanetDetail extends PolymerElement {
  
  @published g.Planet planet;
  @published g.Player player;
  
  MaPlanetDetail.created() : super.created() {
  }

  void onClickWarp(Event e, var detail, Node sender) {
    fire("warp", detail:{"planet":planet} );
  }
    
}